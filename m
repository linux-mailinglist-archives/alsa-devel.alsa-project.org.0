Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB3576D66A
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:04:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83E9AE12;
	Wed,  2 Aug 2023 20:03:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83E9AE12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999484;
	bh=sKCAbXhkPXWk9hJyr0CaXjVrUCN9I69EpYbUl9JyaFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G9Jb7FpxTsSfw/BvEUDhrlIDd6SFJZDDmqekZ4KugSTfe+r2OwGjvDRXmHF44X9Mh
	 +hsbYXa1jzl4fc0b17EMf4J6IvtKkImxAw8W9QFuN8Y0TAbUGpC28mY+MsmoLKr2G/
	 iaoKbAQEOsmYZzFFFmDsD5RVAy1MY+a+Jhjgprr8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69DD6F80672; Wed,  2 Aug 2023 19:59:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA74FF80673;
	Wed,  2 Aug 2023 19:59:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E488F805E0; Wed,  2 Aug 2023 19:58:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72C1FF80557
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:58:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72C1FF80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=nHvmRKQk
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fe2ba3e260so1400045e9.2
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999119; x=1691603919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r84U5vKKrOG5iP+/wELvgXipD3A/eO08Kh4+Yu4iiLQ=;
        b=nHvmRKQk5b0vvll7cRuFQ7yoULx2W60YBSzafVOipAk+XPMA8mPPGqUgJV5xCmYOU0
         gUtYmyflcfvJXSSR2WUKfg85Tp5fSaAtVixDhdKxpaHWJc3KEc6mMuIy1Tv2J8XGm3iB
         bPNo6aUDpnWdTtNkPHDxcTcSCxej+8+wlyPHrbiK8DMpgI8n8ocrxuzsVmXYZAqY/1fN
         pH4stOJyWoP8mIDGSUwiznE8EV8K4oRD4+GbYUkPs03oGIZwVVJ+Luv3Es7Kq3TwFLwV
         7s4p5wlBgIL/FOB4fj8pQnSegH0AwAS5XW9+b4b1qLDAs8Z25gjf63SBb813WGwEgGhu
         TxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999119; x=1691603919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r84U5vKKrOG5iP+/wELvgXipD3A/eO08Kh4+Yu4iiLQ=;
        b=ke2v4mAutMNwlbc9NASpjoQHC61oaE+KpaSOw8EkvrsQ74G5gSI3L5boTVA2UKIpV/
         jruFfAhPtSBQjIkybIgFrqY/uJp6AIigHWf3F1qorjy3OmE9JOH1nE8I+NzjXJGp8hRa
         dNMGxlJJreWAkg45MbKbDlJjOLoAi8qtCCHZa20RGZ+8AApcDeZEL4ZJBULlB78MWIhq
         X4b7LDYovp6zNqBwltt1LWac3w6Wj+UdOokeZ3BHK8GK9tPvwOM6E/tKyLDh9BK5kC9Z
         3k6SRdE+VBl2VvMEZUJd128coyQggd5TOW5yJ3HW8rgKk/9g5CtfBR+512OMJfSpO4An
         XkoQ==
X-Gm-Message-State: ABy/qLYq/f+X6HAtwN5WKxgQhLWtYoJuEneQgNU+Xy1FkSRo421HC86g
	kowa2NdyYy7MlCX0JHYwDfDbfMfoUOc=
X-Google-Smtp-Source: 
 APBJJlHTdTr6GABuL8o6Z9U1QvO2dPaRIzK5YY/L5EMLjePFSuhtQUmUrLD+p8BRkDSBML7H+lgVcQ==
X-Received: by 2002:a05:600c:215:b0:3fe:173e:4a54 with SMTP id
 21-20020a05600c021500b003fe173e4a54mr5247511wmi.17.1690999119701;
        Wed, 02 Aug 2023 10:58:39 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:58:39 -0700 (PDT)
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
Subject: [PATCH 23/27] ASoC: rk3399-gru-sound: Map missing Line Out jack
 kcontrol
Date: Wed,  2 Aug 2023 20:57:33 +0300
Message-Id: <20230802175737.263412-24-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VYBCFHQKYZ4MVIAOPT5XMEQIJOQD6LAO
X-Message-ID-Hash: VYBCFHQKYZ4MVIAOPT5XMEQIJOQD6LAO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VYBCFHQKYZ4MVIAOPT5XMEQIJOQD6LAO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit d0508b4f1604 ("ASoC: rk3399_gru_sound: Add DAPM pins, kcontrols
for jack detection") maps kcontrols for Headphones and Headset Mic jacks
for this driver so that PulseAudio and PipeWire can handle insertion
events for these peripherals.

The DA7219 codec used here can also distinguish between Headphone and
Line Out connections that go into the same physical port. Expose the
latter to userspace as a kcontrol as well and add the necessary widget.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---
Tested on a "Kevin" Chromebook.

 sound/soc/rockchip/rk3399_gru_sound.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
index 5e52e9d60d44..0f704d22d21b 100644
--- a/sound/soc/rockchip/rk3399_gru_sound.c
+++ b/sound/soc/rockchip/rk3399_gru_sound.c
@@ -41,13 +41,17 @@ static struct snd_soc_jack_pin rockchip_sound_jack_pins[] = {
 		.pin = "Headset Mic",
 		.mask = SND_JACK_MICROPHONE,
 	},
-
+	{
+		.pin = "Line Out",
+		.mask = SND_JACK_LINEOUT,
+	},
 };
 
 static const struct snd_soc_dapm_widget rockchip_dapm_widgets[] = {
 	SND_SOC_DAPM_HP("Headphones", NULL),
 	SND_SOC_DAPM_SPK("Speakers", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_LINE("Line Out", NULL),
 	SND_SOC_DAPM_MIC("Int Mic", NULL),
 	SND_SOC_DAPM_LINE("HDMI", NULL),
 };
@@ -56,6 +60,7 @@ static const struct snd_kcontrol_new rockchip_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphones"),
 	SOC_DAPM_PIN_SWITCH("Speakers"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Line Out"),
 	SOC_DAPM_PIN_SWITCH("Int Mic"),
 	SOC_DAPM_PIN_SWITCH("HDMI"),
 };
-- 
2.40.1

