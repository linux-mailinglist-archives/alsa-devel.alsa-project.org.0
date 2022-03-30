Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CE44ECE2D
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 22:43:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E411D1AD6;
	Wed, 30 Mar 2022 22:43:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E411D1AD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648673032;
	bh=eQC120Pg3Qu9KkRUoa0leEw42XQcDP0fZ5TIvu/rtZc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TTtsG5tcy8pxAPU7OdFhPGZNQyzI/IbSg+cIrrf7PCzid1Wz+BXHQG44Puo3mcy1m
	 VZI8FQgZei+/cBAYOCMfSSVRpseJTph+SlbDBfOeIHeU6bfrZsNAfFBmYp0iC/whR0
	 zlr2rF5rKFuDzpzJSmQH4OFZ/8BIopDTXodPTuSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BF56F8025A;
	Wed, 30 Mar 2022 22:42:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80E3CF80254; Wed, 30 Mar 2022 22:42:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEBFDF80155
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 22:42:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEBFDF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TmG125jU"
Received: by mail-lj1-x22c.google.com with SMTP id r22so29338504ljd.4
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ICtX8vJXHq3AHfULAa1Lf6IAnjSqmJ3fVv5dGbQwOvQ=;
 b=TmG125jUIg3Tal8JAqGpY1kVFpBd80svhIAJgBA+U5h1DvQ/UbfOsbOAH24UWI/y3J
 wZ2l9kUhJreEkDzFc68E1WjyKxnxeZ2H55dxbIve5ixPtq58ejQhcInNC3LrFjWbyDLI
 DE16c9zjzgbDX5CQaG+WSx5fV3hx7GC1BjeHBEFJNaxYIE/LnEiosr0Ip1h0uo8+K0Vn
 bAx6eO27KQqwtaUqWgowkVTMOir9tVcmT0j9cUbgKHM8rPps+lCEp5jgaQI4i3PTjmwS
 oUAFhPeQiZVXpFse7AToqMFVGmt8LUcXgekSdzl03aoI77Txe+NSt2IdUDmxXwdhOYLo
 eFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ICtX8vJXHq3AHfULAa1Lf6IAnjSqmJ3fVv5dGbQwOvQ=;
 b=POjFHXYFnfx0y0wlt1/NrHMVCQbfrdGJTMWQ+P7b0heug4FFVJRmH9BENtwknIoUdH
 RjwA8J7+1QwbkCfK9iQZPRd0Gpm6UNbjroRFZ96goSQh3YgNho0t/rAlo3WrB6QZcQdr
 v15Eh/ZRJMVfjMSObrh58i2HI+QefiQLOVPJKFJPsjWLy5jcPYjKT/I8hlP+B4FCgS4t
 44+5LnI/eIzVG7ICFtK2+k6zngNLhDd9Pq23h+A0MPWK4TOvjTA6epRhqB8ZZeDFEDio
 7SAqsObcEgEZkPgfoDfPpH6QQWuEJp1HFFtuK4xX2FUSm0wDQjXjZM8v2IV/ZO3XVsTz
 a9ag==
X-Gm-Message-State: AOAM532ZlgjeFeCnLNdmSHi5s7clpaU7UoDGr8VX+b7DwhzmU5No5XoE
 wudKfiLMflgoV7srz3Z0fA8=
X-Google-Smtp-Source: ABdhPJw1zU3I66y4H0SMYqrMyMfkJ/7RIzrRskwK10mMYT+5jMdZe1M3rv4gzdHPdGKJFOo2EWCTvw==
X-Received: by 2002:a2e:a4a3:0:b0:24a:c0bf:3d32 with SMTP id
 g3-20020a2ea4a3000000b0024ac0bf3d32mr8381816ljm.161.1648672955447; 
 Wed, 30 Mar 2022 13:42:35 -0700 (PDT)
Received: from localhost.localdomain (h-82-196-111-188.NA.cust.bahnhof.se.
 [82.196.111.188]) by smtp.gmail.com with ESMTPSA id
 i1-20020a2e8641000000b00247d94a6ac5sm2532997ljj.2.2022.03.30.13.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 13:42:34 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: samsung: Constify snd_soc_dapm_{route,widget} structs
Date: Wed, 30 Mar 2022 22:42:27 +0200
Message-Id: <20220330204227.25081-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-actions@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

These structs only have their address assigned to the
dapm_{routes,widget} fields in the snd_soc_card struct,
both which are pointers to const data. Make them const to
allow the compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 sound/soc/samsung/bells.c      | 4 ++--
 sound/soc/samsung/littlemill.c | 4 ++--
 sound/soc/samsung/lowland.c    | 4 ++--
 sound/soc/samsung/speyside.c   | 4 ++--
 sound/soc/samsung/tobermory.c  | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/samsung/bells.c b/sound/soc/samsung/bells.c
