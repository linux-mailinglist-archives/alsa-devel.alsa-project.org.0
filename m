Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 228FB9E15A5
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2024 09:27:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04FE814E6;
	Tue,  3 Dec 2024 09:26:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04FE814E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733214419;
	bh=tgcQHnx+7iGFajm3KYwxmomnGyJW5dy33JkYZ0nOlWs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=op/WzPnwnf6sS67Ry1zahkUWvfF7uPNmf9ZpnfW+vPFZMrFcfHnc6roYPPLQxKlXR
	 9/vp7+3/DroWHbSj/WnDGD8O+eSfJdcKXTGBZXddjSiJfKzo3uLZ0MGXs9WPKTugfm
	 YBgSgXBVV6FIMbUZ8nF+ZiJYycDA4vkSPPZNUXpE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CAE9F805EA; Tue,  3 Dec 2024 09:26:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1560F805E7;
	Tue,  3 Dec 2024 09:26:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52D0FF80272; Tue,  3 Dec 2024 09:26:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2073.outbound.protection.outlook.com [40.107.102.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F721F80073
	for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2024 09:26:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F721F80073
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=i5AtFN0Z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dB0H+75Yn0+LoUYkYNb1SCs+H4On2umpligeOvhyg/hJDpIcqBLmUWhTPKXASbERc4iBvs+EfxbMj9TaLndVjhV+sKzvBGP1R2BFGF6qfYvFxKmEteVfVctwu1PZuC+TKRuUhTCbzb7+LpmORd/oZi/UaG+otSuZ7PNVlXzqNlNkMGX35GPmQKdFBznSlAs/bgdZ/iPSd0jvkNvNixU6CcHrz1yHTHqPRQn5Rol2qcrr6VKPed3z6ZZ+s5hRE1bvsK1ZQYLxj9caR7AuotuuQ1ONNeVueJMcPFlu8K3dwPid0VI4vsYd6E5fqVSCTBm6WKVex26BGm3+TFA5rw2J6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlzoDTko5WKzMDkMDDSbScPYqLovUsMAuMxHyDa2tZ0=;
 b=ZsWlPX2cb1pOhXOCvf2q4m2nAq+g4wJRntkegTUa65atahFxtwZYsQJ6d1X/AM1XLhKehfLjal0vWkrhW1y3/RYjgxZOydRvdWtXo6aKkWyLmB2da2XjjwN9n5DyTBZ0ngRHkmp/Eupie7CWfV/GtmMMfvwTQltTx4qBCx8pA21S4b6G2MF/D87oTe9NaGLqEnNzZ5DkqfoyMrZusH9PqnY/Y7o7RDXmlNrfYukKTkTToInVV1FFGAuOtjPUo7Jg7K5Jp83Pg6A3PVv6+ZXn3n6IY5ouVRpD7zzFzP9ludHszUroNFovnM2AhmlbanWgs61i7KfzQDptKZZu7yTJ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AlzoDTko5WKzMDkMDDSbScPYqLovUsMAuMxHyDa2tZ0=;
 b=i5AtFN0ZelhXxPc9+vwV3kVAGkff8NO2oQZT+1Ra9YUT8jjxoiaYs7TnjtbqOVOs9o6MbD4PpSy3i9SpecpJImrUkhqxEPoOLSlCjPu2UknzxlUq8l7q5V4A6aXtNxTemq8gwyO6aJmn6Gb+x1npvadS+aNscjuNBpu8R9a9K4g=
Received: from BLAPR03CA0102.namprd03.prod.outlook.com (2603:10b6:208:32a::17)
 by MW4PR12MB7215.namprd12.prod.outlook.com (2603:10b6:303:228::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Tue, 3 Dec
 2024 08:25:48 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:32a:cafe::82) by BLAPR03CA0102.outlook.office365.com
 (2603:10b6:208:32a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Tue,
 3 Dec 2024 08:25:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Tue, 3 Dec 2024 08:25:47 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 02:23:21 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 2/2] ASoC: amd: ps: add ZSC control register programming
 sequence
Date: Tue, 3 Dec 2024 13:49:40 +0530
Message-ID: <20241203081940.3390281-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203081940.3390281-1-Vijendar.Mukunda@amd.com>
References: <20241203081940.3390281-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|MW4PR12MB7215:EE_
X-MS-Office365-Filtering-Correlation-Id: f9d0bea4-41ec-41bb-7837-08dd137416b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lLaDaX+LAzrdM2V8UutdIlQ4AzC9zAVcCmNLNuAReDzka3VhttMv1qjOdoN/?=
 =?us-ascii?Q?N1nbCBfFfS849f2K6OMD3czEXJkpRuc8+QGHMVgfLK4UNolszuuO/B+Z9JOB?=
 =?us-ascii?Q?gkRQncOWoQdjZZrgsr4ILNHf9JpXwf2jYqSxVlyRo/Y4v+KnGaFqrG1Wk8Bq?=
 =?us-ascii?Q?LNgxqN8Z7Wo2cSxeA6i+3yUs0ulVhHJNuCWh/sQivwdZ9Qytm1SwCUS3DQW+?=
 =?us-ascii?Q?VHe4MdhyDym5OcaD5sZbQ9rr1li+mSuYTkMNcYQ6j+6RppcJrzWfjKjneC4X?=
 =?us-ascii?Q?TI+gE5VQD/vXCTM7Fk0HZ73U6lEHGXHhafpO1zB4thlHy6nt96CYErVuktQe?=
 =?us-ascii?Q?8Oo30FWYA0z//Eb0N7SQ/3rFHY53StGrK+054Y6sw1gcdMnV2akb6I5vHQto?=
 =?us-ascii?Q?p71Tf41DJ5bQPOTlcJhkncPk8dZ1bY3bvH85PiZ0BM9c5pVcPLaNCA1nRaZe?=
 =?us-ascii?Q?jR4gxiQoOZMizO1QxrDfX4vKFVyl960t/nuFxvHHUO2KdXQaYpX6RYoocTeZ?=
 =?us-ascii?Q?r4psuIHIV5XL2P6l171W9cz12JfbvzECgtNK+HWBL49xCFSlqmzNAT+45cYu?=
 =?us-ascii?Q?j8/XLb7cIJ9wYGv9YSVzIKP4v7sZWAdjbZ1BoNhEV8cxDwKwz7KGMJst+9BE?=
 =?us-ascii?Q?K5FtlOmoQ1ayM8nATwWqcrxcoXrZrv33vElMhkmhIzefvK8RaVjEA++ZHQki?=
 =?us-ascii?Q?yORoDkKVXYfF3srKbYxIoUHDsjuV/nNuqJI8NNSnBu2szVBTGDVffRvT8UnZ?=
 =?us-ascii?Q?eV9StkcOwmlKygXT7YKdIe1JyK4gznhGLrIpd8pE0eW53ypBd/ClOS9MhsKb?=
 =?us-ascii?Q?TMhsVNQgVDRLkBuO6EjmSROIuJgy+OxdHRtRxqlNliJDlQpiMdbKjTkh3LrC?=
 =?us-ascii?Q?erosMrI+Ll2/3oZ2UkSgFHcBt05UpnzW9z6F/AsDo6CutsdJdwKk0TIqeAA6?=
 =?us-ascii?Q?rhel4g6OOPMzDW/PCO1m/hH/3MXEFsE2358wmj2+3fu6ZCEo2W3t+/7ZZ584?=
 =?us-ascii?Q?3iHA3g2ogGPqIqDei06jwH80K1Fd0gqBkD7wXZoWVGsOMhbOMdbYjPCP0j+D?=
 =?us-ascii?Q?NTEOa9l5Kuqt51ZT6H1Gr89RvdVZYlaHeIyDfKG+sCuVkD06d6NEnaX1fO5H?=
 =?us-ascii?Q?NvJA94kaIBsTTAXB3uDzH3X3Z8gx/Du78nvOzMcj+IFUIhauaEkEj574Ih1K?=
 =?us-ascii?Q?D/a4ip+J+WFFYc5FcinuU6fKs8NWuTXOCqwqfWIUoBhgYyIa9ThquedeR0tM?=
 =?us-ascii?Q?bLCSjfs3IsGmEWdMz1FkqCPr/vnwzgjfOwi2iHePLuu1+lvn6rfhocm5LEVN?=
 =?us-ascii?Q?LBL4IYcZvpnpSNmyptuxtjxgvCBqcRO1KByKLhRb+Qy4CM1LDKydFuqdIg7i?=
 =?us-ascii?Q?GShjdUYTF4GfF2MMKT3dZDJvTuPtXt/nejZZIt0KwGDEJKKQkalHMccvbu0K?=
 =?us-ascii?Q?2G9zNYTjlgDwqpzgZpOwMq+TzCcEGNPp?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 08:25:47.2935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f9d0bea4-41ec-41bb-7837-08dd137416b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7215
Message-ID-Hash: ORNNUHE6U3MJ2X74H76SA5346C72TMQ4
X-Message-ID-Hash: ORNNUHE6U3MJ2X74H76SA5346C72TMQ4
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ORNNUHE6U3MJ2X74H76SA5346C72TMQ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add ZSC Control register programming sequence for ACP D0 and D3 state
transitions for ACP6.3 platform. This will allow ACP to enter low power
state when ACP enters D3 state. When ACP enters D0 State, ZSC control
should be disabled.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/pci-ps.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 4ed50cebadb3..22b677a026e1 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -83,6 +83,7 @@ static int acp63_init(void __iomem *acp_base, struct device *dev)
 		return ret;
 	}
 	acp63_enable_interrupts(acp_base);
