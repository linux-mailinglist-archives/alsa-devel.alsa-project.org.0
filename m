Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD768D4445
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2019 17:30:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44114167E;
	Fri, 11 Oct 2019 17:29:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44114167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570807835;
	bh=oKNsFJfHhbzrMf2SWIR/p1doU3OdL20LpruxyzTnWO4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HBTsJ8xZa3DUc8tfmCmS/d5zAC3Dy/oY3W2MrB4WYS3On7IFGtYZQ03q+2NOdA2th
	 vb8OYTV7VAJcGz2WQidUz6sfSvz6TLtfm4hFQZ+tXLhlsr80gYTa7jqcXAM5xqIlLB
	 NSTeFW3pMcP4y2sGpn0bNsSiuHQIp4peTHLHS2lo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7806F80611;
	Fri, 11 Oct 2019 17:27:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F19B7F80539; Fri, 11 Oct 2019 17:27:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBED5F8026F
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 17:27:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBED5F8026F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="KEKu2/gP"
Received: by mail-wr1-x442.google.com with SMTP id y18so2939738wrn.5
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 08:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vqG7+AGfghGk6oxgeHLKo8renKYHQ6ikGsMAIU3fyFY=;
 b=KEKu2/gPosLPl5Pq3bC9ZnPgnkpl4boe0ilknbQYgjhpOCmgCh6BUf3umAF4fq4u7U
 Lb5YJ/l7Q2VuDfmZ+mk7rVQcmzoZ+kMSRPVW6NVy7SsL5Fi/B/4AP0v+WNJ+O7huRMUx
 9UI8JYUh4aLZHqs79yWmPe4BXgZ0NXP16rHI+u2hhL6mxB5efMfbF/QlcOZklN/ZH0Eo
 rAkak4C8T9asM3nDtc3lbXkiulnMaD3GG/Gmzltv/uod9fN/hdwp25vZtvzbEqaYpjoS
 hyHbR3j5FDLX0x4v5Dlie6beAjNyMWur49I7fK3bUD5W9mcpkrQ5aAfG1SsG6bzYF6Vx
 bthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vqG7+AGfghGk6oxgeHLKo8renKYHQ6ikGsMAIU3fyFY=;
 b=gOdDfcSOviIRW12ra6Ys4b6rGLuOHmW9wM0H8RBbBG/7dgCtZDgnyUJfGMUtint7bq
 jN72e3fyVymhjfMa1nUDklvQVCEeHr2ZxIkUhJWJECOt+7zmRMcgxJ8HGjFdgaqLLQeA
 C6iI5vH5zyvoJjG/XkREnTIzkVCaz5OB+uGnfd9MptTmvHaogCXE7akUGbLdnX/Z59zY
 P60QtaSbAWTBUvfXCuwgs1xs1Qr3yQHEvH+jbIb488Gf01hqZtrVJtUjiukNJyMiYTWX
 E8THRlocQWQRG7qmi6vlKOzPx+EyaXEVkeNeaSVcxUW+/XXYn0oFSRjcasExErx2HUh9
 /K+A==
X-Gm-Message-State: APjAAAXV/aGm2OHLZm0WfmjV7VbJzVdgtOgjOWd20IZTkjgFXZccPdwE
 ehd8BGhuZevISPxQJ2Vufh5NuQ==
X-Google-Smtp-Source: APXvYqy78aITUXBHI8DPHAdTjO8XKBGiUnnfb99voA6hpuWolGklgWJIBDhHYFH/4L5KjJjMQe7z+w==
X-Received: by 2002:adf:f744:: with SMTP id z4mr14176405wrp.22.1570807630074; 
 Fri, 11 Oct 2019 08:27:10 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id a204sm16439979wmh.21.2019.10.11.08.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 08:27:09 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	robh@kernel.org
Date: Fri, 11 Oct 2019 16:24:45 +0100
Message-Id: <20191011152446.5925-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191011152446.5925-1-srinivas.kandagatla@linaro.org>
References: <20191011152446.5925-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, vkoul@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v8 2/3] dt-bindings: ASoC: WSA881x: Add missing
	#sound-dai-cells
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

As this codec now exposes dai, add missing #sound-dai-cells.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
index faa90966a33a..ea44d03e58ca 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
@@ -29,11 +29,15 @@ properties:
   '#thermal-sensor-cells':
     const: 0
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - powerdown-gpios
   - "#thermal-sensor-cells"
+  - "#sound-dai-cells"
 
 additionalProperties: false
 
@@ -49,6 +53,7 @@ examples:
             reg = <0 1>;
             powerdown-gpios = <&wcdpinctrl 2 0>;
             #thermal-sensor-cells = <0>;
+            #sound-dai-cells = <0>;
         };
 
         speaker@0,2 {
@@ -56,6 +61,7 @@ examples:
             reg = <0 2>;
             powerdown-gpios = <&wcdpinctrl 2 0>;
             #thermal-sensor-cells = <0>;
+            #sound-dai-cells = <0>;
         };
     };
 
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
