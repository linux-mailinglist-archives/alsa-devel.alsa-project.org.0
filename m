Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB03D94487F
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:34:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 485B83B14;
	Thu,  1 Aug 2024 11:32:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 485B83B14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722504782;
	bh=eGgwrcdu1pwB6BfUTjhL8YT/g4FVNfycDOP8imUnFzg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kCdlkRgzcSl6PMUCREaXONMvJlOa4daVy8ZMUFUDB6I+yzNChMC7Fv59rYIrDLCJF
	 FnKA/kMvCq6HNPm0G0TzcDghOtRgGjuvFthv5s5K6rkE2T//POsHRcWKL9jg5uz1Zx
	 x8LZWehVfx6GHFCtML8VmrfMC+kLMlbxG1GYtOio=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9335EF805BF; Thu,  1 Aug 2024 11:32:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CEEA0F805C2;
	Thu,  1 Aug 2024 11:32:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A397F8026A; Thu,  1 Aug 2024 11:19:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18B7CF8019B
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:19:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18B7CF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=etFGNNNx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ng2nRqvysMWk6lcW2wT8LhamJLfV9H2/Gj5TRPvNn+9Ia2WolH6p2hkX8wrYrsHF46D2HHC2VmehMSNynDvte9Jj/xEhPxLAWo+aUYg9ho8c1p/crG+tOvoX4LUtyqbIw9EYAHRgsgcz9raMO0XPVZBU6wxA/St303mTAiT3wfFH51GAcsDKe/cTgqpCBEWTlP5Ia3brPIAfSW5I/loxOQZbYVGABj1xhqjOqutF9JiPakua/vyXOrJkFx4PSwff2O4mxtkQ2osLqapdzCyHZ8zqhqM+2PdW99smklCv/LMO/MIFB5eVesEHJ/ZSIJ+UHMEIur5/Z4RpYa5HSTPVcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5PhBdhWSJKgEbj7Xmz6uau3/rcfvUoIsh4OCENhd4E=;
 b=vmKFeumua+MjyIqiF1NPVM9YV+u8aUH5Ket9HUiNE4X2gp9+TBBWc4+Gjv3WXDq18oUuAFdwWPEPbbSvX1ZF6rJDpYMYXbA0W8NfZrvgwQjVw57l0+0PJTXLTGF04ZFZPcqS5fkNjRV1wQGcQxtKC3LDOontROBwyZ5i2tibQ7J9tiQfWSf2PjbukN4uD1bImPW3BNzZwCRSQgdvuEl3JMLyKlANefMjbIJ2JJw+g2spuuWciN3SaGc/lb/rzUK1lpYkb84jLMlBpiZLkVZ5G7Y16SP7ywSsCKQo5oAEMXTajJh9Sa3MFV87l3XJY1TrWihe1lNOLDDs6IGicGOEmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5PhBdhWSJKgEbj7Xmz6uau3/rcfvUoIsh4OCENhd4E=;
 b=etFGNNNxse8Swc/dyttkilA2d2IUPNXnyu600wz1OepYVUVoka6EPFFG15OX41fprSTJKnoxGZmK/fA1Ep6RROqVkO/MmIJJ03PT7b6W7a/Q/ja+HI0tG8quWI9h8aoqt4fmL0r+6+7nHixGp/KCxlTaVc31kBv31M4EPNigRww=
Received: from DM6PR05CA0037.namprd05.prod.outlook.com (2603:10b6:5:335::6) by
 DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.22; Thu, 1 Aug 2024 09:19:04 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:5:335:cafe::7f) by DM6PR05CA0037.outlook.office365.com
 (2603:10b6:5:335::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.6 via Frontend
 Transport; Thu, 1 Aug 2024 09:19:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 09:19:04 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:18:59 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 04:18:54 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Cezary
 Rojewski" <cezary.rojewski@intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Charles Keepax
	<ckeepax@opensource.cirrus.com>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND 09/31] ASoC: intel/sdw_utils: move soundwire machine
 driver helper functions