+	writel(0, acp_base + ACP_ZSC_DSP_CTRL);
 	return 0;
 }
 
@@ -97,6 +98,7 @@ static int acp63_deinit(void __iomem *acp_base, struct device *dev)
 		return ret;
 	}
 	writel(0, acp_base + ACP_CONTROL);
+	writel(1, acp_base + ACP_ZSC_DSP_CTRL);
 	return 0;
 }
 
@@ -655,8 +657,10 @@ static int __maybe_unused snd_acp63_suspend(struct device *dev)
 	adata = dev_get_drvdata(dev);
 	if (adata->is_sdw_dev) {
 		adata->sdw_en_stat = check_acp_sdw_enable_status(adata);
-		if (adata->sdw_en_stat)
+		if (adata->sdw_en_stat) {
+			writel(1, adata->acp63_base + ACP_ZSC_DSP_CTRL);
 			return 0;
+		}
 	}
 	ret = acp63_deinit(adata->acp63_base, dev);
 	if (ret)
@@ -671,9 +675,10 @@ static int __maybe_unused snd_acp63_runtime_resume(struct device *dev)
 	int ret;
 
 	adata = dev_get_drvdata(dev);
-	if (adata->sdw_en_stat)
+	if (adata->sdw_en_stat) {
+		writel(0, adata->acp63_base + ACP_ZSC_DSP_CTRL);
 		return 0;
-
+	}
 	ret = acp63_init(adata->acp63_base, dev);
 	if (ret) {
 		dev_err(dev, "ACP init failed\n");
@@ -691,8 +696,10 @@ static int __maybe_unused snd_acp63_resume(struct device *dev)
 	int ret;
 
 	adata = dev_get_drvdata(dev);
-	if (adata->sdw_en_stat)
+	if (adata->sdw_en_stat) {
+		writel(0, adata->acp63_base + ACP_ZSC_DSP_CTRL);
 		return 0;
+	}
 
 	ret = acp63_init(adata->acp63_base, dev);
 	if (ret)
-- 
2.34.1

