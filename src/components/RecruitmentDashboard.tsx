import React, { useState, useEffect } from 'react';
import { BarChart, Bar, XAxis, YAxis, Tooltip, Legend, ResponsiveContainer } from 'recharts';
import Neo4jConnection from '@/lib/neo4j-connection';

interface JobSeeker {
  id: string;
  name: string;
  applicationCount: number;
}

const RecruitmentDashboard: React.FC = () => {
  const [topJobSeekers, setTopJobSeekers] = useState<JobSeeker[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchTopJobSeekers = async () => {
      try {
        // Replace with your actual Neo4j connection details
        const neo4jConnection = new Neo4jConnection(
          'bolt://localhost:7687', 
          'neo4j', 
          'password'
        );

        const results = await neo4jConnection.getTopJobSeekers();
        
        const formattedData = results.map((record: any) => ({
          id: record.c.identity.low,
          name: record.c.properties.name,
          applicationCount: record.applicationCount.low
        }));

        setTopJobSeekers(formattedData);
        setLoading(false);
      } catch (err) {
        setError('Failed to fetch job seekers');
        setLoading(false);
      }
    };

    fetchTopJobSeekers();
  }, []);

  const handleExport = async () => {
    try {
      const neo4jConnection = new Neo4jConnection(
        'bolt://localhost:7687', 
        'neo4j', 
        'password'
      );
      const csvData = await neo4jConnection.exportData('Candidate');
      
      // Create download link
      const blob = new Blob([csvData], { type: 'text/csv' });
      const url = window.URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.setAttribute('hidden', '');
      a.setAttribute('href', url);
      a.setAttribute('download', 'candidates_export.csv');
      document.body.appendChild(a);
      a.click();
      document.body.removeChild(a);
    } catch (err) {
      console.error('Export failed', err);
    }
  };

  if (loading) return <div>Loading...</div>;
  if (error) return <div>Error: {error}</div>;

  return (
    <div className="p-6 bg-white shadow-md rounded-lg">
      <h2 className="text-2xl font-bold mb-4">Top Job Seekers Dashboard</h2>
      
      <ResponsiveContainer width="100%" height={400}>
        <BarChart data={topJobSeekers}>
          <XAxis dataKey="name" />
          <YAxis />
          <Tooltip />
          <Legend />
          <Bar dataKey="applicationCount" fill="#8884d8" />
        </BarChart>
      </ResponsiveContainer>

      <div className="mt-4">
        <button 
          onClick={handleExport}
          className="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600"
        >
          Export Candidates Data
        </button>
      </div>

      <table className="w-full mt-6 border-collapse">
        <thead>
          <tr className="bg-gray-100">
            <th className="border p-2">Name</th>
            <th className="border p-2">Applications</th>
          </tr>
        </thead>
        <tbody>
          {topJobSeekers.map((seeker) => (
            <tr key={seeker.id} className="hover:bg-gray-50">
              <td className="border p-2">{seeker.name}</td>
              <td className="border p-2 text-center">{seeker.applicationCount}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default RecruitmentDashboard;