Date: Thu, 1 Aug 2024 14:44:24 +0530
Message-ID: <20240801091446.10457-10-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
References: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|DM6PR12MB4388:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ce44733-98fe-43b1-9718-08dcb20afd1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sTKCRLNw/j1MSDAyDuGtqqUmVUje2+E6wk8GoyJn73hqyk0Z1AiCiV+jM/G4?=
 =?us-ascii?Q?i9PiyJlQiJytJ6qocmmnTFE5yDTIauSU1ebQHgR94gPGqH8Sgfsn79z6rrmK?=
 =?us-ascii?Q?nSGRrR0G4nzOWlB58YzpWbjYmDwEcsvA7vuvS26XZ0tr25lTWI/xG3S3tJTv?=
 =?us-ascii?Q?/UATMiYd5cVycm3Y5KzOdnYXV3iQ2LQjFkgmDVgv9jwOTS8bIMwUb4MEzany?=
 =?us-ascii?Q?vGp5sSSYZ121c1t/BY+sgcrrCK+8yBzBjv92HWieU7+AjmPh+nFpBVX4EE/M?=
 =?us-ascii?Q?qzgGWb45eR1C/6Icm5LPnGbGO+YMR5nQ6tg/zwriKq9jodYik/2Yu+UtmQN+?=
 =?us-ascii?Q?Yz2zLl/wDQ64bJqTJ2UGZyQpW5FC1vJKYOhhfWdJcR6btKjr6InDF7rEnxEQ?=
 =?us-ascii?Q?RlA56He/xrMTVfn/vjLDUYiZ37CfbbRrHWcdxo9dS2F6Js3KQaGw0PUcdMV3?=
 =?us-ascii?Q?LAwkNBpTy4uZO3DOWRvu3+HkPfPs2TnNXJtt0pwHBnW0oMlfPir5yvzzyjiz?=
 =?us-ascii?Q?Ukw+FUI8P03tcDB5IEFN2r6oum7FDSLQiqT1794ql2vZ8MSevbjUHtyw/aUL?=
 =?us-ascii?Q?UQyACnzGUQHi6J4MCrG+CesKshEoGly2a50z2kb66UqXprJ54pSgnW+QRnr+?=
 =?us-ascii?Q?mK6ir0NIU7crJZNu12hmcxGNuhJfxPRe9yjUvcZdGpjsMGyqPnOZz3ENhOSI?=
 =?us-ascii?Q?/M0KRAuO0jyaGS0KltO4anF2fOPbCWZZPROvhh5z5f9YHMDHrs0jqyyhtv+P?=
 =?us-ascii?Q?gYzvpxeQwb0/gJQ9k37aBPfOZYBSWHuhlnM4Yc7Pfuit5OE90wQRENKRu3Ki?=
 =?us-ascii?Q?LwFN41gdWsXg4GNKv1qzGBgUuXKvsRtc5UQrzSKuihEn2nMYLX9HG6BYT7rV?=
 =?us-ascii?Q?IlQ1z7ZiuoxE9hVU6lnmuzDLP4mNjKOlAaADsM+iAkslh62j19X4GfBhQaDM?=
 =?us-ascii?Q?vwnRVajJzKS+b/33131qISNOTN8vYvMPeSRMkYL45SGo360UUc0stjaMDNeN?=
 =?us-ascii?Q?4r/MoVN9Fi39ArDeN+6KLO4wWzBKXJxy937dnrdwUHfyJT1Kgyhr9zwccqaB?=
 =?us-ascii?Q?Crk+b81tEPAZlij6F9o+Un4AcqCiGEI59BHfp+B1eBBZneE01i/ieaVilwPU?=
 =?us-ascii?Q?KfRQTsMEAuyEhuYOm6wSWgTrypPmTRBKQQozleqV8Yq/Vy4AveviM/zjL/Qi?=
 =?us-ascii?Q?VnYhNZG7UxHPhvQv2U47GaLyQfcrmh5ae4421hoH6yu6Ph9VzRXpN09ie/9I?=
 =?us-ascii?Q?DRwIvHP25gPVZvdtViDWuOhjv6NoJnHBtYmMiBWByZoCPWAziDBTlVTKTnTp?=
 =?us-ascii?Q?JDOsntqBsROo4MiDPmbk1/1Uwd1/0MMx3nYzDkHvw31CdwpF3P45nU3IK3Yi?=
 =?us-ascii?Q?1YlzhsblReUsPu7s7esbTxKbaCfR0dscTYUT5XMjDF9xcwPArw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:19:04.4666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1ce44733-98fe-43b1-9718-08dcb20afd1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4388
