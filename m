Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEABD13AA6F
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:15:12 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB0BD17C8;
	Mon, 13 Jan 2020 14:23:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB0BD17C8
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31E42F8025A;
	Mon, 13 Jan 2020 14:22:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06460F801F7; Mon, 13 Jan 2020 14:22:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8197F800B9
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 14:22:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8197F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="br/eDHQd"
Received: by mail-wr1-x443.google.com with SMTP id t2so8571696wrr.1
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 05:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D/zgSAoCVsSdiweHMVDrK8nA0R60nkQkJQGcdVDh1og=;
 b=br/eDHQd0x8llbigzrXZRlqJaZX4duJUbmWjYqwd6ceNQXZqaYjEKm1XaVvs2g21F8
 WGS6IDf2LUG3cUeTFs5gqTZJu7My373rI4HdsE8Tw8w+ok9gqdYL7plKzMDSEc8tfI0b
 j0VD3yzShNdDf5sdoGjSVMTWgT+9VXXybvYtqtwSghYdxtkeMiKsEMDNztVhmHDRft3w
 zBx1zXcFCjgcqSOC5aoAaGBkbfOQhRtDKKVM/D4x8tQFS3TtOTSeUwrt/I/WyKl7cDN6
 BgtKLNrfxZR+r5YhKHPIyzzQTyBCWNiEi0i9lQLio+4FSr3qcEnuH6Cx/n7rO8ElSGCe
 FRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D/zgSAoCVsSdiweHMVDrK8nA0R60nkQkJQGcdVDh1og=;
 b=lcpP4vGtc6uY1yNQYglDcikGlcdPnwiZHnLU+R1/Tbuh1RAweozFwfUU7kF5d6AbSG
 Haf3GhpWYz9YqYY/AnfqsbN6ULaDNAXFQgmFMgBcH/HB1mHkFM8FwXaAJVjDIcVZqiuQ
 EcI9gH4t3O2biXObkWgQyoUIaaUjOqTOKlBlZiJLABNpdFaVtJ3NlaHka5x8mkk+B2Te
 IvoJEXQiU2+M7y1n8oPQWnos7CCl3C+VYDMS6z/QhAKDaUxhIN1mUWDqf59DLMXWng5D
 znbsFXJPNuC0PRk78kl2Mjkc7RGQwp9vNXJZYoot5wswppV/09IBlbCK0J00z7HuDo4Q
 JAfA==
X-Gm-Message-State: APjAAAW/wnsTCVE4fgpJPC63SATHsFetb4U2ad/yVhs2KBKgw1dnJI4n
 R6L9zH38yMVQg1BF+iGDigdzVA==
X-Google-Smtp-Source: APXvYqzyzFsiGyOdKPbaEpxrkE10+1dd2DXNa3Y7sYoWXOI+M+TDGld2VQUrm5tt76IELexF439+dQ==
X-Received: by 2002:a5d:4692:: with SMTP id u18mr18989285wrq.206.1578921726858; 
 Mon, 13 Jan 2020 05:22:06 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id u18sm14692987wrt.26.2020.01.13.05.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 05:22:06 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Date: Mon, 13 Jan 2020 13:21:52 +0000
Message-Id: <20200113132153.27239-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200113132153.27239-1-srinivas.kandagatla@linaro.org>
References: <20200113132153.27239-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 linux-kernel@vger.kernel.org, spapothi@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v6 1/2] dt-bindings: soundwire: add bindings
	for Qcom controller
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch adds bindings for Qualcomm soundwire controller.

