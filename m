Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D373176D65D
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:02:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 451BF1D6;
	Wed,  2 Aug 2023 20:01:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 451BF1D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999348;
	bh=GaO5nQByXKm7CHVG/RbTdDt5Gb53mwcJye5+lhsRbVk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P7zfNekKvm5fwKzYQmcPpos8fCdxnc6P8ESY/yxvIClZCXxVFRy2o0gp+LeIcwI5r
	 9xsp5a01kC8D8dKBXUYKTQmxgd9TU3uTO1BzICpNQGC8E4P+ehK5pMujsyacRlaffX
	 bgGJ6McfZ0Ql0wFYQdJD1IeaU1kOuEy605l+9Hqw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77DC3F805F9; Wed,  2 Aug 2023 19:58:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 859FCF80600;
	Wed,  2 Aug 2023 19:58:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 949EDF805B5; Wed,  2 Aug 2023 19:58:26 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 05BD8F805AF
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:58:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05BD8F805AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=P7SbG6nL
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fe2bc2702cso1513855e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999102; x=1691603902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlBC1H0XtO+vTlN099a54STTMxr//GhxYmUmPY9nGaY=;
        b=P7SbG6nLbP5uQyIVD5oRSxcoBdInRHrHOSv3pvN/jypg+ocEyrjRbQ4lqEKp1vJiIu
         7mDOvNK00gS5ddxx1HL+aDnc287/Kef8HVateKq08UJ+ZxcQva9Q739eH7LKqylyQ/fz
         F66/1c6237DYGJ7C2P7le9/P9rNYRkgJB95gmL1ZDEfZ8wfaerwWkEUAWXGeiDjfxE+U
         TpYj3I1a81h68lFefEYaO6OOn0DJ39tBL5Yop8v3OTuu46N5a8rocO63RHcKojqrFgde
         z4Ip44DptNxtQ6sHAscXu8uNI+o+eo/aWuIYPBGLyoDeBYUCR+V7NCuCf4e7U1AfnM2Q
         RNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999102; x=1691603902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KlBC1H0XtO+vTlN099a54STTMxr//GhxYmUmPY9nGaY=;
        b=LIM8ww8oRuhGgee0sAxX7P+bqvhU5uJDSuypXScEpRtOG/tVzK0qvA6hBU6gziJce7
         cHnupx7rFSAbKFo7L1UMHREemBGnvJcoJr+oX85/xr/R5SUueFHo5ZjDSVkjbea8loOX
         SpK2dv50LY3D70OK2HcS+3AfAjRjLI6/2WC8d89Vd3rM0J6TCRSLGS0naaLTxkdteqpZ
         GgBZy+0aboGGSepIHZoFvgoeAECaGq8INoiOh8QnRzAyd1fPst6tbVJ0zAFD6UjRVBwS
         CQETSoumorubUFThIzAqOHIyg1pU+L+RXVOhWvADd02X625+3sq0iw6o/tH/z+F8+Ydd
         yViQ==
X-Gm-Message-State: ABy/qLbdgBDfE7YUdY4uCE5DM0gKLlEWHwRS4FWtFK5u206qNqDo5vSe
	XC4uvzTTmcY/2tVEAF+rBbO2bc5MZrM=
X-Google-Smtp-Source: 
 APBJJlGfeKrU/n8gCLLShGwZi3d6BtH6N8GQz9cTtygM4kg1m56ye3zCalthG5m6h7ODrfn0m0jQhw==
X-Received: by 2002:a7b:c8d2:0:b0:3fe:90f:8496 with SMTP id
 f18-20020a7bc8d2000000b003fe090f8496mr5507988wml.1.1690999102117;
        Wed, 02 Aug 2023 10:58:22 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:58:21 -0700 (PDT)
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
Subject: [PATCH 14/27] ASoC: mediatek: mt8173-rt5650-rt5676: Map missing jack
 kcontrols
Date: Wed,  2 Aug 2023 20:57:24 +0300
Message-Id: <20230802175737.263412-15-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CRP4RXDFLD7H4VCW3C5MM33KLHNNSEJT
X-Message-ID-Hash: CRP4RXDFLD7H4VCW3C5MM33KLHNNSEJT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CRP4RXDFLD7H4VCW3C5MM33KLHNNSEJT/>
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

 .../mediatek/mt8173/mt8173-rt5650-rt5676.c    | 23 +++++++++++++++----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
index 8794720cea3a..ffb094284bfb 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
@@ -44,6 +44,17 @@ static const struct snd_kcontrol_new mt8173_rt5650_rt5676_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 };
 
+static struct snd_soc_jack_pin mt8173_rt5650_rt5676_jack_pins[] = {
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
 static int mt8173_rt5650_rt5676_hw_params(struct snd_pcm_substream *substream,
 					  struct snd_pcm_hw_params *params)
 {
@@ -95,11 +106,13 @@ static int mt8173_rt5650_rt5676_init(struct snd_soc_pcm_runtime *runtime)
 				RT5677_CLK_SEL_I2S2_ASRC);
 
 	/* enable jack detection */
-	ret = snd_soc_card_jack_new(card, "Headset Jack",
-				    SND_JACK_HEADPHONE | SND_JACK_MICROPHONE |
-				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-				    SND_JACK_BTN_2 | SND_JACK_BTN_3,
-				    &mt8173_rt5650_rt5676_jack);
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack",
+					 SND_JACK_HEADPHONE | SND_JACK_MICROPHONE |
+					 SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+					 SND_JACK_BTN_2 | SND_JACK_BTN_3,
+					 &mt8173_rt5650_rt5676_jack,
+					 mt8173_rt5650_rt5676_jack_pins,
+					 ARRAY_SIZE(mt8173_rt5650_rt5676_jack_pins));
 	if (ret) {
 		dev_err(card->dev, "Can't new Headset Jack %d\n", ret);
 		return ret;
-- 
2.40.1

