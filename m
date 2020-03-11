Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0600F1823A0
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 22:00:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7890416A3;
	Wed, 11 Mar 2020 21:59:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7890416A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583960433;
	bh=u2iync7lpoczXWBocKolL8o52SJtLc/5UVBqMHBnILY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HxIYgXGmhUjPSnllGP527g60pvFeImkFheK4DZI2/CT3y2BwPu6Vsgus9htyIo2hv
	 KtizkgjLC4QcqgR0cFXoYdOdmxrbS9iK0FILretcVp+s935cFf/3O7h5inif+qAQE4
	 Upm57B6UcweISvUWypdgl61zwudOMIvpie74E2KQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D069F801F7;
	Wed, 11 Mar 2020 21:58:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3DE8F801EB; Wed, 11 Mar 2020 21:58:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1397EF800BE
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 21:58:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1397EF800BE
Received: by mail-ot1-f66.google.com with SMTP id k26so3680256otr.2
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 13:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uhg/0FAO3q/vHDALs56YJQeY3t0IUDUvD5cc2QPb2XM=;
 b=Tt7TLd2w3MAan8OeewKMttm8u3QlxgbgWySFvnz/bVnlYZO8auAIcUpYykTO9l9I/x
 qWNNBAar1tRFKG+x1oSpgyhr5W2TQwoEtRP4j65YdFI1IFxUy/P9jOxUYxTvVijFVOMO
 Fowim/B4vCbxBFLt+Kj/bwS/BUGMZaCUbojGYJF2egrUFDBdkHzwr7Zu9JjTxGzZsqT0
 rHg1xk8ts7El4V95He35RyfCCBkksBJH991SMTFd5N0B+MdDQjKB8O+O9ymWI1jQJOoM
 E+vsCUbmlLuHQr4zlAMKQSq45CVgx/gAPO6v6IkYbZc7yT1IV6A5aWhjQX5WF7+IRdIq
 FN3w==
X-Gm-Message-State: ANhLgQ0Qpf8JFwgaF+JyHC36TwwsvKZMpsQWFOs3lD4bT/fpr1s/KPqY
 FDUQ5B+tZCoXohQ0rrGrYQ==
X-Google-Smtp-Source: ADFU+vuv4liSgXNM9hk0LvRLrjr4VQeYNuyIQ2YCdJkyrlgfjAXq5rTb3WuF0vh5KOZNuIaLo8UO8Q==
X-Received: by 2002:a9d:3d65:: with SMTP id a92mr3565544otc.326.1583960323590; 
 Wed, 11 Mar 2020 13:58:43 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id c24sm638848oov.43.2020.03.11.13.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 13:58:42 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: dt-bindings: google,
 cros-ec-codec: Fix dtc warnings in example
Date: Wed, 11 Mar 2020 15:58:41 -0500
Message-Id: <20200311205841.2710-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Cheng-Yi Chiang <cychiang@chromium.org>
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

Extra dtc warnings (roughly what W=1 enables) are now enabled by default
when building the binding examples. These were fixed treewide in
5.6-rc5, but the newly added google,cros-ec-codec schema adds some new
warnings:

Documentation/devicetree/bindings/sound/google,cros-ec-codec.example.dts:17.28-21.11:
Warning (unit_address_vs_reg): /example-0/reserved_mem: node has a reg or ranges property, but no unit name
Documentation/devicetree/bindings/sound/google,cros-ec-codec.example.dts:22.19-32.11:
Warning (unit_address_vs_reg): /example-0/cros-ec@0: node has a unit name, but no reg property
Documentation/devicetree/bindings/sound/google,cros-ec-codec.example.dts:26.37-31.15:
Warning (unit_address_vs_reg): /example-0/cros-ec@0/ec-codec: node has a reg or ranges property, but no unit name

Fixing the above, then results in:

Documentation/devicetree/bindings/sound/google,cros-ec-codec.example.dts:26.13-23:
Warning (reg_format): /example-0/cros-ec@0:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/sound/google,cros-ec-codec.example.dts:27.37-32.15:
Warning (unit_address_vs_reg): /example-0/cros-ec@0/ec-codec: node has a reg or ranges property, but no unit name

Fixes: eadd54c75f1e ("dt-bindings: Convert the binding file google, cros-ec-codec.txt to yaml format.")
Cc: Cheng-Yi Chiang <cychiang@chromium.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/sound/google,cros-ec-codec.yaml  | 27 +++++++++++--------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
index 94a85d0cbf43..c84e656afb0a 100644
--- a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
@@ -44,19 +44,24 @@ additionalProperties: false
 
 examples:
   - |
-    reserved_mem: reserved_mem {
+    reserved_mem: reserved-mem@52800000 {
         compatible = "shared-dma-pool";
-        reg = <0 0x52800000 0 0x100000>;
+        reg = <0x52800000 0x100000>;
         no-map;
     };
-    cros-ec@0 {
-        compatible = "google,cros-ec-spi";
-        #address-cells = <2>;
-        #size-cells = <1>;
-        cros_ec_codec: ec-codec {
-            compatible = "google,cros-ec-codec";
-            #sound-dai-cells = <1>;
-            reg = <0x0 0x10500000 0x80000>;
-            memory-region = <&reserved_mem>;
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        cros-ec@0 {
+            compatible = "google,cros-ec-spi";
+            #address-cells = <2>;
+            #size-cells = <1>;
+            reg = <0>;
+            cros_ec_codec: ec-codec@10500000 {
+                compatible = "google,cros-ec-codec";
+                #sound-dai-cells = <1>;
+                reg = <0x0 0x10500000 0x80000>;
+                memory-region = <&reserved_mem>;
+            };
         };
     };
-- 
2.20.1

