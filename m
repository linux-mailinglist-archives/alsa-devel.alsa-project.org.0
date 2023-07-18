Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C84757ABD
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 13:42:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66945A4D;
	Tue, 18 Jul 2023 13:42:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66945A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689680577;
	bh=SCpa/zar7T35ZM8Iqj/9WkKqWKx5wv11Nu23ICXAggk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JiB52zmbjtG9FT2IbjyzAnE83d+5IunaVkzsFLlmYz704oL8Uth974+17zlD9/Byi
	 52CeSPtGz97iNW3YxtiPvSvES/jLPYNKJpCxZBbugiRdjUIgkYeaOIi89edb8CJx2w
	 uFxCC5X4/WFr2rksvO18CUv90jbknqx3TDiWNSkY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B78C3F8058C; Tue, 18 Jul 2023 13:41:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CB17F8057E;
	Tue, 18 Jul 2023 13:41:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4741EF80552; Tue, 18 Jul 2023 13:40:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de
 [85.215.255.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB233F80494
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 13:40:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB233F80494
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gerhold.net header.i=@gerhold.net header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=GOtbLx0A;
	dkim=pass header.d=gerhold.net header.i=@gerhold.net header.a=ed25519-sha256
 header.s=strato-dkim-0003 header.b=E/QakzoE
ARC-Seal: i=1; a=rsa-sha256; t=1689680440; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=bxJEewCmKTsxShVrLusqoZ4GKwdrG53rtIgidVQJUNWPQFmK/bzn+NIi1lGf/gZXtj
    LBD9s/SKJot+tW1wURR9WPpUb3yDi6vN1uAnZiH4sTL0QE/gs27TZ3lkD4J1upOrmhDR
    SgvWaEi3AH6xEf9HkCmIgOshiO+g22LYfo3J8kNqQejBPgBTtCxTZ8iZ8T/bK6JGARcf
    NAaQRRSlvji1cwES95CiBJlbd40yOhTl9VYQPAqMAc+KU2h+dWkO6bkjFJKbB37y8fXu
    YOaa1QyUzW7OjhvYQ0QoyOKp8WktYj+OubQ1n69BhpqXW1YqiEmFr7ps9TMVotOeOmh4
    Rkbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1689680440;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=vteLTIoeDwJEb7tTBHVxn9SENfUDXfypYONPVknY2OI=;
    b=ACqCJGfZSsul7barksXv6Gt4lAMbV5raYbv6IdlixGtj/1VZZcRm3Q6dq7oh/qIKJp
    wjjRvQVUeubETDh63v7NZduRW9Rkf5d03CUlw1QbK9JSkpUWYtHKcbkXJ7zLKAdn0mwZ
    hWu/+MB4YTAEk4Y4RVc2sVsiKR3PQrm5eKT2OkmF3nLQhbTI2xCIp5bHXPvkjNrpBWeq
    bPaclM1qrbhwULP3X1QFr5UlCn4+EEZew9YZw3Q3n3WzJiW1T8WyMzV9k7cU81wAqB/r
    a9JWcrzSDZ9cEQpF0kAyQXjgUJS+voetSYNyccBDu3tXd9R90OSfytP4xF/EmsQOd0BJ
    AAEQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1689680440;
    s=strato-dkim-0002; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=vteLTIoeDwJEb7tTBHVxn9SENfUDXfypYONPVknY2OI=;
    b=GOtbLx0A/gDA7QjoijZd6RZ6Py0WPlH+b9ZUEXgqJN2KclTwsESB4RyUPywQiOmaX/
    YtrNXaigGv9RIIBOR58k+ILvK5f3vw9dP/6uXTT1yO/q3LoYPcGhV/R2/9JLdO/K+btW
    ybu65Lk/n44ah4bN5kB/Ywo/Mcl205udLgX+flrjPucNSEIGRbD7cNgdEOJ2QSOGME9X
    of3qbuX2Zi7OZQReKRRNSamTRIL/Dkq3PzZEmykcfYArzthqrL/wzhSH1YCLZznF2IiN
    38WYLmkij5QV1ayAv4mxxCQ5JbUC2U1ziNtvppzxOXfg7fz20Atr+sjIaWhmfvsPDDMD
    D1PA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1689680440;
    s=strato-dkim-0003; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=vteLTIoeDwJEb7tTBHVxn9SENfUDXfypYONPVknY2OI=;
    b=E/QakzoEEBxCqf7ER/+p72LxejX7PynRA+/2eh3n+nQMD3Er/NJ3uS5r40JYFw41li
    fN7c3DdTxiOTo7YrSwDA==
X-RZG-AUTH: 
 ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQjVd4CteZ/7jYgS+mLFY+H0JAn8u45/mw=="
Received: from [192.168.244.3]
    by smtp.strato.de (RZmta 49.6.0 DYNA|AUTH)
    with ESMTPSA id D0d0a8z6IBedbpR
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 18 Jul 2023 13:40:39 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
Date: Tue, 18 Jul 2023 13:40:18 +0200
Subject: [PATCH 6/6] arm64: dts: qcom: pm8916: Drop codec reg-names and
 mclk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230718-pm8916-mclk-v1-6-4b4a58b4240a@gerhold.net>
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
Message-ID-Hash: JEP7TEPPY2EUKOK6KIBGWFBCI6ELKWA5
X-Message-ID-Hash: JEP7TEPPY2EUKOK6KIBGWFBCI6ELKWA5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JEP7TEPPY2EUKOK6KIBGWFBCI6ELKWA5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Drop the redundant reg-names and mclk from the PM8916 analog codec that
were removed from the DT schema. Having the mclk on the analog codec is
incorrect because only the digital codec consumes it directly.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts | 2 --
 arch/arm64/boot/dts/qcom/pm8916.dtsi     | 3 ---
 2 files changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index f3d65a606194..52bf876b8cc9 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -328,8 +328,6 @@ &mpss {
 
 &pm8916_codec {
 	status = "okay";
-	clocks = <&gcc GCC_CODEC_DIGCODEC_CLK>;
-	clock-names = "mclk";
 	qcom,mbhc-vthreshold-low = <75 150 237 450 500>;
 	qcom,mbhc-vthreshold-high = <75 150 237 450 500>;
 };
diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
index 1ea8920ff369..78187c0c94ce 100644
--- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
@@ -142,9 +142,6 @@ pm8916_vib: vibrator@c000 {
 		pm8916_codec: audio-codec@f000 {
 			compatible = "qcom,pm8916-wcd-analog-codec";
 			reg = <0xf000>;
-			reg-names = "pmic-codec-core";
-			clocks = <&gcc GCC_CODEC_DIGCODEC_CLK>;
-			clock-names = "mclk";
 			interrupt-parent = <&spmi_bus>;
 			interrupts = <0x1 0xf0 0x0 IRQ_TYPE_NONE>,
 				     <0x1 0xf0 0x1 IRQ_TYPE_NONE>,

-- 
2.41.0

