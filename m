Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D271D9446CE
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 10:42:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32B373453;
	Thu,  1 Aug 2024 10:41:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32B373453
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722501726;
	bh=eGgwrcdu1pwB6BfUTjhL8YT/g4FVNfycDOP8imUnFzg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iiOUBjRtCghrvMq/i+BbmG4xN52kOpzlEnZ7Gy+Fpl+t2rSwd+Fk9GAUjBTq6eYjG
	 mEnA6qfzZ6vwLqFn4dvIX59twDw/n13jF9MK2RQAT0nasrkaip41iswlX/UaYvruZu
	 s22Kly2mEgUgU2RaaXqfzyBvu6PtoxYm6UWVr6uI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2418F805AA; Thu,  1 Aug 2024 10:41:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 563BFF805B0;
	Thu,  1 Aug 2024 10:41:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55F9BF8026A; Thu,  1 Aug 2024 08:28:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07782F8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 08:28:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07782F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=jjHr/vED
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6fvDCrM71qwyvo2gMsSZ2z8nsKLZcmcjxl0N0dmcG2H2VBEwjV//M6BbHYP6aGnbcFvHEWHhBCe0XomELD/JDVwo7UHGAXiW3VZCgni23LfHns9tvOX4eDzftsUEIxRGj9NnQ+Wj9e7PaZsgixLgIaEPsfl/nLWOmXe2hRI/zOumkqpxHs1lQ9rgY6juM6TAMHss5RTVIGXGO4mSGUFXa2f41XWpi+anQ8zRkkxBMvlkeSfdaBTFlO9jWkXcMhL9dMSBJfqj+wYSo7tSR+RV2B61mRj7L/kWkPUtH4OuhlPDgCrZ8gFl2bU69lDKkIEBtpSyji7xN+cm0+7tmufBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5PhBdhWSJKgEbj7Xmz6uau3/rcfvUoIsh4OCENhd4E=;
 b=gTXHYa7whbbSoniOUQxOaxQeuB8zPxSKi6OWLS/zE9XIcgkISteHueQOeyVk77Sbfz+sKS8lV+oF/0Q5mEvYjzVSeKCBQKXoBXublj/xArUersrTxl8cXNqEFyyCcRhgtZucgvHQjnQpS+upz1ynFG+IUN0l5XgX8tqq6/H1b2Nul0IltfeXl81LkhfyPjQqSTlqhsELV3812Gi+fYucI2rWP1fpkkAVvEK2VHAlhj6Ej+VgcE6FLMhJGfFqC/jbLpN6BxVn+rdRUqQmkTvUOAgMo11toojDwsh9lFUzD9BHcULdqjtjA6DWt4SYGZu9fl4CZGlXN2Qr6X6lKC3q8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5PhBdhWSJKgEbj7Xmz6uau3/rcfvUoIsh4OCENhd4E=;
 b=jjHr/vEDwHGvzrhG6foxEedw9udjq99IySAwo20y1H4azUoHVSZvi5KHAsSyzu0sruanHo38aEALGS1dtGNvv6QoxGlDTMiANaJAhS3EYPWISFxtgbtX0qfcBSlwFMO945EAhTobWzjAhUyoSGYAq2sOi1yGiG8ky+SPne/xid4=
