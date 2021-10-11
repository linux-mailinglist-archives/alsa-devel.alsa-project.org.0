Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09942428668
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 07:42:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BC581693;
	Mon, 11 Oct 2021 07:41:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BC581693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633930967;
	bh=NtteMnB3mc8S3dn8D9oDTD3iL5cJaoNowotiQWLCqO4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PFztHYH4OwWGwmk+yrfRSc3HeFl16Y9bVQp/VxXQnhfQkCQmwGN1ATe/JNQwqJhNj
	 uz68pZo/YrAYip36NMJ+HndPh7R3PI+POCFGt8CRASt3ijAhXwqaG3CXYQt2pDqvVN
	 MzzaXGnNk8ILUdEV3O2qHrDaBhU06rmJCT9MgzAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD7B8F804EC;
	Mon, 11 Oct 2021 07:40:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0D9AF8051A; Mon, 11 Oct 2021 07:40:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D54FDF804EC
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 07:40:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D54FDF804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="JqFwYfXj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W4IPHF8T74whgQNMEXNYS+CPMCCjJmyn2PIe6OAsbpHKNvZbBcXpCejemOBlmEwpUOpwEB6HScFFDXdaUDOXGnFU9y5+Ls5eshAqzTalzUsgnFb8YIHieSA3+nzAEDZiTMTm1bjpi1Cgx/Hu/W0vObPnyD1V74yovqxRI7GkMOmp4ylFieuZDBE+HHFk0FNLsJpK1L621nuCvXfAHFr9ZyYPh2uAT6HE8ks+dvpvmYqgxICNfItAsHi9NrJkEv6cRqiH+QIyoHWrf35k69CfLJ27t3zt2P93cHygvCu+OZnkDGQ627ug5MRM7ObmZwzOL6TYZIWrh9cm8391meMPQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKJNFoXl+Uup5TjO7IbM3xE5ajCbNgUwUxVam8DfM0I=;
 b=R94iZ3fIGVR+GvUCdSZoAX4tXztWW3A/HpiHTFicETotLzWm4qPc/AXW+mn88mk9DXKKdVWLiAJFVhS5dkQK0OzfcGdrTsQY5IlnUMiIADM+BV9gcYKBpx5OFP2kDBj97y1Pb7nDJO+u9UHA1GH0Rr8qx6JGgHHFlkcXKMBnJlDirrz0nxQqzIn6TDHK575zG9CpVUilxz+LjJE9yhLU1mDD1sdWeNioCQ/K7uBqIjzWXkNn0y1efkW8BgvkYRGv/NFfE8k4c5M+83ZGuhB3/Uhw2L5gDYW3hmd2nHEkymDgenOOmbLVbLJ2HHJrfiX7RYr/F+gUdz8tu3Wf4V2bBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKJNFoXl+Uup5TjO7IbM3xE5ajCbNgUwUxVam8DfM0I=;
 b=JqFwYfXjH287vgzYXLeI7mNZJ7TU/+FIu6y36/Q4/+RwC5JEjhOkHyA+kj25Fry4wYKnhEYoJMaDopbJpPSFfTrHuVf+0REXK9g6jMU6exakeQFLftq+/tagvoH1srLgJ6GBwgTr7JXZ3C9QKaLqULecR2sTaEz+/W3n5j4fHHM=
