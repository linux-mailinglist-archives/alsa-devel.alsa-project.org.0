Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3CA76D657
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:01:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73D3A868;
	Wed,  2 Aug 2023 20:00:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73D3A868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999259;
	bh=EV6sokUEFPBNAyyEgdkgFd6IVbLFp4RbjuU08yI99gw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DarvtrmO8dT1YALcFGVvXcwAT56r+FTS+7AqjHnRpLghcJcatWRqVdFk90j/I66Zh
	 yIvkVSqUmBAoJXSRTC3RRkmTNr+X2hWJmUkVF49PGKvjMdbTiKFEuuPsHo7e1RqlnK
	 rSdhaoecCkGzCtj14ppfD7Po/tjE1+xwmFa2Snsc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA7CBF805D2; Wed,  2 Aug 2023 19:58:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3B4EF805C5;
	Wed,  2 Aug 2023 19:58:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4475F8056F; Wed,  2 Aug 2023 19:58:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CA57F80520
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:58:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CA57F80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=eUPPgU27
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fe2bc27029so1308615e9.3
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999092; x=1691603892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gA29wr7vIe71PHnjZ5O12+t0Upf2Tn7RCA7Ahjy5Xv0=;
        b=eUPPgU27Wo4JR9a2RIjYfG+xrznhiFt9Qe7qlU/+5xCKROjTMqCOKQuyxxbiACT0BO
         X8LR3/sOH47/yXSL31SYbZpkxpD6j8RFN5Y1DlDIttR7gbZ8S8X0i2JxnlvfH3o4wX+W
         m1TDvCHB9fKxLosYA3pbH4UypPxafLw4OU3trvvoM0Hvp1YcNe4GLPx/vz8V5o3FtyOW
         WQjqlzzzwgIrbNNeMoLJSv06ywQxuwD1+xee4JTf4rb58FpNp06uKNHrLDUUJrmMM1y2
         ufjo7mouFAdTL9DHyh8I9dWWRW9H8LSd19mvgdvrWaZ/DgDbXYtIdWEuzTgVfQHQfsiK
         0y+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999092; x=1691603892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gA29wr7vIe71PHnjZ5O12+t0Upf2Tn7RCA7Ahjy5Xv0=;
        b=bfwhaVZXtKDxk17qw2tNti6YtNRgikN0Yc5LrKxiB9u3PMc6Mb5FPhuHHffWdUmYpg
         /gpE0jXvs34NPeKJR/qXywXBDWrHcEbDWPoEyPZFKPZtEnDSNeE6H62SdIZh9rOOxtzV
         o8hl06isebKMseeZMq9usNMhoNHuA3UhHi1VJzyWX47Fkkwha51vKnMci8WZeU7RTEZl
         MhC8aKL7kp2EFK1u0QtM9fkxwkfnj2/BdeQ2Yh3dqX1iqNPgxJu00nt+MvGrFwjoAsx2
         vmsz1WxUKqRTvlZQHbd5+vXSWfOTnQQas62tO9uhiKP3LyslBGdxBSUMSNz6P6gHR1wO
         1Ztg==
X-Gm-Message-State: ABy/qLY8BLKIxgnZXzQeZDQCMsv4/kSySnAYeCFUEEcW6XLHfUVdtXRe
	ktxNLGntDulhDiltavCQ4CxATC2uios=
X-Google-Smtp-Source: 
 APBJJlHngmzNEWhBf6DHJujPjqwuCj4M3FeWgtuZSVvq23YZ3ZtMNId2qLjVXZPX9ou5I5sdGphd8A==
X-Received: by 2002:a05:600c:2216:b0:3fe:16d3:7d60 with SMTP id
 z22-20020a05600c221600b003fe16d37d60mr5772777wml.9.1690999092232;
        Wed, 02 Aug 2023 10:58:12 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:58:11 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: alsa-devel@alsa-project.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>
Subject: [PATCH 09/27] ASoC: Intel: kbl_da7219_max98927: Map missing Line Out
 jack kcontrol
Date: Wed,  2 Aug 2023 20:57:19 +0300
Message-Id: <20230802175737.263412-10-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B7OKRGIC3I6WII4H4LRBCRSR7GUX2WOB
X-Message-ID-Hash: B7OKRGIC3I6WII4H4LRBCRSR7GUX2WOB
X-MailFrom: alpernebiyasak@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B7OKRGIC3I6WII4H4LRBCRSR7GUX2WOB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit b9f53b9fc14e ("ASoC: Intel: kbl_da7219_max98927: remap jack
pins") maps kcontrols for Headphone and Headset Mic jacks for this
driver so that PulseAudio and PipeWire can handle jack detection events
for these peripherals.

The DA7219 codec used here can also distinguish between Headphone and
Line Out connections that go into the same physical port. Expose the
latter to userspace as a kcontrol as well and add the necessary widgets.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---

 sound/soc/intel/boards/kbl_da7219_max98927.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
index ad4223fee0c5..a1f8234c77bd 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98927.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
@@ -102,6 +102,7 @@ static const struct snd_kcontrol_new kabylake_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 	SOC_DAPM_PIN_SWITCH("Left Spk"),
 	SOC_DAPM_PIN_SWITCH("Right Spk"),
+	SOC_DAPM_PIN_SWITCH("Line Out"),
 };
 
 static const struct snd_soc_dapm_widget kabylake_widgets[] = {
@@ -109,6 +110,7 @@ static const struct snd_soc_dapm_widget kabylake_widgets[] = {
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_SPK("Left Spk", NULL),
 	SND_SOC_DAPM_SPK("Right Spk", NULL),
+	SND_SOC_DAPM_LINE("Line Out", NULL),
 	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
 	SND_SOC_DAPM_SPK("HDMI1", NULL),
 	SND_SOC_DAPM_SPK("HDMI2", NULL),
@@ -127,6 +129,10 @@ static struct snd_soc_jack_pin jack_pins[] = {
 		.pin    = "Headset Mic",
 		.mask   = SND_JACK_MICROPHONE,
 	},
+	{
+		.pin    = "Line Out",
+		.mask   = SND_JACK_MICROPHONE,
+	},
 };
 
 static const struct snd_soc_dapm_route kabylake_map[] = {
@@ -182,6 +188,7 @@ static const struct snd_soc_dapm_route kabylake_ssp1_map[] = {
 
 	{ "Headphone Jack", NULL, "Platform Clock" },
 	{ "Headset Mic", NULL, "Platform Clock" },
+	{ "Line Out", NULL, "Platform Clock" },
 };
 
 static int kabylake_ssp0_hw_params(struct snd_pcm_substream *substream,
-- 
2.40.1

