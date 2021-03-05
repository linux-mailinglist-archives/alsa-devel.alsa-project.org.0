Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0D232DEA8
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Mar 2021 01:54:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE29C17EE;
	Fri,  5 Mar 2021 01:53:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE29C17EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614905641;
	bh=HvdCobbqW+oYzsKDo4Q/qSmBpvfnECCKoaIHnOeIq7s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HdtYSpS48NItXToXl1qH3a8Pk4kbiFEb+JwiXCo+EP6PVHNZqWCp1nTyYdclaIGbN
	 0XtlCN9nlqGnxSbJQYn25q5an4hwSCgN3vX0+0PsvcnWhwYyeM9thfgFoGr6TKoPxI
	 cbvuUDaUtWxoDD5CpCd/iDrtWCRolZWAWc8Pi0Hk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4D2CF8007E;
	Fri,  5 Mar 2021 01:52:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C9AFF80269; Fri,  5 Mar 2021 01:52:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8F08F8007E
 for <alsa-devel@alsa-project.org>; Fri,  5 Mar 2021 01:52:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8F08F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com
 header.i=@marek-ca.20150623.gappssmtp.com header.b="cTpqXglB"
Received: by mail-qk1-x72d.google.com with SMTP id t4so444326qkp.1
 for <alsa-devel@alsa-project.org>; Thu, 04 Mar 2021 16:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cgOQi/vVU6ZZA3ZTTPU47X1SZKTsVoK9deRtexYnDh0=;
 b=cTpqXglB2XTwF2LgJ/l2DHTGzF2gQGj7D/nJUkOvhpdAd+2h1jPY3p4tCfZNj5yY+e
 7zOrCbBN6lt9lhLX06eLXdrqYwSeDO5mPPLt2LzT01lMbwAR8m3y3YZ5o883v5JLqoZN
 0bq0/PaKCVK5rbc03Ru3/h4s6uGkw2gHP/rts200u3N1T241DDe7EJJrBOVtZzB5xUMV
 VYReP5acG+DYkUszKAHC1XyKLSG6N4FvkHlnFxbvppb5M/MqkQDZy4/6udaf/7DubcBR
 NaJvudSE/73zC+d6Pr7NQO4ywzjgm9c/6rC3w5q97DzxXlx/BH2EE+27XtG+kxmKL+aw
 dDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cgOQi/vVU6ZZA3ZTTPU47X1SZKTsVoK9deRtexYnDh0=;
 b=k+qzHjWkpnI4TTn/kXDD0YLgds2YaTDOo5laKxoOVmalUEqqNmcd5UBUul0QzMorc7
 l5so7rN7IUzJ0jRmhx/fUVe8AhOYcxdGEx4sCEmuo5h2EKZEFUBA31riztBld8jCb8QJ
 5rKbdBxxVQ8X7ID30Pb5pK9Rby0kge2gTnjflWE97j+TofxVYzBvXyPqw6JyUm2Krmk5
 mhPPVsqEQOSrPz4Ne2hFyBi5ibnLkpeGLu5kWooRZMUfwnF1v36babYwEX1owBmqQhQx
 QxiyrrmOUOyQIQgJVeGvW3Ukp5sIASXql8WYheu8QeLgA1ThgAbuchC0LIOKNrMmK289
 Thjg==
X-Gm-Message-State: AOAM533hpAWUwUUb+7SUvDlQ8bL7lQFgv+rCktCS0tqwa71Zu6qvJ9yN
 fIeGvE7Ex5qJa6D+FrmSayxmIQ==
X-Google-Smtp-Source: ABdhPJwV2DQk5G1xaNKIxBVw8PIYkhGkjDXsi5yohmD/k0nUgCRzjx31VeKi18H2T/lLHZqWiSqxgQ==
X-Received: by 2002:a05:620a:799:: with SMTP id
 25mr7288891qka.182.1614905535831; 
 Thu, 04 Mar 2021 16:52:15 -0800 (PST)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id n67sm754456qkb.35.2021.03.04.16.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 16:52:15 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH] ASoC: codecs: lpass-wsa-macro: fix RX MIX input controls
