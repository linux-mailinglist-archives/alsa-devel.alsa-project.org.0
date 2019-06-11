Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0600D3C92E
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2019 12:43:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8508B16EA;
	Tue, 11 Jun 2019 12:42:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8508B16EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560249814;
	bh=PTFlq/0wzjZn+NfPSdPK/I/zWaIg5pYX7e2lu4fZILo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=skz8wQ2CbnUMRPnG6WtYagnUSuvIpb59hYkAuRda4Xn7OhIQ4SShBRJa6vyOlkA49
	 fso0LydukFwFHG39BCYMEStPBL7eXNt6FWpHBUPQkDKNU08xhUyqF0AtZynBdFfWJQ
	 U4Cth1LxWkND96z6TZevq2gH3pEqPiqILBLD+mgM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 362A0F89728;
	Tue, 11 Jun 2019 12:41:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54471F89711; Tue, 11 Jun 2019 12:41:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D84DF8961D
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 12:41:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D84DF8961D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="yz9mV4N+"
Received: by mail-wr1-x444.google.com with SMTP id n4so12390052wrw.13
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 03:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Gpz9OAv6XE5jXE+cWS3impQo2MFLCRNnAJiI/H46i8=;
 b=yz9mV4N+vItMSb0ZebnnzAvl58O0ImcBvJpG+VgMse/+oVEetTdiTMgqrMARsDg4Ca
 /Pflabz2rgCT3/eYvf/xJWmONndZxu8tpveX6p7Lz8wpb4m53mr2+vyltKqHt/l5Dkr3
 qDPFzKHCkgMXSXmb2L+53zNmiTYUhnJi/qI3IPPH/TmGuN2hUQZvBFW63jmx9tKBTo8P
 ySQkITia6tY0svstKyHYwb1Vvd+a1uVeDm2C1Naxm5VdQ1acAJe7lXFxQ/M70CiSq/u5
 G5yL3SXtZ3dTXs6TQ1zFJ+axj3T4s8IkMUSoYO5wiO07q183uZ2Ma+cT/OFkUV1TEDHs
 jfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Gpz9OAv6XE5jXE+cWS3impQo2MFLCRNnAJiI/H46i8=;
 b=I4IUHqCmKtRIpNZvQgbqqlRz+zVwMCU/WHaExhnjPsa2BoqJEd9Nzaqm0/cV0mkQps
 OoL46436qX05y6mmQMy6EjVVj9dvX6SmHPLSq+tDHtAq6YaYLKb3tAZ0/subLr0BH6wi
 ah0rHPgXY6NDXHCde1FlnZM9VPugWq8i6B7qUDm69iBxa7pfHpXGpSrN1IIbPhj7iYsU
 Q/XX8hmnHgQB0uiKdr0ZD5Rf0D8cqa3vcS6fISSgZgQYL3yZUP2CSajmUzR/5TGycjTn
 OdIdWegXDtssP3acEx/3sjSHdCoHGLj7aJgNWPrjpweg97Rz8rrD26BgHbDREIKTYIyj
 0Q6w==
X-Gm-Message-State: APjAAAWdk5q2cZtmTmo9LysLjPeIMWor8cC9vCNmG5/kUXm9zuQDp/N2
 1Pv+EdfZ4KVt1zzd6OjEY7pmgw==
X-Google-Smtp-Source: APXvYqw0VHgX1azWWjQDETpNylE10g6+4P3bUZ01iGYUimXj1pqhrwetgi3EVywiQlTKCKQS9Y0+Xg==
X-Received: by 2002:a5d:4f81:: with SMTP id d1mr25750987wru.156.1560249659592; 
 Tue, 11 Jun 2019 03:40:59 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id c65sm2359614wma.44.2019.06.11.03.40.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 03:40:59 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Date: Tue, 11 Jun 2019 11:40:39 +0100
Message-Id: <20190611104043.22181-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190611104043.22181-1-srinivas.kandagatla@linaro.org>
References: <20190611104043.22181-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, bgoswami@quicinc.com
Subject: [alsa-devel] [RFC PATCH 1/5] dt-bindings: soundwire: add slave
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
 .../devicetree/bindings/soundwire/bus.txt     | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soundwire/bus.txt

diff --git a/Documentation/devicetree/bindings/soundwire/bus.txt b/Documentation/devicetree/bindings/soundwire/bus.txt
new file mode 100644
index 000000000000..19a672b0d528
--- /dev/null
+++ b/Documentation/devicetree/bindings/soundwire/bus.txt
@@ -0,0 +1,48 @@
+SoundWire bus bindings.
+
+SoundWire is a 2-pin multi-drop interface with data and clock line.
+It facilitates development of low cost, efficient, high performance systems.
+
+SoundWire controller bindings are very much specific to vendor.
+
+Child nodes(SLAVE devices):
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
