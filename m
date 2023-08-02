Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2AE76D651
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:00:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B86C61D6;
	Wed,  2 Aug 2023 19:59:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B86C61D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999227;
	bh=GtB3OPZEAVDhJRYf+CtUXHRjjxCOHYXQcqjZniKErT0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IG/DiX0SLsyPPASTGkENxBVrnFAl/Z7ThTg/WvWGnNYmQ3O7aFyEQiZZ2y9K3kH0n
	 2d4a7E5eeUTFPCHcPUb+Xq4Zyi7rNryDWsraqng2til2yEe6umU3zv7XPvBXDhNbt9
	 nDs1u/KNAeDbT9Q99Lqm1TgItEByhUEpbcR9jSho=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04C2AF80588; Wed,  2 Aug 2023 19:58:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E1E5F80588;
	Wed,  2 Aug 2023 19:58:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A205F80568; Wed,  2 Aug 2023 19:58:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E000FF80520
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:58:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E000FF80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=QmAr5gO5
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fe2bc2702cso1511635e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999088; x=1691603888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ln5Wo7yMvulq8m4RXX5h43LD0FJm5RWbml3d8jCXUmU=;
        b=QmAr5gO5OJHe2+KrJTzPsNSLD5fPvr8qGS0MTNj11WsaZ15vvacM8igaJSLKO2+rx/
         s2bIZ4URxkPfkRThv9kbjVm1PQ84GbyVSVwDitcqqAHobVs98Gq8tPKKGj5oq6yjrYBq
         M3AT+OVH2j81fUJVXnISuA7S3XPq6o4zIt1cJvWZAGtsVxp68dTMZDoEWhEwLHeZjALz
         NDkdS5RgI+MUDvbjFraVu4LaArsUgkCI0K6Idp0Gxr0/TqK0Aknxqb0eTcfsW6p2/8Q1
         dJFtoCYdHIR15I9fzdLeXTyj+dIizXMBNxmaR/4BBAuXzD2xS6lK7MMOZTY+o8qripOK
         hg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999088; x=1691603888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ln5Wo7yMvulq8m4RXX5h43LD0FJm5RWbml3d8jCXUmU=;
        b=VZ+Qy9SWNhqja5yYgrnUV14f4LPxztDYqH7oZyz1619hCMEANs8lORNO5GhG53AWuZ
         V5pvMZmV/zH5Wl4FzDeWnrT6rkoHg7bLjmIFluf1EftpZwBxs9xHez9yMV2/skWgANna
         2qinm8b6A/q4RXSEg/4YQgIX4BHb2RtdvWyp2mFzH5ngXp9VXw8KnDAfBt8Q+ndhRUUI
         i8W/Kw51qw4LZi1t9d2vobYUVa5tUm22eiyd9o9Rds7OhOnv5GjHJH21MMgRC4DRVeoI
         cwK4cUHO8lMyA7Qz4gwGd8e5ZuKqFRWPOd4an1r2sbTzWw/vnbioCckHkJvTglI2/h3T
         lzDA==
X-Gm-Message-State: ABy/qLb7zbTQx/bMRfyWeXPyOWOU7a8+rE77uBm0fKvMGFInbgd2+rNP
	r1y3t4HIjljsy4ZwECrd6HGnegPk9Pk=
X-Google-Smtp-Source: 
 APBJJlF+GHDkkxI4yAurYVIyjrAJMP1jkpuyyPKJGc0fIuSZm0v3MllDtBGvGXHm8voz6pfDIhYP7w==
X-Received: by 2002:a05:600c:21d5:b0:3fd:2e1d:eca1 with SMTP id
 x21-20020a05600c21d500b003fd2e1deca1mr5313451wmj.4.1690999088263;
        Wed, 02 Aug 2023 10:58:08 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:58:07 -0700 (PDT)
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
Subject: [PATCH 07/27] ASoC: Intel: bytcr_wm5102: Map missing Line Out jack
 kcontrol
Date: Wed,  2 Aug 2023 20:57:17 +0300
Message-Id: <20230802175737.263412-8-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NGS2LKJWBVAKYUIONTCRY4GJGH2MGYWA
X-Message-ID-Hash: NGS2LKJWBVAKYUIONTCRY4GJGH2MGYWA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NGS2LKJWBVAKYUIONTCRY4GJGH2MGYWA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit ecd77d494ec9 ("ASoC: Intel: bytcr_wm5102: Add jack detect
support") maps kcontrols for Headphone and Headset Mic jacks for this
driver so that PulseAudio and PipeWire can handle jack detection events
for these peripherals.

The WM5102 codec used here can also distinguish between Headphone and
Line Out connections that go into the same physical port. Expose the
latter to userspace as a kcontrol as well and add the necessary widgets.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---

 sound/soc/intel/boards/bytcr_wm5102.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index f2382d4cb76f..5c9e06ed1a53 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -131,6 +131,7 @@ static const struct snd_soc_dapm_widget byt_wm5102_widgets[] = {
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_MIC("Internal Mic", NULL),
 	SND_SOC_DAPM_SPK("Speaker", NULL),
+	SND_SOC_DAPM_LINE("Line Out", NULL),
 	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
 			    platform_clock_control, SND_SOC_DAPM_PRE_PMU |
 			    SND_SOC_DAPM_POST_PMD),
@@ -144,6 +145,7 @@ static const struct snd_soc_dapm_route byt_wm5102_audio_map[] = {
 	{"Headset Mic", NULL, "Platform Clock"},
 	{"Internal Mic", NULL, "Platform Clock"},
 	{"Speaker", NULL, "Platform Clock"},
+	{"Line Out", NULL, "Platform Clock"},
 
 	{"Speaker", NULL, "SPKOUTLP"},
 	{"Speaker", NULL, "SPKOUTLN"},
@@ -177,6 +179,7 @@ static const struct snd_kcontrol_new byt_wm5102_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 	SOC_DAPM_PIN_SWITCH("Internal Mic"),
 	SOC_DAPM_PIN_SWITCH("Speaker"),
+	SOC_DAPM_PIN_SWITCH("Line Out"),
 };
 
 static struct snd_soc_jack_pin byt_wm5102_pins[] = {
@@ -188,6 +191,10 @@ static struct snd_soc_jack_pin byt_wm5102_pins[] = {
 		.pin	= "Headset Mic",
 		.mask	= SND_JACK_MICROPHONE,
 	},
+	{
+		.pin	= "Line Out",
+		.mask	= SND_JACK_LINEOUT,
+	},
 };
 
 static int byt_wm5102_init(struct snd_soc_pcm_runtime *runtime)
-- 
2.40.1

