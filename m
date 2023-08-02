Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 355A876D65E
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:02:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57E77DE;
	Wed,  2 Aug 2023 20:01:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57E77DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999357;
	bh=7CKbjMP/B9VMbvg1xRhi8emxsMts2BBCwJ3arzZc+0k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WdW8Se0KH656Yut7IKaiguhRfHrvDOBYXK3F+DOnSQWlQMFTqtEB3W0q8sQUkK3be
	 TV5DTPLdoX3rvMELxU72S/5k9TUqhCcKu27XCtgrbDEchO6rK1KR/8e6/w7xB4pemY
	 +H4ZID/13s9VH7M24ycalLmekjp5zXChQ0u0uXGo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68121F8060E; Wed,  2 Aug 2023 19:58:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56119F80608;
	Wed,  2 Aug 2023 19:58:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43FEDF805B5; Wed,  2 Aug 2023 19:58:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E17D6F805AC
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:58:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E17D6F805AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=s3Ze57Wv
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fbc59de009so1194615e9.3
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999104; x=1691603904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7Eujl9TONcNYsMANe/HBMPhXswxieLTEnBVw6VDaZs=;
        b=s3Ze57WvoBdJRWBk+oNorD4T96n4Clz5XVEh7ZN2O8aeoaDHpqSOR14ZBkCVUfP21q
         x18yJZRzpN3tpgvEZTXXAe7ooi3CK7xtbJurmgsoqtHblmM1G+nKmFSM4+2W0XwnxX0o
         9K9y98/XSe2pUvNwpcncrUPAoxNd0UIxEyFSP1kIMMC8nPrwwXfsXVzm4u+jvaVcfkq4
         vjXJ/0PTS5fQ3NJhljyw37VLDWvxZV1SSorsKJtNfUw7xwvqZybOvsNCcYTD0FRSV/WZ
         byX+kemK8LndSyfuYhDXNRJQSsnTfYCdNN8CXBy2A/9M5sEyv7+U4ceS/7PlGTBZZEWX
         HK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999104; x=1691603904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7Eujl9TONcNYsMANe/HBMPhXswxieLTEnBVw6VDaZs=;
        b=a5sZby3ZZUf7gbeuNB8pnKnH7lCwezdpCnkaaNku/laqHfD0vk0zhdFDJJd5TqPt+M
         afhsD8/rXzZTldz0uYbheeJkRhVmff99eaEVVDKShmoQQbN/frogOD3Wne9d1t9ewRSD
         qnaftGkM9QahTLqfMVo5+8idXIq8EOSIfENCI2PRdsDh5YgCIcjXLKJeJDYTVfa/7vhQ
         KkaA4Wkdeks+X+lORUOzpsEe/GD0OF2Oc3PpAObF6AswFi7NUim1JRzptwYMFM2h210L
         GyfAd1sKf5ZlM8zNjLb/rArTE9yDF/ZqhOtA7gKES528xIUjRIjR1tI5iqJVUjQX9Fw6
         IVsQ==
X-Gm-Message-State: ABy/qLaBdWXO1674GuBir2SC8prAJe+wIqiz2lI1oTQib24q9HL87N9V
	aUclKT6n87FEYcHygBCpV9Yc/d8GxaY=
X-Google-Smtp-Source: 
 APBJJlE9v5IMSE84zbQhqQGnEpXNG4pSickpNyGMWVqiZVTFXLE89xOKSB3Mt6As+quUq+SxsRUTZQ==
X-Received: by 2002:a1c:f309:0:b0:3fc:e7d:ca57 with SMTP id
 q9-20020a1cf309000000b003fc0e7dca57mr5432380wmq.2.1690999104110;
        Wed, 02 Aug 2023 10:58:24 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:58:23 -0700 (PDT)
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
Subject: [PATCH 15/27] ASoC: mediatek: mt8173-rt5650: Map missing jack
 kcontrols
Date: Wed,  2 Aug 2023 20:57:25 +0300
Message-Id: <20230802175737.263412-16-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I57TBE5SBJG4DCHPPERMS5VXKCUVTABV
X-Message-ID-Hash: I57TBE5SBJG4DCHPPERMS5VXKCUVTABV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I57TBE5SBJG4DCHPPERMS5VXKCUVTABV/>
List-Archive: <>
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
Tested on a "Hana" Chromebook.

 sound/soc/mediatek/mt8173/mt8173-rt5650.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index 3ece4b5eaca2..18cf84bb25c7 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -54,6 +54,17 @@ static const struct snd_kcontrol_new mt8173_rt5650_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 };
 
+static struct snd_soc_jack_pin mt8173_rt5650_jack_pins[] = {
+	{
+		.pin	= "Headphone",
+		.mask	= SND_JACK_HEADPHONE,
+	},
+	{
+		.pin	= "Headset Mic",
+		.mask	= SND_JACK_MICROPHONE,
+	},
+};
+
 static int mt8173_rt5650_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
@@ -128,11 +139,13 @@ static int mt8173_rt5650_init(struct snd_soc_pcm_runtime *runtime)
 	}
 
 	/* enable jack detection */
-	ret = snd_soc_card_jack_new(card, "Headset Jack",
-				    SND_JACK_HEADPHONE | SND_JACK_MICROPHONE |
-				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-				    SND_JACK_BTN_2 | SND_JACK_BTN_3,
-				    &mt8173_rt5650_jack);
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack",
+					 SND_JACK_HEADPHONE | SND_JACK_MICROPHONE |
+					 SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+					 SND_JACK_BTN_2 | SND_JACK_BTN_3,
+					 &mt8173_rt5650_jack,
+					 mt8173_rt5650_jack_pins,
+					 ARRAY_SIZE(mt8173_rt5650_jack_pins));
 	if (ret) {
 		dev_err(card->dev, "Can't new Headset Jack %d\n", ret);
 		return ret;
-- 
2.40.1