Date: Thu,  4 Mar 2021 19:50:48 -0500
Message-Id: <20210305005049.24726-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "moderated list:QCOM AUDIO ASoC DRIVERS" <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Attempting to use the RX MIX path at 48kHz plays at 96kHz, because these
controls are incorrectly toggling the first bit of the register, which
is part of the FS_RATE field.

Fix the problem by using the same method used by the "WSA RX_MIX EC0_MUX"
control, which is to use SND_SOC_NOPM as the register and use an enum in
the shift field instead.

Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/lpass-wsa-macro.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index f399f4dff5511..bd2561f9fb9fa 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1211,14 +1211,16 @@ static int wsa_macro_enable_mix_path(struct snd_soc_dapm_widget *w,
 				     struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	u16 gain_reg;
+	u16 path_reg, gain_reg;
 	int val;
 
-	switch (w->reg) {
-	case CDC_WSA_RX0_RX_PATH_MIX_CTL:
+	switch (w->shift) {
+	case WSA_MACRO_RX_MIX0:
+		path_reg = CDC_WSA_RX0_RX_PATH_MIX_CTL;
 		gain_reg = CDC_WSA_RX0_RX_VOL_MIX_CTL;
 		break;
-	case CDC_WSA_RX1_RX_PATH_MIX_CTL:
+	case WSA_MACRO_RX_MIX1:
+		path_reg = CDC_WSA_RX1_RX_PATH_MIX_CTL;
 		gain_reg = CDC_WSA_RX1_RX_VOL_MIX_CTL;
 		break;
 	default:
@@ -1231,7 +1233,7 @@ static int wsa_macro_enable_mix_path(struct snd_soc_dapm_widget *w,
 		snd_soc_component_write(component, gain_reg, val);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		snd_soc_component_update_bits(component, w->reg,
+		snd_soc_component_update_bits(component, path_reg,
 					      CDC_WSA_RX_PATH_MIX_CLK_EN_MASK,
 					      CDC_WSA_RX_PATH_MIX_CLK_DISABLE);
 		break;
@@ -2068,14 +2070,14 @@ static const struct snd_soc_dapm_widget wsa_macro_dapm_widgets[] = {
 	SND_SOC_DAPM_MUX("WSA_RX0 INP0", SND_SOC_NOPM, 0, 0, &rx0_prim_inp0_mux),
 	SND_SOC_DAPM_MUX("WSA_RX0 INP1", SND_SOC_NOPM, 0, 0, &rx0_prim_inp1_mux),
 	SND_SOC_DAPM_MUX("WSA_RX0 INP2", SND_SOC_NOPM, 0, 0, &rx0_prim_inp2_mux),
-	SND_SOC_DAPM_MUX_E("WSA_RX0 MIX INP", CDC_WSA_RX0_RX_PATH_MIX_CTL,
-			   0, 0, &rx0_mix_mux, wsa_macro_enable_mix_path,
+	SND_SOC_DAPM_MUX_E("WSA_RX0 MIX INP", SND_SOC_NOPM, WSA_MACRO_RX_MIX0,
+			   0, &rx0_mix_mux, wsa_macro_enable_mix_path,
 			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_MUX("WSA_RX1 INP0", SND_SOC_NOPM, 0, 0, &rx1_prim_inp0_mux),
 	SND_SOC_DAPM_MUX("WSA_RX1 INP1", SND_SOC_NOPM, 0, 0, &rx1_prim_inp1_mux),
 	SND_SOC_DAPM_MUX("WSA_RX1 INP2", SND_SOC_NOPM, 0, 0, &rx1_prim_inp2_mux),
-	SND_SOC_DAPM_MUX_E("WSA_RX1 MIX INP", CDC_WSA_RX1_RX_PATH_MIX_CTL,
-			   0, 0, &rx1_mix_mux, wsa_macro_enable_mix_path,
+	SND_SOC_DAPM_MUX_E("WSA_RX1 MIX INP", SND_SOC_NOPM, WSA_MACRO_RX_MIX1,
+			   0, &rx1_mix_mux, wsa_macro_enable_mix_path,
 			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 
 	SND_SOC_DAPM_MIXER_E("WSA_RX INT0 MIX", SND_SOC_NOPM, 0, 0, NULL, 0,
-- 
2.26.1

