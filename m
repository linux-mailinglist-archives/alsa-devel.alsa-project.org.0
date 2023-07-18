Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6F2757ABA
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 13:42:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 849C1E12;
	Tue, 18 Jul 2023 13:41:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 849C1E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689680558;
	bh=4Rvnie3P9isrzxjqE5pZujm2UFXuVx8/I7GoL29XHu0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QS1Kds/BYf6frGlRVqI7Ivul3joo2o+l6JQKmMDE/jIsRRWJqsOaZKLEV0MC+gdsL
	 qT7tz+cZX80gPy02fLE2x5F1fEuAdw9RgwXHwK1wOt5IFOYXcBMuzyIoRzr0J4e9S1
	 xtGjx5zu5Tu5Jt9dYNyhUoEqyKKRpHICFgXSR2gc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9550F8055C; Tue, 18 Jul 2023 13:41:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84982F8055C;
	Tue, 18 Jul 2023 13:41:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7B2AF8053B; Tue, 18 Jul 2023 13:40:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C75A7F8047D
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 13:40:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C75A7F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gerhold.net header.i=@gerhold.net header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=KKterwiS;
	dkim=pass header.d=gerhold.net header.i=@gerhold.net header.a=ed25519-sha256
 header.s=strato-dkim-0003 header.b=ojnsujMm
ARC-Seal: i=1; a=rsa-sha256; t=1689680439; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=he3zbxol7Eutot+rDN9ngVPc+60F9RyVv2fpwM4KtTgM2niQHZougLu68uQ6M1G+JF
    aCSExsLDEVBhPyNtGNGwyFyU+/Vz3CmmjZ6BrY3W0dx+6OCLo7y0OQpYNFoPDZbRVwhY
    XRyktMLLvpm64F6plmky/TlMVc/gH6MJSKsD+Hc4Fbtd+ue7xEigVEL6xtDf1h/FKmTx
    Uzc8/mHk4VdHPCWGhZYEofKBt90PTnD/TAqvV8JkhmTfGPVqG42zWF+zl8oLvMoCu+5a
    s/LKAamhSdHDx+XUc9TKY0bWb7DaXqy4To+9e3o3layT9Het4HwGgVFSpPZaAvV3mNBv
    G3Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1689680439;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=3Xs5nxIGQOE10yC+AGjCn4bCSkdyLg/EjjkDzz6aSHg=;
    b=N2H3TVv28KDEOx+YDoD90xLJ+5HsU2Lj0PVaHFgum2VM/zsmibHijupnKBsyf0St7Z
    Mlx0MeQ03PSb9jNszfYgTgdO1enFSbSO9QT5e8A++lpraaZDXrSZbohdMjmQOtYreweY
    sdUMkbIWl+ZFe0zuy+ZsH3xnjoGe37ukEYjGDRcTrqsD4fkIUPmV7Y9W/nq0SGKqDT+1
    L6RvWy7be5XQ8xz432u0qNAZ5D2yxqAF8EbqmjrCuOTwLrwtTCwo7wOwroMlkrqAi/nt
    Sicxs0KnSei328cxqQR7gngMMzcin79hO02v33R931zQP7Q/DgWhYPWX0k02dYKWLc6u
    sBpw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1689680439;
    s=strato-dkim-0002; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=3Xs5nxIGQOE10yC+AGjCn4bCSkdyLg/EjjkDzz6aSHg=;
    b=KKterwiS7ksOzcDKEts2E36g51hpBDgO7r2DSXddS4dDrtSdeJx+/ZTI1+/vwu82Bx
    mBglRfoMxIT1kFhHCMY0+2+e1LcRY4+zF19ClhJ24WawHFolOP25kK/d+IYOuyTgqCKp
    NhXcPAZ9OPBb/E0/li5j5BRvULyxjiEOY6b+j4YUKltCfOD+T6d3COOLIYBfwxDm4bud
    KQNjoFjDB0ns3NF2N4dpO9aYr0CTPgxnOnl5vmKjk70h9GrF03hiNbog9hISNNLDCd92
    kT88mZ+7sHy0q4SEQSWU73hEEyd08mLwevfnHLTMpfTQl32rKD1U/E2HtHgdtmXwWITg
    Sc5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1689680439;
    s=strato-dkim-0003; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=3Xs5nxIGQOE10yC+AGjCn4bCSkdyLg/EjjkDzz6aSHg=;
    b=ojnsujMmxbjbZX6m3rDdzIBAhdpGSLNJWuQdXuM/ZJOPVSZy4jSiIIax89cZCvsrpG
    y9Uq533BvF9bKfEpZIDw==
X-RZG-AUTH: 
 ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQjVd4CteZ/7jYgS+mLFY+H0JAn8u45/mw=="
