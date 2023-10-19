Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B2E7D00BB
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 19:36:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8046A4D;
	Thu, 19 Oct 2023 19:35:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8046A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697736984;
	bh=ci4ulWbiczJaL32FjYNIPNE48dvTPf7Qx2ed5oot2TM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q5xxWFm/rixH+gIDNYlD+28s7ayVa33njX8ILOM5ByTR/q4XAMu6kmumU4dXEIgd5
	 7QeGVSKI4IQ/6GPSsIugeeEfzOXlE/dp0SjTTICwQk7jxUp/0RntdJGB+c/2UJ2rpu
	 Ne2f9OUiM1fhAhCX++Kvm0hgUCdkbzv97XIHyK28=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 239A4F80588; Thu, 19 Oct 2023 19:34:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E62AF8057C;
	Thu, 19 Oct 2023 19:34:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26936F8055A; Thu, 19 Oct 2023 19:34:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1FC6F8027B
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 19:34:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1FC6F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YqfuULpe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697736872; x=1729272872;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ci4ulWbiczJaL32FjYNIPNE48dvTPf7Qx2ed5oot2TM=;
  b=YqfuULpeGpirItYZ6JiuAL433vqf6H8AQrfTk4NtdqMwEPw+lUO4pMKa
   Z0fo3Xw0CR2utuEPJacnUneVRM/3EnLVRM1nOD5qapjReZ8Ht0YOf2eTd
   b71oEPBQQBF6wniQfHryjXk5w3XDtjSvfuSgEq/8yO1/r23XdWiHuZmKE
   OvxzHN8SU7ZvUlDK0SPRi9VjNin4KwMxaYA1DCfcEzkGlHamMut3e2dLX
   qr0t/4g57UYSG57qSVU4d0Z+d2/ib+q/j/qHzbUNemCO3Ro/2LXp9ciKI
   5dOVpRfc+aO4mlEHxgBED+2zkRS76MA2M27SWjqiCfgaUOeirfr81Q/sz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="7884326"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200";
   d="scan'208";a="7884326"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 10:34:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="792090634"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200";
   d="scan'208";a="792090634"
Received: from jihao1-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.213.163.144])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 10:34:24 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 03/10] ASoC: intel: sof_sdw_cs42l43: Create separate jacks for
 hp and mic
Date: Thu, 19 Oct 2023 12:34:04 -0500
Message-Id: <20231019173411.166759-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019173411.166759-1-pierre-louis.bossart@linux.intel.com>
References: <20231019173411.166759-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7NTJ3CKCTWNWAAMRBE73NT45XTNAUEM4
X-Message-ID-Hash: 7NTJ3CKCTWNWAAMRBE73NT45XTNAUEM4
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7NTJ3CKCTWNWAAMRBE73NT45XTNAUEM4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

It makes sense to report the microphone separately from the headphones,
that way ALSA UCM can differentiate between switching the playback and
the capture. For example, still using the built-in microphone path when
a 3-pole headset is inserted.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_cs42l43.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_cs42l43.c b/sound/soc/intel/boards/sof_sdw_cs42l43.c
index 9b072c745f10..360f11b72aa2 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l43.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l43.c
@@ -39,6 +39,17 @@ static const struct snd_soc_dapm_route cs42l43_dmic_map[] = {
 	{ "cs42l43 PDM2_DIN", NULL, "DMIC" },
 };
 
+static struct snd_soc_jack_pin sof_jack_pins[] = {
+	{
+		.pin    = "Headphone",
+		.mask   = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin    = "Headset Mic",
+		.mask   = SND_JACK_MICROPHONE,
+	},
+};
+
 static int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
@@ -66,12 +77,13 @@ static int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	ret = snd_soc_card_jack_new(card, "Headphone Jack",
-				    SND_JACK_MECHANICAL | SND_JACK_AVOUT |
-				    SND_JACK_HEADSET | SND_JACK_LINEOUT |
-				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-				    SND_JACK_BTN_2 | SND_JACK_BTN_3,
-				    jack);
+	ret = snd_soc_card_jack_new_pins(card, "Jack",
+					 SND_JACK_MECHANICAL | SND_JACK_AVOUT |
+					 SND_JACK_HEADSET | SND_JACK_LINEOUT |
+					 SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+					 SND_JACK_BTN_2 | SND_JACK_BTN_3,
+					 jack, sof_jack_pins,
+					 ARRAY_SIZE(sof_jack_pins));
 	if (ret) {
 		dev_err(card->dev, "Failed to create jack: %d\n", ret);
 		return ret;
-- 
2.39.2

