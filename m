Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BF276D66D
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:05:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D2FC828;
	Wed,  2 Aug 2023 20:04:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D2FC828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999514;
	bh=VIIRnkDnYUzpm8Rls44qmTYiqEqceh58gUUMgF3oL8w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OmJJGThpbfYNt6wCDQJsjl+0a+nvKa9qYzX/GQQwzyIXC6D33CKMMPjE560Vx8lO+
	 V/DpcepuiofYu+j/T6FgfjmHjg5OUvNg0FuYBGt/VS74tbdljSldPakpJcwNiJesAJ
	 VmIhyKRcwtFqfShEXMeap70B/LBvSLuodHelKb1g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CF20F802BE; Wed,  2 Aug 2023 19:59:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96B78F80567;
	Wed,  2 Aug 2023 19:59:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A66CF80601; Wed,  2 Aug 2023 19:58:50 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 76210F805F2
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:58:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76210F805F2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=HRCj7K9d
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fe110de3b6so917565e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999123; x=1691603923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXqXYAcukJg9NxGMzxMn5REWqtvtEi1jTOlYbMmEIwQ=;
        b=HRCj7K9dtm+flY3nG52NdwdzhU/m9cYvvltc4+JcXjr+3hBjxAxlfu3xEC9Q5wS26x
         GVg9y1suh7fhuXt/GPxc6N3xoTv7DjEMN8pea6sgapzjpU9bmXqLPLe4OcDsNp63ZK9D
         uN5GPpv2bxxNeMdFRvcWse/YNZT3VXtGukhFwDaDJ8STEXZQSCO8g7cx2l+egd/QdNA3
         eVLKc38vAtsMAOIUezHhXjX+UTl3DLLR/K6IxXYusihdWdlQoW/AYcvZlVlUrU0Si5+b
         pktAYGsgyBnrQyJJ/GZA7cz2/ZdoBeh3V7xo9afYhauPw/+KPkbnEmbRq9njiaAvRXEx
         py+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999123; x=1691603923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXqXYAcukJg9NxGMzxMn5REWqtvtEi1jTOlYbMmEIwQ=;
        b=CLYOiHDULo11ec593xY2+dVvQwVtoohE7IB51NqanVajQP0PEMXpmTi58dt5sL8pwj
         AdEA+tlihTbvvRSsY0pk3X519KBixY/R4qUc6Z8Xy8sQk5vagN7RVrn8Dm2ZtL7zseBh
         sLaPiSULAC5KCOccXevkuOfCvfSY038w5ar1IOYwbD3mwPU6nmfY4E26Q1Ozby51Dn+d
         X2MVYKxu3LOIg6USaqAn94zzecnEFL7j9m1++UZ7VwSRX1Pz0XnrtoA/KSj/Vk7iT7ke
         l8PLuAGBp58PcoZpngQYdigf7DieQWf34AQqDTQDVAihS0Vny21w625s18+rjsO4g8MW
         5mAw==
X-Gm-Message-State: ABy/qLbzskkmiRFyfXcteQBRC2WPfhgooPVHynHk5Nfwp4qIqf2P6NaE
	lOx2pSJDUAt8dpUBRPq5JjxfX51SVv4=
X-Google-Smtp-Source: 
 APBJJlF4WH4ztE6sP96Ip/0+rlET/v5cd61TY/xgM05U+urjF/YhBfw4WfbX+mrQ1mjsRh1wiH6llQ==
X-Received: by 2002:a05:600c:3d85:b0:3f7:e78e:8a41 with SMTP id
 bi5-20020a05600c3d8500b003f7e78e8a41mr5585448wmb.18.1690999123631;
        Wed, 02 Aug 2023 10:58:43 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:58:43 -0700 (PDT)
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
Subject: [PATCH 25/27] ASoC: samsung: littlemill: Map missing jack kcontrols
Date: Wed,  2 Aug 2023 20:57:35 +0300
Message-Id: <20230802175737.263412-26-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DF6BVMV7TU6S5RZG7IDMSRJFPFESV4MX
X-Message-ID-Hash: DF6BVMV7TU6S5RZG7IDMSRJFPFESV4MX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DF6BVMV7TU6S5RZG7IDMSRJFPFESV4MX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver does not properly map jack pins to kcontrols that PulseAudio
and PipeWire need to handle jack detection events. The WM8958 codec used
here can detect Headphone and Headset Mic connections. Expose each to
userspace as a kcontrol and add the necessary widgets.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---
Would SND_JACK_MECHANICAL be useful as a kcontrol as well?

 sound/soc/samsung/littlemill.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemill.c
index 5d8118e69359..fafadcef234e 100644
--- a/sound/soc/samsung/littlemill.c
+++ b/sound/soc/samsung/littlemill.c
@@ -225,12 +225,15 @@ static int bbclk_ev(struct snd_soc_dapm_widget *w,
 }
 
 static const struct snd_kcontrol_new controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 	SOC_DAPM_PIN_SWITCH("WM1250 Input"),
 	SOC_DAPM_PIN_SWITCH("WM1250 Output"),
 };
 
 static const struct snd_soc_dapm_widget widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_HP("Headset Mic", NULL),
 
 	SND_SOC_DAPM_MIC("AMIC", NULL),
 	SND_SOC_DAPM_MIC("DMIC", NULL),
@@ -255,6 +258,16 @@ static const struct snd_soc_dapm_route audio_paths[] = {
 };
 
 static struct snd_soc_jack littlemill_headset;
+static struct snd_soc_jack_pin littlemill_headset_pins[] = {
+	{
+		.pin = "Headphone",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Headset Mic",
+		.mask = SND_JACK_MICROPHONE,
+	},
+};
 
 static int littlemill_late_probe(struct snd_soc_card *card)
 {
@@ -281,12 +294,14 @@ static int littlemill_late_probe(struct snd_soc_card *card)
 	if (ret < 0)
 		return ret;
 
-	ret = snd_soc_card_jack_new(card, "Headset",
-				    SND_JACK_HEADSET | SND_JACK_MECHANICAL |
-				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-				    SND_JACK_BTN_2 | SND_JACK_BTN_3 |
-				    SND_JACK_BTN_4 | SND_JACK_BTN_5,
-				    &littlemill_headset);
+	ret = snd_soc_card_jack_new_pins(card, "Headset",
+					 SND_JACK_HEADSET | SND_JACK_MECHANICAL |
+					 SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+					 SND_JACK_BTN_2 | SND_JACK_BTN_3 |
+					 SND_JACK_BTN_4 | SND_JACK_BTN_5,
+					 &littlemill_headset,
+					 littlemill_headset_pins,
+					 ARRAY_SIZE(littlemill_headset_pins));
 	if (ret)
 		return ret;
 
-- 
2.40.1