Message-ID-Hash: PBKBH5OMVLAO7QWIEDLEWZFXJZKKTITW
X-Message-ID-Hash: PBKBH5OMVLAO7QWIEDLEWZFXJZKKTITW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PBKBH5OMVLAO7QWIEDLEWZFXJZKKTITW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move below Intel SoundWire machine driver helper functions to
soc_sdw_utils.c file so that it can be used by other platform machine
driver.
- asoc_sdw_is_unique_device()
- asoc_sdw_get_codec_name()

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc_sdw_utils.h       |  5 +++
 sound/soc/intel/boards/sof_sdw.c    | 60 ----------------------------
 sound/soc/sdw_utils/soc_sdw_utils.c | 61 +++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+), 60 deletions(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 1ae5523bbcf8..7ca3a6afdfb1 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -10,6 +10,7 @@
 #define SOC_SDW_UTILS_H
 
 #include <sound/soc.h>
+#include <sound/soc-acpi.h>
 
 #define SOC_SDW_MAX_DAI_NUM             8
 
@@ -63,4 +64,8 @@ int asoc_sdw_hw_params(struct snd_pcm_substream *substream,
 int asoc_sdw_hw_free(struct snd_pcm_substream *substream);
 void asoc_sdw_shutdown(struct snd_pcm_substream *substream);
 
+const char *asoc_sdw_get_codec_name(struct device *dev,
+				    const struct asoc_sdw_codec_info *codec_info,
+				    const struct snd_soc_acpi_link_adr *adr_link,
+				    int adr_index);
 #endif
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index fc73db4af186..e1d2b744987f 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1190,66 +1190,6 @@ static int init_simple_dai_link(struct device *dev, struct snd_soc_dai_link *dai
 	return 0;
 }
 
-static bool asoc_sdw_is_unique_device(const struct snd_soc_acpi_link_adr *adr_link,
-				      unsigned int sdw_version,
-				      unsigned int mfg_id,
-				      unsigned int part_id,
-				      unsigned int class_id,
-				      int index_in_link)
-{
-	int i;
-
-	for (i = 0; i < adr_link->num_adr; i++) {
-		unsigned int sdw1_version, mfg1_id, part1_id, class1_id;
-		u64 adr;
-
-		/* skip itself */
-		if (i == index_in_link)
-			continue;
-
-		adr = adr_link->adr_d[i].adr;
-
-		sdw1_version = SDW_VERSION(adr);
-		mfg1_id = SDW_MFG_ID(adr);
-		part1_id = SDW_PART_ID(adr);
-		class1_id = SDW_CLASS_ID(adr);
-
-		if (sdw_version == sdw1_version &&
-		    mfg_id == mfg1_id &&
-		    part_id == part1_id &&
-		    class_id == class1_id)
-			return false;
-	}
-
-	return true;
-}
-
-static const char *asoc_sdw_get_codec_name(struct device *dev,
-					   const struct asoc_sdw_codec_info *codec_info,
-					   const struct snd_soc_acpi_link_adr *adr_link,
-					   int adr_index)
-{
-	u64 adr = adr_link->adr_d[adr_index].adr;
-	unsigned int sdw_version = SDW_VERSION(adr);
-	unsigned int link_id = SDW_DISCO_LINK_ID(adr);
-	unsigned int unique_id = SDW_UNIQUE_ID(adr);
-	unsigned int mfg_id = SDW_MFG_ID(adr);
-	unsigned int part_id = SDW_PART_ID(adr);
-	unsigned int class_id = SDW_CLASS_ID(adr);
-
-	if (codec_info->codec_name)
-		return devm_kstrdup(dev, codec_info->codec_name, GFP_KERNEL);
-	else if (asoc_sdw_is_unique_device(adr_link, sdw_version, mfg_id, part_id,
-					   class_id, adr_index))
-		return devm_kasprintf(dev, GFP_KERNEL, "sdw:0:%01x:%04x:%04x:%02x",
-				      link_id, mfg_id, part_id, class_id);
-	else
-		return devm_kasprintf(dev, GFP_KERNEL, "sdw:0:%01x:%04x:%04x:%02x:%01x",
-				      link_id, mfg_id, part_id, class_id, unique_id);
-
-	return NULL;
-}
-
 static int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index cccab173fd17..2b59ddc61078 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -146,5 +146,66 @@ void asoc_sdw_shutdown(struct snd_pcm_substream *substream)
 }
 EXPORT_SYMBOL_NS(asoc_sdw_shutdown, SND_SOC_SDW_UTILS);
 
+static bool asoc_sdw_is_unique_device(const struct snd_soc_acpi_link_adr *adr_link,
+				      unsigned int sdw_version,
+				      unsigned int mfg_id,
+				      unsigned int part_id,
+				      unsigned int class_id,
+				      int index_in_link)
+{
+	int i;
+
+	for (i = 0; i < adr_link->num_adr; i++) {
+		unsigned int sdw1_version, mfg1_id, part1_id, class1_id;
+		u64 adr;
+
+		/* skip itself */
+		if (i == index_in_link)
+			continue;
+
+		adr = adr_link->adr_d[i].adr;
+
+		sdw1_version = SDW_VERSION(adr);
+		mfg1_id = SDW_MFG_ID(adr);
+		part1_id = SDW_PART_ID(adr);
+		class1_id = SDW_CLASS_ID(adr);
+
+		if (sdw_version == sdw1_version &&
+		    mfg_id == mfg1_id &&
+		    part_id == part1_id &&
+		    class_id == class1_id)
+			return false;
+	}
+
+	return true;
+}
+
+const char *asoc_sdw_get_codec_name(struct device *dev,
+				    const struct asoc_sdw_codec_info *codec_info,
+				    const struct snd_soc_acpi_link_adr *adr_link,
+				    int adr_index)
+{
+	u64 adr = adr_link->adr_d[adr_index].adr;
+	unsigned int sdw_version = SDW_VERSION(adr);
+	unsigned int link_id = SDW_DISCO_LINK_ID(adr);
+	unsigned int unique_id = SDW_UNIQUE_ID(adr);
+	unsigned int mfg_id = SDW_MFG_ID(adr);
+	unsigned int part_id = SDW_PART_ID(adr);
+	unsigned int class_id = SDW_CLASS_ID(adr);
+
+	if (codec_info->codec_name)
+		return devm_kstrdup(dev, codec_info->codec_name, GFP_KERNEL);
+	else if (asoc_sdw_is_unique_device(adr_link, sdw_version, mfg_id, part_id,
+					   class_id, adr_index))
+		return devm_kasprintf(dev, GFP_KERNEL, "sdw:0:%01x:%04x:%04x:%02x",
+				      link_id, mfg_id, part_id, class_id);
+	else
+		return devm_kasprintf(dev, GFP_KERNEL, "sdw:0:%01x:%04x:%04x:%02x:%01x",
+				      link_id, mfg_id, part_id, class_id, unique_id);
+
+	return NULL;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_get_codec_name, SND_SOC_SDW_UTILS);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("SoundWire ASoC helpers");
-- 
2.34.1

