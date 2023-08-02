Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B546B76D658
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:01:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07CDA6C0;
	Wed,  2 Aug 2023 20:00:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07CDA6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999276;
	bh=K0dHf+JdZsJuCVmkArPvEsizmy+n3+hktauwUSPu/Lo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P3R3Dpk0sa+p1Qp+l1IjnmaJ9pADqLc1J86CFXGi2JUtXJZDLQxcgdD9htI5AmhYM
	 MqCZVJkHABFfJf4o+6zN061Kd36P++wGBacURkjryNwNSfmpRtSbH2uPTm7B7hCJdt
	 49yJ8IiPSc6VeNTtTf/TkbldOOqbl0QoGH2qmibQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64C81F805D4; Wed,  2 Aug 2023 19:58:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75B6BF801D5;
	Wed,  2 Aug 2023 19:58:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47AD7F8058C; Wed,  2 Aug 2023 19:58:20 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FDFAF80551
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:58:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FDFAF80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=lkUVB3Er
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fbea14700bso1316845e9.3
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999094; x=1691603894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNnRUj13sGKYiaqiH+uUTgS+yS59+A+KbZaO7xd9beM=;
        b=lkUVB3Er6Tk4LtvOzzFy83WjQTHW44mVzjLLbvGWYul576VCJEMkF8DHZhFSneRvs4
         FHhPDUsl0A/XDlnt9uJF8cDUfJNEZwP9vEysWWdghsgRnZ0/chZeN9CqgxVrYZNy+nGP
         S0gj35ahl4JEC+1+TbxKtDq8zKkgPo1MxPc0qEHuq5C9EVtS31K2lokeftsT7+X+Dcec
         o/H5LdipYetf+g0AosAO0r2fZqfh4QTLs5x3W+te7VnKDkF8Z6QBeFAZKA10HjFmsNhp
         Ai9VwROFVoKnv9wDuN6mEgRS4+oo23cxN3arsslC19XbJHKaTBjVl067/MvGkhnY9Qch
         VAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999094; x=1691603894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNnRUj13sGKYiaqiH+uUTgS+yS59+A+KbZaO7xd9beM=;
        b=FVw3pfn6Ig/ZiXnbNkMHMkLfdVnzDJ0D0/1pmF3p7Oe0gXxIWMG5EK9gjrinBVu6W4
         gxQPuWNBnUaLBNxe4E8Rj32SLwrVshzz1BVve1AkG4XlZQatcN5BBFI7GyfPJNSPGJJm
         Ohdlo94ClGvNBquMjG9n39yKcgE4MbjiniDakD4XNqO7lCWP0Mx7iLjztEBIirpQba0v
         N2QGW/jZpRqwGgwm6b1KX7WPLnDWCvFi8cXx4ppzvgPPvN+o0mSXcz3G8SzycZRk842W
         we4m/kFZ6V3x2nV+HmxU7Wn8ckkh9QrsZwbozTxENRX0ZhuH283G5M3DItEYFQUOC9T2
         x86A==
X-Gm-Message-State: ABy/qLbQqcxWiUF+INSSa6a9+/nv2FR0/rjhwJOk0OC9ftXFS+cBGfRQ
	6BfP6zyIRP13j7cGa1GWjMux/gNotgk=
X-Google-Smtp-Source: 
 APBJJlGBjIeCNfjfwIJCCvX2YxfjXB5idSZwIp2n/1KH4BsL9nfFvZi5dAIObjjgRpBFhDgrA0/aLw==
X-Received: by 2002:a05:600c:281:b0:3fb:dff2:9f17 with SMTP id
 1-20020a05600c028100b003fbdff29f17mr5479686wmk.15.1690999094138;
        Wed, 02 Aug 2023 10:58:14 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:58:13 -0700 (PDT)
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
Subject: [PATCH 10/27] ASoC: Intel: sof_da7219_max98373: Map missing Line Out
 jack kcontrol
Date: Wed,  2 Aug 2023 20:57:20 +0300
Message-Id: <20230802175737.263412-11-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3CQ5CN6EW7PIG7KRGMODYGOE5XY4L5H7
X-Message-ID-Hash: 3CQ5CN6EW7PIG7KRGMODYGOE5XY4L5H7
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit 2913bb1f6830 ("ASoC: Intel: sof_da7219_max98373: remap jack
pins") maps kcontrols for Headphone and Headset Mic jacks for this
driver so that PulseAudio and PipeWire can handle jack detection events
for these peripherals.

The DA7219 codec used here can also distinguish between Headphone and
Line Out connections that go into the same physical port. Expose the
latter to userspace as a kcontrol as well and add the necessary widgets.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---

 sound/soc/intel/boards/sof_da7219_max98373.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/intel/boards/sof_da7219_max98373.c b/sound/soc/intel/boards/sof_da7219_max98373.c
index 740aa11cb019..bbd47e7e4343 100644
--- a/sound/soc/intel/boards/sof_da7219_max98373.c
+++ b/sound/soc/intel/boards/sof_da7219_max98373.c
@@ -65,6 +65,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 static const struct snd_kcontrol_new controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Line Out"),
 	SOC_DAPM_PIN_SWITCH("Left Spk"),
 	SOC_DAPM_PIN_SWITCH("Right Spk"),
 };
@@ -72,6 +73,7 @@ static const struct snd_kcontrol_new controls[] = {
 static const struct snd_kcontrol_new m98360a_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Line Out"),
 	SOC_DAPM_PIN_SWITCH("Spk"),
 };
 
@@ -79,6 +81,7 @@ static const struct snd_kcontrol_new m98360a_controls[] = {
 static const struct snd_soc_dapm_widget widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_LINE("Line Out", NULL),
 
 	SND_SOC_DAPM_SPK("Left Spk", NULL),
 	SND_SOC_DAPM_SPK("Right Spk", NULL),
@@ -98,6 +101,7 @@ static const struct snd_soc_dapm_route audio_map[] = {
 
 	{ "Headphone Jack", NULL, "Platform Clock" },
 	{ "Headset Mic", NULL, "Platform Clock" },
+	{ "Line Out", NULL, "Platform Clock" },
 
 	{ "Left Spk", NULL, "Left BE_OUT" },
 	{ "Right Spk", NULL, "Right BE_OUT" },
@@ -110,6 +114,7 @@ static const struct snd_soc_dapm_route audio_map[] = {
 static const struct snd_soc_dapm_widget max98360a_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_LINE("Line Out", NULL),
 
 	SND_SOC_DAPM_SPK("Spk", NULL),
 
@@ -128,6 +133,7 @@ static const struct snd_soc_dapm_route max98360a_map[] = {
 
 	{ "Headphone Jack", NULL, "Platform Clock" },
 	{ "Headset Mic", NULL, "Platform Clock" },
+	{ "Line Out", NULL, "Platform Clock" },
 
 	{"Spk", NULL, "Speaker"},
 
@@ -144,6 +150,10 @@ static struct snd_soc_jack_pin jack_pins[] = {
 		.pin    = "Headset Mic",
 		.mask   = SND_JACK_MICROPHONE,
 	},
+	{
+		.pin    = "Line Out",
+		.mask   = SND_JACK_LINEOUT,
+	},
 };
 
 static struct snd_soc_jack headset;
-- 
2.40.1

