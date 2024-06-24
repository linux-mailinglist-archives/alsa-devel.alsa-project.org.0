Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB87F914972
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2024 14:12:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1752ADEC;
	Mon, 24 Jun 2024 14:12:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1752ADEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719231172;
	bh=UFzKGxzmCvgpTCM7GovIF2X1aBmxmsmexFJMbXdSkmI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T16E8giCnqQg0okUbCitgGcVvUdcqu5LvHIyfuvnO36LoIe+b4CCG3rLynwyfZf73
	 lFnjnSFTZQZHCznXynbtOoMb8hbZWVraGvqzuzu6SlY665T4R5Uzx5XhatUyv4eAXN
	 n1fo8VYSI/t9DfPBM1ijDf1deG93ZwSk/SoyENLA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 328D2F8060E; Mon, 24 Jun 2024 14:11:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D09EF80604;
	Mon, 24 Jun 2024 14:11:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8FB9F8059F; Mon, 24 Jun 2024 14:11:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF5EEF80423
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 14:11:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF5EEF80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gUkDHXwe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719231100; x=1750767100;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UFzKGxzmCvgpTCM7GovIF2X1aBmxmsmexFJMbXdSkmI=;
  b=gUkDHXwerQoqYiW3UuviDa6wQXwnKTj6lR1rceDvt9RQKLOvYdkSh8LG
   s68crr92FIUdVYe1YDNS+DZ5ON9dYYtSYildt/U14XlqrBv0mXWupC0O3
   oRyv3e3/fDrYbqIupa0vk3rfWaQt4loSQmd07B7SqwNaJhmMhYKm1zT0D
   CCTYhrgRtygWassc7xWHj5tHmZhsyKeRNfEf0x/SDXJlEQTFDzfR063Yn
   b3FreDudxKm5rGlsfxJzIRyf/FOXZGnrCtk08R7lHsMaVORRIuJVnRbY3
   aLFJNjj/YDg9RzmcuxKl2bzgCW0lM/P9UZ/dSr+9d2rZLvqpaVPTD22T6
   A==;
X-CSE-ConnectionGUID: zh/sELayQRKkgDe2IhBxMQ==
X-CSE-MsgGUID: 0Ape3q5NT9Kq4GAgBD8yug==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="15887544"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000";
   d="scan'208";a="15887544"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 05:11:38 -0700
X-CSE-ConnectionGUID: 7+mxtzNZRcKY16+NFKweew==
X-CSE-MsgGUID: wq6mPcfyQme65JB5WAhfwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000";
   d="scan'208";a="43091217"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.230])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 05:11:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 2/4] ASoC: Intel: maxim-common: add max_98373_get_tx_mask
 function
Date: Mon, 24 Jun 2024 14:11:17 +0200
Message-ID: <20240624121119.91552-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240624121119.91552-1-pierre-louis.bossart@linux.intel.com>
References: <20240624121119.91552-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7FEBCY2GPUMARS7CKBHZBSIOQ4EWWBZ5
X-Message-ID-Hash: 7FEBCY2GPUMARS7CKBHZBSIOQ4EWWBZ5
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7FEBCY2GPUMARS7CKBHZBSIOQ4EWWBZ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add a helper function max_98373_get_tx_mask() to get tx mask from
max98373 ACPI device properties at runtime.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_maxim_common.c | 56 +++++++++++++++++------
 1 file changed, 43 insertions(+), 13 deletions(-)

diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index f965b172fa36..fcc3b95e57a4 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -77,19 +77,36 @@ static struct snd_soc_dai_link_component max_98373_components[] = {
  * According to the definition of 'DAI Sel Mux' mixer in max98373.c, rx mask
  * should choose two channels from TDM slots, the LSB of rx mask is left channel
  * and the other one is right channel.
- *
- * For tx mask, each codec requires two channels: one for V-sense and the other
- * one for I-sense. Must match the device property "maxim,vmon-slot-no" and
- * "maxim,imon-slot-no" in ACPI table.
  */
 static const struct {
-	unsigned int tx;
 	unsigned int rx;
 } max_98373_tdm_mask[] = {
-	{.tx = 0x03, .rx = 0x3},
-	{.tx = 0x0c, .rx = 0x3},
+	{.rx = 0x3},
+	{.rx = 0x3},
 };
 
+/*
+ * The tx mask indicates which channel(s) contains output IV-sense data and
+ * others should set to Hi-Z. Here we get the channel number from codec's ACPI
+ * device property "maxim,vmon-slot-no" and "maxim,imon-slot-no" to generate the
+ * mask. Refer to the max98373_slot_config() function in max98373.c codec driver.
+ */
+static unsigned int max_98373_get_tx_mask(struct device *dev)
+{
+	int vmon_slot;
+	int imon_slot;
+
+	if (device_property_read_u32(dev, "maxim,vmon-slot-no", &vmon_slot))
+		vmon_slot = 0;
+
+	if (device_property_read_u32(dev, "maxim,imon-slot-no", &imon_slot))
+		imon_slot = 1;
+
+	dev_dbg(dev, "vmon_slot %d imon_slot %d\n", vmon_slot, imon_slot);
+
+	return (0x1 << vmon_slot) | (0x1 << imon_slot);
+}
+
 static int max_98373_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params)
 {
@@ -98,6 +115,8 @@ static int max_98373_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai;
 	int i;
 	int tdm_slots;
+	unsigned int tx_mask;
+	unsigned int tx_mask_used = 0x0;
 	int ret = 0;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
@@ -117,13 +136,26 @@ static int max_98373_hw_params(struct snd_pcm_substream *substream,
 				return -EINVAL;
 			}
 
+			/* get the tx mask from ACPI device properties */
+			tx_mask = max_98373_get_tx_mask(codec_dai->dev);
+			if (!tx_mask)
+				return -EINVAL;
+
+			if (tx_mask & tx_mask_used) {
+				dev_err(codec_dai->dev, "invalid tx mask 0x%x, used 0x%x\n",
+					tx_mask, tx_mask_used);
+				return -EINVAL;
+			}
+
+			tx_mask_used |= tx_mask;
+
 			/*
 			 * check if tdm slot number is too small for channel
 			 * allocation
 			 */
-			if (fls(max_98373_tdm_mask[i].tx) > tdm_slots) {
+			if (fls(tx_mask) > tdm_slots) {
 				dev_err(codec_dai->dev, "slot mismatch, tx %d slots %d\n",
-					fls(max_98373_tdm_mask[i].tx), tdm_slots);
+					fls(tx_mask), tdm_slots);
 				return -EINVAL;
 			}
 
@@ -134,12 +166,10 @@ static int max_98373_hw_params(struct snd_pcm_substream *substream,
 			}
 
 			dev_dbg(codec_dai->dev, "set tdm slot: tx 0x%x rx 0x%x slots %d width %d\n",
-				max_98373_tdm_mask[i].tx,
-				max_98373_tdm_mask[i].rx,
+				tx_mask, max_98373_tdm_mask[i].rx,
 				tdm_slots, params_width(params));
 
-			ret = snd_soc_dai_set_tdm_slot(codec_dai,
-						       max_98373_tdm_mask[i].tx,
+			ret = snd_soc_dai_set_tdm_slot(codec_dai, tx_mask,
 						       max_98373_tdm_mask[i].rx,
 						       tdm_slots,
 						       params_width(params));
-- 
2.43.0

