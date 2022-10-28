Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D1A610E6D
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 12:26:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 451312260;
	Fri, 28 Oct 2022 12:25:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 451312260
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666952793;
	bh=ZKc8ylDd3p8WZSF4jRHV2mMBbH7shNx0jCao1ROSkgk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gBytZHzaXn+yIOiLIv+85+O2OW1xMRSRcHCH1R4MuasYppWbgeDEfk3FNnzsg8L31
	 OZDPbfr9Mxx1DE0QxBK7uPaoUXd7i1ibHvsGTI72txvRvH/fCRQqASo7a39OLpek7u
	 7PHz1S4ptlTTvvbPiMTFhMsexGGi1zN8ytTFiic8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8AB1F804DF;
	Fri, 28 Oct 2022 12:25:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FBBDF804D0; Fri, 28 Oct 2022 12:25:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 792CDF80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 12:25:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 792CDF80095
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=compal-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20210112.gappssmtp.com
 header.b="m/UP4fu4"
Received: by mail-pl1-x62d.google.com with SMTP id f23so4481135plr.6
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 03:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mUsj9+u75ZiURBRDbzjBcZDwYbW7xC+xuux1Bvrvp1o=;
 b=m/UP4fu4PKx43aYhlz2Rp68oxaguB66SWgjhBVhkhTHKdqmEwNzyWVWP/JjKj9e9MR
 Y9NbqLdrh6vosMJkx4/BbPjlDdoTGOSbLf9YlskUdi2tRYgX1g1CvzAuVyoCi0VkzXRC
 YiJikNgpdC5EnHKpbrhHNkk119Nj3DFsGsE6w+TjxTdDz+6HVs67iFL9qP8jyjb/AORE
 f3P+EGHaIc/diGpmmYEz4CycVYZSvEao+8SdiHCuSm9vC6VKyCeNUY/bjUA93jagvckf
 3An73/Dpsb6QM8WHQVPgptVGjG3555ilgw6nCH2As9aTzF5lO+bKWqXlNOhd+iiecq/a
 GB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mUsj9+u75ZiURBRDbzjBcZDwYbW7xC+xuux1Bvrvp1o=;
 b=auatM9MGwR+f08vMEt78V9agU676OQYOi+1ycbMii6wJ56ht3blTduxuYjKNXlhXki
 3zrnINxg/S/WmYeWs3kFKq4jnyltUo6kYQsDPP3rfPUeW6HKU8ZR34b0bJqlbMfb9kyV
 tRV/IvaKaY5WqAUeZu3XsD/rjEpAmRqcyc6pzmaJv/Jz8ijzpKc1yMHImvklRifVL877
 ngftS5BC3HQkgZWpwWeIyUmMd+EiMFdx5Rm2XyinZhUW6AQsNL52ZV9sdpNwAXeob73P
 eQAtjq+eO43xmXl8hNUvfHKgYISlqETIfhpTzHz3ACl50CskqXa7AATXqafDKX7pg39+
 JcAg==
X-Gm-Message-State: ACrzQf3TJt+dTMb6s0Q3GQQEcVz89aBrRGctuheWzVk7BmcHyVAydgNo
 dwR7lF5jBwq4TGDo8/Vvd5z3MA==
X-Google-Smtp-Source: AMsMyM5PF+mfGpOT7qE4MUpscnGJjWoxwCDcOj+0J2CfXJVc05btTeWq4lG3ZKUCtFYAksnUSFF5Nw==
X-Received: by 2002:a17:902:bd8e:b0:178:25ab:56cc with SMTP id
 q14-20020a170902bd8e00b0017825ab56ccmr53514796pls.86.1666952715118; 
 Fri, 28 Oct 2022 03:25:15 -0700 (PDT)
Received: from localhost.localdomain (118-167-210-30.dynamic-ip.hinet.net.
 [118.167.210.30]) by smtp.gmail.com with ESMTPSA id
 o1-20020aa79781000000b0056b6a22d6c9sm2565236pfp.212.2022.10.28.03.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 03:25:14 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] ASoC: dmic: Add optional dmic selection
