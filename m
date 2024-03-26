Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FF188C89F
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:09:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D55862BF1;
	Tue, 26 Mar 2024 17:09:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D55862BF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469371;
	bh=+RqUgqGIVdP7peYMwm0LbrXLh8sPQbx6LB6mT/cLrZQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ti+Y1zpiQq1aW5RC+ZwKaHEY1D2IE4EzDiL2LsO612pTgcI+3CPQKVUlIANbZkxu+
	 I8OwtD32sPfPjIPPZzwYIgh3rSxkuVHjOTUzELlKgUCjRQpH8VN7H4eEs3uoQBotwA
	 T7zjZTVg/hKPOoZt0RI1JIr5kYwNf7jtpB+kksjA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E62C7F80718; Tue, 26 Mar 2024 17:06:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D10E5F8077D;
	Tue, 26 Mar 2024 17:06:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D4BAF805E7; Tue, 26 Mar 2024 17:06:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E17DF80578
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E17DF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RejrNjeo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469135; x=1743005135;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+RqUgqGIVdP7peYMwm0LbrXLh8sPQbx6LB6mT/cLrZQ=;
  b=RejrNjeo/XQzUs4YJuvmx/DvvOL0nxKhetGyIC1J9trxSTiVojpcIbNH
   ZrfA2Qv3GIz8KZ81FGr2vi7/6pgcSaTQRc38zzeJ89SWxJxsTBzcg5BFG
   LB0I6la7V1QNmx2hF8Ax/SUE1a9w11CJHQryz356xtrvuH5/dwQIoBKxF
   hKld2mFBiUOCUbf+NAAc2SOCb8ARJx9LkAWbcfY1D+y+3wvcX4oShMW/j
   5yyp1zV3EMOD9twDtQODBhAG7kd9aFiSQXYsG3oV9misNzA/8txxh9Nh/
   YUOUC3COkBShS5xz3eeocIpIcvZ6V1zgFdDYgy+WYo7qf0mbntuUrXx1J
   w==;
X-CSE-ConnectionGUID: 2BoMjZiqQB6OlZD2pP9RbQ==
X-CSE-MsgGUID: pUfO7QhlRpyqDyjAHAJkmg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260400"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260400"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482218"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 11/34] ASoC: Intel: sof_sdw: Factor out DMIC DAI creation.
Date: Tue, 26 Mar 2024 11:04:06 -0500
Message-Id: <20240326160429.13560-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: G3R2FCV3U2GZKBXXYNZJPABQCE4QXIWC
X-Message-ID-Hash: G3R2FCV3U2GZKBXXYNZJPABQCE4QXIWC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G3R2FCV3U2GZKBXXYNZJPABQCE4QXIWC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Factor out the creation of the DMIC DAI links into a helper function.
No functional change.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 53 +++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 21 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 9980652c901b..5571c9e85dd7 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1659,6 +1659,34 @@ static int create_ssp_dailinks(struct snd_soc_card *card,
 	return 0;
 }
 
+static int create_dmic_dailinks(struct snd_soc_card *card,
+				struct snd_soc_dai_link **dai_links, int *be_id)
+{
+	struct device *dev = card->dev;
+	int ret;
+
+	ret = init_simple_dai_link(dev, *dai_links, be_id, "dmic01",
+				   0, 1, // DMIC only supports capture
+				   "DMIC01 Pin", "dmic-codec", "dmic-hifi",
+				   sof_sdw_dmic_init, NULL);
+	if (ret)
+		return ret;
+
+	(*dai_links)++;
+
+	ret = init_simple_dai_link(dev, *dai_links, be_id, "dmic16k",
+				   0, 1, // DMIC only supports capture
+				   "DMIC16k Pin", "dmic-codec", "dmic-hifi",
+				   /* don't call sof_sdw_dmic_init() twice */
+				   NULL, NULL);
+	if (ret)
+		return ret;
+
+	(*dai_links)++;
+
+	return 0;
+}
+
 static int sof_card_dai_links_create(struct snd_soc_card *card)
 {
 	struct device *dev = card->dev;
@@ -1825,30 +1853,13 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	if (dmic_num > 0) {
 		if (ctx->ignore_pch_dmic) {
 			dev_warn(dev, "Ignoring PCH DMIC\n");
-			goto HDMI;
+		} else {
+			ret = create_dmic_dailinks(card, &dai_links, &be_id);
+			if (ret)
+				return ret;
 		}
-
-		ret = init_simple_dai_link(dev, dai_links, &be_id, "dmic01",
-					   0, 1, // DMIC only supports capture
-					   "DMIC01 Pin", "dmic-codec", "dmic-hifi",
-					   sof_sdw_dmic_init, NULL);
-		if (ret)
-			return ret;
-
-		dai_links++;
-
-		ret = init_simple_dai_link(dev, dai_links, &be_id, "dmic16k",
-					   0, 1, // DMIC only supports capture
-					   "DMIC16k Pin", "dmic-codec", "dmic-hifi",
-					   /* don't call sof_sdw_dmic_init() twice */
-					   NULL, NULL);
-		if (ret)
-			return ret;
-
-		dai_links++;
 	}
 
-HDMI:
 	/* HDMI */
 	for (i = 0; i < hdmi_num; i++) {
 		name = devm_kasprintf(dev, GFP_KERNEL, "iDisp%d", i + 1);
-- 
2.40.1

