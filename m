Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4922872CA44
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 17:34:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5336E828;
	Mon, 12 Jun 2023 17:34:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5336E828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686584091;
	bh=D+h6zmi1PwBN46LQ6PqhDOlK8bzw1EsX2G2MZRtDlS0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=R84gP+G1bZ6JWGzjkIS0Om8Doy/2i5GhGwedvrMWxNt9gdmQ8bmdT90iFA9k1E8+f
	 Z2dVuRD6Y/v9BdkMZ2R3QIEco0Itu9xIsZ/dstO4pZFxxlXk2+5urHpXODn1nM+onm
	 hqRDX6zCTYDOOUREkVtgExVCYNETCMNQ3X8HFc5A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13E04F805F3; Mon, 12 Jun 2023 17:32:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65E38F805EC;
	Mon, 12 Jun 2023 17:32:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A899DF80132; Mon, 12 Jun 2023 11:02:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B34AF800BA
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 11:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B34AF800BA
Received: from loongson.cn (unknown [10.180.13.124])
	by gateway (Coremail) with SMTP id _____8AxEenN3oZkuJkDAA--.5858S3;
	Mon, 12 Jun 2023 17:01:02 +0800 (CST)
Received: from localhost.localdomain (unknown [10.180.13.124])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxPMrM3oZkqmwVAA--.52803S4;
	Mon, 12 Jun 2023 17:01:01 +0800 (CST)
From: YingKun Meng <mengyingkun@loongson.cn>
To: krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	conor+dt@kernel.org
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	Yingkun Meng <mengyingkun@loongson.cn>
Subject: [ PATCH v2 3/3] ASoC: dt-bindings: Add support for Loongson audio
 card
Date: Mon, 12 Jun 2023 17:00:58 +0800
Message-Id: <20230612090058.3039546-1-mengyingkun@loongson.cn>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxPMrM3oZkqmwVAA--.52803S4
X-CM-SenderInfo: 5phqw55lqjy33q6o00pqjv00gofq/1tbiAQAADGSFuYEEQQAWsH
X-Coremail-Antispam: 1Uk129KBj93XoW7tF4fAFWfCrWUAFWUKr4xZrc_yoW8Kr15pw
	s3C347Gr48t3W7C395ZFyxJw4fZasayFsrXr42q34UCFZ8Ka4Fqw4ak3WUu3W2kF1kJay7
	uFyFkw18Gas3CwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUk529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r1q6r43M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY
	6Fy7McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUnLID5UUUUU==
X-MailFrom: mengyingkun@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FFDUGDZKZ23LOLF43R2DN2DWOHN7EGI3
X-Message-ID-Hash: FFDUGDZKZ23LOLF43R2DN2DWOHN7EGI3
X-Mailman-Approved-At: Mon, 12 Jun 2023 15:31:58 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FFDUGDZKZ23LOLF43R2DN2DWOHN7EGI3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Yingkun Meng <mengyingkun@loongson.cn>

The audio card uses loongson I2S controller present in
7axxx/2kxxx chips to transfer audio data.

On loongson platform, the chip has only one I2S controller.

Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
---
 .../sound/loongson,ls-audio-card.yaml         | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml

diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
new file mode 100644
index 000000000000..61e8babed402
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/loongson,ls-audio-card.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson 7axxx/2kxxx ASoC audio sound card driver
+
+maintainers:
+  - Yingkun Meng <mengyingkun@loongson.cn>
+
+description:
+  The binding describes the sound card present in loongson
+  7axxx/2kxxx platform. The sound card is an ASoC component
+  which uses Loongson I2S controller to transfer the audio data.
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
+    required:
+      - sound-dai
+
+  codec:
+    description: Holds subnode which indicates codec dai.
+    type: object
+    additionalProperties: false
+    properties:
+      sound-dai:
+        maxItems: 1
+    required:
+      - sound-dai
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