Date: Fri, 28 Oct 2022 18:24:50 +0800
Message-Id: <20221028102450.1161382-3-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028102450.1161382-1-ajye_huang@compal.corp-partner.google.com>
References: <20221028102450.1161382-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, devicetree@vger.kernel.org,
 angelogioacchino.delregno@collabora.corp-partner.google.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
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

Having two DMICs, a front DMIC and a rear DMIC,
but only host audio input AUX port0 is used for these two Dmics.
A "dmic_sel-gpios" property is used for a mixer control to switch
the dmic signal source between the Front and Rear Dmic.

usage: amixer -c0 cset name='Dmic Mux' 'FrontMic'
usage: amixer -c0 cset name='Dmic Mux' 'RearMic'

Refer to this one as an example,
commit 3cfbf07c6d27
("ASoC: qcom: sc7180: Modify machine driver for 2mic")

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
 sound/soc/codecs/dmic.c | 52 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/sound/soc/codecs/dmic.c b/sound/soc/codecs/dmic.c
index 4fd6f97e5a49..5c56fbcdb3e6 100644
--- a/sound/soc/codecs/dmic.c
+++ b/sound/soc/codecs/dmic.c
@@ -28,8 +28,50 @@ struct dmic {
 	int wakeup_delay;
 	/* Delay after DMIC mode switch */
 	int modeswitch_delay;
+	struct gpio_desc *dmic_sel;
+	int dmic_switch;
 };
 
+static int dmic_sel_get(struct snd_kcontrol *kcontrol,
+		    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+	struct dmic *dmic = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = dmic->dmic_switch;
+	return 0;
+}
+
+static int dmic_sel_set(struct snd_kcontrol *kcontrol,
+		    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+	struct dmic *dmic = snd_soc_component_get_drvdata(component);
+
+	dmic->dmic_switch = ucontrol->value.integer.value[0];
+	if (dmic->dmic_sel) {
+		gpiod_set_value(dmic->dmic_sel, dmic->dmic_switch);
+		dev_info(dapm->dev, "%s value %d\n", __func__, dmic->dmic_switch);
+	} else
+		dev_info(dapm->dev, "%s without dmic_sel-gpios\n", __func__);
+
+	return 0;
+}
+
+static const char * const dmic_mux_text[] = {
+	"FrontMic",
+	"RearMic",
+};
+
+static SOC_ENUM_SINGLE_DECL(dmic_enum,
+			    SND_SOC_NOPM, 0, dmic_mux_text);
+
+static const struct snd_kcontrol_new dmic_mux_control =
+	SOC_DAPM_ENUM_EXT("DMIC Select Mux", dmic_enum,
+			  dmic_sel_get, dmic_sel_set);
+
 static int dmic_daiops_trigger(struct snd_pcm_substream *substream,
 			       int cmd, struct snd_soc_dai *dai)
 {
@@ -115,6 +157,11 @@ static int dmic_component_probe(struct snd_soc_component *component)
 	if (dmic->modeswitch_delay > MAX_MODESWITCH_DELAY)
 		dmic->modeswitch_delay = MAX_MODESWITCH_DELAY;
 
+	dmic->dmic_sel = devm_gpiod_get_optional(component->dev,
+						"dmic_sel", GPIOD_OUT_LOW);
+	if (IS_ERR(dmic->dmic_sel))
+		return PTR_ERR(dmic->dmic_sel);
+
 	snd_soc_component_set_drvdata(component, dmic);
 
 	return 0;
@@ -125,10 +172,15 @@ static const struct snd_soc_dapm_widget dmic_dapm_widgets[] = {
 			       SND_SOC_NOPM, 0, 0, dmic_aif_event,
 			       SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_INPUT("DMic"),
+	SND_SOC_DAPM_MIC("DMIC", NULL),
+	SND_SOC_DAPM_MUX("Dmic Mux", SND_SOC_NOPM, 0, 0, &dmic_mux_control),
 };
 
 static const struct snd_soc_dapm_route intercon[] = {
 	{"DMIC AIF", NULL, "DMic"},
+	/* digital mics */
+	{"Dmic Mux", "FrontMic", "DMIC"},
+	{"Dmic Mux", "RearMic", "DMIC"},
 };
 
 static const struct snd_soc_component_driver soc_dmic = {
-- 
2.25.1

