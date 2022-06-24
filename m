Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CCB55A214
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 21:48:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3BB817F9;
	Fri, 24 Jun 2022 21:47:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3BB817F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656100109;
	bh=6XS5Ha56SkyDQxwYydcQVHybYqafy+BQ7pF5cmjeQtQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SDnFJmDVnjq+ayzOZxG2tWi0nTKrHQwLAO5qhEidzVnVCT6O3TSGz3QDx7Hl4QHVc
	 FSTtNyvyqRLhV6HCU9JrJ85+Keo0F9cA8+JWid4HtZ1a7lI5SN9VW5wI9g7D8hMIJO
	 +KMa4CXgYuzb2D0nd6gVbBT3RbMZBrbIZ9Dlrtyw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EE6AF800CB;
	Fri, 24 Jun 2022 21:47:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C5B0F80139; Fri, 24 Jun 2022 21:47:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F821F80109
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 21:47:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F821F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="vEcOvGEq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egpm1SYEv5uZoy5p1MpjdY2ZTT/SNp585gXZLiNjd9ce6bG4Fz5ghpautgL55iwwGY8ifCXokorJNGjhGdXaIUMOyx/sL2ar7/rwteCeI6gQM6xHOJXRrC+Yl9+rVAuHa51fGKMJK8n29olywQ11LdK45tJIPnZf0ffYlXPGmO1EknhUFztB35i07FWqc4cVPifwv0L/Nt8Z42Dw+f/XYeys8g05GKRTPow0gmyFoHnkGCdrMslI9GBCWjXWaLYULKqX/2fHAC4uRM7/WHsacrDmUn33acsVFwWEMNcyDN4KOC9lM3v/U0mCT97MU4XcPhKUflB4NQvxvnjN0Zqhtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhv+vJHh05hxA2nYlDEz/BQjkT2/oMyihclm4bjys4g=;
 b=mWNkHmbWUC6TgpAlLfbzjztZZknzsVwEEMBLfJ4urPHEGuKr6A7sPDqLMslO/jnimjEaX9YvrZIoq7pVfeaQivRUrCBoMSM+v5e8LebtTyl8O/bZx3qgL7nxamVZfc85gkD60KHpreX/GQbYHWrrdGvqHapXq/Ytbf9SBrLBoVy3fiRpWuZb4Ly+CQSVws9g7m/03d/KO2KsQZMEC9cHl2+aiQ0IsCWeL0MvxzQnoFgXtJ6Cv8jM9UF4vSNeZA1XOJVcr3gxCGXmTqcRoVOIuRAPVa/nbb5wgrid7fQrk8JDarvVnSRknp0S7GE+DpeizDWCwOj2Ehc5yChs8LILWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhv+vJHh05hxA2nYlDEz/BQjkT2/oMyihclm4bjys4g=;
 b=vEcOvGEqUB/rm0ZzLJpQAq2mM03injJJgItIo7tCcl2H5xAMcyjPrLHd/xkkD57phrvlh9hubo6bL2Hl1Z6TfTUhKehdryjrIZlM/ej+T+gsafoZSoXM4rC/jAE5yZneCCIruOR5b3tV8LR8bu4ENTO6ZAdBmz3DHn+v0cz8w7A=