Received: from CO2PR05CA0060.namprd05.prod.outlook.com (2603:10b6:102:2::28)
 by CY4PR1201MB0264.namprd12.prod.outlook.com (2603:10b6:910:1e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Mon, 11 Oct
 2021 05:39:59 +0000
Received: from CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:102:2:cafe::85) by CO2PR05CA0060.outlook.office365.com
 (2603:10b6:102:2::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.4 via Frontend
 Transport; Mon, 11 Oct 2021 05:39:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT050.mail.protection.outlook.com (10.13.174.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 05:39:58 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 00:39:57 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 00:39:57 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Mon, 11 Oct 2021 00:39:53 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 11/13] ASoC: amd: create platform device for acp6x machine
 driver
Date: Mon, 11 Oct 2021 11:26:19 +0530
Message-ID: <20211011055621.13240-12-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211011055621.13240-1-Vijendar.Mukunda@amd.com>
References: <20211011055621.13240-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ec50987-4d67-4235-099d-08d98c799023
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0264:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0264C62C0BCA5812376F03C297B59@CY4PR1201MB0264.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RJk7+MLk3aCB950i9q80ZqD++pYVSTCJIPXQ9/Xfyl5OUoGpK/4oO3xtLhxL4oGMbEw9h/UtIA4MW2bg4Exdiq2QJvHRDMl7R5klkuTke50aWqBj9o76DdQrp2GZ63jjF++0bWe2gwPeg6kGWhgsF4bi/hCy0d8BXDscpGtz13IydW+XrW6lP91j+cbmMWr+VxZ/l18W+ntlMM8r9U23AlESq05qHIwheMd8vTGhP4wgCPddsSRWKe2XAi6XmpWjFwvLlY4lJvMYX8qtiQHUujXQqnioTH73wF4TTrfd0hchX6+J2xcsrSe1fIhQdWbgJnvROGez9R+UvCPXc6Q6gRR+0eSTGZEpcYtz3dLyyeMUN1yzT97mzfpkoIoSHLpCf6MZlQ0L2Hw4hQO7OxHWshbx5M5UDvtS7g+4JT55pGFBzQYJtpyOZkMuQcRpZlbAc9pZqnqgZcbg7kF+aODENnutasqQ3+W0ese9g8klHEp1MEX5bUTXszZn+t1pqSbexkzVCShKz9X6G1DDbeTXvM/OqXjkR4LCUBOFC2Oj3xlSDlkaoAgB7LjSsXy1inBvm8Gne6rPcpDBXkV11fpU0MOv5yxA0qUEUzYie+b8IM4U9fWT1KR3nlRTPexDgEkEprYFTMfI/RK/aHklb3J1ngnqfA+7FebE8lcZk5oK5SPaLvJrygrmChzI3lHe8AFLcv3nDo7w+xJAie6/ra8apikJvX91zeXR+hl0pDXvBNYar9naIypOZFdvj6Z4JM1VVtebMGa3u9Olny/XaioEJw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(2906002)(5660300002)(2616005)(70586007)(336012)(7696005)(36860700001)(508600001)(6666004)(70206006)(86362001)(26005)(82310400003)(81166007)(8676002)(316002)(47076005)(356005)(8936002)(426003)(54906003)(83380400001)(110136005)(1076003)(36756003)(4326008)(186003)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 05:39:58.5333 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec50987-4d67-4235-099d-08d98c799023
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0264
Cc: Sunil-kumar.Dommati@amd.com, Richard.Gong@amd.com,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mario.Limonciello@amd.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 open list <linux-kernel@vger.kernel.org>
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

Create platform device for acp6x machine driver.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/yc/acp6x.h     | 2 +-
 sound/soc/amd/yc/pci-acp6x.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/yc/acp6x.h b/sound/soc/amd/yc/acp6x.h
index b0d3f6a9d0ce..74b596e6807a 100644
--- a/sound/soc/amd/yc/acp6x.h
+++ b/sound/soc/amd/yc/acp6x.h
@@ -11,7 +11,7 @@
 #define ACP6x_PHY_BASE_ADDRESS 0x1240000
 #define ACP6x_REG_START		0x1240000
 #define ACP6x_REG_END		0x1250200
-#define ACP6x_DEVS		2
+#define ACP6x_DEVS		3
 #define ACP6x_PDM_MODE		1
 
 #define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK	0x00010001
diff --git a/sound/soc/amd/yc/pci-acp6x.c b/sound/soc/amd/yc/pci-acp6x.c
index 5f07db987cca..c6477ab6aab8 100644
--- a/sound/soc/amd/yc/pci-acp6x.c
+++ b/sound/soc/amd/yc/pci-acp6x.c
@@ -228,6 +228,10 @@ static int snd_acp6x_probe(struct pci_dev *pci,
 		pdevinfo[1].id = 0;
 		pdevinfo[1].parent = &pci->dev;
 
+		pdevinfo[2].name = "acp_yc_mach";
+		pdevinfo[2].id = 0;
+		pdevinfo[2].parent = &pci->dev;
+
 		for (index = 0; index < ACP6x_DEVS; index++) {
 			adata->pdev[index] =
 				platform_device_register_full(&pdevinfo[index]);
-- 
2.25.1

