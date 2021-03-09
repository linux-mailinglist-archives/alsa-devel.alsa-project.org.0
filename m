Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E733C33285E
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 15:18:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8470F181A;
	Tue,  9 Mar 2021 15:18:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8470F181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615299538;
	bh=Tes0GAdee8FicUSMei8n8KLTjWs+ugeiXFxoSMO37CY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cuYzCBUuNKI7CujoVxKjE1c0ii2o1on0FbnNrasMQA97c6vR6DRsOCUWYfmTmlT1E
	 yOprc46pmdtv2VySRR261+4JPzGTSMQVZaNuvhbuY0AjAk224Fx0dhtPSlcjAV/RUz
	 UssHyLPF6MDRgTRshoiF4ls0MMaJaare4J7NwzU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B029F804A9;
	Tue,  9 Mar 2021 15:15:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3C22F80430; Tue,  9 Mar 2021 15:15:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E1FAF8028B
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 15:15:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E1FAF8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="X//NLVhI"
Received: by mail-wr1-x430.google.com with SMTP id w11so15889798wrr.10
 for <alsa-devel@alsa-project.org>; Tue, 09 Mar 2021 06:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=edjmsvTbiBGyAA1eKIb4COjGcbGBPS+75xg700Bbb9k=;
 b=X//NLVhIAdcbeOgoTBSqEzOS6xAs/LrLYRCs0Iz3aE+2RlVsk/ZmS0RkLWbHASlHXw
 lA1WEwlrcvJz4Mo6Xz1Qf8O2rPXg5suJYTTZWZhwf6JwKWDb9M1kxVQ1q722/7PdC83B
 rSQwb13ezL6pBecUL1R3KuBd8YPj/oX4p+BnUZ5FyDHlInhvgedjwVX4sNJDbDi1x8ch
 T067BcNYNiyibRD57kC2o17RsXETeMG749GHfsgCDHmy86fCa6CrpjtAkGzLgTeC75Cy
 vnI5hBHrVdO8uBQ3GMfisN27f23T213RQ/67DMXymXpvATdNv5E1aNni7cdSD2nBd+tT
 yWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=edjmsvTbiBGyAA1eKIb4COjGcbGBPS+75xg700Bbb9k=;
 b=L5DYB5egxr0AuA9g+lA4x2XlVljmeG+HMav5cPAJQvN8+K+VZUEPJkaEYjDyCsU+9U
 pU6zn/gkhGerjmEznFjIaGw4jD8LOcgk/kef6hv3l4+IJ2O/OzTvuMn6nLefvSLIKuKB
 tJQKMtynAQ1xzyG3dpWNp3+x5chiJW9l22wVHVP62bSOJnUl/Q+z2xQ8Q2OCPed5lp/K
 LiX0QqxL9xax6RPYW9qp9l3BXkn+VyaJxlUHtMm1yZTGLcEqkBqD5wxeiyQ4fnuA+Csc
 N22/P+4u71CdJsU5L9SlxxkddQ64SmJtktZHvc+1IJlwVdy0Fcjqviq8Hfe5jMgkLxJs
 WsEA==
X-Gm-Message-State: AOAM532dQbdd/Zrs/hdPuH9QjFMMCDYduCBcYLHBmlyGxam4tbkk9ngP
 gp1mHRTviu/knRr+Kpd+Gd+4nA==
X-Google-Smtp-Source: ABdhPJz1cWrPVW9Z3/nXVPR7xY9H4HbgV6Q4s9PxMLKYFCCBtBbFPDvVRO5YZ2OgdD2jk/P/4CGWJA==
X-Received: by 2002:adf:ff8c:: with SMTP id j12mr28335588wrr.297.1615299336486; 
 Tue, 09 Mar 2021 06:15:36 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id u20sm28007579wru.6.2021.03.09.06.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:15:36 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Subject: [PATCH v2 4/5] ASoC: dt-bindings: wsa881x: add bindings for port
 mapping
Date: Tue,  9 Mar 2021 14:15:13 +0000
Message-Id: <20210309141514.24744-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210309141514.24744-1-srinivas.kandagatla@linaro.org>
References: <20210309141514.24744-1-srinivas.kandagatla@linaro.org>
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
index ea44d03e58ca..48bc72304b90 100644
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
+            qcom-port-mapping = <1 2 3 7>;
         };
 
         speaker@0,2 {
@@ -62,6 +70,7 @@ examples:
             powerdown-gpios = <&wcdpinctrl 2 0>;
             #thermal-sensor-cells = <0>;
             #sound-dai-cells = <0>;
+            qcom-port-mapping = <4 5 6 8>;
         };
     };
 
-- 
2.21.0