Received: from [192.168.244.3]
    by smtp.strato.de (RZmta 49.6.0 DYNA|AUTH)
    with ESMTPSA id D0d0a8z6IBecbpO
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 18 Jul 2023 13:40:38 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
Date: Tue, 18 Jul 2023 13:40:16 +0200
Subject: [PATCH 4/6] ASoC: codecs: msm8916-wcd-analog: Drop invalid mclk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230718-pm8916-mclk-v1-4-4b4a58b4240a@gerhold.net>
References: <20230718-pm8916-mclk-v1-0-4b4a58b4240a@gerhold.net>
In-Reply-To: <20230718-pm8916-mclk-v1-0-4b4a58b4240a@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 Stephan Gerhold <stephan@gerhold.net>
X-Mailer: b4 0.12.3
Message-ID-Hash: BFVHRHG54W2EC7UAEA4UJXIRXVSBUDY4
X-Message-ID-Hash: BFVHRHG54W2EC7UAEA4UJXIRXVSBUDY4
X-MailFrom: stephan@gerhold.net
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BFVHRHG54W2EC7UAEA4UJXIRXVSBUDY4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The audio codec typically used for the MSM8916 SoC is split into two
parts: the digital codec is part of the SoC, while the analog codec is
part of the PM8916 PMIC.

The analog codec in the PMIC has no direct connection to the mclk of
the SoC (GCC_CODEC_DIGCODEC_CLK). As the name of the clock suggests
this is supplied to the digital part of the codec. During playback it
will use this clock to transmit the audio data via the "CDC PDM" pins
to the PMIC. In this case the analog codec indirectly receives the
clock signal through the digital codec.

GCC_CODEC_DIGCODEC_CLK is already managed by the driver of the digital
part of the codec in the SoC. Having this clock on the analog PMIC part
additionally is redundant and incorrect because the analog codec cannot
receive the clock signal without going through the digital codec.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 43 +++++------------------------------
 1 file changed, 6 insertions(+), 37 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index cec90cf920ff..d4456a714c97 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -7,7 +7,6 @@
 #include <linux/delay.h>
 #include <linux/regulator/consumer.h>
 #include <linux/types.h>
-#include <linux/clk.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -1198,12 +1197,6 @@ static int pm8916_wcd_analog_spmi_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	priv->mclk = devm_clk_get(dev, "mclk");
-	if (IS_ERR(priv->mclk)) {
-		dev_err(dev, "failed to get mclk\n");
-		return PTR_ERR(priv->mclk);
-	}
-
 	for (i = 0; i < ARRAY_SIZE(supply_names); i++)
 		priv->supplies[i].supply = supply_names[i];
 
@@ -1214,17 +1207,9 @@ static int pm8916_wcd_analog_spmi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = clk_prepare_enable(priv->mclk);
-	if (ret < 0) {
-		dev_err(dev, "failed to enable mclk %d\n", ret);
-		return ret;
-	}
-
 	irq = platform_get_irq_byname(pdev, "mbhc_switch_int");
-	if (irq < 0) {
-		ret = irq;
-		goto err_disable_clk;
-	}
+	if (irq < 0)
+		return irq;
 
 	ret = devm_request_threaded_irq(dev, irq, NULL,
 			       pm8916_mbhc_switch_irq_handler,
@@ -1236,10 +1221,8 @@ static int pm8916_wcd_analog_spmi_probe(struct platform_device *pdev)
 
 	if (priv->mbhc_btn_enabled) {
 		irq = platform_get_irq_byname(pdev, "mbhc_but_press_det");
-		if (irq < 0) {
-			ret = irq;
-			goto err_disable_clk;
-		}
+		if (irq < 0)
+			return irq;
 
 		ret = devm_request_threaded_irq(dev, irq, NULL,
 				       mbhc_btn_press_irq_handler,
@@ -1250,10 +1233,8 @@ static int pm8916_wcd_analog_spmi_probe(struct platform_device *pdev)
 			dev_err(dev, "cannot request mbhc button press irq\n");
 
 		irq = platform_get_irq_byname(pdev, "mbhc_but_rel_det");
-		if (irq < 0) {
-			ret = irq;
-			goto err_disable_clk;
-		}
+		if (irq < 0)
+			return irq;
 
 		ret = devm_request_threaded_irq(dev, irq, NULL,
 				       mbhc_btn_release_irq_handler,
@@ -1270,17 +1251,6 @@ static int pm8916_wcd_analog_spmi_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_component(dev, &pm8916_wcd_analog,
 				      pm8916_wcd_analog_dai,
 				      ARRAY_SIZE(pm8916_wcd_analog_dai));
-
-err_disable_clk:
-	clk_disable_unprepare(priv->mclk);
-	return ret;
-}
-
-static void pm8916_wcd_analog_spmi_remove(struct platform_device *pdev)
-{
-	struct pm8916_wcd_analog_priv *priv = dev_get_drvdata(&pdev->dev);
-
-	clk_disable_unprepare(priv->mclk);
 }
 
 static const struct of_device_id pm8916_wcd_analog_spmi_match_table[] = {
@@ -1296,7 +1266,6 @@ static struct platform_driver pm8916_wcd_analog_spmi_driver = {
 		   .of_match_table = pm8916_wcd_analog_spmi_match_table,
 	},
 	.probe = pm8916_wcd_analog_spmi_probe,
-	.remove_new = pm8916_wcd_analog_spmi_remove,
 };
 
 module_platform_driver(pm8916_wcd_analog_spmi_driver);

-- 
2.41.0

