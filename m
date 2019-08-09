Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C4687B55
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 15:36:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F70A86E;
	Fri,  9 Aug 2019 15:36:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F70A86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565357818;
	bh=wYgo3elv2uNo737ruDjIwYfToL4A2PccllyB8TQforw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X7ku1klwk03PPzAWriqnMQXpMNz4UqKsFZlrze6RqUp3hgt05L3p5lHFykibTZKir
	 QLVjY7Mu9HvKAkM5h8MIykN7tK+gA+4D2WguvEN5Jf2QZlBKKK0Jl/uyfq31QY19je
	 arUaXPuLo5d8d5BYmBAW0OCoNmE7DVniohoYkn6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F784F805F5;
	Fri,  9 Aug 2019 15:34:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4212EF805E2; Fri,  9 Aug 2019 15:34:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86565F805AA
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 15:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86565F805AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DcQZdgr2"
Received: by mail-wr1-x444.google.com with SMTP id p17so98253715wrf.11
 for <alsa-devel@alsa-project.org>; Fri, 09 Aug 2019 06:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0HujpxJDALuBLWUqjS8zq5NBk/WyCBZfMmdnlRTpNtM=;
 b=DcQZdgr2IlFroNIH+nLIyKRTWFgLTPuEN1bDsv4N8D5zGm8ZqLRiw14VLSCE1WjSjA
 l5cUBLF29k/e6ssUrIqAvYe+WGKfvsLlWyavYiYiDC/Iwo7gZ602Xg6LGySET24t9jLy
 SXznkZWj8N1WtvSXSYngfTpgBTabH4LUTGl9Y2W7Po/wN1EARpyUHyif13pwgzvm0UAF
 k1RX9axwIeRu4C0pVccAi1fG1DmY1/TEIXRTwVIlOuMcDsVGjtT0dKrN3KIlW5zgnZUb
 hK3eiL+bOsp7rzGQV0NoeV6XEjkJYwn7H778pBmYu7kcXctMI5F7AkXm2lYG+1r5r1Da
 fZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0HujpxJDALuBLWUqjS8zq5NBk/WyCBZfMmdnlRTpNtM=;
 b=k0BIy2f0wjOPmuHvi8z+GXtN32hvdl++dGj34AtXBasP2WxTV4UuxFyk1om7WQkIjl
 GVZrGVV5jUglXF4iklf+O0Ug0WYHoP1UQvFSxQduHSQ1l+Hk403w8TZ29xM6Evf//sea
 Nhn5c/cWocKh11iApkJk97JirvtL4JQZ95Q70olBK0MT3p0FeMyDn+7KIhyDXhepmpMG
 sLU/VJtRnQYl7htKYUQGN9tm1qRskYsZI2rzh0quRnAkFh38le4IlKKzZdS77ecTXi9J
 Er9IATCsuFORUDbDkIoUisRNDMr9eF5TTReg5TQxc1e2nOgBpKsICEu1azRy7+Mua9SX
 HWkw==
X-Gm-Message-State: APjAAAUl0Hm67G0NLbKP9TdYrFTSgtsLZavIEYHY8etuiLkdiV5RlqSa
 hGYtWBBZx9pNOkBCTPxloK6+SA==
X-Google-Smtp-Source: APXvYqxcL/4UZ+zBOXcgvw4tHlarYgHxBGZtino0zaUbILQwiVTHaAxi7DlzP3mT4N0JY7khimgnvg==
X-Received: by 2002:adf:f7cd:: with SMTP id a13mr1202327wrq.165.1565357669514; 
 Fri, 09 Aug 2019 06:34:29 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id y18sm5674641wmi.23.2019.08.09.06.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2019 06:34:28 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	broonie@kernel.org
Date: Fri,  9 Aug 2019 14:34:04 +0100
Message-Id: <20190809133407.25918-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190809133407.25918-1-srinivas.kandagatla@linaro.org>
References: <20190809133407.25918-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v3 1/4] dt-bindings: soundwire: add slave
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

This patch adds bindings for Soundwire Slave devices that includes how
SoundWire enumeration address and Link ID are used to represented in
SoundWire slave device tree nodes.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../devicetree/bindings/soundwire/slave.txt   | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soundwire/slave.txt

diff --git a/Documentation/devicetree/bindings/soundwire/slave.txt b/Documentation/devicetree/bindings/soundwire/slave.txt
new file mode 100644
index 000000000000..201f65d2fafa
--- /dev/null
+++ b/Documentation/devicetree/bindings/soundwire/slave.txt
@@ -0,0 +1,51 @@
+SoundWire slave device bindings.
+
+SoundWire is a 2-pin multi-drop interface with data and clock line.
+It facilitates development of low cost, efficient, high performance systems.
+
+SoundWire slave devices:
+Every SoundWire controller node can contain zero or more child nodes
+representing slave devices on the bus. Every SoundWire slave device is
+uniquely determined by the enumeration address containing 5 fields:
+SoundWire Version, Instance ID, Manufacturer ID, Part ID
+and Class ID for a device. Addition to below required properties,
+child nodes can have device specific bindings.
+
+Required properties:
+- compatible:	 "sdw<LinkID><VersionID><InstanceID><MFD><PID><CID>".
+		  Is the textual representation of SoundWire Enumeration
+		  address along with Link ID. compatible string should contain
+		  SoundWire Link ID, SoundWire Version ID, Instance ID,
+		  Manufacturer ID, Part ID and Class ID in order
+		  represented as above and shall be in lower-case hexadecimal
+		  with leading zeroes. Vaild sizes of these fields are
+		  LinkID is 1 nibble,
+		  Version ID is 1 nibble
+		  Instance ID in 1 nibble
+		  MFD in 4 nibbles
+		  PID in 4 nibbles
+		  CID is 2 nibbles
+
+		  Version number '0x1' represents SoundWire 1.0
+		  Version number '0x2' represents SoundWire 1.1
+		  ex: "sdw0110217201000" represents 0 LinkID,
+		  SoundWire 1.0 version slave with Instance ID 1.
+		  More Information on detail of encoding of these fields can be
+		  found in MIPI Alliance DisCo & SoundWire 1.0 Specifications.
+
+SoundWire example for Qualcomm's SoundWire controller:
+
+soundwire@c2d0000 {
+	compatible = "qcom,soundwire-v1.5.0"
+	reg = <0x0c2d0000 0x2000>;
+
+	spkr_left:wsa8810-left{
+		compatible = "sdw0110217201000";
+		...
+	};
+
+	spkr_right:wsa8810-right{
+		compatible = "sdw0120217201000";
+		...
+	};
+};
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
