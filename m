Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FBBA2BB7D
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 07:33:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B61060211;
	Fri,  7 Feb 2025 07:33:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B61060211
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738910001;
	bh=TC7L+1CLAUwWm4rY7CAou7PTpAll00Kzw5D7XHVz9Os=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E83vMAlgajrGpzpYm/ZlYkmbI/1+U7hmdw2Bhf1eeDzLYyyNEVp/MF35rXzKPoAKq
	 m5rXv9Bd5zKLoCDOctVO/qRaLUr7MIMHNyyziztZkUAJkgRT38TCk4CWoA3V6VRv1z
	 7iiCFgsI0iml33dvv16NNR8z8OpEMo67H45gA/Gc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBF84F80BF3; Fri,  7 Feb 2025 07:29:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EE58F808F4;
	Fri,  7 Feb 2025 07:29:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 789DEF80735; Fri,  7 Feb 2025 07:29:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::608])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF7E3F806E5
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:29:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF7E3F806E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=OGAKsdYQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6TiTxwjrUV2rMs/dDjGhTSyubLpFOBrp4lbGcCzA1m9urg9ix0SuCcdOdhfajiQgDPDZMW/IQOkzSvQuYdsx7p41Pen+I55heCRx22EIZuzI3QECCYdMV7sXY4bO+f2AdAsnVcgOc6R6fxITKjRJYpzp+8HKgXN/yq1u47aHA7Pt3tchZGXV7d0xKFyzEd/DwnKba/P2ZY6jzxLY1DpMei2thn6qqZzzEbwoPrvPi/DsNi8j3aQD0w6aL7aaphMngMzEdC6PblOAxQ+8OMVyjUogrFdZwDAoKQzjD+9PCKKUV5StcN6RYMkq4NLOONGihyM0fPGCiQGcAbrL1rdQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oi5LiCWrK/AxYQdSJ3vjOROHGCc0qfufGS5SHrPBAyI=;
 b=qJ8YxEHv/uddzczH2FLjpj3grPdKgDtN0yxLTxoY6XyEQwNU/9MPaIKJydRnKtqnROt9rtzXqIX/502JnWf/vnGiUiACW2O2ia2Lc1Cz2skT96AMWI3quKHkIpSqhN8XyQfNEiRijMiO+jHMEcjReVJshRxWSqza+V+wCAoM9QjlOk9S1zlm6jr91s0L2DcxcvqwI0GWKy7CujWRuf78mjHy4RLV5pGMEQ121l1M3ZB3TPIenlsELlYOMEbGQdtAR4icyyARGGP/krSi3iUDdhrEtkxpv0UVvoTh6VAetIuUb8Pp+RAci7Tl7TEe6b+ku/kAYItR9LHK8f3jrZ6bhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oi5LiCWrK/AxYQdSJ3vjOROHGCc0qfufGS5SHrPBAyI=;
 b=OGAKsdYQL8YlXTpUagQQiREvGT1UH0hb/mP7ZsV76lM9pvQTWarqjbPOmEM+PTyw1hvVtJlHFlokzApWttuic/MLbPjL/rUAbarFIwikeo2JbcMjF29RkpkkXCWL+D65pmOUqJyDjXtqXhYzrEj+j/8e2iMVOhowGa7k0zgV36Y=
Received: from PH8PR22CA0002.namprd22.prod.outlook.com (2603:10b6:510:2d1::26)
 by PH7PR12MB9256.namprd12.prod.outlook.com (2603:10b6:510:2fe::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 06:29:27 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:510:2d1:cafe::f) by PH8PR22CA0002.outlook.office365.com
 (2603:10b6:510:2d1::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.30 via Frontend Transport; Fri,
 7 Feb 2025 06:29:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.2 via Frontend Transport; Fri, 7 Feb 2025 06:29:27 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:29:22 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 13/25] ASoC: amd: ps: add pm ops related hw_ops for ACP7.0
 & ACP7.1 platforms
