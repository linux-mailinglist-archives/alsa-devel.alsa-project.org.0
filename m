Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F8E9F745C
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2024 06:55:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7B0A60291;
	Thu, 19 Dec 2024 06:55:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7B0A60291
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734587749;
	bh=lVgX+fLvSP85L2Rofn2ihdqZpltVmekJ++lM5pRSmPw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kg4rDiYl3t6vlmSWTZr/IqPYRnyP9wLzkEBb2zIw+KJ0UcbyUBA9elF37lyhq4Msv
	 y6WHDnRkHIGKPVIctpmVHqd6KmTMukelDO1hqIzWYSkj8HAm3wZZHboMM0JeQJWQ1a
	 21+ZXWyHtCXKz4VgiDLmSgF+B9afn61r0705mrpU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D38BFF808C8; Thu, 19 Dec 2024 06:52:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9ADDF80C06;
	Thu, 19 Dec 2024 06:52:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B33AF805BF; Thu, 19 Dec 2024 06:52:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::61f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0BC7F8075B
	for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2024 06:51:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0BC7F8075B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Tva90utN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sYYnTLbzvwlvWmTG/NRI/oMD7mzX8oYvbFIw3OXCkKWk0jX7+3MoQNU75jUyM86596VybuRmRMhDV7RW0eDDz9zyfarIzmZje0Hkfhk91T/k6CFpL4PSAt7d8ncFEapIK9XRqZv7j9I+s54XZpiCpVF8QNbwwr+rF7zvmx2WBxVAZbT7aP4QWNvfdX2oHIKrYUh+zaVbzw/nTtQLDNZ+StulqTTnY3sOpGQiY3VashJu2kBiFR6+bVKkZP4veJkiZ8/a7NmmsQNPMxOAd8YA4g7HwEGvcQttwL9DLw7cZF2WgPsYD/bmlwyfVjVvn+gAzxoO6WrcWvfU5Um4ZpCzaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z49mm4VSqdNYZlWWFiAkMujUb4pyfyf+byOBPncwc4s=;
 b=dWfb/wf2YaoGUpBzhSiDKlEWqoweU2z99nPAEFUdE/jDwEWLuj5DRvhIJnx7pIaPmFAFVAD2+BG4YpgXjweiasP39Sru9DTTHhKvNg6IBncp1KmPyidUC48T0UZ5FoJavawUz2yv+ai4GrUi+gmowzpciSsfvki1/64mw5WkJITWMHcIML+HkuKEELIf2kq/+v1EmWBvq+kXEdrQ6UsgG5MaLrSsW+aL/mzE5WSVXjOI/5oz+a8m3MHjv4+NZzPzm4zsxclaGD84ZXGM5yJjBDBrwmInCcSa9dMH9ABwiAaEVykDIkJuXvOHlHsk0jh4fl9ANtT6xYmCB8w7YiWqTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z49mm4VSqdNYZlWWFiAkMujUb4pyfyf+byOBPncwc4s=;
 b=Tva90utNccBbOpGLqKVOIW8zLd20Yt3N0b17+pAk+mBhqs1YEf60O8R2M5HNjqyOoSzL5WKVlCzT9DOAL6Ibp5gb9CGxi9BBid8voJsLTU3GgHtOQwh9jyD2DY+W1hvlPoidUiSj1rdU3ZdAPdoJrkbVwRaeSGM1RVVaidq3RPU=
Received: from CH0PR03CA0003.namprd03.prod.outlook.com (2603:10b6:610:b0::8)
 by SA1PR12MB7442.namprd12.prod.outlook.com (2603:10b6:806:2b5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 05:51:53 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::81) by CH0PR03CA0003.outlook.office365.com
 (2603:10b6:610:b0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.15 via Frontend Transport; Thu,
 19 Dec 2024 05:51:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 05:51:53 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Dec 2024 23:51:49 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 19/21] ASoC: amd: acp: add machine driver changes for ACP7.0
 and ACP7.1 platforms
