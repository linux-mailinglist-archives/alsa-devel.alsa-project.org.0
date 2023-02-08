Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D8C68ECA8
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 11:18:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F805E87;
	Wed,  8 Feb 2023 11:17:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F805E87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675851518;
	bh=xBjrkyN9yRUiRONYlnnQ6BTgWhRsxLggvByqFrMGZnI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PRH4NjnWLPS+AxYrxQ2ALu8Ka1K39z973YDpx7vTVx/lzy+EjjSUtrvhnMk3SOP8M
	 r5BmEvdZ1MhErnvU2UNSwofAYk7/xvLhlAmMXubsum0gc5kp9xVYwwGhqf9scnQUOi
	 ehKVovNHWp7ja12TuDtz3GMFL9IEFdNHwikt3Ldw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26A2EF80552;
	Wed,  8 Feb 2023 11:16:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86FBBF80526; Wed,  8 Feb 2023 11:16:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C254F80095
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 11:16:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C254F80095
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bQ904evB
Received: by mail-wm1-x336.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so1039735wmb.4
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 02:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=adTl94APknDnu5iGaupYfmKo8FkuD8SwaKoEr2aG59Q=;
        b=bQ904evB0Dbvio9KDLzHttH4Ne823Yrwxb8Zk78lufyfvfmEeiynZzJGjjzzFm7IqL
         C0gx40OGU9YJjrJEI7XEa9eJrfdy+oCoRAjSktizRl4+OKNzDJV7eNaKOowkxOLXXqV9
         dPWSSvVGkln/uQdcZEow6mMmasTSgyXtpQEuj0I/7oKYyRkDbIUMg/v0bN21fChXk5iP
         htmZmk5fODi+N8QG4XHh1iWzmrFvvQ+TYQXCZ8JMbVEgaJc6kQtGEyqzi4ZU5LX+cV/A
         E5PbSA6d2Ps+QkkfBfjKp7UP1aq/mMiRlVtr1gUQUSuwGU+RLNn5BMny1lO4L0Hk2CfH
         WWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=adTl94APknDnu5iGaupYfmKo8FkuD8SwaKoEr2aG59Q=;
        b=KDmh9k4uTEhzmCPUpIS6db3fPNJZiKuOMItK1UieW7Fy2NG9scQfX3mZIRMpfh3hmo
         gApuhZTVvkBFD+3KOkH1F89GN9cQtSWbN8WaE7QM7M07+kNsgO/gt5z1o5rxOvU+TaSY
         Xg2Ia3zLjDLQ2aMCYAhD32pI3sUTxVyCNZSZGTBeosXicdTtDnQH25e69rNzwELt98QS
         bQSxjW1IgG/Wr+8x5eaNHGRqo7DjkF1rYKRisddBSHtWHv4yjqOxWzL3yjMR1iuAMprR
         0dEdDyPkq5OIDSODSsIbGxaaMN2QHsaj0xwXFe4DQE2Y65xz40htu0nGpkLxtzOVaPDQ
         dShA==
X-Gm-Message-State: AO0yUKWfpofxwL368Ou+GkZ4T4eRH+iiKe5d7IJEN5EKRLJ56Cb33fZy
	p66J5WRotpx10zZxUZH5Y+FK3A==
X-Google-Smtp-Source: 
 AK7set/szvmHKGrN7NwTRdzvBqRm7ePHGlF7HnajiFVr/G/36ChpjyTPO+VnAiBnTf0G91EFJwVfJQ==
X-Received: by 2002:a05:600c:990:b0:3dc:5abb:2f50 with SMTP id
 w16-20020a05600c099000b003dc5abb2f50mr5866654wmp.19.1675851359710;
        Wed, 08 Feb 2023 02:15:59 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c198e00b003dc4ecfc4d7sm1496328wmq.29.2023.02.08.02.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 02:15:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 6/7] dt-bindings: remoteproc: qcom,glink-rpm-edge: convert
 to DT schema
Date: Wed,  8 Feb 2023 11:15:44 +0100
Message-Id: <20230208101545.45711-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
References: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OBYJGRQBSECIEBBZOCNED6VFOKUTEGWP
X-Message-ID-Hash: OBYJGRQBSECIEBBZOCNED6VFOKUTEGWP
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OBYJGRQBSECIEBBZOCNED6VFOKUTEGWP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert Qualcomm G-Link RPM edge binding to DT schema.  Move it to
remoteproc as it better suits the purpose - communication channel with
remote processor.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. :: -> :
2. Correct qcom,intents type.

There are no strict dependencies on other patches, but the previous
"qcom,apcs-kpss-global" should end up in the same cycle (or earlier) as
this one.
---
 .../remoteproc/qcom,glink-rpm-edge.yaml       | 99 +++++++++++++++++++
 .../bindings/soc/qcom/qcom,glink.txt          | 94 ------------------
 2 files changed, 99 insertions(+), 94 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml
new file mode 100644
index 000000000000..f5a044e20c4e
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,glink-rpm-edge.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm G-Link RPM edge
+
+description: |
+  Qualcomm G-Link edge, a FIFO based mechanism for communication with Resource
+  Power Manager (RPM) on various Qualcomm platforms.
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+
+properties:
+  compatible:
+    const: qcom,glink-rpm
+
+  label:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Name of the edge, used for debugging and identification purposes. The
+      node name will be used if this is not present.
+
+  interrupts:
+    maxItems: 1
+
+  mboxes:
+    items:
+      - description: rpm_hlos mailbox in APCS
+
+  qcom,remote-pid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The identifier for the remote processor as known by the rest of the
+      system.
+
+  qcom,rpm-msg-ram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      RPM message memory resource (compatible: qcom,rpm-msg-ram).
+
+  rpm-requests:
+    type: object
+    $ref: /schemas/soc/qcom/qcom,smd-rpm.yaml#
+    unevaluatedProperties: false
+    description:
+      Qualcomm Resource Power Manager (RPM) over G-Link
+
+    properties:
+      qcom,intents:
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        minItems: 1
+        maxItems: 32
+        items:
+          items:
+            - description: size of each intent to preallocate
+            - description: amount of intents to preallocate
+              minimum: 1
+        description:
+          List of (size, amount) pairs describing what intents should be
+          preallocated for this virtual channel. This can be used to tweak the
+          default intents available for the channel to meet expectations of the
+          remote.
+
+    required:
+      - qcom,glink-channels
+
+required:
+  - compatible
+  - interrupts
+  - mboxes
+
+anyOf:
+  - required:
+      - qcom,remote-pid
+  - required:
+      - qcom,rpm-msg-ram
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    rpm-glink {
+        compatible = "qcom,glink-rpm";
+        interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
+        mboxes = <&apcs_glb 0>;
+        qcom,rpm-msg-ram = <&rpm_msg_ram>;
+
+        rpm-requests {
+            compatible = "qcom,rpm-msm8996";
+            qcom,glink-channels = "rpm_requests";
+
+            /* ... */
+        };
+    };
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
deleted file mode 100644
index 1214192847ac..000000000000
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
+++ /dev/null
@@ -1,94 +0,0 @@
-Qualcomm GLINK edge binding
-
-This binding describes a Qualcomm GLINK edge, a fifo based mechanism for
-communication between subsystem-pairs on various Qualcomm platforms. Two types
-of edges can be described by the binding; the GLINK RPM edge and a SMEM based
-edge.
-
-- compatible:
-	Usage: required for glink-rpm
-	Value type: <stringlist>
-	Definition: must be "qcom,glink-rpm"
-
-- label:
-	Usage: optional
-	Value type: <string>
-	Definition: should specify the subsystem name this edge corresponds to.
-
-- interrupts:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: should specify the IRQ used by the remote processor to
-		    signal this processor about communication related events
-
-- qcom,remote-pid:
-	Usage: required for glink-smem
-	Value type: <u32>
-	Definition: specifies the identifier of the remote endpoint of this edge
-
-- qcom,rpm-msg-ram:
-	Usage: required for glink-rpm
-	Value type: <prop-encoded-array>
-	Definition: handle to RPM message memory resource
-
-- mboxes:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: reference to the "rpm_hlos" mailbox in APCS, as described
-		    in mailbox/mailbox.txt
-
-= GLINK DEVICES
-Each subnode of the GLINK node represent function tied to a virtual
-communication channel. The name of the nodes are not important. The properties
-of these nodes are defined by the individual bindings for the specific function
-- but must contain the following property:
-
-- qcom,glink-channels:
-	Usage: required
-	Value type: <stringlist>
-	Definition: a list of channels tied to this function, used for matching
-		    the function to a set of virtual channels
-
-- qcom,intents:
-	Usage: optional
-	Value type: <prop-encoded-array>
-	Definition: a list of size,amount pairs describing what intents should
-		    be preallocated for this virtual channel. This can be used
-		    to tweak the default intents available for the channel to
-		    meet expectations of the remote.
-
-= EXAMPLE
-The following example represents the GLINK RPM node on a MSM8996 device, with
-the function for the "rpm_request" channel defined, which is used for
-regulators and root clocks.
-
-	apcs_glb: mailbox@9820000 {
-		compatible = "qcom,msm8996-apcs-hmss-global";
-		reg = <0x9820000 0x1000>;
-
-		#mbox-cells = <1>;
-	};
-
-	rpm_msg_ram: memory@68000 {
-		compatible = "qcom,rpm-msg-ram";
-		reg = <0x68000 0x6000>;
-	};
-
-	rpm-glink {
-		compatible = "qcom,glink-rpm";
-
-		interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
-
-		qcom,rpm-msg-ram = <&rpm_msg_ram>;
-
-		mboxes = <&apcs_glb 0>;
-
-		rpm-requests {
-			compatible = "qcom,rpm-msm8996";
-			qcom,glink-channels = "rpm_requests";
-
-			qcom,intents = <0x400 5
-					0x800 1>;
-			...
-		};
-	};
-- 
2.34.1