Date: Fri, 7 Feb 2025 11:58:07 +0530
Message-ID: <20250207062819.1527184-14-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
References: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|PH7PR12MB9256:EE_
X-MS-Office365-Filtering-Correlation-Id: 6898b6a8-bd63-45a8-18b0-08dd4740c587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Nhn4E/8y4b3BaORf7jfRhtyTHmjYnR25Gj4VFsjMxoJo3UqqQxNVew7XgK+8?=
 =?us-ascii?Q?dFMp1NOIinFsqgBFDO59YxjkIPTcoCgJSKqgVlisiwCqUEDLLZ6OtQKjG/0G?=
 =?us-ascii?Q?yTDnZDb7CNHskyXV8wBiQwertjPQwr3GYk+c3+B0/0O2p2PKMCxOyXuwJuSH?=
 =?us-ascii?Q?p8Gi9h5Xa3LXi8TKrqvHdQVEQFvvoVrudJPCgf6C6Az2CeyWso1aeQJ9CVFI?=
 =?us-ascii?Q?ZmJrIHwA7vAYCexBFdh9wSPJtUKZPmjcR7xBbYiFKhXHrlMkAzMRdf7kbw8p?=
 =?us-ascii?Q?1LPkj6fDGqh0kqSO8KZOcLFTDq84BVs0hE8EzXShK2uqFnbTtSkFiJ6sd1ft?=
 =?us-ascii?Q?2tcwd4MeO5dm4nT9NsbWEFLu+skD+gNcIzK0odJuIB6v8FkI+jFMl1eKHLnA?=
 =?us-ascii?Q?u1fjNcks0Gz9Z7brpImsDULrTpF5JY25zCwed6yeW6k3zRX3BAV12qNSU/BJ?=
 =?us-ascii?Q?U9jjNTCxDHycmhFHXTRETC7d9/6K3eM6NYn5Kq+JtEx0GMNNF2RWsO1m6OkL?=
 =?us-ascii?Q?KtziIBTXHHXe4h8R1iJ9m+/sOxq4FnifJ60DrmWwgRSL4S7jBk6adPLoMlt3?=
 =?us-ascii?Q?lcKtV3Bsiz8nvHFh/cFk26SWUHgbmWRIppNLUdNl6xLDZvzVmn6YZUNt3x2J?=
 =?us-ascii?Q?J41OMaP6diyRblV2Daw4+4byOfS8KSVgn+am/psD+f9Ivgx0ExGFlm97YSrj?=
 =?us-ascii?Q?13lsB9XVj0ZgkPnfg94WbgA+Pw+SsRG+4j2JVPaeYepMclN8JeYuh/Y9OytF?=
 =?us-ascii?Q?S6a7uXqOcZ+gQ/bjGFneqAKaUrjGVr4PlFGhx43bs4G1mPhr5ixECWZsEUpm?=
 =?us-ascii?Q?9EQ2NL8UcovPcsSzuZqXtUIFQIL5t9WBTzS5TOS6jd/GViMR98YI5Mzf4IsO?=
 =?us-ascii?Q?hIel2vYO41cBtlHIHznATHhQDa19mIVWL0pA2hjhLInG3CQu+oFt6lrg3Uc7?=
 =?us-ascii?Q?cRbQmmbWOM3UkornxPgz/oCWIPWTvRovanVK9EBQzNFKZk6xk43wb55/nhtx?=
 =?us-ascii?Q?3+moqcHs+mUS5R1Nw+36D0V+WWqdmsk326wHEI3SRbopNDHoXmke5GQkAw3L?=
 =?us-ascii?Q?lp9cmcd3KxyFpbv82sbPegRezC1Bbt81YbaerSF/+C6s4tsJQ8VxMw8TOxMY?=
 =?us-ascii?Q?txJOpk03eMigSYjvj8nB6sbY+8Zx43NIokwlYQ6PNd2FFbzBfvJ1DSpQjNwi?=
 =?us-ascii?Q?kcfzE7ENINXR3xQ6UBimUAJ87N0PJ0FsFvT08DoGtWemR9SoDcDjOCPEBBWa?=
 =?us-ascii?Q?qt7OkkJcuvA4jyJYgJZwIOll8DAxcDXGG9LX1E3cBtv0qwfOLzarXUXwffOp?=
 =?us-ascii?Q?EGJAzTNKrZxi+toEqmOB8jxonVCJ8FymPZxrwmURAiRehZVRcqT3XB0vFlBk?=
 =?us-ascii?Q?diYgJTilVLPbLISQJdkQ90gyX5MnoiMmzN5UXLwNFivCL4+SW9dGXPP0GR+e?=
 =?us-ascii?Q?Em9fYLsFlTVqWXR7zQgHSyrcJQ+r1Qh4YTI23WhlWLiz//KqD3a9gcyJ1XP/?=
 =?us-ascii?Q?IP11Ff4YQkoyB70=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:29:27.2360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6898b6a8-bd63-45a8-18b0-08dd4740c587
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9256
Message-ID-Hash: QO7OSQZEY3HKEIBR46UOJLNIXBN436TE
X-Message-ID-Hash: QO7OSQZEY3HKEIBR46UOJLNIXBN436TE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QO7OSQZEY3HKEIBR46UOJLNIXBN436TE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add ACP7.0 & ACP7.1 platform specific PM ops related hw_ops.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/ps-common.c | 65 ++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/sound/soc/amd/ps/ps-common.c b/sound/soc/amd/ps/ps-common.c
index a15284bde48d..6639dac0a415 100644
--- a/sound/soc/amd/ps/ps-common.c
+++ b/sound/soc/amd/ps/ps-common.c
@@ -378,9 +378,74 @@ static void acp70_get_config(struct pci_dev *pci, struct acp63_dev_data *acp_dat
 	}
 }
 
