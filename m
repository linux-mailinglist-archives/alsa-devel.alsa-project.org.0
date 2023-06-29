Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AFB7424C2
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 13:10:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D651B83B;
	Thu, 29 Jun 2023 13:09:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D651B83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688037002;
	bh=7Qd//eQKXCiEUIjC4MWr2Zh96qV5egW8CtYySGG49Kw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rb+VYiDlaLQHe27VDCknXtPLCJOT42rGe4ZaEj/FU8PC6RjZbGpt/H9CS4qaCPXj6
	 /kAh9JlN8okvHjfTwwbS9fGun9qJw3lrobXooX2VAhAlpXq0L61rgrArIDSXnlHPWv
	 +yrwOKqv+yw2jvGOQ5oHH9BvxVcFu/47PHWwwJpo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38B6EF805C6; Thu, 29 Jun 2023 13:07:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6F52F805C0;
	Thu, 29 Jun 2023 13:07:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87217F8058C; Thu, 29 Jun 2023 13:07:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2889BF8055A
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 13:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2889BF8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EnRqPNhU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688036833; x=1719572833;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7Qd//eQKXCiEUIjC4MWr2Zh96qV5egW8CtYySGG49Kw=;
  b=EnRqPNhUfwau6jhqmeIsWVOYKvv8LpbVHKc0di5+biKGuZodJkPzAkdk
   bxzN3PCEOeIE4vX0BXHpvt2kgoMTmkfmrchhrfYkbrNvJm34ayllbRxHv
   cm3f49PB/+dRrtt4LY6wX4bJdMbq6daLYJgQVQHelnSYcO3jfOt1ZPyyV
   EBC2z972cf5I1Yu5708HeDTwJVkKRBfPlgb8qo7zoIOAoHOl96CAkdGXT
   ryFLlFx5y6DMcdoul73IOFJkZrcvPg+fkUGCIOaUQa4pZQNqkXCIbYuJW
   PMZhp599PVW4jQ1eWTWtZRHa8TfSvoJW0QngeexJgj4DJz/AbVZOnuOq+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="365543660"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="365543660"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 04:07:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="1047732747"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="1047732747"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga005.fm.intel.com with ESMTP; 29 Jun 2023 04:07:07 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	zhuning@everest-semi.com,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 7/8] ASoC: Intel: avs: rt5682: Add missing components
Date: Thu, 29 Jun 2023 13:24:48 +0200
Message-Id: <20230629112449.1755928-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230629112449.1755928-1-cezary.rojewski@intel.com>
References: <20230629112449.1755928-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RZJWELH43OBHWCORKRYTNNYJP6AVLUHT
X-Message-ID-Hash: RZJWELH43OBHWCORKRYTNNYJP6AVLUHT
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RZJWELH43OBHWCORKRYTNNYJP6AVLUHT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Align with what's done for all other boards and allocate jacks pins
dynamically and explicitly specify ->dai_fmt for the DAI link.

The latter clears any ambiguity - given the current implementation
of the codec driver, specifying format is optional but should the
implementation change, the sound card behaviour may be undesired.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/rt5682.c | 32 +++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index 7142a67900bf..bd0902bb5a37 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -79,14 +79,31 @@ static const struct snd_soc_dapm_route card_base_routes[] = {
 	{ "IN1P", NULL, "Headset Mic" },
 };
 
+static struct snd_soc_jack_pin card_jack_pins[] = {
+	{
+		.pin = "Headphone Jack",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Headset Mic",
+		.mask = SND_JACK_MICROPHONE,
+	},
+};
+
 static int avs_rt5682_codec_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
-	struct snd_soc_jack *jack;
 	struct snd_soc_card *card = runtime->card;
-	int ret;
+	struct snd_soc_jack_pin *pins;
+	struct snd_soc_jack *jack;
+	int num_pins, ret;
 
 	jack = snd_soc_card_get_drvdata(card);
+	num_pins = ARRAY_SIZE(card_jack_pins);
+
+	pins = devm_kmemdup(card->dev, card_jack_pins, sizeof(*pins) * num_pins, GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
 
 	/* Need to enable ASRC function for 24MHz mclk rate */
 	if ((avs_rt5682_quirk & AVS_RT5682_MCLK_EN) &&
@@ -95,12 +112,10 @@ static int avs_rt5682_codec_init(struct snd_soc_pcm_runtime *runtime)
 					RT5682_AD_STEREO1_FILTER, RT5682_CLK_SEL_I2S1_ASRC);
 	}
 
-	/*
-	 * Headset buttons map to the google Reference headset.
-	 * These can be configured by userspace.
-	 */
-	ret = snd_soc_card_jack_new(card, "Headset", SND_JACK_HEADSET | SND_JACK_BTN_0 |
-				    SND_JACK_BTN_1 | SND_JACK_BTN_2 | SND_JACK_BTN_3, jack);
+
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack", SND_JACK_HEADSET | SND_JACK_BTN_0 |
+					 SND_JACK_BTN_1 | SND_JACK_BTN_2 | SND_JACK_BTN_3, jack,
+					 pins, num_pins);
 	if (ret) {
 		dev_err(card->dev, "Headset Jack creation failed: %d\n", ret);
 		return ret;
@@ -220,6 +235,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->platforms = platform;
 	dl->num_platforms = 1;
 	dl->id = 0;
+	dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC;
 	dl->init = avs_rt5682_codec_init;
 	dl->exit = avs_rt5682_codec_exit;
 	dl->be_hw_params_fixup = avs_rt5682_be_fixup;
-- 
2.25.1

