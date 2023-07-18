Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7E6757AC0
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 13:43:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2525DDF0;
	Tue, 18 Jul 2023 13:42:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2525DDF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689680628;
	bh=FscZAanuLt52+mZHvtA9ybBTVsGaHIGou1sCUf8ad9Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X3+8q80tqHnjPkSC+8SYz5lIFV3Vs16RdtqrX+sxA+Yhq6KJtHGcmfeDS/SKaCr0e
	 t+3NvGZe1oyeVfOpV/FrPUtgOnrjougu0gv+JuqIij79WSVZ/ZSaCX7GFqEpPzncZN
	 DtjkmaFfvAeblOkWU+vyE4y3L1zXM0crOrJOvdEY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 913F9F805C3; Tue, 18 Jul 2023 13:41:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20601F805C2;
	Tue, 18 Jul 2023 13:41:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16964F80568; Tue, 18 Jul 2023 13:41:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de
 [85.215.255.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16B7FF80153
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 13:40:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16B7FF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gerhold.net header.i=@gerhold.net header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=aX6fe6Tg;
	dkim=pass header.d=gerhold.net header.i=@gerhold.net header.a=ed25519-sha256
 header.s=strato-dkim-0003 header.b=S7LPsRV5
ARC-Seal: i=1; a=rsa-sha256; t=1689680439; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=oK4gxsT3eHZ94nHchtRlLJNuPv6daCdQG84QKMwDIQb1l/IRIz0Vc55cAsTGKrz5xl
    3sf06S+0ZVO1RZGXBPKnExg3ouantqpBgiuLyx4gz4lKbO2v7n7apjPGBBKPceMCjUnW
    dA3S574x3mU2l7EwAC1eoxO/4ByhTd1/jDEGVLU03GmHv+R52zyI3yVrlML/mE5pU3J8
    23HJImaBtet6YEA8OnETB5v10auCA4V6tE+mB/yHpiYHdPTvGagmF2Pf7kzuROtJQyLB
    UL5sICQlAoDt0IHlEBAuogyypZUgHn2Yaj/xliqkq3mPXMXueoNQt4itLVtEMwwlbzmp
    sllQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1689680439;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=DyT5d0eh0/jTHCEcjHCZZZfipa2RUFTxaspkR4U3YH0=;
    b=sZG3TBQhz2wrONxoYWTlmGjH0gMDFgvbeSTqaTDiin48eJIdA74PIIL9LQxWT35ZMK
    TfV9iu/q0AhiYlDUO5CH/LYQwacv+YKksii1X0iY2LZVrm5taBFcyIvpjg1U3VbD2wSj
    TiqDsgvRrzrCU2kCcLwlt4r3TDx+Psths8NqKrHsfrIXw7HiW8biVeIwWf8zEwBv1Fv/
    mGn7mjFivsQFxJqXJxSFzOhoEoOu9flFI4Xi+g52sfoVQB0C+O5Y1FGYl3c7reG3uZa8
    aXlSbkKjUL/WL8garnF/I/nQ/OKZclN4AONlqOMFf+s7Gidny7q9Zvdj0FH3bpjXa2uH
    iENA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1689680439;
    s=strato-dkim-0002; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=DyT5d0eh0/jTHCEcjHCZZZfipa2RUFTxaspkR4U3YH0=;
    b=aX6fe6Tg9hQ7s1FUnfzoCnS75dXqnivx/hO36KNV3L47C2B33qLLwycE/nDn/j4+zS
    5LD53T3zwgaPeASpvfJJon1oWf1+/XkGwGEMT8DHxDD3B3H8PiW+c7b+2iS7bwAwRRNl
    YMVMcfgvTu2rWb+5ocwBibfVU8kguvZS5FTkNTEFyRmtvWHN3nUpJy485zAVE5DpTlSt
    HFQrgxEsy1Uui7YXK97e+DMjGH0Ueik5JlS9SypS+WD+mApS3CpfSQtFYVz89aepaZvR
    4lj7iAMyWBOBcyDYAbPpKIfQKUR2OjVwiAsR1+Ah1/NCZD3vQjWGU7OM8dftSYW/h4TJ
    Xc5Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1689680439;
    s=strato-dkim-0003; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=DyT5d0eh0/jTHCEcjHCZZZfipa2RUFTxaspkR4U3YH0=;
    b=S7LPsRV5v19JJRqP3iHxccjg5XVH7nylcbO2qVkzF3oMoRIb4wGoCll2lbk5NwPzTL
    DQG21kRboafaY21Wo9DA==
X-RZG-AUTH: 
 ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQjVd4CteZ/7jYgS+mLFY+H0JAn8u45/mw=="
Received: from [192.168.244.3]
    by smtp.strato.de (RZmta 49.6.0 DYNA|AUTH)
    with ESMTPSA id D0d0a8z6IBedbpQ
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 18 Jul 2023 13:40:39 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
Date: Tue, 18 Jul 2023 13:40:17 +0200
Subject: [PATCH 5/6] ASoC: codecs: msm8916-wcd-analog: Properly handle
 probe errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230718-pm8916-mclk-v1-5-4b4a58b4240a@gerhold.net>
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
Message-ID-Hash: IGJPFSLYO4KG3KF3J6O2DAZPYDNLL7VO
X-Message-ID-Hash: IGJPFSLYO4KG3KF3J6O2DAZPYDNLL7VO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IGJPFSLYO4KG3KF3J6O2DAZPYDNLL7VO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The probe() function fails with an error for platform_get_irq_byname()
but only logs when devm_request_threaded_irq() fails. Make this
consistent and fail to probe in that case as well. In practice this
should never happen unless something is really wrong.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index d4456a714c97..9ca381812975 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -1216,8 +1216,10 @@ static int pm8916_wcd_analog_spmi_probe(struct platform_device *pdev)
 			       IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING |
 			       IRQF_ONESHOT,
 			       "mbhc switch irq", priv);
-	if (ret)
+	if (ret) {
 		dev_err(dev, "cannot request mbhc switch irq\n");
+		return ret;
+	}
 
 	if (priv->mbhc_btn_enabled) {
 		irq = platform_get_irq_byname(pdev, "mbhc_but_press_det");
@@ -1229,8 +1231,10 @@ static int pm8916_wcd_analog_spmi_probe(struct platform_device *pdev)
 				       IRQF_TRIGGER_RISING |
 				       IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
 				       "mbhc btn press irq", priv);
-		if (ret)
+		if (ret) {
 			dev_err(dev, "cannot request mbhc button press irq\n");
+			return ret;
+		}
 
 		irq = platform_get_irq_byname(pdev, "mbhc_but_rel_det");
 		if (irq < 0)
@@ -1241,9 +1245,10 @@ static int pm8916_wcd_analog_spmi_probe(struct platform_device *pdev)
 				       IRQF_TRIGGER_RISING |
 				       IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
 				       "mbhc btn release irq", priv);
-		if (ret)
+		if (ret) {
 			dev_err(dev, "cannot request mbhc button release irq\n");
-
+			return ret;
+		}
 	}
 
 	dev_set_drvdata(dev, priv);

-- 
2.41.0

