-- AI Strategy Simulator Database Schema

CREATE TABLE IF NOT EXISTS ai_assessments (
id SERIAL PRIMARY KEY,


-- Business Inputs
use_case VARCHAR(255) NOT NULL,
industry VARCHAR(100) NOT NULL,
budget NUMERIC(12,2) NOT NULL,
employees_impacted INTEGER NOT NULL,
annual_revenue NUMERIC(15,2) NOT NULL,
strategic_priority VARCHAR(50) NOT NULL,

-- Calculated Metrics
estimated_productivity_gain NUMERIC(15,2),
estimated_revenue_gain NUMERIC(15,2),
total_benefit NUMERIC(15,2),
roi_percentage NUMERIC(10,2),

-- Risk Assessment
risk_score INTEGER,
risk_category VARCHAR(50),

-- Readiness Assessment
readiness_score INTEGER,
readiness_category VARCHAR(50),

-- AI Generated Results
executive_summary TEXT,
business_impact TEXT,
implementation_risks TEXT,
recommendation TEXT,
implementation_roadmap TEXT,

-- Metadata
assessment_status VARCHAR(50) DEFAULT 'Completed',
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP


);

CREATE INDEX idx_use_case
ON ai_assessments(use_case);

CREATE INDEX idx_industry
ON ai_assessments(industry);

CREATE INDEX idx_created_at
ON ai_assessments(created_at);
