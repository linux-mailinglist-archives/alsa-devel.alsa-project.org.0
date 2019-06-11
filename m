Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 019AF3C93C
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2019 12:45:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94B5E171D;
	Tue, 11 Jun 2019 12:44:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94B5E171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560249931;
	bh=gqXX+53EXW9Y2fF11UKtri9D8/s4NvyJwjqQLiXyfFY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A66pylzKNhjeaytTybL1z06K1Skv6eUZBAXrlUTtzzs2X8Fr4rzRF98V/k2Vz03EM
	 IXxr3kXEup1fJlu0KYLqlCJrptJSTLRssqY0u1Oqn4Hs1YLV9BGqLZIf0M+dmZHAAj
	 Xx7kzWjzmgJ6cw4oxaVj33RgTvVJzw26UXXXEJkM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DBBFF89742;
	Tue, 11 Jun 2019 12:41:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 924F6F89728; Tue, 11 Jun 2019 12:41:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CC75F8961D
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 12:41:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CC75F8961D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QUoqo2jm"
Received: by mail-wr1-x441.google.com with SMTP id x4so9790030wrt.6
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 03:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XkV4oZs6ZiC2qzQJvCHYzSVuaz5P2YoXcRt/ldJXf5U=;
 b=QUoqo2jm13Ah8FKoW9ZQffD7RxI2rPxaShyjImH5esJ3XGLFgOOSuXXn6Q6zUEWzve
 FoGVpsrmEoizOPupYvUMsyq0S/ncIbTuVNUAnkQPXp7Dr2a57Fcm/08o3KYvLJbbrUGG
 aYWjHG0lr7QZip82Nshzyn3AI0/D5ePUw//y/Fjys1hV+qhmCIN2Kr1I/v5Z/pXOjaOM
 3Zpr3NpZZft4km8qUpT7fcVj4DamJ0Xe9ab7TqEuIy/5P5lSO1gbHrOvAi/iZQ9jLZsF
 BMPpv01TZvuS2Z28DIBp1qlY1IkuclNetRMIcNmjjxJj2j4QxbLUVdbPFMv5KwQyVgUp
 UJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XkV4oZs6ZiC2qzQJvCHYzSVuaz5P2YoXcRt/ldJXf5U=;
 b=UYvq/By0tEN/qtlpoKmJA0TjTMkAiYaq+b4Gr/+6nojV+N+fvBjJeH40qqQkk5vs9z
 5m66+YFW+XXeZvRUlM4p7jGv+OifNV93fVNALyVGDRl4KMDX38ujvEfvipr9I+yKa2uD
 HsIz7clzzt+gRlGrHktA2BWnXIxH7hV2Fxk/1+9LHxAUTrD1rG+NW8pJU4jBnf1hgeYe
 eTDoyPsrUO62k3KmHCOblSD2gR8NIsZSCEH18Frj+YMQ4SuBgTadrExlblTZ/tYsIErI
 C6SMsr614KKYP2U0GpNQG7bFS48GFMC6fyluEqVd5shENr/fZeMiE8pfd7OEUB8kuVvM
 GUkA==
X-Gm-Message-State: APjAAAUwKanpOngvyuJuCGz1uY5Yh6Lf9TH5PR80gEDZGF73zKjqVatQ
 LHcwWVYqM1vxaBLZ0HYafvdfMg==
X-Google-Smtp-Source: APXvYqwfFkBFylnzRecASi8Zz0rbC6zl7wEOF2/dyq1l7Bhc83VPv5YNjRcpF6qSsCV/HdegblZWcQ==
X-Received: by 2002:adf:e2c7:: with SMTP id d7mr28417773wrj.272.1560249662909; 
 Tue, 11 Jun 2019 03:41:02 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id c65sm2359614wma.44.2019.06.11.03.41.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 03:41:02 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Date: Tue, 11 Jun 2019 11:40:42 +0100
Message-Id: <20190611104043.22181-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190611104043.22181-1-srinivas.kandagatla@linaro.org>
References: <20190611104043.22181-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, bgoswami@quicinc.com
Subject: [alsa-devel] [RFC PATCH 4/5] dt-bindings: ASoC: Add WSA881x bindings
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

This patch adds bindings for WSA8810/WSA8815 Class-D Smart Speaker
Amplifier. This Amplifier also has a simple thermal sensor for
over temperature and speaker protection.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/sound/qcom,wsa881x.txt           | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.txt

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.txt b/Documentation/devicetree/bindings/sound/qcom,wsa881x.txt
new file mode 100644
index 000000000000..582db402a482
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.txt
@@ -0,0 +1,27 @@
+Bindings for Qualcomm WSA8810/WSA8815 Class-D Smart Speaker Amplifier
+
+WSA8810 is a class-D smart speaker amplifier and WSA8815 is a high-output
+power class-D smart speaker amplifier. This amplifier uses SoundWire
+digital audio as primary interface.
+
+Required properties with SoundWire Interface:
+
+- compatible:		Should be textual representation of SoundWire Enumeration
+			address.
+			Refer to soundwire/bus.txt for details.
+			Should be "sdw10,0217,2010,0" for WSA8810
+- sdw-instance-id:	Should be ('Instance ID') from SoundWire Enumeration
+		    	address.
+			Refer to soundwire/bus.txt for details.
+- pd-gpios: 		Should be phandle and gpio pair for
+			Powerdown/Shutdown pin.
+- #thermal-sensor-cells: Should be 0 
+
+Example:
+
+spkr_left:wsa8810-left{
+	compatible = "sdw10,0217,2010,0";
+	sdw-instance-id = <1>;
+	#thermal-sensor-cells = <0>;
+	...
+};
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
