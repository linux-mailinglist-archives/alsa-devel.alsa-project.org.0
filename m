Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF3667C36F
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 04:21:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27E479F6;
	Thu, 26 Jan 2023 04:20:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27E479F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674703284;
	bh=jQ2XCQyqt5uFOH5yM6dqUzfpknn3H7YWFN6ag/F2j2Y=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=a5WUByLe8P1A+CeWFzz1Vxxvhw09Q+mVoGFuJ6CtFFTm8ditnF1ZTtepfZtTXd4xH
	 7b29UIsZk9riygBvkSSfrItAlRv3ztUMa96WKd0wnw3/BvKQqKkYYe2bBFvTyKxAt5
	 TRCT47NF/QUs6/6QrJJr4zB9n1k+nlp1SY9tlxXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E682BF805EB;
	Thu, 26 Jan 2023 04:15:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D92DF805DF; Thu, 26 Jan 2023 04:15:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CC82F8055C
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 04:14:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CC82F8055C
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=bYWdVIJo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1674702892; x=1706238892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=yGFwuojaQ5ML4dsz23/al/799O12g89UeuaQci4f9LM=;
 b=bYWdVIJoh3TijlAqK5XXWk4pmgHOtQ50n31siJLswwCT6gr+d40zFqZw
 hRJX1s9guj/Xin6GXBK9iocyy5VNOT36vehuklWXk+SFWkpv7hZcL6L+F
 3E6Hhb4++1Fk0P3yu6jauk40OHxCsxddyutDrDF0soKZECysMy4bgCKhp g=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 25 Jan 2023 19:14:50 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.45.79.139])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 19:14:50 -0800
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 25 Jan 2023 19:14:50 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
 <perex@perex.cz>, <lgirdwood@gmail.com>, <andersson@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
 <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>, <bgoswami@quicinc.com>,
 <tiwai@suse.com>, <robh+dt@kernel.org>, <agross@kernel.org>
Subject: [RFC PATCH v2 21/22] ASoC: dt-bindings: Add Q6USB backend bindings
Date: Wed, 25 Jan 2023 19:14:23 -0800
Message-ID: <20230126031424.14582-22-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230126031424.14582-1-quic_wcheng@quicinc.com>
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wesley Cheng <quic_wcheng@quicinc.com>,
 quic_jackp@quicinc.com, quic_plai@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add a dt-binding to describe the definition of enabling the Q6 USB backend
device for audio offloading.  The node carries information, which is passed
along to the QC USB SND class driver counterpart.  These parameters will be
utilized during QMI stream enable requests.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 .../bindings/sound/qcom,q6usb-dais.yaml       | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
new file mode 100644
index 000000000000..e24b4d52fa7e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,q6usb-dais.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm ASoC USB backend DAI
+
+maintainers:
+  - Wesley Cheng <quic_wcheng@quicinc.com>
+
+description:
+  The Q6USB backend is a supported AFE port on the Q6DSP. This backend
+  driver will communicate the required settings to the QC USB SND class
+  driver for properly enabling the audio stream.  Parameters defined
+  under this node will carry settings, which will be passed along during
+  the QMI stream enable request.
+
+properties:
+  compatible:
+    enum:
+      - qcom,q6usb-dais
+
+  iommus:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 1
+
+  qcom,usb-audio-stream-id:
+    description:
+      SID for the Q6DSP processor for IOMMU mapping.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  qcom,usb-audio-intr-num:
+    description:
+      Desired XHCI interrupter number to use.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - '#sound-dai-cells'
+  - qcom,usb-audio-intr-num
+
+additionalProperties: false
+
+examples:
+  - |
+    usbdai: usbd {
+      compatible = "qcom,q6usb-dais";
+      #sound-dai-cells = <1>;
+      iommus = <&apps_smmu 0x180f 0x0>;
+      qcom,usb-audio-stream-id = <0xf>;
+      qcom,usb-audio-intr-num = <2>;
+    };
