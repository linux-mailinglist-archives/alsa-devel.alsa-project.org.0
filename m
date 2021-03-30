Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F5634EAFD
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 16:49:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BFC31685;
	Tue, 30 Mar 2021 16:48:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BFC31685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617115766;
	bh=mIKsPcpbmtZd+fJB4PsZ2Wq3HNhgoZ22DLZAFtfgmGg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oOY6SUVP4XVEFO9tvZ76eO7jHop6/e5jx3mHEr3XARetn+plunX8AFurL9ZwAD7Dv
	 K+QF4evIKG/43wEIffu6BPYbBuoYh2V/DOrCd4vUkCRzIoZec+2PkAmbvpJyJmYDfT
	 KAYQplPz5Rha+50ptZATsfbMAsB8G+c7Gzxbpm0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64878F80431;
	Tue, 30 Mar 2021 16:47:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA08CF8014E; Tue, 30 Mar 2021 16:47:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A82B1F8014E
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 16:47:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A82B1F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="B+vUmE2a"
Received: by mail-ej1-x634.google.com with SMTP id hq27so25225236ejc.9
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 07:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=96IKLbOURC0YjosZF10ff1jryU9fCjeBBqqAs+cW9Zo=;
 b=B+vUmE2atWiIRf7GIibr3udvr0xoOQgMm1tLReuc+eaDWeQuoxFRgDgF5NZp+OUeg/
 zTN0qo2hY9Xapgy7PcQPcU7Paw28NSnYH9yUPEX76DZ0N1YiIqo+n2F3CXdDE84XiOxI
 rSiS9Ig3JGTfhrucrIlMPvAyWb9BOghGud31nBJ9/TMvfuaLQBU00g3OxjfCC513zepJ
 WXeWabkFTQjEur1soBDV3KNhfRUPKc46vTL9MKNUWBDsUCzjguqsJF3ycu24jYWW1kWY
 /a1jRj5qE/VqcD9MfBiJrC9I7h35N8gdBbPT3skv2AzUTfHlK082f/RxkhQTCjMq2SU4
 J/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=96IKLbOURC0YjosZF10ff1jryU9fCjeBBqqAs+cW9Zo=;
 b=p5FwVOIkrS7R3FBbhwweP1LmFM19i+4Jdjkb0WVi1C/7BKHAHvtKUolx5pdsO8Z5W7
 Jhqe4nFqcJI4V8TgcFOndXb9hjrjpt7vx/GLYC/rplv6xgkuuo6OkLITD3v/Ntfei+Rb
 rO18xyOCe/6Oh7soVLJ9eFeWyklStTLyt26a8jRLVxhfboJxycXIj2I/n5xBsSsbbPsb
 LbotiGBavlvXkNCeJXe6Clcd3SLCe4wyeT8JdDBk+1ZKcAEiHx8ZsQFBebf4M2xPbF06
 VO41diDBkHHSKroG59IRc14zZpxv9nqGf4seZOOKYLxbIT0rSMsOVldPFWkyevPu6ygd
 cf2A==
X-Gm-Message-State: AOAM5309O2qlu7nGuR/KtAzoeZX7ru2WDi7q7YSAkI3YDc6kAH3TxduV
 adBMydqAO6hM27bidkaN6G2NEg==
X-Google-Smtp-Source: ABdhPJzeVYSMF3HFVyOYMaUU79Txm34KLYEbu6l9R0FmR98SPUhoLGCE86RKhaobZPI3KkPCP0jmUg==
X-Received: by 2002:a17:907:2642:: with SMTP id
 ar2mr33729453ejc.145.1617115650095; 
 Tue, 30 Mar 2021 07:47:30 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id n16sm11520383edr.42.2021.03.30.07.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 07:47:29 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v6 1/9] dt-bindings: soundwire: qcom: clarify data port bus
 parameters
Date: Tue, 30 Mar 2021 15:47:11 +0100
Message-Id: <20210330144719.13284-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210330144719.13284-1-srinivas.kandagatla@linaro.org>
References: <20210330144719.13284-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Some of the parameters for data ports are not applicable or not implemented
in IP. So mark them as invalid/not applicable in DT so that controller is
aware of this.

