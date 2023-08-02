Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCD676D674
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:06:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 950E0847;
	Wed,  2 Aug 2023 20:05:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 950E0847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999603;
	bh=LB3ABtDUGjhlh0ba/i8Tv8u5FiRcmzgz7YERD/XEgas=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cjyY+wVXuiOMupST5Kqtpb3t1I50f4wSAt86aNX1Pcz1C506JCzJaUbFHTNNEAqAd
	 iLbJwjl8LXYJGSxN1BIQ2pHQD9V576tIqnAD2K7OMi0qCmWEYkUjbkuTfrYR+28oRu
	 4iB2FxYTGu3PfJ6P9QbabypP8KmW5TUErub7VtFA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9C75F806A7; Wed,  2 Aug 2023 19:59:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A7DBF806A7;
	Wed,  2 Aug 2023 19:59:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C29EF80692; Wed,  2 Aug 2023 19:59:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10E47F802BE
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:58:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10E47F802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=dcwAI3ZO
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fe1d9a8ec6so7983855e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999082; x=1691603882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=giLlDxuohbavL/Eh+3qVG6gVGzv5UIQjKSZ5ky1GgcY=;
        b=dcwAI3ZOa09tYBw11uCkrcP1OCcx4OyU/Z2uu9sLT5AszyF0lL7xMJbuSicjUawgVQ
         vlq+yryK2kPnMHPGqA5rcrihs4+1jXfiYJqkcQJhcdhlmTdFA9QrA8uIJ9qEcdDjvvwi
         gSen/5PdQG2pvGa0ablMsZbEGUlO9cl3Q4hvS/WeCKdeTkOi81yTmdc2Gd/mH+EdZOnw
         YFeNflvIxZHVme6PqVUEaION84HAS6+Q7qydRmDPcdFWKNA95ES/zGOlztxFs2x+n/Ub
         4pTXJtsw3z+RinV7DbimCQmbIKC2n6RdBY6FICujmbL94WxJ/9++gOhbx9bY9svVsoH3
         t4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999082; x=1691603882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=giLlDxuohbavL/Eh+3qVG6gVGzv5UIQjKSZ5ky1GgcY=;
        b=KDmENEmNEWjK/cLxPWYeM/rmbwdTxFhX4pX5oNI1qlDMHPxlbYWB9X5SkyslwGyAVC
         /3QvDmXkW4U/+MDX3i7Ixyy/GVXh0Eu35ulPSrskH6a8f+I11ykaGbf7p77d0rlM1co0
         HmarRXP4pIi60phLO1FsxyVzJKZp7iEpN5RIXRKzgxD6GaI04CV7BzWtptxZSPepR0MU
         iCC3JQn4F2+dEgEwrVq/blhIKYtYAZ1DEBDzSrw5+MXldkzyTzyrZ4m1XUDTmr0OhhOo
         jqMJqwZsLbJ5GDjXskAcjWMIQH0KmwikXjhbLH5c29IBz+73jeTnrlyHlqqQxcOsOLAI
         ioaw==
X-Gm-Message-State: ABy/qLZRQ4N5BNl7IOF9UABQY/zr25taMPQ6lUmnAEWk1++qrPtOFlF5
	R/JGQvhb/AWyH4cIOG828IEL5tdk10A=
X-Google-Smtp-Source: 
 APBJJlHsDaCjAi4zBTU9xrF27hqoMFD5e0yhCUCynaZ/vT7KHt4B0IwuLDdQmQ7FEXmHdswWOSfPSw==
X-Received: by 2002:a05:6000:1152:b0:317:58a4:916f with SMTP id
 d18-20020a056000115200b0031758a4916fmr6105223wrx.33.1690999082349;
        Wed, 02 Aug 2023 10:58:02 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:58:01 -0700 (PDT)
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
Subject: [PATCH 04/27] ASoC: amd: acp3x-rt5682-max9836: Map missing jack
 kcontrols
Date: Wed,  2 Aug 2023 20:57:14 +0300
Message-Id: <20230802175737.263412-5-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CL4KXITDOM75FRAZ2D3OQOLE2TJDYB7X
X-Message-ID-Hash: CL4KXITDOM75FRAZ2D3OQOLE2TJDYB7X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CL4KXITDOM75FRAZ2D3OQOLE2TJDYB7X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver does not properly map jack pins to kcontrols that PulseAudio
and PipeWire need to handle jack detection events. The RT5682, RT1015
and RT1015p codecs used here can detect Headphone and Headset Mic
connections. Expose the former two to userspace as kcontrols.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---
Should the SND_JACK_LINEOUT be removed from the jack_new_pins calls?

 sound/soc/amd/acp3x-rt5682-max9836.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 0543dda75b99..3bf7e1e83c36 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -28,6 +28,17 @@
 #define DUAL_CHANNEL		2
 
 static struct snd_soc_jack pco_jack;
+static struct snd_soc_jack_pin pco_jack_pins[] = {
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
 static struct clk *rt5682_dai_wclk;
 static struct clk *rt5682_dai_bclk;
 static struct gpio_desc *dmic_sel;
@@ -86,11 +97,13 @@ static int acp3x_5682_init(struct snd_soc_pcm_runtime *rtd)
 	rt5682_dai_wclk = clk_get(component->dev, "rt5682-dai-wclk");
 	rt5682_dai_bclk = clk_get(component->dev, "rt5682-dai-bclk");
 
-	ret = snd_soc_card_jack_new(card, "Headset Jack",
-				SND_JACK_HEADSET | SND_JACK_LINEOUT |
-				SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-				SND_JACK_BTN_2 | SND_JACK_BTN_3,
-				&pco_jack);
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack",
+					 SND_JACK_HEADSET | SND_JACK_LINEOUT |
+					 SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+					 SND_JACK_BTN_2 | SND_JACK_BTN_3,
+					 &pco_jack,
+					 pco_jack_pins,
+					 ARRAY_SIZE(pco_jack_pins));
 	if (ret) {
 		dev_err(card->dev, "HP jack creation failed %d\n", ret);
 		return ret;
-- 
2.40.1

