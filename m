Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB09757AB5
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 13:42:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 301DC868;
	Tue, 18 Jul 2023 13:41:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 301DC868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689680553;
	bh=tCBB7oZmZQ8YNuEUClFzoOTAETF2v3r3ZANlGZvswig=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vsfhiMYnpZ/ZAgOatRQS5DFvSuccxwUlKk7Z5dcPRZ3OMSrAVes0Uy6uvO+2vS7nM
	 PSQ7DKct3SKdGPo5PeDk+jUIFBAjZZEoymWerDbCZX+yah23pWMykwXBgHIWuUoQ+n
	 6cHeLlce6XP1uexPQq9qoovDi0QraXx8/7dRsPWk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F31BF8055B; Tue, 18 Jul 2023 13:40:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26DC8F80549;
	Tue, 18 Jul 2023 13:40:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA49BF80527; Tue, 18 Jul 2023 13:40:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15298F8027B
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 13:40:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15298F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gerhold.net header.i=@gerhold.net header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=LQjsNuC2;
	dkim=pass header.d=gerhold.net header.i=@gerhold.net header.a=ed25519-sha256
 header.s=strato-dkim-0003 header.b=4FwUFruo
ARC-Seal: i=1; a=rsa-sha256; t=1689680438; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=WAvl8colgcEn9XPus/OWN2RH5IR6MBoUqGQhvVaH2dkf3/jBZmvYpQ9rZDR6Ddj8PK
    aUBsMvnySD4nDTyN9y5z9idhhqVECskeF9RQtQ2hyZk2UjiArFxGVa7gMqkYhdBBq6GP
    48yMeT1ppQMZSerBbL9yzbwzoo/H6NuF4GAujyQVMVzpXRct5bTmP1gRCitwX9yn0EN4
    VkDh0HoAol59+q86lpp5UwAIWuQ1xMZ5Yax1azdOUqpm+QHkOnTEX/9vJrgZ5IincCwE
    ivvTawqSInriOf+dDPXnRfLzm0M8VK6Ga3aZY/hcZ1CKecpq2OPwLcWHM6UlZXfQ1t8Q
    WHDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1689680438;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=9nAs4PEgRZ836zl1pP7Ag3osiO18Y/hoNYTgzgYWHqA=;
    b=XsofbCqBXy8YpVX0e/H+cZISu4Ajlk/UI1BdTSbnPI+FT5l6dSGR+hjN+QNS7kFN16
    XugzXtrLZYg/xzxMF7Xah6CXu7kYmkRHi7Y/byuMUvSageUzwPGNrxZjsY4/1foHpHqa
    s6H9zSOdQ010vh5OLhJ0gEpI/FYQaB6M492tiEEYJgDbjK0PGgKckcqm0t92qIsUBBR6
    bW6GN1S3KdwV5RerRIQPCwzsZdWIYDWwmPpFr+acJ/fiKtFOJwfM8/KM2CwrTg+KOul0
    c1OOaIVHdKuFmCC8G+L164aAtJ5SBaL50gr0ghYpTJ8SZEHWT+m9QQISjUTD4ApZ4OY0
    5PtA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1689680438;
    s=strato-dkim-0002; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=9nAs4PEgRZ836zl1pP7Ag3osiO18Y/hoNYTgzgYWHqA=;
    b=LQjsNuC2/pCXild6nQBwXP6z1nuWeJV9Txv/v8QCqDHLUrrqB2OBTcwuiCNdqXdRZz
    0l3snnIPiJO/XCFE5zge05Kle91Tk2w8Pnt2X/+7FkYOyRUKLcN3FeFOiAyODgCB2tNJ
    uN++fzANPiemayQLASS+Qz/oc8UEFiWjvf4tjE7Mvceb76kJEEQrh5/KKH1PBrtxyCKN
    TLq6FthrLa5+DD60UcsPy2ocBmU+YQ9Sv0ilKwuu/obJuOKZVkWVtfQJLJqwD8VdHDDU
    JVTP2MqEtCnaux8O5fYXv8qcA36/WzaBKF7HV1xeQNESwKUMNL3tMPChmaWqY5Q7pnlZ
    1vYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1689680438;
    s=strato-dkim-0003; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=9nAs4PEgRZ836zl1pP7Ag3osiO18Y/hoNYTgzgYWHqA=;
    b=4FwUFruobAz9C6hytkLEZnDkinKpiqm2PvMkbbrNh0xliDVVoghtIGAFwCp3suYhk7
    lwFw6C13IZ5Uc/UUEJBA==
X-RZG-AUTH: 
 ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQjVd4CteZ/7jYgS+mLFY+H0JAn8u45/mw=="
Received: from [192.168.244.3]
    by smtp.strato.de (RZmta 49.6.0 DYNA|AUTH)
    with ESMTPSA id D0d0a8z6IBecbpM
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 18 Jul 2023 13:40:38 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
Date: Tue, 18 Jul 2023 13:40:15 +0200
Subject: [PATCH 3/6] ASoC: dt-bindings: pm8916-analog-codec: Drop invalid
 mclk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230718-pm8916-mclk-v1-3-4b4a58b4240a@gerhold.net>
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
Message-ID-Hash: OVBHTTS4MEWDKWHBDOL7VCBWAFFULKTT
X-Message-ID-Hash: OVBHTTS4MEWDKWHBDOL7VCBWAFFULKTT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OVBHTTS4MEWDKWHBDOL7VCBWAFFULKTT/>
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
 .../bindings/sound/qcom,pm8916-wcd-analog-codec.yaml           | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
index 5053799c88b5..94e7a1860977 100644
--- a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
@@ -19,13 +19,6 @@ properties:
   reg:
     maxItems: 1
 
-  clocks:
-    maxItems: 1
-
-  clock-names:
-    items:
-      - const: mclk
-
   interrupts:
     maxItems: 14
 
@@ -109,7 +102,6 @@ additionalProperties: false
 
 examples:
   - |
-    #include <dt-bindings/clock/qcom,gcc-msm8916.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/spmi/spmi.h>
 
@@ -122,8 +114,6 @@ examples:
       audio-codec@f000 {
         compatible = "qcom,pm8916-wcd-analog-codec";
         reg = <0xf000>;
-        clocks = <&gcc GCC_CODEC_DIGCODEC_CLK>;
-        clock-names = "mclk";
         qcom,mbhc-vthreshold-low = <75 150 237 450 500>;
         qcom,mbhc-vthreshold-high = <75 150 237 450 500>;
         interrupt-parent = <&spmi_bus>;

-- 
2.41.0

