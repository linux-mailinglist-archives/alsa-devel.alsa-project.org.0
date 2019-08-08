Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 963D2864B8
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 16:48:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44DC81615;
	Thu,  8 Aug 2019 16:47:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44DC81615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565275714;
	bh=uDWVabmAP6PYuBI1SL1AwWsqzJieqKsQ9IqqIEjZ0Nk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pVBElBtXp4IeFAYuOfjyYKKatVGL3RsTPLZuOhOnA/9LSU7LySzyjQXyxAcf4BwAO
	 t9FIaMzYCbYXK89hWcxBIXFpbTX+nlqSBUQpqSnkqCX8umbmuAhyseDjqMJIUCRV6G
	 u/g+1zlpJ1qeup6CJF4Zgytwr/LaRwR6KRMP5HmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1B84F805FB;
	Thu,  8 Aug 2019 16:45:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E193BF805A1; Thu,  8 Aug 2019 16:45:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 512F1F800E3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 16:45:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 512F1F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="lplD0g3m"
Received: by mail-wm1-x343.google.com with SMTP id v19so2694637wmj.5
 for <alsa-devel@alsa-project.org>; Thu, 08 Aug 2019 07:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cdCXxiJkZwv+z5nIdjZ1AKoaP38PZYsnJaBif7OuI/w=;
 b=lplD0g3mm2VDvN4ZziBK53kO4dWPlXrDd+bIfvsd9Q/afBYVz3TbQIgbfVvh6CyFrB
 KgKT+8WNETIsbVlqEO3riSawg/fvGWgkQxR9ZRXykPLUfH7Z7YlFTvgj0nOLewJ80gHY
 QWGem+5rrNBDL/MkNhYGhbETd6tgFRanlojOa+X4CKUngQDU5gI6ZjDJu1pjKqD/qXIW
 vybdtVeWFf7Fq627Jd58d0inlRXE2k+HLR4oQUEGr+IKP9H9Y1AjVavwDV2ji+/2RvBK
 OMnGQOvqqUdZU7xrisepFW3DhOpGwuEvhzZuW74SJeqV792IPUOKBxgV2dG57wP/XCEl
 rMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cdCXxiJkZwv+z5nIdjZ1AKoaP38PZYsnJaBif7OuI/w=;
 b=tlr/KB1a+8l7oijPXwzjWhXzeW/yvauO9J+Zwjvr8Z0u7113/kA09yYg+vfj+CZG1h
 ELIXkUAYbZqdiUkXW90DY0howZkk0Gw/Eb3gwPa1caRJowTPi8rmNRYo/23zsivqO8yI
 D5UcHzrsROKR1qNSyPaNF1cQ1cq8c1FsBgSeRAZcQN2c/CaBQQLx5Sy8bJjKBBMDqcgT
 dWvsNEMEVMrPgUTXR9zbyA7mLTzaO/ZQg4Sor13cfIjhQ4Ifis+iMg2SnI8eWFSCTHx8
 GWJmMgMXm64tJdetTlXQUbFfu8FS3HfqXHo6bNWIsuwC6cbmindLSIR9G9mL/UjVsMKl
 o1iA==
X-Gm-Message-State: APjAAAXJeKr5hhXusoTuEchPc6mNe669BxwWKl5raXo1zhJegRNGTJou
 jage+F1vHvV61+JtBGrwa57+mA==
X-Google-Smtp-Source: APXvYqyySBvQDtGOAbhZvwKWDq+6U8mjD9rtieI80XujmHaIyhwAVfgGvszj3f2Jrs1j1a/mhV/y/g==
X-Received: by 2002:a1c:6c14:: with SMTP id h20mr5098118wmc.168.1565275525435; 
 Thu, 08 Aug 2019 07:45:25 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id g15sm2009060wrp.29.2019.08.08.07.45.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 07:45:24 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	broonie@kernel.org
Date: Thu,  8 Aug 2019 15:45:01 +0100
Message-Id: <20190808144504.24823-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190808144504.24823-1-srinivas.kandagatla@linaro.org>
References: <20190808144504.24823-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v2 1/4] dt-bindings: soundwire: add slave
	bindings
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

This patch adds bindings for Soundwire Slave devices which includes how
SoundWire enumeration address is represented in SoundWire slave device
tree nodes.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../devicetree/bindings/soundwire/slave.txt   | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soundwire/slave.txt

diff --git a/Documentation/devicetree/bindings/soundwire/slave.txt b/Documentation/devicetree/bindings/soundwire/slave.txt
new file mode 100644
index 000000000000..b8e8d34bbc92
--- /dev/null
+++ b/Documentation/devicetree/bindings/soundwire/slave.txt
@@ -0,0 +1,46 @@
+SoundWire slave device bindings.
+
+SoundWire is a 2-pin multi-drop interface with data and clock line.
+It facilitates development of low cost, efficient, high performance systems.
+
+SoundWire slave devices:
+Every SoundWire controller node can contain zero or more child nodes
+representing slave devices on the bus. Every SoundWire slave device is
+uniquely determined by the enumeration address containing 5 fields:
+SoundWire Version, Instance ID, Manufacturer ID, Part ID and Class ID
+for a device. Addition to below required properties, child nodes can
+have device specific bindings.
+
+Required property for SoundWire child node if it is present:
+- compatible:	 "sdwVER,MFD,PID,CID". The textual representation of
+		  SoundWire Enumeration address comprising SoundWire
+		  Version, Manufacturer ID, Part ID and Class ID,
+		  shall be in lower-case hexadecimal with leading
+		  zeroes suppressed.
+		  Version number '0x10' represents SoundWire 1.0
+		  Version number '0x11' represents SoundWire 1.1
+		  ex: "sdw10,0217,2010,0"
+
+- sdw-instance-id: Should be ('Instance ID') from SoundWire
+		  Enumeration Address. Instance ID is for the cases
+		  where multiple Devices of the same type or Class
+		  are attached to the bus.
+
+SoundWire example for Qualcomm's SoundWire controller:
+
+soundwire@c2d0000 {
+	compatible = "qcom,soundwire-v1.5.0"
+	reg = <0x0c2d0000 0x2000>;
+
+	spkr_left:wsa8810-left{
+		compatible = "sdw10,0217,2010,0";
+		sdw-instance-id = <1>;
+		...
+	};
+
+	spkr_right:wsa8810-right{
+		compatible = "sdw10,0217,2010,0";
+		sdw-instance-id = <2>;
+		...
+	};
+};
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
