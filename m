Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3F0949F15
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2024 07:23:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B4CA192A;
	Wed,  7 Aug 2024 07:22:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B4CA192A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723008185;
	bh=mTm3MAKgh+w308d/h61q/miRKwKQ6+/Z5FzsQKtxiJU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m5bMvxsZbWMOaY+z4tkMQhnHeVIQAe1pQlUslmEr4ATwr5dl01sBVrAsDlYjYWrWG
	 U80lZhzOP1UzlzwidjTplRL39NSwAz5wg0qiaWEKP9SwMT8WeL7W24mUSb8l6OS2SV
	 SnE1R9LC+JZAzhZPZzlsB+KPEAt/l7LebZjIQtg4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE244F805EE; Wed,  7 Aug 2024 07:22:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 625E0F805D5;
	Wed,  7 Aug 2024 07:22:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB08FF80236; Wed,  7 Aug 2024 07:15:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A754EF80236;
	Wed,  7 Aug 2024 07:15:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A754EF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=o2g34QHv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lycz7aIxBo3aQGl87rq7C2zYl86sVB3dY2fH0xOIDFU03seInSmm2OfIu/b12wXRIcRLK3+qbaznPOxrO2rWJMUKX607t9mUXBXnT3gpSq/k6PSnYQhgp888AZlfzZFCEwUlSBPWXklPg1nJsbDxa3NDseTYwC2slZpL6cp4iJbLqCani1ho/B1ZI8wPQsKWo2BpgAMvxw5zDBq4zhdV03pLaL0f6mnj3EVOzRQbC8OiZEeyH76AlIIFhpB0EERGB3yT2LLd9YSyboHnIKMZFuslsw7Z1f9peEVfs+hfTUuCZAVhEqI3tds5Izbe48DvuNlg99i4Ach/9yuSY5v6Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcmZuvb5AQbGbL7i/i+v7liw89Xk0n11G1csEO6y+kk=;
 b=r1u+lZi6Ol3+fWEkJJ0n+en1G7lrnSPHVbXmBoM8D8bkAX5phobebuDYL/aG4k0qjmvJN24Dtz01x8Xo/AUUluih+9U28ywdWU8F0vbeO3cwpOGCcKOfYzXf7NvDR2w+55hYRQU8Ipd/futickXwR6N3+g/4sTp/T1pL3WCrU/+i+Pkps/q3xaoeOMuBX/RHAg+yQVexc+ZT9WS5j2XZB8TSNFPic3/s3cCvkdDjL06hl4WCQnFu7STzkQgC+pbh068NstVrJNTZe0QMEZwBAj0SdwqlJHg0UXOgCsXBUZlt0F0zDEcWOItBsIg6su9u39qZgHnjRMTuT11F3V24pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcmZuvb5AQbGbL7i/i+v7liw89Xk0n11G1csEO6y+kk=;
 b=o2g34QHvvXcSlx2hpDdLWLSfy+QN6FkQysPYVLz7x3RZFpLM4P52bYNn8yUcBSLoD+HaUNR+HkMcRPe3ZauUZAgZJEl+WRRTvEZRknD0HGNz1wAhdQlwxKFclpaWu2Z84GSuUuNtgj2x5APlSlLtBDvwUTNXHGNNM4By+8JWB1E=