+static int __maybe_unused snd_acp70_suspend(struct device *dev)
+{
+	struct acp63_dev_data *adata;
+	int ret;
+
+	adata = dev_get_drvdata(dev);
+	if (adata->is_sdw_dev) {
+		adata->sdw_en_stat = check_acp_sdw_enable_status(adata);
+		if (adata->sdw_en_stat) {
+			writel(1, adata->acp63_base + ACP_ZSC_DSP_CTRL);
+			return 0;
+		}
+	}
+	ret = acp_hw_deinit(adata, dev);
+	if (ret)
+		dev_err(dev, "ACP de-init failed\n");
+
+	return ret;
+}
+
+static int __maybe_unused snd_acp70_runtime_resume(struct device *dev)
+{
+	struct acp63_dev_data *adata;
+	int ret;
+
+	adata = dev_get_drvdata(dev);
+
+	if (adata->sdw_en_stat) {
+		writel(0, adata->acp63_base + ACP_ZSC_DSP_CTRL);
+		writel(1, adata->acp63_base + ACP_PME_EN);
+		return 0;
+	}
+
+	ret = acp_hw_init(adata, dev);
+	if (ret) {
+		dev_err(dev, "ACP init failed\n");
+		return ret;
+	}
+	return 0;
+}
+
+static int __maybe_unused snd_acp70_resume(struct device *dev)
+{
+	struct acp63_dev_data *adata;
+	int ret;
+
+	adata = dev_get_drvdata(dev);
+
+	if (adata->sdw_en_stat) {
+		writel(0, adata->acp63_base + ACP_ZSC_DSP_CTRL);
+		writel(1, adata->acp63_base + ACP_PME_EN);
+		return 0;
+	}
+
+	ret = acp_hw_init(adata, dev);
+	if (ret)
+		dev_err(dev, "ACP init failed\n");
+
+	return ret;
+}
+
 void acp70_hw_init_ops(struct acp_hw_ops *hw_ops)
 {
 	hw_ops->acp_init = acp70_init;
 	hw_ops->acp_deinit = acp70_deinit;
 	hw_ops->acp_get_config = acp70_get_config;
+	hw_ops->acp_suspend = snd_acp70_suspend;
+	hw_ops->acp_resume = snd_acp70_resume;
+	hw_ops->acp_suspend_runtime = snd_acp70_suspend;
+	hw_ops->acp_resume_runtime = snd_acp70_runtime_resume;
 }
-- 
2.34.1

