Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BF75F1F19
	for <lists+alsa-devel@lfdr.de>; Sat,  1 Oct 2022 22:03:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 435CC282B;
	Sat,  1 Oct 2022 22:02:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 435CC282B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664654616;
	bh=xE/eiXU7/2/RcDSPGUV43+GJIPlijRN4rnt+IytBYwQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gtttJRBCgsU7U42HFx5tU5CGS3ER/jGrBZxYCd2CHjR/M4fPtY+rgy4uOg2tMn/8u
	 9QtOZ6QGS3/zo2RYIcW4/giTP+dzLkIYRO2wK0OWHE8dWWrbHALXmyr65WdGfGvpfR
	 2vZW+AJS/CMDTBcs+evAMW1nedNjcItaHkUHP8EY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1A03F804C2;
	Sat,  1 Oct 2022 22:02:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C1E6F804DA; Sat,  1 Oct 2022 22:02:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92C76F80171
 for <alsa-devel@alsa-project.org>; Sat,  1 Oct 2022 22:02:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92C76F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=schmorgal.com header.i=@schmorgal.com
 header.b="FjB7Q63e"
Received: by mail-pl1-x62b.google.com with SMTP id z20so125718plb.10
 for <alsa-devel@alsa-project.org>; Sat, 01 Oct 2022 13:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=HPFnu8oaYg4AsNK1EYyLZPu6v1c5gswGTazUj1W483Y=;
 b=FjB7Q63eNKtH2CTjrjtwC8FFLZNbmCp4xDfLMqo030pmeTFsR9l+J5qHV7Zs0QgXk6
 QdpJZslGGsesgS1ZMst/0G0dcq32bQPxxFT9uT3r5JEnV/MwiGzi/IC5Qpo37Vnqb0p3
 ecXfI954khKiRlg+mPHKO7o1ah1g5vRMMl1hQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=HPFnu8oaYg4AsNK1EYyLZPu6v1c5gswGTazUj1W483Y=;
 b=yJD8cju+3KIyjXNsBf5lfQl6GY8RmHVYX+DAwt1AFE10XdvxlJNgJMUuoIzfNddiWW
 E6ZC+gDIj0zt7+qWKfKHNcoCS5CKCOxCmncJAYcV+BXjy8AdWpAzWj8b/rv/TY9ZtZjg
 ZL7Chqruw1m2Xu7qvg6iKVvyGMSvWmUb+uJ1IbiKMoGGPIo65MGzsdKP11Ax8BquHOgr
 NICgbbSJ1ilajNWowNr9aDZCCZx9CFJ4gFwniZJJE0mTvtMYFTN/RijOF7i3wKwklabt
 /dsDdq2oRTp5JJjc5bo8pNx9L9sQcCFwgcvOJ09HqfQjsaI+/POg3OTIrhAEFGOVxVak
 i7Iw==
X-Gm-Message-State: ACrzQf2YhbyGAYi/RXt7gchQ0xrFcBhy+R5eGxKWR5zhPcROwNYSPTe2
 qU6/UYk1Yrsw5V4qu2ga9MqmRw==
X-Google-Smtp-Source: AMsMyM7ZelSG4EOYMkI8bR40RPCxCjXuSv0uJeFYi6pAJFqtZXHX7nttj8TlYq1mnu6tsFVckCZ+fA==
X-Received: by 2002:a17:90b:2246:b0:205:97a5:520e with SMTP id
 hk6-20020a17090b224600b0020597a5520emr4676864pjb.244.1664654531968; 
 Sat, 01 Oct 2022 13:02:11 -0700 (PDT)
Received: from doug-ryzen-5700G.. ([50.45.132.124])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a170903121200b0017a8aed0a5asm4313593plh.136.2022.10.01.13.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 13:02:11 -0700 (PDT)
From: Doug Brown <doug@schmorgal.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: dt-bindings: add schema for WM8961
Date: Sat,  1 Oct 2022 13:00:38 -0700
Message-Id: <20221001200039.21049-2-doug@schmorgal.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001200039.21049-1-doug@schmorgal.com>
References: <20221001200039.21049-1-doug@schmorgal.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Doug Brown <doug@schmorgal.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
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

Create a simple DT schema for the existing Wolfson WM8961 driver so that
DT support can be added to the driver.

Signed-off-by: Doug Brown <doug@schmorgal.com>
---
 .../devicetree/bindings/sound/wlf,wm8961.yaml | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8961.yaml

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8961.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8961.yaml
new file mode 100644
index 000000000000..73166cf0fdcf
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8961.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/wlf,wm8961.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Wolfson WM8961 Ultra-Low Power Stereo CODEC
+
+maintainers:
+  - patches@opensource.cirrus.com
+
+properties:
+  '#sound-dai-cells':
+    const: 0
+
+  compatible:
+    const: wlf,wm8961
+
+  reg:
+    maxItems: 1
+
+required:
+  - '#sound-dai-cells'
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          wm8961: codec@4a {
+                  #sound-dai-cells = <0>;
+                  compatible = "wlf,wm8961";
+                  reg = <0x4a>;
+          };
+    };
-- 
2.34.1