Received: from BY5PR04CA0014.namprd04.prod.outlook.com (2603:10b6:a03:1d0::24)
 by CYXPR12MB9340.namprd12.prod.outlook.com (2603:10b6:930:e4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13; Wed, 7 Aug
 2024 05:14:56 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::9e) by BY5PR04CA0014.outlook.office365.com
 (2603:10b6:a03:1d0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.29 via Frontend
 Transport; Wed, 7 Aug 2024 05:14:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 7 Aug 2024 05:14:56 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 00:14:50 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	"Kai Vehmanen" <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>, "moderated list:SOUND - SOUND OPEN
 FIRMWARE (SOF) DRIVERS" <sound-open-firmware@alsa-project.org>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/8] ASoC: SOF: amd: update conditional check for cache
 register update
Date: Wed, 7 Aug 2024 10:43:17 +0530
Message-ID: <20240807051341.1616925-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807051341.1616925-1-Vijendar.Mukunda@amd.com>
References: <20240807051341.1616925-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|CYXPR12MB9340:EE_
X-MS-Office365-Filtering-Correlation-Id: 601b7c56-e2b4-477c-f25f-08dcb69fe0b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dPnZtwacsC0gYUPR25RfISHs6InLBNaotjNNH0V+p0oLOK3ZvYJR1VFjuaTt?=
 =?us-ascii?Q?tIY94uBwqO6rEGyl2nNEf/6Wm+e+5R6iMwwnzC01PJKbt5PCdD86TJN7JIow?=
 =?us-ascii?Q?YrnhbutoMvJDSf8/RWiBD7y2p2KiQWqgAOXF1i7A7I75InOFSmKaXMiVN1w/?=
 =?us-ascii?Q?BjDGWXs1JBGSBpHLPtOWdDaunPt0E9fPUsLsvsRqc9yVvp37X7cODoi+Jyyo?=
 =?us-ascii?Q?zn9DJm7i0iGa/tThe+vgjggzwn3E1y4eTGT4nDwdqGimUtfSHA86bBZuyJ8G?=
 =?us-ascii?Q?wmX7eHhCfbXQE7YvJxZWZQhHQERODhAfdgXrj8EorQpVvYowR7Qi3xtHNUHa?=
 =?us-ascii?Q?ZpojWpfhoWK2IIKEijKW2wrypPj1W2hxWckzZehgV1wa6c+3bfeNULBZZvY4?=
 =?us-ascii?Q?F178myXHOyKZLoOAI5wO/ioKbnZIRUDtBPpHOPQUgBcAeldxR+vK3p08lAZA?=
 =?us-ascii?Q?83Cl9OuQFtR8IxrFLm+YIfqeN8Rlb7h/RK1Xgc/bDPYakf1jOSSpQIgDX0sE?=
 =?us-ascii?Q?IP0pv3ViCrzAZ8mwkqZKKS5kCzfZmoUiNtSYyaw6HTUMLcU7i8nIs8uKZ8RC?=
 =?us-ascii?Q?LzStgLZvie0yONtwsVbmdwYy5ulluSN7JndISiHY1OEx9xjR31X81jfkfc0J?=
 =?us-ascii?Q?W17o5VCRWpIkUM3VkjVHgIyi1EXzz0Ejg9tLDa21tA2B26zUL9BAVTzC4rSW?=
 =?us-ascii?Q?NvmXZiyXhZm3alHFxuwWkYTKq5MM3YzrcI5YqNGCBJMZHl8JpcLfmp04+kmI?=
 =?us-ascii?Q?ETE2Jblo/GRsAReFrHSYJqqbQawRdXVQVAFNhBfiTjw2vZuewYKjVVA+pEfI?=
 =?us-ascii?Q?Ehyj+L0f/W4UVsMVey/G92OA3qTQ6H07We0YOOuYfO2ogyYhd0V2+Gzo8Sg6?=
 =?us-ascii?Q?7ssXQu0M7avDc+cCtFwnOYNO2svLyn1x2HX3P4YJBUj2yHhG/RmyWwwLPH4i?=
 =?us-ascii?Q?NL0xp0ypJJM8bUqnjxZ8WYCfYeCFHed6ittyS3AFVOM2zBi2Z5F/nOe/YAwD?=
 =?us-ascii?Q?JmehFqrqm2XZ3AHnF0oDR0gtA0t0cUkSfjz/JlKzTP8e+BrnMaLwo4Ejea76?=
 =?us-ascii?Q?D6Ujbhe5KO0/wzOLayH9F/LEVt06Y+kIs6Uk+lEWNnoqBU/RTJboY0+7NAfQ?=
 =?us-ascii?Q?FaZ0zuRcKhboTPzdfkSzmTUuPGuL/7ZsVJ5cvM4QPOxUIV/B6adI4xe6c+Ld?=
 =?us-ascii?Q?v2W6Yq65An7FSgGEM42hbGsGRyB+8J22sNg7yAFMeeNLMRbf6SXPD5vqGX9N?=
 =?us-ascii?Q?K2MQpgXHu9IF9mR5sTozspRiTq9CfrsNH7bD9Svo1FZ66/lhD7voKXjCDxdh?=
 =?us-ascii?Q?ojeyOWlVh5s71vs7Dm3QYwPM1pGcMX/mMCM9fEf8nNjy5yyCPp9nHMT83TW8?=
 =?us-ascii?Q?wkABBCS4pw2BtrSEZgS7lPwejVjFeCjNje4pquihFEeNXQzBFrkGCuA2XSTV?=
 =?us-ascii?Q?jj5JLPSdMB7ZovxZx+eftE9xZk/toFTm?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 05:14:56.4240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 601b7c56-e2b4-477c-f25f-08dcb69fe0b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9340
Message-ID-Hash: CUJ3V2C7HPELIJDD7ASXJBODMJV7G6NX
X-Message-ID-Hash: CUJ3V2C7HPELIJDD7ASXJBODMJV7G6NX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CUJ3V2C7HPELIJDD7ASXJBODMJV7G6NX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of desc->rev, use acp pci revision id(pci_rev) for cache register
conditional check.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/amd/acp-loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/amd/acp-loader.c b/sound/soc/sof/amd/acp-loader.c
index 2d5e58846499..19f10dd77e4b 100644
--- a/sound/soc/sof/amd/acp-loader.c
+++ b/sound/soc/sof/amd/acp-loader.c
@@ -219,7 +219,7 @@ int acp_dsp_pre_fw_run(struct snd_sof_dev *sdev)
 			dev_err(sdev->dev, "acp dma transfer status: %d\n", ret);
 	}
 
-	if (desc->rev > 3) {
+	if (adata->pci_rev > ACP_RN_PCI_ID) {
 		/* Cache Window enable */
 		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_DSP0_CACHE_OFFSET0, desc->sram_pte_offset);
 		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_DSP0_CACHE_SIZE0, SRAM1_SIZE | BIT(31));
-- 
2.34.1

