Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F388C15B590
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 01:00:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97C771672;
	Thu, 13 Feb 2020 00:59:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97C771672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581552046;
	bh=hm38IpAY/iUyrNdQWhpJIi89J76/O7rshI+CTGsZvBQ=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=kwauDE1S/9YHlH1M4sQaIcoCqBzOgCPuZGJmaCWsbPvUSvSFdSJh4N8wrmQ1m+Z+A
	 jNkbCR0fKxblHkGhmXSRXFUF7PkhXt6CUFEg2Nh4nS/DIebJQenr1+jLAC0jcZ1OYK
	 dF1jtbE52obHpPwKzupJVm3osDFlXkF4s3w4fGnA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D48CF8028F;
	Thu, 13 Feb 2020 00:57:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 656D4F8027B; Thu, 13 Feb 2020 00:57:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id A7487F8014F
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 00:57:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7487F8014F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1009106F;
 Wed, 12 Feb 2020 15:57:14 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 267453F68E;
 Wed, 12 Feb 2020 15:57:14 -0800 (PST)
Date: Wed, 12 Feb 2020 23:57:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
In-Reply-To: <20200127091806.11403-1-dafna.hirschfeld@collabora.com>
Message-Id: <applied-20200127091806.11403-1-dafna.hirschfeld@collabora.com>
X-Patchwork-Hint: ignore
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, dafna.hirschfeld@collabora.com,
 ezequiel@collabora.com, dafna3@gmail.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, groeck@chromium.org,
 helen.koike@collabora.com, Mark Brown <broonie@kernel.org>,
 enric.balletbo@collabora.com, kernel@collabora.com, bleung@chromium.org,
 cychiang@chromium.org
Subject: [alsa-devel] Applied "dt-bindings: Convert the binding file google,
	cros-ec-codec.txt to yaml format." to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   dt-bindings: Convert the binding file google, cros-ec-codec.txt to yaml format.

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From eadd54c75f1ef1566a6fe004787c028eb095f8b4 Mon Sep 17 00:00:00 2001
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Date: Mon, 27 Jan 2020 10:18:06 +0100
Subject: [PATCH] dt-bindings: Convert the binding file google,
 cros-ec-codec.txt to yaml format.

This was tested and verified with:
make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/r/20200127091806.11403-1-dafna.hirschfeld@collabora.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/sound/google,cros-ec-codec.txt   | 44 -------------
 .../bindings/sound/google,cros-ec-codec.yaml  | 62 +++++++++++++++++++
 2 files changed, 62 insertions(+), 44 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
 create mode 100644 Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml

diff --git a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
deleted file mode 100644
index 8ca52dcc5572..000000000000
--- a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-Audio codec controlled by ChromeOS EC
-
-Google's ChromeOS EC codec is a digital mic codec provided by the
-Embedded Controller (EC) and is controlled via a host-command interface.
-
-An EC codec node should only be found as a sub-node of the EC node (see
-Documentation/devicetree/bindings/mfd/cros-ec.txt).
-
-Required properties:
-- compatible: Must contain "google,cros-ec-codec"
-- #sound-dai-cells: Should be 1. The cell specifies number of DAIs.
-
-Optional properties:
-- reg: Pysical base address and length of shared memory region from EC.
-       It contains 3 unsigned 32-bit integer.  The first 2 integers
-       combine to become an unsigned 64-bit physical address.  The last
-       one integer is length of the shared memory.
-- memory-region: Shared memory region to EC.  A "shared-dma-pool".  See
-                 ../reserved-memory/reserved-memory.txt for details.
-
-Example:
-
-{
-	...
-
-	reserved_mem: reserved_mem {
-		compatible = "shared-dma-pool";
-		reg = <0 0x52800000 0 0x100000>;
-		no-map;
-	};
-}
-
-cros-ec@0 {
-	compatible = "google,cros-ec-spi";
-
-	...
-
-	cros_ec_codec: ec-codec {
-		compatible = "google,cros-ec-codec";
-		#sound-dai-cells = <1>;
-		reg = <0x0 0x10500000 0x80000>;
-		memory-region = <&reserved_mem>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
new file mode 100644
index 000000000000..94a85d0cbf43
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/google,cros-ec-codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Audio codec controlled by ChromeOS EC
+
+maintainers:
+  - Cheng-Yi Chiang <cychiang@chromium.org>
+
+description: |
+  Google's ChromeOS EC codec is a digital mic codec provided by the
+  Embedded Controller (EC) and is controlled via a host-command interface.
+  An EC codec node should only be found as a sub-node of the EC node (see
+  Documentation/devicetree/bindings/mfd/cros-ec.txt).
+
+properties:
+  compatible:
+    const: google,cros-ec-codec
+
+  "#sound-dai-cells":
+    const: 1
+
+  reg:
+    items:
+      - description: |
+          Physical base address and length of shared memory region from EC.
+          It contains 3 unsigned 32-bit integer. The first 2 integers
+          combine to become an unsigned 64-bit physical address.
+          The last one integer is the length of the shared memory.
+
+  memory-region:
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+    description: |
+      Shared memory region to EC.  A "shared-dma-pool".
+      See ../reserved-memory/reserved-memory.txt for details.
+
+required:
+  - compatible
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    reserved_mem: reserved_mem {
+        compatible = "shared-dma-pool";
+        reg = <0 0x52800000 0 0x100000>;
+        no-map;
+    };
+    cros-ec@0 {
+        compatible = "google,cros-ec-spi";
+        #address-cells = <2>;
+        #size-cells = <1>;
+        cros_ec_codec: ec-codec {
+            compatible = "google,cros-ec-codec";
+            #sound-dai-cells = <1>;
+            reg = <0x0 0x10500000 0x80000>;
+            memory-region = <&reserved_mem>;
+        };
+    };
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