Qualcomm SoundWire Master controller is present in most Qualcomm SoCs
either integrated as part of WCD audio codecs via slimbus or
as part of SOC I/O.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/soundwire/qcom,sdw.txt           | 167 ++++++++++++++++++
 1 file changed, 167 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soundwire/qcom,sdw.txt

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
new file mode 100644
index 000000000000..436547f3b155
--- /dev/null
+++ b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
@@ -0,0 +1,167 @@
+Qualcomm SoundWire Controller Bindings
+
+
+This binding describes the Qualcomm SoundWire Controller along with its
+board specific bus parameters.
+
+- compatible:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be "qcom,soundwire-v<MAJOR>.<MINOR>.<STEP>",
+		    Example:
+			"qcom,soundwire-v1.3.0"
+			"qcom,soundwire-v1.5.0"
+			"qcom,soundwire-v1.6.0"
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: the base address and size of SoundWire controller
+		    address space.
+
+- interrupts:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: should specify the SoundWire Controller IRQ
+
+- clock-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: should be "iface" for SoundWire Controller interface clock
+
+- clocks:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: should specify the SoundWire Controller interface clock
+
+- #sound-dai-cells:
+	Usage: required
+	Value type: <u32>
+	Definition: must be 1 for digital audio interfaces on the controller.
+
+- qcom,dout-ports:
+	Usage: required
+	Value type: <u32>
+	Definition: must be count of data out ports
+
+- qcom,din-ports:
+	Usage: required
+	Value type: <u32>
+	Definition: must be count of data in ports
+
+- qcom,ports-offset1:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: should specify payload transport window offset1 of each
+		    data port. Out ports followed by In ports.
+		    More info in MIPI Alliance SoundWire 1.0 Specifications.
+
+- qcom,ports-offset2:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: should specify payload transport window offset2 of each
+		    data port. Out ports followed by In ports.
+		    More info in MIPI Alliance SoundWire 1.0 Specifications.
+
+- qcom,ports-sinterval-low:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: should be sample interval low of each data port.
+		    Out ports followed by In ports. Used for Sample Interval
+		    calculation.
+		    More info in MIPI Alliance SoundWire 1.0 Specifications.
+
+- qcom,ports-word-length:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: should be size of payload channel sample.
+		    More info in MIPI Alliance SoundWire 1.0 Specifications.
+
+- qcom,ports-block-pack-mode:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: should be 0 or 1 to indicate the block packing mode.
+		    0 to indicate Blocks are per Channel
+		    1 to indicate Blocks are per Port.
+		    Out ports followed by In ports.
+		    More info in MIPI Alliance SoundWire 1.0 Specifications.
+
+- qcom,ports-block-group-count:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: should be in range 1 to 4 to indicate how many sample
+		    intervals are combined into a payload.
+		    Out ports followed by In ports.
+		    More info in MIPI Alliance SoundWire 1.0 Specifications.
+
+- qcom,ports-lane-control:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: should be in range 0 to 7 to identify which	data lane
+		    the data port uses.
+		    Out ports followed by In ports.
+		    More info in MIPI Alliance SoundWire 1.0 Specifications.
+
+- qcom,ports-hstart:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: should be number identifying lowerst numbered coloum in
+		    SoundWire Frame, i.e. left edge of the Transport sub-frame
+		    for each port. Values between 0 and 15 are valid.
+		    Out ports followed by In ports.
+		    More info in MIPI Alliance SoundWire 1.0 Specifications.
+
+- qcom,ports-hstop:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: should be number identifying highest numbered coloum in
+		    SoundWire Frame, i.e. the right edge of the Transport
+		    sub-frame for each port. Values between 0 and 15 are valid.
+		    Out ports followed by In ports.
+		    More info in MIPI Alliance SoundWire 1.0 Specifications.
+
+- qcom,dports-type:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: should be one of the following types
+		    0 for reduced port
+		    1 for simple ports
+		    2 for full port
+		    Out ports followed by In ports.
+		    More info in MIPI Alliance SoundWire 1.0 Specifications.
+
+Note:
+	More Information on detail of encoding of these fields can be
+found in MIPI Alliance SoundWire 1.0 Specifications.
+
+= SoundWire devices
+Each subnode of the bus represents SoundWire device attached to it.
+The properties of these nodes are defined by the individual bindings.
+
+= EXAMPLE
+The following example represents a SoundWire controller on DB845c board
+which has controller integrated inside WCD934x codec on SDM845 SoC.
+
+soundwire: soundwire@c85 {
+	compatible = "qcom,soundwire-v1.3.0";
+	reg = <0xc85 0x20>;
+	interrupts = <20 IRQ_TYPE_EDGE_RISING>;
+	clocks = <&wcc>;
+	clock-names = "iface";
+	#sound-dai-cells = <1>;
+	qcom,dports-type = <0>;
+	qcom,dout-ports	= <6>;
+	qcom,din-ports	= <2>;
+	qcom,ports-sinterval-low = /bits/ 8  <0x07 0x1F 0x3F 0x7 0x1F 0x3F 0x0F 0x0F>;
+	qcom,ports-offset1 = /bits/ 8 <0x01 0x02 0x0C 0x6 0x12 0x0D 0x07 0x0A >;
+	qcom,ports-offset2 = /bits/ 8 <0x00 0x00 0x1F 0x00 0x00 0x1F 0x00 0x00>;
+
+	/* Left Speaker */
+	left{
+		....
+	};
+
+	/* Right Speaker */
+	right{
+		....
+	};
+};
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
