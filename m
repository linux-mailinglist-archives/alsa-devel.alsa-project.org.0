Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5247876D655
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:00:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90D0A82A;
	Wed,  2 Aug 2023 19:59:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90D0A82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999249;
	bh=YBG5VsjTUOyJ4LHepKLqH8f4Aq/iaCkrf/F6JskqY10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qZdB90hqF4ku1WwiRoJz9g1jlk3zvD+Tvk/JCHmZD7NAlKDjphqpHeJMngS1b/Tam
	 KVWng+KPW1qMhj8bT5+GALKNz3Q/L8hVEWTE/T4aPvATme7nzKlSvgNc5/r061YQmh
	 p0+aA/gsdmyHmuOFG+jggLSQhTmz3eorCQjdyXSU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F987F805BF; Wed,  2 Aug 2023 19:58:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46115F805AC;
	Wed,  2 Aug 2023 19:58:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D208CF80571; Wed,  2 Aug 2023 19:58:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59474F80551
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:58:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59474F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=cH9DcH1D
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fbea147034so1550105e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999090; x=1691603890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5Agk2IhTlueKpAaOVZPmPiVBKk+AEjM8QiFyo+WrKQ=;
        b=cH9DcH1DxY4Yz9Q9s2/zqrXiaeWRqIgZsmXk5aOM5TA9zaAmZZtz4Ue5dckgnO/7PR
         LcDuoemcupnv+vTeCNJJqkCm8yylKBrOc40IT40+P6L8HWbHIzKll9CqbUlXScxvxEqK
         YBUi0vnpPisZkI8DvtYQsrZXm7eArwxev7rnIKr+BU6Aa1F8RDAyEdz5rqDYN7GmB1pY
         /zFPekPj6pIE04Pz5oCvTUYWillfyfKmFqAEA92JtC5znNz73IljhlYowHalEOkDIcQj
         bzr4b4xQLJDSuuEIYhHEJhe8I2WL9FetkV1cmP37LVhXf23zYFf3Jc/USF8Nqu5muPyn
         rUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999090; x=1691603890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5Agk2IhTlueKpAaOVZPmPiVBKk+AEjM8QiFyo+WrKQ=;
        b=j3acUtcSvaa7UnmqGvx7iUAzmsq9KjagfCv8EQ/iLhrBt4l3eELZScMIgy9OmwV6Ml
         SAYtDhfJIJ78nEErFluzQ7N560PK5lK7zlmVJK/vatjD2vU/SGASVniTM6By7knin/Ez
         93968S1rAaHUzy5L9mfkx6HZAZQ6wV5uthIiB1b5OFrQUg/rPvHnoyD3wH6vaUHivdJR
         Hj1Pjmttlfeqn0PId3NA4E64PIU1uflQWnmDltA46CDT+pniNUzUkfa7G//P4yVRY96h
         4SK2KGyT1GOIpoYzqVJRj9Wgp2G4Tn/45MStDWKTfpMFlc+h6jTzGIgnXxigie24URPt
         ARXQ==
X-Gm-Message-State: ABy/qLb3IbcDioVVQXsqVxTLQquXBgPHeq+++2XiU52QtGo62O5zW84P
	z36ff4tI1b9++xrdZbd2u27DcBNN3V0=
X-Google-Smtp-Source: 
 APBJJlHfdaDchRiKCzzj9hZwgTbQzwyxtzeuizDH16V+TqsJiCmpv7CuVvnxrhr/G1gG/9TOMuyrvA==
X-Received: by 2002:a05:600c:2253:b0:3fd:3049:9496 with SMTP id
 a19-20020a05600c225300b003fd30499496mr5605696wmm.33.1690999090199;
        Wed, 02 Aug 2023 10:58:10 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:58:09 -0700 (PDT)
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
Subject: [PATCH 08/27] ASoC: Intel: kbl_da7219_max98357a: Map missing Line Out
 jack kcontrol
Date: Wed,  2 Aug 2023 20:57:18 +0300
Message-Id: <20230802175737.263412-9-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CPUYUDNJWX2CD6JTIWNR2HCJ4POAGIN6
X-Message-ID-Hash: CPUYUDNJWX2CD6JTIWNR2HCJ4POAGIN6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CPUYUDNJWX2CD6JTIWNR2HCJ4POAGIN6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit c2065d43ae85 ("ASoC: Intel: kbl_da7219_max98357a: remap jack
pins") maps kcontrols for Headphone and Headset Mic jacks for this
driver so that PulseAudio and PipeWire can handle jack detection events
for these peripherals.

The DA7219 codec used here can also distinguish between Headphone and
Line Out connections that go into the same physical port. Expose the
latter to userspace as a kcontrol as well and add the necessary widgets.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---

 sound/soc/intel/boards/kbl_da7219_max98357a.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c b/sound/soc/intel/boards/kbl_da7219_max98357a.c
index 18365ce6bcba..97149513076f 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
@@ -83,12 +83,14 @@ static const struct snd_kcontrol_new kabylake_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 	SOC_DAPM_PIN_SWITCH("Spk"),
+	SOC_DAPM_PIN_SWITCH("Line Out"),
 };
 
 static const struct snd_soc_dapm_widget kabylake_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_SPK("Spk", NULL),
+	SND_SOC_DAPM_LINE("Line Out", NULL),
 	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
 	SND_SOC_DAPM_SPK("HDMI1", NULL),
 	SND_SOC_DAPM_SPK("HDMI2", NULL),
@@ -107,6 +109,10 @@ static struct snd_soc_jack_pin jack_pins[] = {
 		.pin    = "Headset Mic",
 		.mask   = SND_JACK_MICROPHONE,
 	},
+	{
+		.pin    = "Line Out",
+		.mask   = SND_JACK_LINEOUT,
+	},
 };
 
 static const struct snd_soc_dapm_route kabylake_map[] = {
@@ -147,6 +153,7 @@ static const struct snd_soc_dapm_route kabylake_map[] = {
 
 	{ "Headphone Jack", NULL, "Platform Clock" },
 	{ "Headset Mic", NULL, "Platform Clock" },
+	{ "Line Out", NULL, "Platform Clock" },
 };
 
 static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
-- 
2.40.1

