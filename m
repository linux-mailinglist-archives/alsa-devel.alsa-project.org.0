Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0845B39E09E
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 17:35:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93E28169B;
	Mon,  7 Jun 2021 17:34:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93E28169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623080103;
	bh=DmlLpbLKsgqcNtfmLN5WMY5K/nPNqbBFcCYWZVfrPTs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iFBPFlN92BnOAv+C86m7PEztRGKO+ziZe5ifc7CKjKIpTmtb+X6WV5k/vvwhVom5o
	 CmW42wUdM5I9wfuESP6FACxoQ2Oxjyk1I462J/b43z0WfRvsWsEPAUx4eirXDzp0Gd
	 d9jC4LbS4DkJH7uteIsZDF3HtlH0gTufzfP3J3Rc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02DDCF804FC;
	Mon,  7 Jun 2021 17:30:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24487F8027C; Mon,  7 Jun 2021 17:29:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A54A1F804C1
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 17:29:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A54A1F804C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="UDhiFSqx"
Received: by mail-wr1-x42a.google.com with SMTP id r9so1405802wrz.10
 for <alsa-devel@alsa-project.org>; Mon, 07 Jun 2021 08:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lzk4lCLmAXbNCfDcTx4wmKLjACEaxBk+nh7dbPXaa38=;
 b=UDhiFSqxE1s5YjiU15JeFLbAqZTe5nrAp1XpGXbX3+6iigSEPtlXwzTkvntFfFKvUR
 CpBxINqcZhWT0UC1sfuoxFLEQRwISz4l/4Eiv4J3HFKjSN8JJTn4d+7SZ+3azQAoxnVh
 AxmwdoO+fl8Jq+VPXz37aaoKN8tzydm2SBo7HzVGMsl3tfb/UdJ2T/cO8q4jTYYecott
 QCPxHQ2SW6oWTs0oL1nM8oi6jOmXMtoR1gvlZD4nbeLwiSh5fXpXltWklGS9irK9lX/V
 WZlzDpgHayq+NoLyEkq675dzef9ZyF/MhtS5y3zUcKPzpZTzxk2P59ioGDKB2+5D2dfy
 cTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lzk4lCLmAXbNCfDcTx4wmKLjACEaxBk+nh7dbPXaa38=;
 b=nZzUcefiVLlk4H1vlX0IX6WEZJc2cQ1JHEZYtPjX6AXNGowY5YkQAKaqJbsn0nLvwz
 +2aj6Amxtslkx9YdbOOo9PtF/OX4b6dtkmvQXBtrj5cTQDJ4atcmOezSo0LIi3NUvr7G
 UBHXTTHi5MGA12AXRasrtGSawclDcihJbKNbgEGHT9syg/PBq0zrx0v4N2I/veiU/zs6
 oixOIh0+wcFwrS/veX09tl0n92d7WVVX2ds59mOzrk3HXcpjQW/LvtU4rpt+5L8NG8uS
 JotGUn5EOzzVx/gizfuKqHN9C1XcNaG8dHeD8FhboOJtW5FqKEfqZWb5qJp54DINErXI
 Sw5w==
X-Gm-Message-State: AOAM530IR1joP+4mdhOUsYwPHYbw6ucFneuaKDcMsBI+EkZ/sSGbmNjU
 k8tZHlaNnzFoTiZmWsm+nBF5OA==
X-Google-Smtp-Source: ABdhPJwzX/sWF8yrXRuPQ0fIro1jD8AuiOKC8LpOEgmpevy8/2G9wmoj3HHnFWe4aaCpWakoNCyS1Q==
X-Received: by 2002:a05:6000:18a8:: with SMTP id
 b8mr17320018wri.208.1623079755937; 
 Mon, 07 Jun 2021 08:29:15 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id q3sm16370170wrr.43.2021.06.07.08.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 08:29:15 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org
Subject: [RFC PATCH 12/13] ASoC: qcom: dt-bindings: add audioreach soundcard
 compatibles
Date: Mon,  7 Jun 2021 16:28:35 +0100
Message-Id: <20210607152836.17154-13-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210607152836.17154-1-srinivas.kandagatla@linaro.org>
References: <20210607152836.17154-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, tiwai@suse.de, lgirdwood@gmail.com,
 plai@codeaurora.org, linux-kernel@vger.kernel.org
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

Add compatible strings for AudioReach DSP firmware based soundcards.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/sound/qcom,sm8250.yaml           | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 72ad9ab91832..551f4fe04749 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -18,6 +18,8 @@ properties:
     oneOf:
       - const: qcom,sm8250-sndcard
       - const: qcom,qrb5165-rb5-sndcard
+      - const: qcom,sm8250-audioreach-sndcard
+      - const: qcom,qrb5165-rb5-audioreach-sndcard
 
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
@@ -157,3 +159,44 @@ examples:
             };
         };
     };
+#---------------------------
+# AudioReach based dai links
+#---------------------------
+  - |
+    #include <dt-bindings/sound/qcom,q6apm.h>
+    sound {
+        compatible = "qcom,qrb5165-rb5-audioreach-sndcard";
+        model = "Qualcomm-qrb5165-RB5-WSA8815-Speakers-DMIC0";
+        audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+                    "SpkrRight IN", "WSA_SPK2 OUT";
+
+        wsa-dai-link {
+            link-name = "WSA Playback";
+            cpu {
+                sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+            };
+
+            platform {
+                sound-dai = <&q6apm>;
+            };
+
+            codec {
+                sound-dai = <&left_spkr>, <&right_spkr>, <&swr0 0>, <&wsamacro>;
+            };
+        };
+
+        va-dai-link {
+            link-name = "VA Capture";
+            cpu {
+                sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+            };
+
+            platform {
+                sound-dai = <&q6apm>;
+            };
+
+            codec {
+                sound-dai = <&vamacro 0>;
+            };
+        };
+    }
-- 
2.21.0

