Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C7D1487AD
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 15:24:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E364E168E;
	Fri, 24 Jan 2020 15:23:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E364E168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579875890;
	bh=Ycd6MYonxnfyAkzjafGArgJmxp4AH2t4ADOKpnzBpWI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fmBu2+Um/lDvaQ8+1e3OIsurdy7fipFnSO00B20bn0jSodQWQGHSe6XuIel2pU49o
	 rt11/AFUv3cDPA+iU+B9ICYPvLEcVrA+jIBBbyfScnp3cy3TW5+MX3iVz6mXTy6bSa
	 GSHnEy2QONb829FmbTk0mU2afVyegr2rFRmIN54k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEFD5F802BD;
	Fri, 24 Jan 2020 15:19:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 905C4F8029A; Fri, 24 Jan 2020 15:19:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C66DAF8028A
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 15:19:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C66DAF8028A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GdmZBD1p"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB5FD214AF;
 Fri, 24 Jan 2020 14:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579875563;
 bh=iPMVL4crNxPbC1jQF3SB1zO7fOwWGK3uSOuPiijHZqo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GdmZBD1p7wDQu+0NYME9NabsF5IKIuAS79tC8SaqpAaBJqdxXIXSe9aaSWlUYCMA+
 3aINDv75+qd6+AZ14RXUyrsby7dPS4k5tB9vWb3Zb3b+PfIK8gvWTTnFX1NPUW0Up0
 mnVsi8Chcs9RAQtww94Awv2tgZfAlfWvV6Ae01Gs=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 24 Jan 2020 09:17:27 -0500
Message-Id: <20200124141817.28793-57-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200124141817.28793-1-sashal@kernel.org>
References: <20200124141817.28793-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>
Subject: [alsa-devel] [PATCH AUTOSEL 5.4 057/107] ASoC: msm8916-wcd-analog:
	Fix MIC BIAS Internal1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Stephan Gerhold <stephan@gerhold.net>

[ Upstream commit 057efcf9faea4769cf1020677d93d040db9b23f3 ]

MIC BIAS Internal1 is broken at the moment because we always
enable the internal rbias resistor to the TX2 line (connected to
the headset microphone), rather than enabling the resistor connected
to TX1.

Move the RBIAS code to pm8916_wcd_analog_enable_micbias_int1/2()
to fix this.

Fixes: 585e881e5b9e ("ASoC: codecs: Add msm8916-wcd analog codec")
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
Link: https://lore.kernel.org/r/20200111164006.43074-3-stephan@gerhold.net
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 08399a734be27..84289ebeae872 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -391,9 +391,6 @@ static int pm8916_wcd_analog_enable_micbias_int(struct snd_soc_component
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		snd_soc_component_update_bits(component, CDC_A_MICB_1_INT_RBIAS,
-				    MICB_1_INT_TX2_INT_RBIAS_EN_MASK,
-				    MICB_1_INT_TX2_INT_RBIAS_EN_ENABLE);
 		snd_soc_component_update_bits(component, reg, MICB_1_EN_PULL_DOWN_EN_MASK, 0);
 		snd_soc_component_update_bits(component, CDC_A_MICB_1_EN,
 				    MICB_1_EN_OPA_STG2_TAIL_CURR_MASK,
@@ -443,6 +440,14 @@ static int pm8916_wcd_analog_enable_micbias_int1(struct
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct pm8916_wcd_analog_priv *wcd = snd_soc_component_get_drvdata(component);
 
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_update_bits(component, CDC_A_MICB_1_INT_RBIAS,
+				    MICB_1_INT_TX1_INT_RBIAS_EN_MASK,
+				    MICB_1_INT_TX1_INT_RBIAS_EN_ENABLE);
+		break;
+	}
+
 	return pm8916_wcd_analog_enable_micbias_int(component, event, w->reg,
 						     wcd->micbias1_cap_mode);
 }
@@ -553,6 +558,11 @@ static int pm8916_wcd_analog_enable_micbias_int2(struct
 	struct pm8916_wcd_analog_priv *wcd = snd_soc_component_get_drvdata(component);
 
 	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_update_bits(component, CDC_A_MICB_1_INT_RBIAS,
+				    MICB_1_INT_TX2_INT_RBIAS_EN_MASK,
+				    MICB_1_INT_TX2_INT_RBIAS_EN_ENABLE);
+		break;
 	case SND_SOC_DAPM_POST_PMU:
 		pm8916_mbhc_configure_bias(wcd, true);
 		break;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
