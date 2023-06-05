Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AB6722801
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 15:57:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C91CE828;
	Mon,  5 Jun 2023 15:56:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C91CE828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685973469;
	bh=IHZ6T0HRBDFBYIf0Ym5bo1yUI0MC4kCwudRgb4mV5dg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bEYIQpSUR6nzI+C71855db5IxONKIe72F/IM+zu7lRy7cnFR8kuBQZRf3+omgugh9
	 1oT3BkOpQdVDKeaOls8aDJiD0iiZvhwIgVrr9yrQmN6vw0l4fvvHvlbyqfG6S+qZUT
	 4jRQGkffZ5fuweI+Zx0of3uhgK5cN+UvyGtq18YA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04463F805E1; Mon,  5 Jun 2023 15:55:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 545DDF805AE;
	Mon,  5 Jun 2023 15:55:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A8E4F8016C; Mon,  5 Jun 2023 14:10:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id 66850F80199
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 14:09:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66850F80199
Received: from loongson.cn (unknown [10.180.13.124])
	by gateway (Coremail) with SMTP id _____8Dx9vCG0H1k+BMAAA--.210S3;
	Mon, 05 Jun 2023 20:09:42 +0800 (CST)
Received: from localhost.localdomain (unknown [10.180.13.124])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxauWC0H1k_3AAAA--.2032S6;
	Mon, 05 Jun 2023 20:09:42 +0800 (CST)
From: YingKun Meng <mengyingkun@loongson.cn>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	Yingkun Meng <mengyingkun@loongson.cn>
Subject: [PATCH 3/3] ASoC: dt-bindings: Add support for Loongson audio card
Date: Mon,  5 Jun 2023 20:09:34 +0800
Message-Id: <20230605120934.2306548-3-mengyingkun@loongson.cn>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230605120934.2306548-1-mengyingkun@loongson.cn>
References: <20230605120934.2306548-1-mengyingkun@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxauWC0H1k_3AAAA--.2032S6
X-CM-SenderInfo: 5phqw55lqjy33q6o00pqjv00gofq/1tbiAQANDGR8fwASxAASsj
X-Coremail-Antispam: 1Uk129KBj93XoW7tF4fuF1UWw15WF47ZFWDtrc_yoW8Zw1Dpw
	s3C34UGrWxt3W7C395ZFWxAw4fJasayFsrXF42qw1UGFWDKa4FqwsIk3W5u3W2kFn5Jay7
	Wa4rGr1xGas3CwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU84xRDUUUUU==
X-MailFrom: mengyingkun@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: B7RBD4ZQIK4Y2MHGAHXM3GTI2EB5F5XU
X-Message-ID-Hash: B7RBD4ZQIK4Y2MHGAHXM3GTI2EB5F5XU
X-Mailman-Approved-At: Mon, 05 Jun 2023 13:55:12 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B7RBD4ZQIK4Y2MHGAHXM3GTI2EB5F5XU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Yingkun Meng <mengyingkun@loongson.cn>

The audio card uses loongson I2S controller present in 7axxx/2kxxx chips
to transfer audio data.

Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
---
 .../sound/loongson,ls-audio-card.yaml         | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml

diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
new file mode 100644
index 000000000000..f1d6ee346bb3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/loongson-audio-card.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson generic ASoC audio sound card.
+
+maintainers:
+  - Yingkun Meng <mengyingkun@loongson.cn>
+
+description:
+  Generic ASoC audio device for loongson platform.
+
+properties:
+  compatible:
+    const: loongson,ls-audio-card
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: User specified audio sound card name
+
+  mclk-fs:
+    $ref: simple-card.yaml#/definitions/mclk-fs
+
+  cpu:
+    description: Holds subnode which indicates cpu dai.
+    type: object
+    additionalProperties: false
+    properties:
+      sound-dai:
+        maxItems: 1
+
+  codec:
+    description: Holds subnode which indicates codec dai.
+    type: object
+    additionalProperties: false
+    properties:
+      sound-dai:
+        maxItems: 1
+
+required:
+  - compatible
+  - model
+  - mclk-fs
+  - cpu
+  - codec
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "loongson,ls-audio-card";
+        model = "loongson-audio";
+        mclk-fs = <512>;
+
+        cpu {
+            sound-dai = <&i2s>;
+        };
+        codec {
+             sound-dai = <&es8323>;
+        };
+    };
-- 
2.33.0

