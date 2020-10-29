Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1815229E8D1
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 11:17:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9352E1689;
	Thu, 29 Oct 2020 11:16:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9352E1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603966661;
	bh=8EQOQDY4ZWOujTu0GWOaKaGsIb1DgnSYhnxyhZ/0008=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J1XE40L14nHyVXbJbj8xCywKvsUeJrypRE8oCQWyY0IX33nZxBuFLbYnYucouiwZZ
	 lke1R5jWlK7PeFDYeXEOA2LKmNYVzuFLTWR5BSofqJu/+SuxIfA+V+3qLe1MSCyBAu
	 MqsAhKdtcaPm+5gN0t3aX959J8As2Luo3CciF/GU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB288F80095;
	Thu, 29 Oct 2020 11:16:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A0A6F80217; Thu, 29 Oct 2020 11:16:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 561F2F800D8
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 11:15:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 561F2F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="O05Zz/pd"
Received: by mail-wm1-x342.google.com with SMTP id 13so1827161wmf.0
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 03:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fYyCEb9n1uW/GtO+Icma9ul0k8OoUNEYDQcb88XmO5g=;
 b=O05Zz/pdl27ZIwt1YVkKcFWRvvhrwjPNE9cxeiuglOIbnH6BjoHV2zF/AvOHpPrqMh
 QNF0RzQjv4or6DnHhQOvxDJJHM449xfcFJxz1c2+CdNZCfuCphKAWVdfze7oCrduMIDb
 mGzE1XM8UXj389iex1BSebqeI/cnM/O1Ta8s/d5URElFfu3LRwMD7jLiYbNQvKX6FVd6
 UXz0x9odecvYPlkkU1EBaZfRvl7nhHhsj2iED9sWxKabnR63wh/OHRZu2OPaEng9gGYm
 /srhE/3A5TXmq/aNtps5sxRt+kAfl/SJL//AUDxuEwMD1DB1efMowkg5uELz6iKUi37U
 j5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fYyCEb9n1uW/GtO+Icma9ul0k8OoUNEYDQcb88XmO5g=;
 b=tjLzy4yWzsJSUVfVm+DUaMF/VPmot06tZshbQXtHiRu4hdPc+8oVZqLlyGk7LEzf5L
 ld0XzUVaFTpHgvCgLNkqozYgeK2aIRVAMCyhjBylRzsp8dfkaS3VIiuP9JMV8/DTM7+G
 AOunoode3vnjtxsJORlxx3xtYjrbSiVWxh6gNCKtLGpR6TA4icwfP0yOi2fxEYuoZPwV
 NNTxemzFBg2OY9oGZUDiCXufXxM6rFjvDlFUgv+vgy75UJg0NvEpeVPUdvbSs9LITohn
 C2mH2G1D2OfcfoNEQQ2L4ukOU9PNck0I0ACRnxAeN+KhTvNTEJjd4qQ+mBBXRwEzuxd0
 4HLw==
X-Gm-Message-State: AOAM532w7hfLBLUbU7f1yLVKJ6nItljVjOHAf/3e6uTHAT68n6hOZB/T
 hNRUPHrgkETJja3seldSBvtnMA==
X-Google-Smtp-Source: ABdhPJwNELU/1Cf7kaWKDnW3VeGHFj4v73i/xYmaOjqFZoHSRmwDNjXa9Dz3BF4lx+TaAOpHlYdA2w==
X-Received: by 2002:a7b:c387:: with SMTP id s7mr3493931wmj.52.1603966557351;
 Thu, 29 Oct 2020 03:15:57 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id 32sm4222495wro.31.2020.10.29.03.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 03:15:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/2] ASoC: qcom: dt-bindings: sm8250: update compatibles
Date: Thu, 29 Oct 2020 10:15:49 +0000
Message-Id: <20201029101550.31695-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Rob Herring <robh@kernel.org>, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
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

Update compatible string as board compatible and device compatible
should not be same!. New compatible is now suffixed with -sndcard
to be inline with other Qualcomm Sound cards.

This also fixes the warnings/error reported by dt_binding_check.

Fixes: 765c37598494 ("ASoC: qcom: dt-bindings: Add SM8250 sound card bindings")
Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index b8f97fe6e92c..72ad9ab91832 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -16,10 +16,8 @@ description:
 properties:
   compatible:
     oneOf:
-      - const: qcom,qrb5165-rb5
-      - items:
-        - const: qcom,sm8250
-        - const: qcom,qrb5165-rb5
+      - const: qcom,sm8250-sndcard
+      - const: qcom,qrb5165-rb5-sndcard
 
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
@@ -83,7 +81,7 @@ examples:
     #include <dt-bindings/sound/qcom,q6afe.h>
     #include <dt-bindings/sound/qcom,q6asm.h>
     sound {
-        compatible = "qcom,qrb5165-rb5";
+        compatible = "qcom,qrb5165-rb5-sndcard";
         model = "Qualcomm-qrb5165-RB5-WSA8815-Speakers-DMIC0";
         audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
                     "SpkrRight IN", "WSA_SPK2 OUT",
-- 
2.21.0

