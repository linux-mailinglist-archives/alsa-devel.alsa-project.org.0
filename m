Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB92338CAD
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 13:25:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FC8D173A;
	Fri, 12 Mar 2021 13:24:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FC8D173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615551941;
	bh=V50DLHwwgPw9VNIMeyaHP6rinDduzRgBIO4HGWNv8Kc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g+AUgT/A/nvwW/19e2hy/dbUas21oX1iP5T4Ri07hTVthFaJQ/CUtc8FyT9b+8O+y
	 ow4tISfYwlrtp+gji7FF8dXhtdiEe4+S0Hc2M94J9pfaE/jh6WTmf3HPlwBFHgwCZo
	 SzeVyuJn7pfLobo/anuzHhLAOxZYmxNp8WaiPkFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 364F5F8032C;
	Fri, 12 Mar 2021 13:23:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C98BF802E7; Fri, 12 Mar 2021 13:23:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81268F8020D
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 13:23:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81268F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="MnZg8Bck"
Received: by mail-wr1-x429.google.com with SMTP id 7so4709526wrz.0
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 04:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dw9cMYL3jtOlJaAZjl852OdyP+MrjSkhGMQF/GJ7398=;
 b=MnZg8BckWCKVKqWXv2LXDVn0bGKFv/UO5w0PAdja6Vo5FYRJNZnEt42SJoQzgoS/BL
 MMcs/kCElXSsbDwrcstRTWQfBR+SnPt7TA1xtCcKcJp3p/MmRp5t6KeG4SD9v7QV15qC
 JgvuBbdJ9v7nGrfE6GqM7dNbPiGwKnX2ivGC5XPlpljxamylHW6DIhwxU8MiM/E+F343
 TPLo/yzzUh31BRxcjodGt90M6el50sVwyGlHgLOC2wKdDpk/B7X0mUsLnNFj9LhnK5Vt
 h0Ssv6yTUgHqFalRhDJeK1fUaQAvFEtyEu/dj6tSzdePaY5xz83zK800LrfwsYEKiOpO
 ukhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dw9cMYL3jtOlJaAZjl852OdyP+MrjSkhGMQF/GJ7398=;
 b=CuVvGnMAg5gCPzIVDAQMyw2ujVxSgekj06c2AwoNFLt7Q+WyeHLCdAyUjX2KS0025b
 jEdcRzMoHjzAj9yHT05GgZ0Wm0tXVqCzLNvMBBwnls9fPGnmtf6Eo6AdmL07mjh/pL6b
 C6GFY3xdbOew2HDEVrX8MiwnmWBdcvz1aH/45GqA5vG051vu99VeOO32RHGy50Y0BzDz
 ejFGPDvzjP08VeG0WOD/XtXytnP0UYJ4U6K6hVrNMu/xXx+3uQY5H3W3lQFkG9xZO5IE
 MPF6Ay+ZC0ZSZtVE+eT7LUoJqYGg4HCQTSzRKyhZDj7PMxo4O9gjwNdHA4JyCU3+GVtX
 P8QA==
X-Gm-Message-State: AOAM5327vf0CbxDhswdgVIym47pL6g0YaGZbNzc23cngH1HaZcSTuTyw
 Bc28jEikXFEm/5gY7XrqKBCL0w==
X-Google-Smtp-Source: ABdhPJxelaUCaKUQZmHL7HJb4caHsVTShiD872wjtSGytEdC3VatTRVvj0MTTd5faY2TOorhScvwAw==
X-Received: by 2002:adf:a2d3:: with SMTP id t19mr13660099wra.299.1615551782223; 
 Fri, 12 Mar 2021 04:23:02 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id 3sm8804329wry.72.2021.03.12.04.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 04:23:01 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Subject: [RESEND PATCH v3 4/5] ASoC: dt-bindings: wsa881x: add bindings for
 port mapping
Date: Fri, 12 Mar 2021 12:22:54 +0000
Message-Id: <20210312122255.3143-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210312122255.3143-1-srinivas.kandagatla@linaro.org>
References: <20210312122255.3143-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
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

WSA881x SoundWire device ports are statically assigned to master ports
at design time. So add bindings required to specify these mappings!

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../devicetree/bindings/sound/qcom,wsa881x.yaml          | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
index ea44d03e58ca..491ce1270cb5 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
@@ -26,6 +26,13 @@ properties:
     description: GPIO spec for Powerdown/Shutdown line to use
     maxItems: 1
 
+  qcom,port-mapping:
+    description: |
+      Specifies static port mapping between slave and master ports.
+      In the order of slave port index.
+    maxItems: 4
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
   '#thermal-sensor-cells':
     const: 0
 
@@ -54,6 +61,7 @@ examples:
             powerdown-gpios = <&wcdpinctrl 2 0>;
             #thermal-sensor-cells = <0>;
             #sound-dai-cells = <0>;
+            qcom,port-mapping = <1 2 3 7>;
         };
 
         speaker@0,2 {
@@ -62,6 +70,7 @@ examples:
             powerdown-gpios = <&wcdpinctrl 2 0>;
             #thermal-sensor-cells = <0>;
             #sound-dai-cells = <0>;
+            qcom,port-mapping = <4 5 6 8>;
         };
     };
 
-- 
2.21.0