index 8b83f39c3ac9..76998a4a4cad 100644
--- a/sound/soc/samsung/bells.c
+++ b/sound/soc/samsung/bells.c
@@ -386,11 +386,11 @@ static struct snd_soc_codec_conf bells_codec_conf[] = {
 	},
 };
 
-static struct snd_soc_dapm_widget bells_widgets[] = {
+static const struct snd_soc_dapm_widget bells_widgets[] = {
 	SND_SOC_DAPM_MIC("DMIC", NULL),
 };
 
-static struct snd_soc_dapm_route bells_routes[] = {
+static const struct snd_soc_dapm_route bells_routes[] = {
 	{ "Sub CLK_SYS", NULL, "OPCLK" },
 	{ "CLKIN", NULL, "OPCLK" },
 
diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemill.c
index 34067cc314ff..26c42892c059 100644
--- a/sound/soc/samsung/littlemill.c
+++ b/sound/soc/samsung/littlemill.c
@@ -228,7 +228,7 @@ static const struct snd_kcontrol_new controls[] = {
 	SOC_DAPM_PIN_SWITCH("WM1250 Output"),
 };
 
-static struct snd_soc_dapm_widget widgets[] = {
+static const struct snd_soc_dapm_widget widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 
 	SND_SOC_DAPM_MIC("AMIC", NULL),
@@ -239,7 +239,7 @@ static struct snd_soc_dapm_widget widgets[] = {
 			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 };
 
-static struct snd_soc_dapm_route audio_paths[] = {
+static const struct snd_soc_dapm_route audio_paths[] = {
 	{ "Headphone", NULL, "HPOUT1L" },
 	{ "Headphone", NULL, "HPOUT1R" },
 
diff --git a/sound/soc/samsung/lowland.c b/sound/soc/samsung/lowland.c
index 7b12ccd2a9b2..8e4579fdcd7b 100644
--- a/sound/soc/samsung/lowland.c
+++ b/sound/soc/samsung/lowland.c
@@ -140,7 +140,7 @@ static const struct snd_kcontrol_new controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone"),
 };
 
-static struct snd_soc_dapm_widget widgets[] = {
+static const struct snd_soc_dapm_widget widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 
@@ -150,7 +150,7 @@ static struct snd_soc_dapm_widget widgets[] = {
 	SND_SOC_DAPM_MIC("Main DMIC", NULL),
 };
 
-static struct snd_soc_dapm_route audio_paths[] = {
+static const struct snd_soc_dapm_route audio_paths[] = {
 	{ "Sub IN1", NULL, "HPOUT2L" },
 	{ "Sub IN2", NULL, "HPOUT2R" },
 
diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
index 37b1f4f60b21..1ae1a5aae72f 100644
--- a/sound/soc/samsung/speyside.c
+++ b/sound/soc/samsung/speyside.c
@@ -261,7 +261,7 @@ static const struct snd_kcontrol_new controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone"),
 };
 
-static struct snd_soc_dapm_widget widgets[] = {
+static const struct snd_soc_dapm_widget widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 
@@ -271,7 +271,7 @@ static struct snd_soc_dapm_widget widgets[] = {
 	SND_SOC_DAPM_MIC("Main DMIC", NULL),
 };
 
-static struct snd_soc_dapm_route audio_paths[] = {
+static const struct snd_soc_dapm_route audio_paths[] = {
 	{ "IN1RN", NULL, "MICB1" },
 	{ "IN1RP", NULL, "MICB1" },
 	{ "IN1RN", NULL, "MICB2" },
diff --git a/sound/soc/samsung/tobermory.c b/sound/soc/samsung/tobermory.c
index 8d3149a47a4c..4a56abfc243e 100644
--- a/sound/soc/samsung/tobermory.c
+++ b/sound/soc/samsung/tobermory.c
@@ -130,7 +130,7 @@ static const struct snd_kcontrol_new controls[] = {
 	SOC_DAPM_PIN_SWITCH("DMIC"),
 };
 
-static struct snd_soc_dapm_widget widgets[] = {
+static const struct snd_soc_dapm_widget widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 
@@ -140,7 +140,7 @@ static struct snd_soc_dapm_widget widgets[] = {
 	SND_SOC_DAPM_SPK("Main Speaker", NULL),
 };
 
-static struct snd_soc_dapm_route audio_paths[] = {
+static const struct snd_soc_dapm_route audio_paths[] = {
 	{ "Headphone", NULL, "HPOUTL" },
 	{ "Headphone", NULL, "HPOUTR" },
 
-- 
2.35.1

