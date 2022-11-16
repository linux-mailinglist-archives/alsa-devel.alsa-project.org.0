Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 327E462B2ED
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 06:42:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 977B216D4;
	Wed, 16 Nov 2022 06:41:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 977B216D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668577343;
	bh=kX/JKGPTVpCVsC1Ry+4LVq9u/MVor/OzWoqVfob66XA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UKA9KplkmbvW6WFsw68JJ9ujuXz5eu1oKP6C9wjKs55nVWtQ5iATYyqzmToLP2he3
	 pERgskSJg6TNycgDStpLy7+A317hPeLHneZ5u8bA6BFRpxFFvYTh9jzziR34v4CNnt
	 2PRB2VZK+JWXd2Awgt5h/6ELfQZyey4p+uPvokqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8619F805BA;
	Wed, 16 Nov 2022 06:38:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 601ABF80563; Wed, 16 Nov 2022 06:38:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, SPF_HELO_NONE, T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED, 
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60D02F80563
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 06:38:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60D02F80563
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FdiOzIGo"
Received: by mail-pf1-x434.google.com with SMTP id 140so15023807pfz.6
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 21:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PI/Dm8Xn6WniktdX7f/nHoTvWtwHm/H0w1CeN5e56Wg=;
 b=FdiOzIGoubl3ylDJ4lEbihqGx6GfPoOlTI+RmmWDK+WcYsnRSZUWPAHqNsO7JqQOhP
 HHWv2k57KZmxMnVz7Vg5/t0q5d/X+ZAnSobweFcquLpO27kqyM14vA/q1knI7/pKtWiV
 yu+0f5rKkHGOVOwo4Dwedj3jxrvGASm8QZLmCO8VGmhjNiTWKhcjSjmKOkwn/2QKLHuK
 WuwERwYNTksL8zv+t7VgVmVtf4l4XTOPMxTC2ETVdBB7cPOqgEnX5mNIwg0SOmXc3UiK
 t2welHGhT4I2vZJCOLDoAa1ndbstNuuwNsQHuJ+JSYt+Zg1nyMtP/3wgzatOZ1aZjNRI
 EEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PI/Dm8Xn6WniktdX7f/nHoTvWtwHm/H0w1CeN5e56Wg=;
 b=Whr+d1UAfM/NZJP5Baqp+AOK9yU12rYqRNT+sLT5EDmJ4UtezrtYFTrOKiVP3A/fuD
 nXmuv45VUsxc7BDqq1QfCEVcoxNoTBxV8sekEJ0R86A5SrhdAFVQCxEqdvb22OBOj41u
 P2GQcAH5wszlPibpeMauB5B7UAlKlbWAzTm10+Lw/ohnzABmGXEwy/XQB3yF8CLhPXlB
 dVphZEvg1HY+/j76Lo7b8vshRX5vAUlQtiRI7AkYCnV2IHZDkRHghDsXgEqZp0LYv9o4
 Y76G/06NqefZ4Jpwa9u7wL0P+W3OVtUSHmizv9PvD12kXSL+3UTKBwsuh0yrNeqGHnOF
 qrWg==
X-Gm-Message-State: ANoB5pkt+zN9XGUTNYH94//Zk5HvRS1O2yfp+TaMQ1O386bndbqS7YO8
 SXKr+FDgxin8nVZPhuFRyvg=
X-Google-Smtp-Source: AA0mqf6tk4n1dLo2nIOqIKkMGMQQJiQhYcFaLRx5eEWqbalX+e19mG1wrZvjtwV/DOOFKmlOgiSJJw==
X-Received: by 2002:a63:fd42:0:b0:426:9c23:97da with SMTP id
 m2-20020a63fd42000000b004269c2397damr19863493pgj.2.1668577115229; 
 Tue, 15 Nov 2022 21:38:35 -0800 (PST)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:2d36:e9a0:170b:669f])
 by smtp.gmail.com with ESMTPSA id
 ik13-20020a170902ab0d00b0017834a6966csm10881038plb.176.2022.11.15.21.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 21:38:34 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 08/11] ASoC: dt-bindings: wcd9335: fix reset line polarity in
 example
Date: Tue, 15 Nov 2022 21:38:14 -0800
Message-Id: <20221116053817.2929810-8-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221116053817.2929810-1-dmitry.torokhov@gmail.com>
References: <20221116053817.2929810-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

When resetting the block, the reset line is being driven low and then
high, which means that the line in DTS should be annotated as "active
low".

Fixes: 1877c9fda1b7 ("ASoC: dt-bindings: add dt bindings for wcd9335 audio codec")
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

This was sent out previously as part of other series. Collected
Krzysztof's ack.

 Documentation/devicetree/bindings/sound/qcom,wcd9335.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9335.txt b/Documentation/devicetree/bindings/sound/qcom,wcd9335.txt
index 5d6ea66a863f..1f75feec3dec 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd9335.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd9335.txt
@@ -109,7 +109,7 @@ audio-codec@1{
 	reg  = <1 0>;
 	interrupts = <&msmgpio 54 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-names = "intr2"
-	reset-gpios = <&msmgpio 64 0>;
+	reset-gpios = <&msmgpio 64 GPIO_ACTIVE_LOW>;
 	slim-ifc-dev  = <&wc9335_ifd>;
 	clock-names = "mclk", "native";
 	clocks = <&rpmcc RPM_SMD_DIV_CLK1>,
-- 
2.38.1.431.g37b22c650d-goog

