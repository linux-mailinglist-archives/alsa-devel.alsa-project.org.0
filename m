Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A066A6C5622
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 21:03:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2304CED5;
	Wed, 22 Mar 2023 21:02:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2304CED5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679515404;
	bh=WamK9sCvCYLHnmBW33jQHUEzfx0faqK9l3F9CwjpECc=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c7jpiF9wmJywcIjtcbzkIp9geUZCZpTBL8MPqU5iWhXC6fkEngkIxf1gKtMuJDBtl
	 MCBxMyFPZeOvhZyfVJzmbgkPG//SEEr6+V8fSytuDrhgVTqEZALNNTqX8Km1FI4tyj
	 c45HF/bAvuxUcQGufvEjnxQCp5S0wIb9KoA/pLQM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C014F802E8;
	Wed, 22 Mar 2023 21:00:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBB92F80564; Wed, 22 Mar 2023 21:00:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7BF1F802E8
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 21:00:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7BF1F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DxsUVy0g
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B754A621E9;
	Wed, 22 Mar 2023 20:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9549CC4339B;
	Wed, 22 Mar 2023 20:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679515209;
	bh=WamK9sCvCYLHnmBW33jQHUEzfx0faqK9l3F9CwjpECc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DxsUVy0gFEHjZX0w3LJfVErIJLdmboAoVrHRqUeloMsnPAunYOSrSDBmEZQ9o4K7v
	 1wIzhzFb/CgR1TIsSRlHgDvpFoZii4I/CLx0TR39tUgwhzlmM9TTvX1X9O62CIl2pG
	 gtwQwaVeh38mSVWYwzo+NqMO0KRzDrkcD9HnjUM4hwbSmVMpDRp+5XVdJoZua17eYT
	 FnxElsUwLjNWSvditMY2MK0zjO0LvzPoohHq5Eyx4g2LzsdPb2Kt1Dd/RXu2IQ8ovd
	 ItA7GL4mPXDTcrv5EzAyPhGkPV1SJkJC4Xt2qEy7I6+txY5RA6UQPRTQOSsOPmxgJz
	 RNJ/yHwWiLeLA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 05/34] ASoC: Intel: avs: ssm4567: Remove nau8825
 bits
Date: Wed, 22 Mar 2023 15:58:57 -0400
Message-Id: <20230322195926.1996699-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322195926.1996699-1-sashal@kernel.org>
References: <20230322195926.1996699-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZQOT7LT4D6XE2DFPKYNWEKHD355LGG4B
X-Message-ID-Hash: ZQOT7LT4D6XE2DFPKYNWEKHD355LGG4B
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Cezary Rojewski <cezary.rojewski@intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, tiwai@suse.com, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZQOT7LT4D6XE2DFPKYNWEKHD355LGG4B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Cezary Rojewski <cezary.rojewski@intel.com>

[ Upstream commit 933de2d127281731166cf2880fa1e23c5a0f7faa ]

Some of the nau8825 clock control got into the ssm4567, remove it.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Link: https://lore.kernel.org/r/20230303134854.2277146-5-amadeuszx.slawinski@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/avs/boards/ssm4567.c | 31 ----------------------------
 1 file changed, 31 deletions(-)

diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index 9f84c8ab34478..51a8867326b47 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -15,7 +15,6 @@
 #include <sound/soc-acpi.h>
 #include "../../../codecs/nau8825.h"
 
-#define SKL_NUVOTON_CODEC_DAI	"nau8825-hifi"
 #define SKL_SSM_CODEC_DAI	"ssm4567-hifi"
 
 static struct snd_soc_codec_conf card_codec_conf[] = {
@@ -34,41 +33,11 @@ static const struct snd_kcontrol_new card_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Right Speaker"),
 };
 
-static int
-platform_clock_control(struct snd_soc_dapm_widget *w, struct snd_kcontrol *control, int event)
-{
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
-	struct snd_soc_dai *codec_dai;
-	int ret;
-
-	codec_dai = snd_soc_card_get_codec_dai(card, SKL_NUVOTON_CODEC_DAI);
-	if (!codec_dai) {
-		dev_err(card->dev, "Codec dai not found\n");
-		return -EINVAL;
-	}
-
-	if (SND_SOC_DAPM_EVENT_ON(event)) {
-		ret = snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_MCLK, 24000000,
-					     SND_SOC_CLOCK_IN);
-		if (ret < 0)
-			dev_err(card->dev, "set sysclk err = %d\n", ret);
-	} else {
-		ret = snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_INTERNAL, 0, SND_SOC_CLOCK_IN);
-		if (ret < 0)
-			dev_err(card->dev, "set sysclk err = %d\n", ret);
-	}
-
-	return ret;
-}
-
 static const struct snd_soc_dapm_widget card_widgets[] = {
 	SND_SOC_DAPM_SPK("Left Speaker", NULL),
 	SND_SOC_DAPM_SPK("Right Speaker", NULL),
 	SND_SOC_DAPM_SPK("DP1", NULL),
 	SND_SOC_DAPM_SPK("DP2", NULL),
-	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0, platform_clock_control,
-			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 };
 
 static const struct snd_soc_dapm_route card_base_routes[] = {
-- 
2.39.2