Date: Thu, 19 Dec 2024 11:18:55 +0530
Message-ID: <20241219054857.2070420-20-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
References: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|SA1PR12MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: 12526e4e-284f-441e-3162-08dd1ff13d6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aWC16sjuIubuElrDywsZETAs2gwiXWYqY2krv/MDSfK5M9+lbRm+FxmgUjYa?=
 =?us-ascii?Q?54INaane2CD16mURxP1mP1A8ntRVtRObD8HBnkkf/pTGC2rrtKYX3bjjDdRC?=
 =?us-ascii?Q?8zBvS8C/ikoQbrYpk96x7DRVWUIIegcDbcimrsHINSoxt0xazHdXvqDeZavb?=
 =?us-ascii?Q?voxhk0g7mxiZ2ullRYc4P+vCmUSJmk9X2lNa7QzxpFo9vn13D7j8qJTFeDIQ?=
 =?us-ascii?Q?C2v98l3cd5p2gF8n71/ciTv1cKi6N+WkTQLCm/mHmuRCgwxDyw7y0LPMLvL4?=
 =?us-ascii?Q?j58Q7hT1KOeoaLqOqTjOMbFKIv+J/fPJ4VRJaGDek6vHxlr+pQSe/V8elkcY?=
 =?us-ascii?Q?b/576IaO/m0uWtwiLa6ilC+irqnWARKrxQNx/fYxz+qVA4yuBIu4yTsNuSK+?=
 =?us-ascii?Q?3ef5l6rwYmt61+DfRLXsc3+SJ+YZKS+2D3PVnsWiTX/BTrwbFItKo3VfuHPZ?=
 =?us-ascii?Q?7bHy19/oCfxO9/qTpahysIQWfXDHIhR/2ycWDRFozIjeC4pcaYaWyEMi7d0v?=
 =?us-ascii?Q?x9yxs76cqcXYRmX8YzB45iJNv7mo4Md2DTIq2fenYFbfjpicrwtSda8YlTlr?=
 =?us-ascii?Q?yAfhXM/2iQjM9fzz0Z4TXY/HoYZVQpM8zOd1kB5IhtozootyJ91CPygHu4aH?=
 =?us-ascii?Q?8xeC5qzeQAEKIEuD6TrVz9Ys7+qcqDTSEmzlv5JQjKESzqKjlCsbgwNOE/3E?=
 =?us-ascii?Q?junASIAJYYxH/1Na8hhkKFe3IbleHgY6iqxiMztRb8+DmOtEM4Pbb0bEuHHc?=
 =?us-ascii?Q?eyCctgmjOA6Fv2QJEcHsoWVYvXPj9aFGdZ8oak14Eh2lWUskYu7BYdzyeTEo?=
 =?us-ascii?Q?f5x0zEHoGqjtD/LAzGzjrzE2oRnBa/Rx60W95fgxrlle1Q+eMIJNRnfW3hQz?=
 =?us-ascii?Q?gFHHVQ/9gUR8cdBgUXbXp3F9BS7EJUzaqU1Z1DdwhVampdHxHAj5HHz9PE8f?=
 =?us-ascii?Q?1hv/OXoXDVt14NtJ+PgfMqDJdEbAZjSsE6qE1yTiDaIiu8N8wFtrbiPXT2Gq?=
 =?us-ascii?Q?ysb4m0x+qyvQ7HdRR2iF3IFYzB+U8vBKhgQe4HFArk50F6CruZTiBoUKDori?=
 =?us-ascii?Q?BgaXBWfw/KkEIt4t6EK3nUUxrrMC4c6tKltPRFaS5p3mQnKvoVifK5q1pCBn?=
 =?us-ascii?Q?3BsFdpkzv6+ACkrczs8jTpMKHlSRphZ6o6ZxTi1/I8x6IlFq33xPPccrqDuN?=
 =?us-ascii?Q?T/G7CA2zp2j8XJv8dU024qnVmIHGDqb0+qOh7VqsQVMMKPKL9fo8jtRAzMUI?=
 =?us-ascii?Q?mbWwo3FUn4YwrBDpGCAKho0fgOAqClIOuR50bng6RUP6i9ZjbnBIJEIumuAZ?=
 =?us-ascii?Q?VWkkxtQtSck7xVW+nNbOGp6HOKurXMnVBs2IEy+eVToX+9wMyPwDc0jXqqrN?=
 =?us-ascii?Q?8DRYpk+u2B/jOtQ/WnW4FUrbjwwTqF45tVPEjZbJLs4dlxVcTA20zlCmk6+S?=
 =?us-ascii?Q?xrcLm8YVEh4zt+DkyXOGgDi4qIkJQbLXe/gd1vN85I9dCCbL9yXNDrQrVJsw?=
 =?us-ascii?Q?7o2mD8DF92NXMLs=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 05:51:53.3752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 12526e4e-284f-441e-3162-08dd1ff13d6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7442
Message-ID-Hash: JXFL6PGSWBTBYHQB2SPY2N7FZE5HZ4XI
X-Message-ID-Hash: JXFL6PGSWBTBYHQB2SPY2N7FZE5HZ4XI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JXFL6PGSWBTBYHQB2SPY2N7FZE5HZ4XI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add SoundWire generic machine driver changes for legacy stack(No DSP) for
ACP7.0 and ACP7.1 platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 16 ++++++++++++
 sound/soc/amd/acp/acp-sdw-mach-common.c | 34 +++++++++++++++++++++++++
 sound/soc/amd/acp/soc_amd_sdw_common.h  | 11 ++++++++
 3 files changed, 61 insertions(+)

diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index 9280cd30d19c..e27093d80cc6 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -122,6 +122,13 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			if (ret)
 				return ret;
 			break;
+		case ACP70_PCI_REV:
+		case ACP71_PCI_REV:
+			ret = get_acp70_cpu_pin_id(ffs(soc_end->link_mask - 1),
+						   *be_id, &cpu_pin_id, dev);
+			if (ret)
+				return ret;
+			break;
 		default:
 			return -EINVAL;
 		}
