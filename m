Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8258B642810
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 13:07:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B936116FE;
	Mon,  5 Dec 2022 13:07:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B936116FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670242075;
	bh=GGZ8KBCtSm3RD+ORJC0J+7PSCM00apf+w2h3oUG+xkI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eMCwDYeqxMkfbuPsYE+0mIF0w91yvwbzepUaJXn6jtmlHdPZ34DDLWltcoETM2ipV
	 2aQVVmnaoLMZzp0Zd2aKhffMJNatIJ5/LJATOJoDZCdu+mhyBtxRpMj098MMobciSd
	 5XR83Qr5FBIZJa4jTW4e0Hy5lhBRCh9/GrXetfCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D55A9F80236;
	Mon,  5 Dec 2022 13:06:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44B94F80155; Mon,  5 Dec 2022 13:06:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::61b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1C76F80155
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 13:06:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1C76F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="Jw3lkrFT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZA1mol1W6VpCTtD0PNy3OKYOrG+poMn4KYMJfzaLQ5gqzE1YTithLqOScGz5dWtThgWf9bmz/Ak8GMbikIUIJb8XL7h8rWvb8JrCz19/fVRqIrXlNHGK38petHKa1w3qJ7malAtT0emvZwX1ozHu2j+jefdoBDsjW/ws3jgHop4DDEWNS0rKJ2a96M6LkzdGky9DDtyTO8sMQCdMoxB6beGkA27/HXqKrnbRJDfpYx32Ckm4+L1Lm6pz/AUkITC84YnCUVBIJuJw/pZl8ajqDN8btud3j5RFUHVGAk5G3VGnZc2am/HMI11WjeMYoxZr9dltlUQG1J8e/fZM2LoSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3GH9S648zzxpD1v76g+KzCVWkKyOJl7qJrr+FCebqo=;
 b=WbT9MWgTX0kOohI0pAo69Dm8b4HLBREryqoH4faB3F+yyrGMpKHcBCQfm11um1zIbgQbpmJZXqGI1qI50rFb/7G8rNnJA0QEfJi0HwvywA4yjVUY+pwpna+KXpWjTIiaAjXZb+hVEUH2S653+6dz+mGiwg8AZcqTaMZTsLzmJrXgldS9c48Lhho+4CHqOjqcpgzDpvFDTZRlqitT5oRDpx6vcsml1Jp4jtM05ejf6KwWAlbtb4kqxKfmOG1dGo63bQwBFYxNOX+/CsCHvv25v+D9VSIByv88PZTu32/pt6vMOvoXF9XlmCBPcnyzh5B2ukYiAiiSniS9bKkTeUO0mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3GH9S648zzxpD1v76g+KzCVWkKyOJl7qJrr+FCebqo=;
 b=Jw3lkrFTB2GfcejdWRkUMkYhaB7KY6kUBYEnKq8S7MYL9I+euZltms+OaxVTkftjGW8ecSoyC+scHun52KQ7TrtiUMDyJtPgTG8cS624aedPW+K0Aicu+B1I6PFrp9JWVmjCVOS+DUn/OpPgjZLet8cPzmpLFoi7vLhtgX9Il7k=
Received: from BN9PR03CA0662.namprd03.prod.outlook.com (2603:10b6:408:10e::7)
 by SN7PR12MB7912.namprd12.prod.outlook.com (2603:10b6:806:341::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 12:06:45 +0000
Received: from BN8NAM11FT093.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10e:cafe::a9) by BN9PR03CA0662.outlook.office365.com
 (2603:10b6:408:10e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Mon, 5 Dec 2022 12:06:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT093.mail.protection.outlook.com (10.13.177.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.14 via Frontend Transport; Mon, 5 Dec 2022 12:06:45 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 06:06:44 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 06:06:44 -0600
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 5 Dec 2022 06:06:42 -0600
From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 0/2] Add SOF panic dump support for AMD platform.
Date: Mon, 5 Dec 2022 17:36:47 +0530
Message-ID: <20221205120649.1950576-1-Vsujithkumar.Reddy@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT093:EE_|SN7PR12MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: 93efa247-46d5-46cd-87cc-08dad6b92df5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u0zZDbIABj2Jrj2o3I+Dycgm6k1MY4JjvBSaRLmg3bXv0JmxeX9wgrbxwFFPHzJBV24DoFyk9lQo9M0Tb3NklU4oGiK4O/xzzxtzwFGH2taHCy+HxYy58sJkxQiRFNWbrMI0rSvsrsowHF+GJZiFchXFBCjBn80vLTy3PB1L/VwGOc8sTP1aTi/dBw1FbH5maKE/UCfclw7Y9Txz5eejNqhMtvlsxVP6GHGrkU9vrZb+eFf+aTIAUehF4n+7RYRkm5GurDaMPIwAVrpwraMZXAhxh1QENNIiuozZwccDEdujIkC7JmpqY6GnIeXOO0pt2ArDBH7EMhy5GX65Q+5a0VhcHfwAr4jWGLOgAZAIHv+oVH/06qTB3VoKaSH9ZhQ3xIOB+fSz2/pYY2WOHun6zh1TflGBEQzNnFvVYzAsh+GWXeQeG2FaCpeg4GqqH+jT3vp0aU74pY0ThW+dZsjNr670GYILmlOcA9v4yaeHkfHNyIAYQaCjvf0qZ2TNWAVFojlNPmst3b019Nrx1d4X29Iqp2e1r1nh7XJZmAbxcnRPfGRnqKSX/U3sKOWSkFSFGqK/nDfklY5CaTxKNXB7qpcm8wt2JY+6ARu0X0FQHUcgSjj+ifGvjmySBBU+nhT6K6iWMVp0UT/Sw3SETCZptWkQpMeCVGVM0rKc7KI1qNVWkfWA2CbX/00eINwjI1yRay+QdXtrzDpNfiD8ocK6vyrxgBXKFinEmi5+ajKP0wU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(396003)(346002)(136003)(451199015)(40470700004)(36840700001)(46966006)(83380400001)(36860700001)(356005)(86362001)(81166007)(82740400003)(4744005)(5660300002)(41300700001)(8936002)(2906002)(4326008)(40460700003)(82310400005)(8676002)(40480700001)(186003)(26005)(7696005)(336012)(47076005)(426003)(1076003)(54906003)(316002)(110136005)(2616005)(70586007)(478600001)(70206006)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 12:06:45.3456 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93efa247-46d5-46cd-87cc-08dad6b92df5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT093.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7912
Cc: Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 venkataprasad.potturu@amd.com, Basavaraj.Hiregoudar@amd.com,
 Vijendar.Mukunda@amd.com, V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch series consists of
	>> Use poll function instead of simple read ACP_SHA_DSP_FW_QUALIFIER
	>> Add support for IPC and DSP dumps

Ajye Huang (1):
  ASoC: SOF: amd: Use poll function instead to read
    ACP_SHA_DSP_FW_QUALIFIER

V sujith kumar Reddy (1):
  ASoC : SOF: amd: Add support for IPC and DSP dumps

 sound/soc/sof/amd/Kconfig      |   1 +
 sound/soc/sof/amd/acp-common.c | 108 +++++++++++++++++++++++++++++++++
 sound/soc/sof/amd/acp-ipc.c    |  13 ++++
 sound/soc/sof/amd/acp.c        |   8 ++-
 sound/soc/sof/amd/acp.h        |   6 ++
 5 files changed, 133 insertions(+), 3 deletions(-)

-- 
2.25.1