Add comment to these bindings to provide more clarity on the values!

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../bindings/soundwire/qcom,sdw.txt           | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
index b104be131235..b93a2b3e029d 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
+++ b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
@@ -54,6 +54,8 @@ board specific bus parameters.
 	Value type: <prop-encoded-array>
 	Definition: should specify payload transport window offset1 of each
 		    data port. Out ports followed by In ports.
+		    Value of 0xFF indicates that this option is not implemented
+		    or applicable for the respective data port.
 		    More info in MIPI Alliance SoundWire 1.0 Specifications.
 
 - qcom,ports-offset2:
@@ -61,6 +63,8 @@ board specific bus parameters.
 	Value type: <prop-encoded-array>
 	Definition: should specify payload transport window offset2 of each
 		    data port. Out ports followed by In ports.
+		    Value of 0xFF indicates that this option is not implemented
+		    or applicable for the respective data port.
 		    More info in MIPI Alliance SoundWire 1.0 Specifications.
 
 - qcom,ports-sinterval-low:
@@ -69,12 +73,16 @@ board specific bus parameters.
 	Definition: should be sample interval low of each data port.
 		    Out ports followed by In ports. Used for Sample Interval
 		    calculation.
+		    Value of 0xFF indicates that this option is not implemented
+		    or applicable for the respective data port.
 		    More info in MIPI Alliance SoundWire 1.0 Specifications.
 
 - qcom,ports-word-length:
 	Usage: optional
 	Value type: <prop-encoded-array>
 	Definition: should be size of payload channel sample.
+		    Value of 0xFF indicates that this option is not implemented
+		    or applicable for the respective data port.
 		    More info in MIPI Alliance SoundWire 1.0 Specifications.
 
 - qcom,ports-block-pack-mode:
@@ -84,6 +92,8 @@ board specific bus parameters.
 		    0 to indicate Blocks are per Channel
 		    1 to indicate Blocks are per Port.
 		    Out ports followed by In ports.
+		    Value of 0xFF indicates that this option is not implemented
+		    or applicable for the respective data port.
 		    More info in MIPI Alliance SoundWire 1.0 Specifications.
 
 - qcom,ports-block-group-count:
@@ -92,6 +102,8 @@ board specific bus parameters.
 	Definition: should be in range 1 to 4 to indicate how many sample
 		    intervals are combined into a payload.
 		    Out ports followed by In ports.
+		    Value of 0xFF indicates that this option is not implemented
+		    or applicable for the respective data port.
 		    More info in MIPI Alliance SoundWire 1.0 Specifications.
 
 - qcom,ports-lane-control:
@@ -100,6 +112,8 @@ board specific bus parameters.
 	Definition: should be in range 0 to 7 to identify which	data lane
 		    the data port uses.
 		    Out ports followed by In ports.
+		    Value of 0xFF indicates that this option is not implemented
+		    or applicable for the respective data port.
 		    More info in MIPI Alliance SoundWire 1.0 Specifications.
 
 - qcom,ports-hstart:
@@ -109,6 +123,8 @@ board specific bus parameters.
 		    SoundWire Frame, i.e. left edge of the Transport sub-frame
 		    for each port. Values between 0 and 15 are valid.
 		    Out ports followed by In ports.
+		    Value of 0xFF indicates that this option is not implemented
+		    or applicable for the respective data port.
 		    More info in MIPI Alliance SoundWire 1.0 Specifications.
 
 - qcom,ports-hstop:
@@ -118,6 +134,8 @@ board specific bus parameters.
 		    SoundWire Frame, i.e. the right edge of the Transport
 		    sub-frame for each port. Values between 0 and 15 are valid.
 		    Out ports followed by In ports.
+		    Value of 0xFF indicates that this option is not implemented
+		    or applicable for the respective data port.
 		    More info in MIPI Alliance SoundWire 1.0 Specifications.
 
 - qcom,dports-type:
@@ -128,6 +146,8 @@ board specific bus parameters.
 		    1 for simple ports
 		    2 for full port
 		    Out ports followed by In ports.
+		    Value of 0xFF indicates that this option is not implemented
+		    or applicable for the respective data port.
 		    More info in MIPI Alliance SoundWire 1.0 Specifications.
 
 Note:
-- 
2.21.0