@@ -223,6 +230,10 @@ static int create_sdw_dailinks(struct snd_soc_card *card,
 	case ACP63_PCI_REV:
 		sdw_platform_component->name = "amd_ps_sdw_dma.0";
 		break;
+	case ACP70_PCI_REV:
+	case ACP71_PCI_REV:
+		sdw_platform_component->name = "amd_acp70_sdw_dma.0";
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -269,6 +280,11 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
 		pdm_cpu->name = "acp_ps_pdm_dma.0";
 		pdm_platform->name = "acp_ps_pdm_dma.0";
 		break;
+	case ACP70_PCI_REV:
+	case ACP71_PCI_REV:
+		pdm_cpu->name = "acp70_pdm_dma.0";
+		pdm_platform->name = "acp70_pdm_dma.0";
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/sound/soc/amd/acp/acp-sdw-mach-common.c b/sound/soc/amd/acp/acp-sdw-mach-common.c
index 6f5c39ed1a18..e5f394dc2f4c 100644
--- a/sound/soc/amd/acp/acp-sdw-mach-common.c
+++ b/sound/soc/amd/acp/acp-sdw-mach-common.c
@@ -59,6 +59,40 @@ int get_acp63_cpu_pin_id(u32 sdw_link_id, int be_id, int *cpu_pin_id, struct dev
 }
 EXPORT_SYMBOL_NS_GPL(get_acp63_cpu_pin_id, "SND_SOC_AMD_SDW_MACH");
 
+int get_acp70_cpu_pin_id(u32 sdw_link_id, int be_id, int *cpu_pin_id, struct device *dev)
+{
+	switch (sdw_link_id) {
+	case AMD_SDW0:
+	case AMD_SDW1:
+		switch (be_id) {
+		case SOC_SDW_JACK_OUT_DAI_ID:
+			*cpu_pin_id = ACP70_SW_AUDIO0_TX;
+			break;
+		case SOC_SDW_JACK_IN_DAI_ID:
+			*cpu_pin_id = ACP70_SW_AUDIO0_RX;
+			break;
+		case SOC_SDW_AMP_OUT_DAI_ID:
+			*cpu_pin_id = ACP70_SW_AUDIO1_TX;
+			break;
+		case SOC_SDW_AMP_IN_DAI_ID:
+			*cpu_pin_id = ACP70_SW_AUDIO1_RX;
+			break;
+		case SOC_SDW_DMIC_DAI_ID:
+			*cpu_pin_id = ACP70_SW_AUDIO2_RX;
+			break;
+		default:
+			dev_err(dev, "Invalid be id:%d\n", be_id);
+			return -EINVAL;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+	dev_dbg(dev, "sdw_link_id:%d, be_id:%d, cpu_pin_id:%d\n", sdw_link_id, be_id, *cpu_pin_id);
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(get_acp70_cpu_pin_id, "SND_SOC_AMD_SDW_MACH");
+
 MODULE_DESCRIPTION("AMD SoundWire Common Machine driver");
 MODULE_AUTHOR("Vijendar Mukunda <Vijendar.Mukunda@amd.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/amd/acp/soc_amd_sdw_common.h b/sound/soc/amd/acp/soc_amd_sdw_common.h
index b7bae107c13e..9bedccfe25a9 100644
--- a/sound/soc/amd/acp/soc_amd_sdw_common.h
+++ b/sound/soc/amd/acp/soc_amd_sdw_common.h
@@ -19,6 +19,8 @@
 
 #define AMD_SDW_MAX_GROUPS		9
 #define ACP63_PCI_REV			0x63
+#define ACP70_PCI_REV			0x70
+#define ACP71_PCI_REV			0x71
 #define SOC_JACK_JDSRC(quirk)		((quirk) & GENMASK(3, 0))
 #define ASOC_SDW_FOUR_SPK		BIT(4)
 #define ASOC_SDW_ACP_DMIC		BIT(5)
@@ -38,11 +40,20 @@
 
 #define ACP_DMIC_BE_ID		4
 
+#define ACP70_SW_AUDIO0_TX	0
+#define ACP70_SW_AUDIO1_TX	1
+#define ACP70_SW_AUDIO2_TX	2
+
+#define ACP70_SW_AUDIO0_RX	3
+#define ACP70_SW_AUDIO1_RX	4
+#define ACP70_SW_AUDIO2_RX	5
+
 struct amd_mc_ctx {
 	unsigned int acp_rev;
 	unsigned int max_sdw_links;
 };
 
 int get_acp63_cpu_pin_id(u32 sdw_link_id, int be_id, int *cpu_pin_id, struct device *dev);
+int get_acp70_cpu_pin_id(u32 sdw_link_id, int be_id, int *cpu_pin_id, struct device *dev);
 
 #endif
-- 
2.34.1

