Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEED47038F
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Dec 2021 16:13:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A04F120A5;
	Fri, 10 Dec 2021 16:12:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A04F120A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639149210;
	bh=ATUT/ZhUgz6b5f+N9M02dJ68u/eDW1VJzXPBp6mCaLY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CmVFq9r7Um2XMZ0BiTlrY8A06ljbSOZftAtbTzZL3+B+SPUZrnCrUEti5M7Oet9cJ
	 tOYHFVSAETTHIZeSSIyobva/iG5ZVMbtsZNDg2WACDeq8LWSqdR+fm4cUB/IUE+OAx
	 28Hy5Jnfvs0PHJSCGxbxCS3C0fTpXPeDI/WirZ5o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0D51F80518;
	Fri, 10 Dec 2021 16:11:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24520F80517; Fri, 10 Dec 2021 16:11:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail3-166.sinamail.sina.com.cn (mail3-166.sinamail.sina.com.cn
 [202.108.3.166]) by alsa1.perex.cz (Postfix) with SMTP id 13883F804E5
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 16:11:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13883F804E5
Received: from unknown (HELO localhost.localdomain)([36.36.86.102])
 by sina.com (172.16.97.23) with ESMTP
 id 61B36DFD0001D2F3; Fri, 10 Dec 2021 23:11:34 +0800 (CST)
X-Sender: chenshumin86@sina.com
X-Auth-ID: chenshumin86@sina.com
X-SMAIL-MID: 2479654919468
From: Shumin Chen <chenshumin86@sina.com>
To: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org
Subject: [PATCH 2/2] ASoC: convert Everest ES8156 binding to yaml
Date: Fri, 10 Dec 2021 23:10:41 +0800
Message-Id: <20211210151041.108751-3-chenshumin86@sina.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210151041.108751-1-chenshumin86@sina.com>
References: <20211210151041.108751-1-chenshumin86@sina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Shumin Chen <chenshumin86@sina.com>
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

This patch converts Everest Semiconductor ES8156 low power audio
CODEC binding to DT schema.

Signed-off-by: Shumin Chen <chenshumin86@sina.com>
---
 .../bindings/sound/everest,es8156.yaml        | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es8156.yaml

diff --git a/Documentation/devicetree/bindings/sound/everest,es8156.yaml b/Documentation/devicetree/bindings/sound/everest,es8156.yaml
new file mode 100644
index 000000000000..695d542013c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es8156.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/everest,es8156.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Everest ES8156 audio CODEC
+
+maintainers:
+  - Shumin Chen <chenshumin86@sina.com>
+
+properties:
+  compatible:
+    const: everest,es8156
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: clock for master clock (MCLK)
+
+  clock-names:
+    items:
+      - const: mclk
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      es8156: codec@8 {
+        compatible = "everest,es8156";
+        reg = <0x11>;
+        clocks = <&clks 10>;
+        clock-names = "mclk";
+        #sound-dai-cells = <0>;
+      };
+    };
-- 
2.25.1

