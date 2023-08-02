Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8057076D64E
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:00:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A8B3836;
	Wed,  2 Aug 2023 19:59:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A8B3836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999215;
	bh=lzbsGZgSIm7e0VRyBGvkH4S24Dkujacy6Kwc5qo+fRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uJ0U+rjDlRtbfVqdQNXPxNLko0M2TE9k2fvuvdAN3To0HVmvtpEeZEpL8XEvkaWXt
	 n4Vx/Fmji/xIkPdNZV+VgtYh4ddpfMj3GrwbN6C+7UxhAYN1MG1Yu3De+YnnwFS2fv
	 jNsjTrxeJ1KjCGUvKLeBQ0IIkef3eNEWHrNJtA3I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7A9BF8057D; Wed,  2 Aug 2023 19:58:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B924EF80589;
	Wed,  2 Aug 2023 19:58:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA80AF80552; Wed,  2 Aug 2023 19:58:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA9A9F801D5
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:58:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA9A9F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=bnCWrvBW
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fe2bc2702cso1511365e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999086; x=1691603886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9P3TP3wzncRhOXgecZRN30Iatpmdu19th61qwxb3TI=;
        b=bnCWrvBW33Hc3lH7E3ojnUXu9Ro8w0Y5gsvpJtoeUNAkcrDtks3psfwf5mrnHNwCyT
         3deFDBbk+9b8/B2aEH7EyMbouK0typo/n9x3MJ998k97nDuFHx2dcxRPVaHPQyvb4nN9
         0TUe+jsmNGDMxGiNEoqWQ9YBTaFZe5aDkOwmBKuQuB5WJ/r1GGlG3mi/JZfbYNYJc4gz
         aTczta8+OM12jgy7iZ8C8/xvbhiMXRAeDuLwC44bv82QfsukQS8UcpvgkYK7GYZRSr7M
         gcB7pFpv2kCTwlPyicYgRdMsnu6pGZ0ZNouy0H0z0Jsfy68v5Q6uzHsE6ARmN85VSsO2
         blIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999086; x=1691603886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9P3TP3wzncRhOXgecZRN30Iatpmdu19th61qwxb3TI=;
        b=RXahauet4Tw/tWyDgy1fhdeuE09q6hRLNPnZ9rCEA5YZChflhyu+eLTBr6JQ9ZTA3u
         LZ1taLwMxzSoh2vrOkDpOnrDBJI85CXumbXc2T+Bw8yoL7Whh1eWd9mvy26Afa4ABwwO
         EUuinaMss0IxADwp+0zK2S1w2wTuF99nmLnQZdT7gvYvtqhEjjD5LVft4SrQpiLFG3x6
         BnK60Qr4iileqQUqhJhTE1+EFnF5nwMrsxlDlcVRs+4BFLb5R1SByLhFjVfPiDkPMTkQ
         1u8PasTIt528fNr7xH0qNHvYggr5j0C5qI+ghu+SNuC5k87DWz7PffVrn3ueCEv/EKeY
         2GRw==
X-Gm-Message-State: ABy/qLaLP3zdLB6jH8JAu+FZWMY4l4ukW0ndH5kD+DwUbxo0DA0p0Ee2
	FshhKCX4tp9anEL3o1+qzt1jyaoiZP8=
X-Google-Smtp-Source: 
 APBJJlEwjdDlcnSWCJ6DvL86bdak4jW/RJj56mLBJrICwRStZ4ojrxzFQe31Kb6pdeyPp60om6IkRQ==
X-Received: by 2002:a05:600c:2198:b0:3fe:e1e:5041 with SMTP id
 e24-20020a05600c219800b003fe0e1e5041mr5573612wme.32.1690999086221;
        Wed, 02 Aug 2023 10:58:06 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:58:05 -0700 (PDT)
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
Subject: [PATCH 06/27] ASoC: Intel: bxt_da7219_max98357a: Map missing Line Out
 jack kcontrol
Date: Wed,  2 Aug 2023 20:57:16 +0300
Message-Id: <20230802175737.263412-7-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5CFAHUZM7SCPF7OWKIGKVLOV5E6IUQRI
X-Message-ID-Hash: 5CFAHUZM7SCPF7OWKIGKVLOV5E6IUQRI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5CFAHUZM7SCPF7OWKIGKVLOV5E6IUQRI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit bbdd4ea2190b4 ("ASoC: Intel: bxt_da7219_max98357a: remap jack
pins") maps kcontrols for Headphone and Headset Mic jacks for this
driver so that PulseAudio and PipeWire can handle detection events for
these peripherals.

The DA7219 codec used here can also distinguish between Headphone and
Line Out connections that go into the same physical port. Expose the
latter to userspace as a kcontrol as well and add the necessary widgets.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---
Tested on a "Lick" Chromebook.

 sound/soc/intel/boards/bxt_da7219_max98357a.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index c593995facaa..cbfff466c5c8 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -90,6 +90,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 static const struct snd_kcontrol_new broxton_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Line Out"),
 };
 
 static const struct snd_kcontrol_new max98357a_controls[] = {
@@ -104,6 +105,7 @@ static const struct snd_kcontrol_new max98390_controls[] = {
 static const struct snd_soc_dapm_widget broxton_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_LINE("Line Out", NULL),
 	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
 	SND_SOC_DAPM_SPK("HDMI1", NULL),
 	SND_SOC_DAPM_SPK("HDMI2", NULL),
@@ -150,6 +152,7 @@ static const struct snd_soc_dapm_route audio_map[] = {
 
 	{ "Headphone Jack", NULL, "Platform Clock" },
 	{ "Headset Mic", NULL, "Platform Clock" },
+	{ "Line Out", NULL, "Platform Clock" },
 };
 
 static const struct snd_soc_dapm_route max98357a_routes[] = {
@@ -194,6 +197,10 @@ static struct snd_soc_jack_pin jack_pins[] = {
 		.pin    = "Headset Mic",
 		.mask   = SND_JACK_MICROPHONE,
 	},
+	{
+		.pin    = "Line Out",
+		.mask   = SND_JACK_LINEOUT,
+	},
 };
 
 static int broxton_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
-- 
2.40.1