Received: from BN9PR03CA0636.namprd03.prod.outlook.com (2603:10b6:408:13b::11)
 by BL1PR12MB5192.namprd12.prod.outlook.com (2603:10b6:208:311::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Fri, 24 Jun
 2022 19:47:18 +0000
Received: from BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13b:cafe::c3) by BN9PR03CA0636.outlook.office365.com
 (2603:10b6:408:13b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Fri, 24 Jun 2022 19:47:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT004.mail.protection.outlook.com (10.13.176.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 19:47:18 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 24 Jun
 2022 14:47:18 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 24 Jun
 2022 12:47:17 -0700
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Fri, 24 Jun 2022 14:47:15 -0500
From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 0/3] ADD  legacy audio driver support for rembrandt
Date: Sat, 25 Jun 2022 01:18:18 +0530
Message-ID: <20220624194821.287462-1-Vsujithkumar.Reddy@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b61e159d-481d-4a53-add7-08da561a58e6
X-MS-TrafficTypeDiagnostic: BL1PR12MB5192:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n0ZR/6ocTyY2s0p+UX9gYqsGGm+sYnq31cWJCNU2ZWyKtvhA/i1aSs0r49a24hGLAtfPFZkp+uBsy4M/M41H0Ab67qDw/dPOR+TeRVtI9jBZMAmmOpFsqCiboJUJANnFV2/1bPnqdEVbDY4wmAysJX3yS3h0RvFMRFfES1EXRjFk2HWUDM8rGalBEDfIn1tBYKRfuoB22v1Oc4oLfd04CHBrpzqsmDMdwiN52l08oDg799ZddiKRDCNSTnwa/IsUJIP9CQv7N3euzaP2qV5aCnzLEfWX8XacVId/JLef02Ysvp33xolbe9AmnrUyG71UEOhjkMj1BUI2H+kDamUb74x8OxNleLc6kDx/Ael4iABuWLnFFN1YjT3DTULv0Mxc55yXSMzgWzNctLvUge/e/WVRrHkUhAO5yYo7yvYf6VYR91CjNp6OLh07K3Vu9jYiTFZ9eY5Hh859d9d4gvAMk53AC5cOlaAjhmvCjcFkkU7+ebgbXLcLDYOPR1tzl+iXG9tv3JHXVJBFnz3AnoDbdG+7wtk3HAGa1YeSeOTtDjjed1D1mtZ6lp5N6b6z93ikVPag+ckaFqy6usszGKDe+O+grssWKlsMCcHkcDguQWk82a7XtTO3LQDRthXEYGvR+l/8VA/M/Fi/medxNDZKgQLQuFWFL+K5WzV3CxlOCpEdfF7/8m4bXLHxRZpgs6SRbuRlXEdo2Dpr4MtK6S+ojt8UJUHWLJ3Z+0aJGF7sqDSpr4FGqCfsrV6TsHHyiV2CIDKKZzjbEDj5aDCu7WWYr+Q7D6Mpt+wn6d3EwsFryJsCcg7SlEXZTuR6iaxZtSdrHuzc+IwhhgMIy+JDj1hTqw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(376002)(39860400002)(396003)(40470700004)(46966006)(36840700001)(1076003)(426003)(36756003)(5660300002)(2906002)(7696005)(478600001)(40480700001)(83380400001)(8936002)(186003)(70586007)(47076005)(8676002)(82310400005)(70206006)(4326008)(40460700003)(86362001)(36860700001)(2616005)(356005)(81166007)(54906003)(26005)(316002)(82740400003)(110136005)(41300700001)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 19:47:18.6216 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b61e159d-481d-4a53-add7-08da561a58e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5192
Cc: venkataprasad.potturu@amd.com, V sujith
 kumar Reddy <Vsujithkumar.Reddy@amd.com>, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Vijendar.Mukunda@amd.com
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

Add Generic driver to support multiple platform,
ADD HS control instance for Rembrandt platform.
Add nau8825,max98560 and rt5682s,rt1019 combination support for legacy
platform.

V sujith kumar Reddy (3):
  ASoC: amd: acp: Remove rt1019_1 codec conf from machine driver
  ASoC: amd: acp: ACP code generic to support newer platforms
  ASoC: amd: acp: Add legacy audio driver support for Rembrandt platform

 sound/soc/amd/acp/Kconfig            |  11 +
 sound/soc/amd/acp/Makefile           |   2 +
 sound/soc/amd/acp/acp-i2s.c          | 169 +++++++++++-
 sound/soc/amd/acp/acp-legacy-mach.c  |  32 +++
 sound/soc/amd/acp/acp-mach-common.c  | 104 +++++--
 sound/soc/amd/acp/acp-mach.h         |   6 +
 sound/soc/amd/acp/acp-pci.c          |   6 +
 sound/soc/amd/acp/acp-pdm.c          |   8 +-
 sound/soc/amd/acp/acp-platform.c     |  32 ++-
 sound/soc/amd/acp/acp-rembrandt.c    | 397 +++++++++++++++++++++++++++
 sound/soc/amd/acp/acp-renoir.c       |  38 ++-
 sound/soc/amd/acp/amd.h              |  86 +++++-
 sound/soc/amd/acp/chip_offset_byte.h |  40 ++-
 13 files changed, 862 insertions(+), 69 deletions(-)
 create mode 100644 sound/soc/amd/acp/acp-rembrandt.c

-- 
2.25.1

