Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C929176D64B
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:00:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0616846;
	Wed,  2 Aug 2023 19:59:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0616846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999200;
	bh=qRiSsKMkQKXsuRAidp00HWU9hPfdt4q3IhNuTBL8Ilk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZImNHfuAf0N9VH9G+bRjl0i0zg8csGlw1su1sKpjUzpc9o9deqg0qJkhGMqLxlM9a
	 78Oo8IspaBppXIRL22bM+IdkJLSBrHrR93zJKHOxhoOQp4j3JunMxL0quZLXBLO+S0
	 JQXHM0t2lHxMRQQPXZ/9coPZhVuQxxJDBhXjPAg0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9A9DF80579; Wed,  2 Aug 2023 19:58:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDF13F8056F;
	Wed,  2 Aug 2023 19:58:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22687F80520; Wed,  2 Aug 2023 19:58:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA240F801D5
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:58:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA240F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=mzEQx3XK
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b9c55e0fbeso683841fa.2
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999079; x=1691603879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ci67Td9oMJsLWbpviA9NcbMT0ChoVa0sXVbZDuba2eI=;
        b=mzEQx3XK3X+y5S6AkjDT4iX/ITs0YrzNj1ep4Yo+ghza6vJhgwrxFYPNIaWuna9+zk
         hjr35fZEIIj4OOMJRBhNKCWwInDeO+Mt61eTr226d5m/hfS+FC6ApSLoInZbn/4Vl591
         VX+neJj2OtSvBnic97wVGQTJLOcE6CUL/kfPribacVzgWGJUb0K2Vug577NVz2A8zU9j
         fNYFE7i8Pp3P//3Qtjpo++eP8/JBYO2c6YyzkygvLcgJrx68Fj5aBQ4lYpO/LWnc9umK
         hyB+xbwRspqMBXYDQO3tbO3tNa6CSTjpKhTwpR7eCDDV7tPPPa9IwPs+mvrynyPllz9N
         Je+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999079; x=1691603879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ci67Td9oMJsLWbpviA9NcbMT0ChoVa0sXVbZDuba2eI=;
        b=kNkJwx+PV0qnwfKXwCl/9Gtbw/NgCmzCW9o9gROj8PK/IdubOsGFM+7HjOvG6aCzFP
         bzhvQZpxcN3ZXG/A10Ag6/QjVq2D9I3H2IAF0unve8bkybDr27NgKPQjAsUbWyIXfqvG
         8ijmMEbrwcMFBwZPpA9AM7pfYe+RgpczQXKfY3KH2LZpx69GHI6DinwN3FH68Z3KRlDI
         HOOrybjBiSGLSGgow2nOrM5qKNSwBj2HK717A4Pi8OLdL+sMEM8k3H8wkw4PKYqB5FqW
         iQt07WeP9BpiRSI7rLv5+43PaPV2Ob356u4N+pS9Cw1uHwWzTGn3P3jIW/Ibdo1aT3g0
         qI9Q==
X-Gm-Message-State: ABy/qLbbDVJtF6BuI/0toPekWLxhgovWP7RbuV+g99KphlfTvD8qySXL
	9nJPZogwBtuAzpYY3syj8frTgY0e6fo=
X-Google-Smtp-Source: 
 APBJJlEzrYBdkRnwRPJ4NN3iObXeOWT2+1vk/p4PnAN6HWDNRkwLIBV6+U3Nxn7N1ETTwqwFIcZb4A==
X-Received: by 2002:a2e:3001:0:b0:2b9:ef0a:7d4b with SMTP id
 w1-20020a2e3001000000b002b9ef0a7d4bmr5792077ljw.31.1690999078378;
        Wed, 02 Aug 2023 10:57:58 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:57:57 -0700 (PDT)
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
Subject: [PATCH 02/27] ASoC: amd: acp-rt5645: Map missing jack kcontrols
Date: Wed,  2 Aug 2023 20:57:12 +0300
Message-Id: <20230802175737.263412-3-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MU3SS5YT6DLFDZXSGC7OCBV7DFRLSCL5
X-Message-ID-Hash: MU3SS5YT6DLFDZXSGC7OCBV7DFRLSCL5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MU3SS5YT6DLFDZXSGC7OCBV7DFRLSCL5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver does not properly map jack pins to kcontrols that PulseAudio
and PipeWire need to handle jack detection events. The RT5645 codec used
here can detect Headphone and Headset Mic connections. Expose both to
userspace as kcontrols.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---

 sound/soc/amd/acp-rt5645.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/sound/soc/amd/acp-rt5645.c b/sound/soc/amd/acp-rt5645.c
index 532aa98a2241..c8ed1e0b1ccd 100644
--- a/sound/soc/amd/acp-rt5645.c
+++ b/sound/soc/amd/acp-rt5645.c
@@ -42,6 +42,16 @@
 #define CZ_PLAT_CLK 24000000
 
 static struct snd_soc_jack cz_jack;
+static struct snd_soc_jack_pin cz_jack_pins[] = {
+	{
+		.pin = "Headphones",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Headset Mic",
+		.mask = SND_JACK_MICROPHONE,
+	},
+};
 
 static int cz_aif1_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
@@ -76,11 +86,13 @@ static int cz_init(struct snd_soc_pcm_runtime *rtd)
 	codec = asoc_rtd_to_codec(rtd, 0)->component;
 	card = rtd->card;
 
-	ret = snd_soc_card_jack_new(card, "Headset Jack",
-				SND_JACK_HEADPHONE | SND_JACK_MICROPHONE |
-				SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-				SND_JACK_BTN_2 | SND_JACK_BTN_3,
-				&cz_jack);
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack",
+					 SND_JACK_HEADPHONE | SND_JACK_MICROPHONE |
+					 SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+					 SND_JACK_BTN_2 | SND_JACK_BTN_3,
+					 &cz_jack,
+					 cz_jack_pins,
+					 ARRAY_SIZE(cz_jack_pins));
 	if (ret) {
 		dev_err(card->dev, "HP jack creation failed %d\n", ret);
 		return ret;
-- 
2.40.1

