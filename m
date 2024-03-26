Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C7B88C89E
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:09:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06B092BC4;
	Tue, 26 Mar 2024 17:08:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06B092BC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469347;
	bh=bdB/FytdahnLxveJ+wKWW/oBK+jrUjYb5O+XidYfLS0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kIjdhgyMtPBTXIJPN1/oQr6HbzgDLSTuMqb2HsL1/hq47Zx/cpL//Fgyq1M4ZIG1X
	 iaqMXmMscnSXkBAmnuu15lOf8uiMhxACi+bW86yJ0RhLSDq23EwY8iXxQiX0Jl1cSx
	 3W+8Rw7T7KWCrNYKsKlc5EObI5LptiQGpi/OlyOY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21F2EF805F2; Tue, 26 Mar 2024 17:06:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FE17F80735;
	Tue, 26 Mar 2024 17:06:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E973FF8061A; Tue, 26 Mar 2024 17:06:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4307AF8057B
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4307AF8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Y2byrucF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469135; x=1743005135;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bdB/FytdahnLxveJ+wKWW/oBK+jrUjYb5O+XidYfLS0=;
  b=Y2byrucFzjYVyY73dCwkmSgyR1XORDgRjKLs2SBfbFnlYrl9sCD5sOzF
   l1OSBkCh26rpDdCm5f4BQCcyfQkly2hjg+W9EmgkTjKbpPhoYKvJonXuT
   fiNh2fYiOfbPk4U+jdkTeJhJU3IgljQ+bACsg+N98yLsD37QsCgOUL6dX
   qpehxv81AAa2TRRxvd+ZrTyCX0FkakNwcXfUjLM6U4PbRidfdEiq8QR7S
   Cbqr8lYcAXCbtdoWAXUSJVaGR7DRdyk7Sx8wK9TaxZ4lTQhNLvSrteBFy
   /HmTPB0+zaGke4FUQy+8Bj51NDIV1ATuj4OcYGPgkPmoNWKF/ctxXpQjt
   w==;
X-CSE-ConnectionGUID: wAqvv9LgQAiF6J1PZCyaKQ==
X-CSE-MsgGUID: pX4jPl0ES9aAThNelokwag==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260408"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260408"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482224"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:50 -0700
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
Subject: [PATCH 12/34] ASoC: Intel: sof_sdw: Factor out HDMI DAI creation
Date: Tue, 26 Mar 2024 11:04:07 -0500
Message-Id: <20240326160429.13560-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ELFUT5FCRBFQ5BM7CO7RGHX4TPLIMR2T
X-Message-ID-Hash: ELFUT5FCRBFQ5BM7CO7RGHX4TPLIMR2T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ELFUT5FCRBFQ5BM7CO7RGHX4TPLIMR2T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Factor out the creation of the HDMI DAI links into a helper function.
No functional change.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 61 ++++++++++++++++++++------------
 1 file changed, 38 insertions(+), 23 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 5571c9e85dd7..7dc3559bf988 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1687,6 +1687,41 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
 	return 0;
 }
 
+static int create_hdmi_dailinks(struct snd_soc_card *card,
+				struct snd_soc_dai_link **dai_links, int *be_id,
+				int hdmi_num)
+{
+	struct device *dev = card->dev;
+	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	int i, ret;
+
+	for (i = 0; i < hdmi_num; i++) {
+		char *name = devm_kasprintf(dev, GFP_KERNEL, "iDisp%d", i + 1);
+		char *cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "iDisp%d Pin", i + 1);
+		char *codec_name, *codec_dai_name;
+
+		if (ctx->hdmi.idisp_codec) {
+			codec_name = "ehdaudio0D2";
+			codec_dai_name = devm_kasprintf(dev, GFP_KERNEL,
+							"intel-hdmi-hifi%d", i + 1);
+		} else {
+			codec_name = "snd-soc-dummy";
+			codec_dai_name = "snd-soc-dummy-dai";
+		}
+
+		ret = init_simple_dai_link(dev, *dai_links, be_id, name,
+					   1, 0, // HDMI only supports playback
+					   cpu_dai_name, codec_name, codec_dai_name,
+					   i == 0 ? sof_sdw_hdmi_init : NULL, NULL);
+		if (ret)
+			return ret;
+
+		(*dai_links)++;
+	}
+
+	return 0;
+}
+
 static int sof_card_dai_links_create(struct snd_soc_card *card)
 {
 	struct device *dev = card->dev;
@@ -1704,7 +1739,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	struct snd_soc_dai_link *dai_links;
 	int num_links;
 	char *name, *cpu_dai_name;
-	char *codec_name, *codec_dai_name;
 	int i, j, be_id = 0;
 	int hdmi_num;
 	unsigned long ssp_mask;
@@ -1861,28 +1895,9 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	}
 
 	/* HDMI */
-	for (i = 0; i < hdmi_num; i++) {
-		name = devm_kasprintf(dev, GFP_KERNEL, "iDisp%d", i + 1);
-		cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "iDisp%d Pin", i + 1);
-
-		if (ctx->hdmi.idisp_codec) {
-			codec_name = "ehdaudio0D2";
-			codec_dai_name = devm_kasprintf(dev, GFP_KERNEL,
-							"intel-hdmi-hifi%d", i + 1);
-		} else {
-			codec_name = "snd-soc-dummy";
-			codec_dai_name = "snd-soc-dummy-dai";
-		}
-
-		ret = init_simple_dai_link(dev, dai_links, &be_id, name,
-					   1, 0, // HDMI only supports playback
-					   cpu_dai_name, codec_name, codec_dai_name,
-					   i == 0 ? sof_sdw_hdmi_init : NULL, NULL);
-		if (ret)
-			return ret;
-
-		dai_links++;
-	}
+	ret = create_hdmi_dailinks(card, &dai_links, &be_id, hdmi_num);
+	if (ret)
+		return ret;
 
 	if (sof_sdw_quirk & SOF_SSP_BT_OFFLOAD_PRESENT) {
 		int port = (sof_sdw_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
-- 
2.40.1

