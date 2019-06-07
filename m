Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AA1386B0
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 11:02:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B53A61664;
	Fri,  7 Jun 2019 11:01:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B53A61664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559898139;
	bh=mosuRVuUt2rWOyYmnSGW2VN1ZIxIMAsL7s2I6ZWejs0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ss+kTxGi89JY2t+/e8ONDadqrFl8CYDdJqVT1V74EccnvqbBi03FV5ztOF0gQXTIi
	 p8b+2CL4uFxzSJCRgoRhIPfyZ+YJaWwEkOj4QHT2/Q6sfOpLW3jU8/RVahvjbo7wSc
	 ezEiOrQ0Cf5GdTWWbtoJGNWM82lTR0AOv01lqBi4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74033F89748;
	Fri,  7 Jun 2019 10:57:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A94DFF896EE; Fri,  7 Jun 2019 10:57:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBCC8F8972E
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 10:57:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBCC8F8972E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ik8kIg7c"
Received: by mail-wm1-x342.google.com with SMTP id v19so1101281wmj.5
 for <alsa-devel@alsa-project.org>; Fri, 07 Jun 2019 01:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XeGdpoJZKO8xonRoPvjOdBGnzDhlf82qyNmmV40WgQg=;
 b=ik8kIg7c8gHngYFvOgvLDNjZVFS0J/MarZ6AQ00p4jM6fEgI3oml1J5wrZ73JN56OK
 YSEbnUcuMOkB98vLI5RKnfAj1721k9cgTHfCgU9ueZz9vbnwgD2ZcR4k2e+yE1bWSQqv
 4Mo/msNohoAFO3NM2ePmxAdc9vIk9DQNBpo/By/YntrwY6ylDF2d9DVZMhLKdHr8Nt33
 v7vKXR71sucu5sdOFRhvGYcV3e7L6c640BmFQuJE60RdBfUhcPpAIlULNCtn8bVAisEr
 wr3d1Cxl9MNMPyrQvMTZQSeoH4F8nkFQmUPQSTKIsYGz0KfTFK9YAkoRHF0ESOWtl5aO
 wM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XeGdpoJZKO8xonRoPvjOdBGnzDhlf82qyNmmV40WgQg=;
 b=NXY+72nQzFBYAYHJZE/2a+13T9quEqxPNUkJjpMgy668fq+Wk1rVxMtPreu1ZNuUJ8
 oipasYv6fJv/zACtHTiUtqHijswWDmPO0TYJbbgZjgrx4tEba0JiMw+DRwbyRfFhbKZ3
 Q1+Cu2H5H4mQ539iRqZhcG92SL7QySgIvQZJtC5DFGveuzy4Un+vNVinTDijEQEv29y6
 yVx538Td/X7+QA+2PhToMZ9MJlWbyn7IA138Q09wyO84/7FK4JwiYTpWrsj1tcdcyxhH
 n9Lai6hR15LaoAMw105KP1Ks+D18KnOC0rlox3d9o4yCZ34e3bmNWL22GsagssEVsOC9
 0Mjw==
X-Gm-Message-State: APjAAAVuFUE0JTrfdO1KhKhEXZfEek1bpeIdRtdKZ5HqA+WorW0oOF/F
 oq1fxhkffBngOuReQU4UPhQsNA==
X-Google-Smtp-Source: APXvYqwJNH+r7RO5nlL9EBeByfxYr+83+doptRLLzcM8m5ZBDjJG90TrRhK96lF2uYa2UavRZkGe1g==
X-Received: by 2002:a1c:e3c1:: with SMTP id a184mr2606525wmh.24.1559897833262; 
 Fri, 07 Jun 2019 01:57:13 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id d10sm2035308wrh.91.2019.06.07.01.57.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 07 Jun 2019 01:57:12 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Date: Fri,  7 Jun 2019 09:56:42 +0100
Message-Id: <20190607085643.932-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
References: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [RFC PATCH 5/6] dt-bindings: soundwire: add bindings
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
 .../bindings/soundwire/qcom,swr.txt           | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soundwire/qcom,swr.txt

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,swr.txt b/Documentation/devicetree/bindings/soundwire/qcom,swr.txt
new file mode 100644
index 000000000000..eb84d0f4f36f
--- /dev/null
+++ b/Documentation/devicetree/bindings/soundwire/qcom,swr.txt
@@ -0,0 +1,62 @@
+Qualcomm SoundWire Controller
+
+This binding describes the Qualcomm SoundWire Controller Bindings.
+
+Required properties:
+
+- compatible:		Must be "qcom,soundwire-v<MAJOR>.<MINOR>.<STEP>",
+	 		example:
+			"qcom,soundwire-v1.3.0"
+			"qcom,soundwire-v1.5.0"
+			"qcom,soundwire-v1.6.0"
+- reg:			SoundWire controller address space.
+- interrupts:		SoundWire controller interrupt.
+- clock-names:		Must contain "iface".
+- clocks:		Interface clocks needed for controller.
+- #sound-dai-cells:	Must be 1 for digital audio interfaces on the controllers.
+- #address-cells:	Must be 1 for SoundWire devices;
+- #size-cells:		Must be <0> as SoundWire addresses have no size component.
+- qcom,dout-ports: 	Must be count of data out ports
+- qcom,din-ports: 	Must be count of data in ports
+- qcom,ports-offset1:	Must be frame offset1 of each data port.
+			Out followed by In. Used for Block size calculation.
+- qcom,ports-offset2: 	Must be frame offset2 of each data port.
+			Out followed by In. Used for Block size calculation.
+- qcom,ports-sinterval-low: Must be sample interval low of each data port.
+			Out followed by In. Used for Sample Interval calculation.
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
+	#address-cells = <1>;
+	#size-cells = <0>;
+	qcom,dout-ports	= <6>;
+	qcom,din-ports	= <2>;
+	qcom,ports-sinterval-low =/bits/ 8  <0x07 0x1F 0x3F 0x7 0x1F 0x3F 0x0F 0x0F>;
+	qcom,ports-offset1 = /bits/ 8 <0x01 0x02 0x0C 0x6 0x12 0x0D 0x07 0x0A >;
+	qcom,ports-offset2 = /bits/ 8 <0x00 0x00 0x1F 0x00 0x00 0x1F 0x00 0x00>;
+
+	/* Left Speaker */
+	wsa8810@1{
+		....
+		reg = <1>;
+	};
+
+	/* Right Speaker */
+	wsa8810@2{
+		....
+		reg = <2>;
+	};
+};
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
