Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBEF62B2EB
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 06:41:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEC5916C6;
	Wed, 16 Nov 2022 06:41:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEC5916C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668577314;
	bh=Xcr7yWXexdOaX1ye8F4zIjxTF6OwDP6ADzVojvAMJvo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bJt2rfXTSctFVrdYlcu5ynoz3QU/cUoWBgAymeEuDfEuqvW6VK68NJf1KufnQCn1h
	 dLs262nFg7bjcEjbjVPrKLzS0lTAjEnV4t+g6wPZM/bDZz+lsUbwv3Xe9RsWMhQ646
	 dxEGmAkg9QF4eOIC/dfUy6GPNmksJoiIvLjt65i4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 131BCF805B1;
	Wed, 16 Nov 2022 06:38:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21DBAF8059F; Wed, 16 Nov 2022 06:38:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83566F80571
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 06:38:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83566F80571
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZRenwPio"
Received: by mail-pf1-x435.google.com with SMTP id y13so16486829pfp.7
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 21:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4MEFKtk2jr+pIrd01Y8QsB7lxnOrOB6iK6YPYP1nPMA=;
 b=ZRenwPioW9g8p00PEamyGH8jzVZok76Ys2CSw60kjNNdSavkAdfHlfoLivu3CxFHJs
 A8oJU7Cd0PUGcEYCpbZmnuUfoF+/2mJE7q9IFfVdJEOkIx9H/rrf3tWqnxpFy+ibOpw+
 hKAHZZh68owi/D985vbBZkzUYBsNW5EySLu9t/fW/TPXI/KRtNoqfdugUHrGqOy2A5cz
 X296GIv47gk0p29rBQ8rsjNbe9Iuq0DF69sugsWyXAiO+WWAZhQw/nT/MawRF4yfiofC
 xZpEb0ZxygrvpdDQBmMFf/d4gC/1eoW1GW5/X8+uNFS31b7DdyxDChWAIrvnn+D/SR5+
 LXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4MEFKtk2jr+pIrd01Y8QsB7lxnOrOB6iK6YPYP1nPMA=;
 b=cL1ySCaX5ywzpDixO0J3N2ZKN8NrzAR1vDfdFjRCwWXcrp+D9dKLTcylTUJzr/v4i8
 X3WWNs+R9nYMxZjDaeBBR030lIifYqj1hXWom92fRo0bs8D0YqKLtHjSaAt2oF96HVX+
 /YTHUqWVlU0dxiptabwX4jBMLiHtYDCbI7VSZRdv5WwMc8/iTM4X4PSNSXKVNEfH0BVp
 B7CXVabukIakmtsNae3CNDam5zLBzrCzfs+4rpJV/dESMlILCrAjOFkeN46rcAp5Hi6k
 RxvLM2Ykh9RtBx2wjUE2YfoUaVblmYHJgFZfUFl3PS2bvrfG+0NwRDTdHP0ay3av/ccC
 SUVw==
X-Gm-Message-State: ANoB5plET2e+1xy/uhPjTriBNO0EFT0lKwL5MxmSiVNfJ5/JvudreYmG
 Y4Dg40Ru3ALHsS3XXGLWWO8=
X-Google-Smtp-Source: AA0mqf6ex8aOz3bvEsY002H/DOqXJxnAt++xm328WBIajR1/qG4sKD8ytPpIYYxQvfoosCQyWL52YQ==
X-Received: by 2002:a62:6001:0:b0:52f:db84:81cf with SMTP id
 u1-20020a626001000000b0052fdb8481cfmr22052595pfb.26.1668577119040; 
 Tue, 15 Nov 2022 21:38:39 -0800 (PST)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:2d36:e9a0:170b:669f])
 by smtp.gmail.com with ESMTPSA id
 ik13-20020a170902ab0d00b0017834a6966csm10881038plb.176.2022.11.15.21.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 21:38:38 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 10/11] ASoC: dt-bindings: wcd938x: fix codec reset line
 polarity in example
Date: Tue, 15 Nov 2022 21:38:16 -0800
Message-Id: <20221116053817.2929810-10-dmitry.torokhov@gmail.com>
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

The driver for the codec, when resetting the chip, first drives the line
low, and then high. This means that the line is active low. Change the
annotation in the example DTS accordingly.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

This was sent out previously as part of other series. Collected
Krzysztof's ack and added missing include per Rob's feedback.

 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
index 51547190f709..3cb542d559c6 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
@@ -110,9 +110,10 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     codec {
         compatible = "qcom,wcd9380-codec";
-        reset-gpios = <&tlmm 32 0>;
+        reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
         #sound-dai-cells = <1>;
         qcom,tx-device = <&wcd938x_tx>;
         qcom,rx-device = <&wcd938x_rx>;
-- 
2.38.1.431.g37b22c650d-goog