Received: from BL1P223CA0007.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::12)
 by PH0PR12MB7471.namprd12.prod.outlook.com (2603:10b6:510:1e9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 06:28:22 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:2c4:cafe::c8) by BL1P223CA0007.outlook.office365.com
 (2603:10b6:208:2c4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21 via Frontend
 Transport; Thu, 1 Aug 2024 06:28:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 06:28:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:28:21 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 01:28:15 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
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
Subject: [PATCH 09/31] ASoC: intel/sdw_utils: move soundwire machine driver
 helper functions
Date: Thu, 1 Aug 2024 11:53:54 +0530
Message-ID: <20240801062416.2203673-10-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
References: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|PH0PR12MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: b740d7f3-fec0-421f-09cc-08dcb1f32440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?G1Dn4Orqa52+HYfm+NCqk3zUNZIVQl/PI0qX6Aze8j4eYZfEuUCtk+sSyOof?=
 =?us-ascii?Q?ybloIWTn3dBBAttFvQrRwZkMxRfEW4kTWSDmtPqWfiFn7CUEE9tCDvnszUSq?=
 =?us-ascii?Q?vPdSPbEARp/We18m3ehs3IA/0mczJ4UqFnRfHkGjFdzUIX+IDtpVgoIPH1ki?=
 =?us-ascii?Q?H0bQ8uYTJ1k8kJcWQzeYeNUfNR9GYY5Jy6ImZ8MiqGhENYbKcMmjwedX6i2i?=
 =?us-ascii?Q?RcHRA7LRZjSFPtk3wy2Ka3VHgwbwuX5d2NOsFuT9o6SLWQDu33YdMSaBe+gs?=
 =?us-ascii?Q?vvGQkAtjzeuEoLlyuoI+vI+yQWjbCHJiNOpji23BgE5s9xD02Av4aX2DXSmR?=
 =?us-ascii?Q?q6rA2tFg0Muq8znsp9WKHnqO6YgVqvY1BTybJK9k8qrDt3sa+dMOqyuzTxAW?=
 =?us-ascii?Q?weQ2y3WGhKtQT6VUzI/jbtI/39T4bGj8Ym4ozlkXZPPm/tC6JDS4f+DwAGv6?=
 =?us-ascii?Q?RR7NoCyjgiPc9cMcs0B1QfMbMoi/VqKka5D6qkPBLc6pf+ajn3T/PMRXGTvM?=
 =?us-ascii?Q?d1RomMvg/X4spBbbGFMl41/33aKODqAAIwl2cdX9SbGjneE6qpkRUYFMyAV8?=
 =?us-ascii?Q?bqht2M6sQg2BaWoqaUOpRiNBvG4MUwC1F9zAJpP1wEoLMFVFulghtslrtOB0?=
 =?us-ascii?Q?l24tDkZdja0X6rot0PHqCRr4WSF5gUnHZ29v7pm2MYsbpUfbDQDzvxvEDjy+?=
 =?us-ascii?Q?Bv0WEiDhz99BhctJxHNBun7kp/WCDpFv00qVtjlvbM9YyttUEqbxeGF3/7nd?=
 =?us-ascii?Q?QoylmlJVGy2S0HPLHjRcZAY0M4KSNlBUDXYIboz9Gbcn6xr2QsQonxlq7Jhu?=
 =?us-ascii?Q?EnTR7avzPp8HgeVCyIsN90CcxRZDlrKhJOWZV7Gb2YZAvdHg3oQcsKDEd3/C?=
 =?us-ascii?Q?V1Kz1ghyTn0uwqq42A+15qdb8u9xnsK5Fh36WR4nIgzJ6Tl1yejZhWJMkG4L?=
 =?us-ascii?Q?OE6fLMzCiDZrETUITljfXna2n/gofrTigixR8pmkJdvxHdL7oQRLbduCBr4q?=
 =?us-ascii?Q?//b8laMt23ZT+L9RcmKEbDCblj9RhqHTznH1djK8dMabBa54F6UPQVTWdir0?=
 =?us-ascii?Q?SFSQBrmOzbRjdNezQuI9VldIRcy2bLBpxOQVu7UVB1JZhL/8QRFCaA55b6UD?=
 =?us-ascii?Q?bIQIYM0rLo8rUfZlBoMrEuCgFdGSs89U+7G9IWkymp/2AQGCBD5Tob78JK83?=
 =?us-ascii?Q?LLUazXeTbyH5cCM14ZwseIxEI4p6dpIdcpHVEjvbBnEg1OuSEZPdIEk+kOOe?=
 =?us-ascii?Q?RBZAuJkwaBpNXfoYShGn5kgdat8iUyCdHnfg50p2wlcvxauiJ/tmVplnsG37?=
 =?us-ascii?Q?KUeNlLF6Ngt8yYV6ck24Dr7qeKQ2KOVT4Mti2qulgZS5MqWNEsDO1NPnfSGc?=
 =?us-ascii?Q?rX5uQwnQWePg1uMbtil5PIJHNUdz2ODQrMU2L7w/52/OeP9IcQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 06:28:22.2488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b740d7f3-fec0-421f-09cc-08dcb1f32440
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7471
Message-ID-Hash: Q4D5NZ7S46X345QSDYSKSWPXVU76S4X4
X-Message-ID-Hash: Q4D5NZ7S46X345QSDYSKSWPXVU76S4X4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q4D5NZ7S46X345QSDYSKSWPXVU76S4X4/>
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

