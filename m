Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B662E9F31
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 16:37:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0EDC2339;
	Wed, 30 Oct 2019 16:37:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0EDC2339
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572449871;
	bh=SQe3gislCw6uS1CzfnOUe+NoUm/KmUazwb5sYSFxoVo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Iv3x6qF5CYPGVCKfKp/MvA63Oi7T+wxoOQrkDlNykHh41WYykWkeLFZpTJIpHHbZM
	 NZxq3npKK3KwGx/g5DdPUhxiqLVkCesuwgjdb5Fhd/54/nDyyCZRPv/cc1TR8hyT+n
	 G/bEgkaTFSmpzNQLC2mr4WDYYqyUDxTU5Jybn3OU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76659F8044A;
	Wed, 30 Oct 2019 16:36:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D189F802BD; Wed, 30 Oct 2019 16:32:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 400C8F80361
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 16:31:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 400C8F80361
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Tfk6xCdy"
Received: by mail-wm1-x344.google.com with SMTP id c22so2660736wmd.1
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 08:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yEcXAg/eBx99MOhVXS0VS0FuBBl4qtw5QHmFpVPcox4=;
 b=Tfk6xCdyxctH526OGxFc7sHM3ABLiZQfJU7KJXkTCsFK0RSPDEserF5W7UtlU4GI2s
 ksIIYB+t/jRtdS7o2VzkeQBiPyPcEPu28ojwqJkB+u6t8g6gI58twJCMx1yq4xOcylWy
 D9zy+saVH09J/pqDrQ3nTTPvNSDirwy1uju32Cy/XCQPfpUwzX8LuNWG+3Q4Qj4hEWS5
 radTzrrU/UohE2MrvUfmU1g9DJjCAFkfy0EYk08Dgq7s2UDMt0wscwkSN5+gw3lQdwy/
 afjXx3uJpRED31istM335kWirpcPR+1hUG37A+m5HFDTo5dzIbj5QjHUjL+vyNL5XWaa
 /bFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yEcXAg/eBx99MOhVXS0VS0FuBBl4qtw5QHmFpVPcox4=;
 b=HolwISob8d/JI2+23vPXJmAsyHAmhi6LolhQNtQ0b69KJsXWMeRjBKwGThVEjsvxai
 FoPiXz4rpo/l+yYr7TPuCtIV5AkgVcpSB5+CqGijWF0u97fZqM/vc665t5AlhJ49+yt7
 BIA5V+6NHfL5DO2HSNnKjETuZUMWgAWvjB021P1M3+vb54AGSK+DHSWapdQcBAn4KfGU
 dmEYKgPqwUmJOFEvhNbu/8djQlI8DIZGFXXOS8X4Ld3t3o1r2UfCbtkhishqsAmRL+Np
 IZhxjKsC2k8j9/8JbOq8OCxLI+gI7/L3hC2LKe7hmAn9ydo69LMXv6c4pwRzVW9TQyCp
 Z0+w==
X-Gm-Message-State: APjAAAUbmb2xe3oqwHDFJy/UvTlqbrMAseVDU++oKe98VWEyXOokoipB
 xAOzDShgwszwEJ86OXYofq93vfhEO7U=
X-Google-Smtp-Source: APXvYqwA52fMPETGCV/5rSTe7mTTegOMwE4pKX/SR9n5jA8RzT74H/2Jp2SPcFM7YMiRtUq0pbCVhQ==
X-Received: by 2002:a05:600c:2551:: with SMTP id
 e17mr34010wma.51.1572449514794; 
 Wed, 30 Oct 2019 08:31:54 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id u21sm417329wmu.27.2019.10.30.08.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 08:31:54 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh@kernel.org,
	vkoul@kernel.org
Date: Wed, 30 Oct 2019 15:31:49 +0000
Message-Id: <20191030153150.18303-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191030153150.18303-1-srinivas.kandagatla@linaro.org>
References: <20191030153150.18303-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, spapothi@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v4 1/2] dt-bindings: soundwire: add bindings
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
---
 .../bindings/soundwire/qcom,sdw.txt           | 179 ++++++++++++++++++
 1 file changed, 179 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soundwire/qcom,sdw.txt

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
new file mode 100644
index 000000000000..4f58de490f0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
@@ -0,0 +1,179 @@
+Qualcomm SoundWire Controller Bindings
+
+
+This binding describes the Qualcomm SoundWire Controller along with its
+board specific bus parameters.
+
+- compatible:
+	Usage: required
+	Value type: <stringlist>
+	Definition:  Should be "qcom,soundwire-v1.3.0"
+
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: the base address and size of SoundWire controller
+		    address space.
+
+- interrupts:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: should specify the SoundWire Controller IRQ.
+
+- clock-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: should be "iface" for SoundWire Controller interface clock.
+
+- clocks:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: should specify the SoundWire Controller interface clock.
+
+- #sound-dai-cells:
+	Usage: required
+	Value type: <u32>
+	Definition: must be 1 for digital audio interfaces on the controller.
+
+- qcom,dout-ports:
+	Usage: required
+	Value type: <u32>
+	Definition: must be count of data out ports, count of both in and
+		    out ports together should not exceed 15.
+
+- qcom,din-ports:
+	Usage: required
+	Value type: <u32>
+	Definition: must be count of data in ports, count of both in and
+		    out ports together should not exceed 15.
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
+		    1 for simple port
+		    2 for full port
+		    Out ports followed by In ports.
+		    More info in MIPI Alliance SoundWire 1.0 Specifications.
+
+- #address-cells:
+	Usage: Required
+	Value type: <u32>
+	Definition: Should be 2 refer to soundwire-controller.yaml
+
+- #size-cells:
+	Usage: Required
+	Value type: <u32>
+	Definition: Should be 0 refer to soundwire-controller.yaml
+
+Note:
+	More Information on detail of encoding of these fields can be
+found in MIPI Alliance SoundWire 1.0 Specifications.
+
+= SoundWire devices
+Each subnode of the bus represents SoundWire device attached to it.
+Refer to soundwire/soundwire-controller.yaml for details of required bindings.
+Each sub node can have its device specific bindings that are not documented
+here.
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
+	#address-cells = <2>;
+	#size-cells = <0>;
+	/* Left Speaker */
+	left {
+		....
+	};
+
+	/* Right Speaker */
+	right {
+		....
+	};
+};
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
