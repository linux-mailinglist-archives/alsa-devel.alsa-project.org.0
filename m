Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AE649D60F
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jan 2022 00:15:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9587A1E83;
	Thu, 27 Jan 2022 00:14:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9587A1E83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643238913;
	bh=2PRtjexe/vIAzo7BUgMjHPoJbgNJ8qmmB1iEc7mq6c0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tVLx4lW4gcTxu5kVOkZO6XxZFJ5mGhMwku9OJw8iuhhiSq+tsRwudLgfTgOw0AWhy
	 YIZyUjYdZi/0lRH6Wm9Z3C8cUn15rBjzCL+CUC011aKXngilk3JtDuvcj4rx8xIdFd
	 W5qvUf2veTEa22Kil6gadLrEoKf/+Yq4dP+1khEo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DC4CF804BC;
	Thu, 27 Jan 2022 00:14:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6EE1F8049C; Thu, 27 Jan 2022 00:14:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 441A7F80118
 for <alsa-devel@alsa-project.org>; Thu, 27 Jan 2022 00:14:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 441A7F80118
Received: by mail-oi1-f174.google.com with SMTP id q186so2571482oih.8
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 15:14:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=id2BNeDZg3dDDMILDpcowwdo+5CZ/wFbYJt0PkzxCcQ=;
 b=MXQF04LUJ9ymSgHd3fT/9UwTUUqv8MDnWQRevc5r2EM79XfAIp7AcNzqSJAJh8mVDr
 JvCYA/9dSMyN2uXIF/u7c+WB6o9pG5Nu0L5SATSY7z/+G3GdyZOZYFg7dO0lKSNGbfDG
 NBVbn1GgwBJaj343xgkneVDBC1hfm78cAJb6W+PwffDCPMNMGwkBc2KXIMUydOgb5rJf
 Gs/3W/xcJ6hZdBPz4JKqBX8+1ppykSaCUhJhAJGqitfySCa6DBaTHTQO3w/b024B7au6
 zcZ30W09rhly8zhZLp2Zzaguswg0uWkCLQr2fjA6kOn5WkxUg3Vn3wd502ZIrHmqJt06
 trkw==
X-Gm-Message-State: AOAM531xn897v2SjHgFkx/qnduJojOpgi9NSQip1nuj09VNlCHbn279R
 Y7WvSCdNZLp8/kB2CtXbYQ==
X-Google-Smtp-Source: ABdhPJx4p4fTjtNu7f3jrQHEOC8n0POr7czD30dfR5wcQ3Z5adbSkF3RGNPVmZ58NMouU0ijrbVZow==
X-Received: by 2002:a05:6808:ec4:: with SMTP id
 q4mr621505oiv.326.1643238842514; 
 Wed, 26 Jan 2022 15:14:02 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id p26sm6081196oth.14.2022.01.26.15.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 15:14:02 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Derek Fang <derek.fang@realtek.com>
Subject: [PATCH] ASoC: dt-bindings: realtek,
 rt5682s: Drop Tegra specifics from example
Date: Wed, 26 Jan 2022 17:13:58 -0600
Message-Id: <20220126231358.1637174-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

There's no need to complicate examples with a platform specific macro.
It also complicates example parsing to figure out the number of interrupt
cells in examples (based on bracketing).

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/sound/realtek,rt5682s.yaml        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
index d65c0ed5060c..ca5b8987b749 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
@@ -21,6 +21,7 @@ properties:
     description: I2C address of the device.
 
   interrupts:
+    maxItems: 1
     description: The CODEC's interrupt output.
 
   realtek,dmic1-data-pin:
@@ -94,7 +95,7 @@ required:
 
 examples:
   - |
-    #include <dt-bindings/gpio/tegra-gpio.h>
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
 
     i2c {
@@ -104,10 +105,9 @@ examples:
         codec@1a {
             compatible = "realtek,rt5682s";
             reg = <0x1a>;
-            interrupt-parent = <&gpio>;
-            interrupts = <TEGRA_GPIO(U, 6) IRQ_TYPE_LEVEL_HIGH>;
+            interrupts = <6 IRQ_TYPE_LEVEL_HIGH>;
             realtek,ldo1-en-gpios =
-                <&gpio TEGRA_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
+                <&gpio 2 GPIO_ACTIVE_HIGH>;
             realtek,dmic1-data-pin = <1>;
             realtek,dmic1-clk-pin = <1>;
             realtek,jd-src = <1>;
-- 
2.32.0

