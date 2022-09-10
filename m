Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 829255B459A
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Sep 2022 11:17:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27A4116B2;
	Sat, 10 Sep 2022 11:16:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27A4116B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662801420;
	bh=XVZGj+P033LVn8gjSj00T+VeC40UUF3xiKUBPJCysAc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OilGQqNesSjld6GZOac1v/1U0kpS2//y1wnLhH6u/pvTiAGjS4w+dpeGpdOHlg7So
	 7DbwI3ujxfcsKC42w0zIdxaNlc5We9FxwjZz+C3krVn75hshxh4ZZ41+hkZQFoZ0oQ
	 ToN2Qr1aXoqw/vuq4sXfN5DtT9rO9qMqZSbnH13c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A229F80553;
	Sat, 10 Sep 2022 11:15:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 883DEF80552; Sat, 10 Sep 2022 11:14:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C028F80535
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 11:14:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C028F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="kbEYjCac"
Received: by mail-lf1-x131.google.com with SMTP id u18so6696269lfo.8
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 02:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=/UI25rqJUxEZV+KxQUPmeT2zHV2+PmX8LADJ48o6xoo=;
 b=kbEYjCacCwwdYF1VmovswFKBZiUu3Qwmhu50PiF5y0ch3buakY2D6pcV2dHcW7Sa6X
 HdglS8dDaZDG6fuEndyKp2FTHKj0dC6J2a3f/dpxR9lgtcLoEMh7jEhqzOtE90OeAvw3
 KTEcCQieDu3ZZBryzVcxsahmLujx84jfjvxPqDXVmuJpDtjoImEIdw5q7CxYvXDqJKR+
 I4Ekl+BLl2jAo3jMctdNjAKATx7DbMuaYxhVndtSbrHdqun9D74cnlqnH9DwYKwh1sf9
 NJmByo+qZKZdBpxq7Cvj73iVLkZwfAUE9D/oZd6Y7IFat8Mt4vxR3KRHN6Wdez6T0wQH
 b7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/UI25rqJUxEZV+KxQUPmeT2zHV2+PmX8LADJ48o6xoo=;
 b=MW5veupXkj4tV3Xg4fsK3w6HMKF9JZvuOpJt1U/Pjaq2Ur8Slvxvxks/EQ9SP82jEP
 NqevrFqsis7wgTr8LIJKEwHiMHt0JrKEsj6pX2ZP2MTGnORTY8h3S1J/hOl2FOegOHKu
 68q4OrSoVZh9U8azh8fqYyyPxk6FnKBQB4+iST58xJpMvh/wO+THEl3JNHIHjjGnaexi
 0YCKIgpw2K9kdAjoz11rGcLTsWjbg/FfygnLzi/BPgLb5/Pb0EcTx16i94snWamyrDTH
 9fqckf/T2nGfJLIJML7qyelpV4aJOEnAGYHzJd91aHc1yILiqxMClKmFi6d1e14osASc
 ywAQ==
X-Gm-Message-State: ACgBeo2nEwepO/Mvw+x3hINrDe2YJxI7+QcUAnQFS2rSkk5DmHh46Ph7
 b9n8ZBFw/dZt2mhV7+HqOwGcCw==
X-Google-Smtp-Source: AA6agR5JSebTMqV9gwQ2S1KjheukgqYP3EiXpHmNCLHtumpvk7Vclk5W+5qNtkxF1tD6wcHKjq7i7A==
X-Received: by 2002:a05:6512:92a:b0:497:ac14:6d0f with SMTP id
 f10-20020a056512092a00b00497ac146d0fmr5015791lft.615.1662801284057; 
 Sat, 10 Sep 2022 02:14:44 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a19e016000000b0048b26d4bb64sm201552lfg.40.2022.09.10.02.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Sep 2022 02:14:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/15] arm64: dts: qcom: msm8996: align dai node names with
 dtschema
Date: Sat, 10 Sep 2022 11:14:19 +0200
Message-Id: <20220910091428.50418-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
References: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

DT schema expects DAI node names to be "dai":

  qcom/msm8996-mtp.dtb: dais: 'hdmi@1' does not match any of the regexes: '^dai@[0-9]+$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index abc17c905bfe..b346ecccb94d 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3402,7 +3402,7 @@ q6afedai: dais {
 							#address-cells = <1>;
 							#size-cells = <0>;
 							#sound-dai-cells = <1>;
-							hdmi@1 {
+							dai@1 {
 								reg = <1>;
 							};
 						};
-- 
2.34.1

