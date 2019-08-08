Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5F7864C4
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 16:49:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B5DE85D;
	Thu,  8 Aug 2019 16:48:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B5DE85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565275779;
	bh=gqXX+53EXW9Y2fF11UKtri9D8/s4NvyJwjqQLiXyfFY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fOIFrfp6DZ3w3WV3QKI2Spo0ESpY8pqPBT9xx7dsY0QCuQAmxBdo1q4zK9RlYByrx
	 J1vsmjdoL+wDkXAYp6nMSXwwtF8Rf0DvIxT66CJBY70hQlN9OFQ+knVmfEeybV2sdx
	 aBoyTBXKz1OpUx/5Rz3ZYuy5oim9gsmbl/qxCpVE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 670FEF80611;
	Thu,  8 Aug 2019 16:45:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9EC1F805F7; Thu,  8 Aug 2019 16:45:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E591AF805A9
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 16:45:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E591AF805A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Cmstt1tV"
Received: by mail-wr1-x442.google.com with SMTP id z1so95213122wru.13
 for <alsa-devel@alsa-project.org>; Thu, 08 Aug 2019 07:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XkV4oZs6ZiC2qzQJvCHYzSVuaz5P2YoXcRt/ldJXf5U=;
 b=Cmstt1tVGYRTZuFBXbdhJ+G+C+NK7oqB9DQGo6s/cQGQ7ycTpaLAzGYn4DV7Gq6D26
 Q89Oj18lD1j5IctLMbOvMvmyoteBXsTTl4EqjGiOgzXpEzgBsWpMuadf3sVxQJavKm5u
 CYoKSgMPMiKyj5ECNVWps666HHfD2EwqUlr8LK1CD1XiPmaEKtrH6Hq//3qJOgNBFkW5
 h77BtlUNVFa/1jv/32Al884UmaU3svQZ5jdwfWpGI4DadINDh89SPK3zQpOjwEdBSloY
 bQfLMVcZDbyVeimk8pGD8YcdOsiWojgOiaIdwpzvzjDIKAklwKCe969dvoSSnHpfyOzi
 uFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XkV4oZs6ZiC2qzQJvCHYzSVuaz5P2YoXcRt/ldJXf5U=;
 b=qsRdUCcFWoZ6NmtSNAfj9U6Jcia1WOWmgEocpEWKKnwY8shmbJ5WwSsKdlH0Z7SGO7
 a1Vu5q/1DJ1/Y7ZcjqS0wTy6Zce3i3iOmjXO+8pwLLZPXhkdJ5eVXhqqJOa0whMR0WAW
 EtYX8PCtbgrfcyK9wpOXFbnXyK85xoDLChzsfg11mrcaHowcl9PbQsq18yYcdNl5uxXO
 eBc+ZQWpbGZjsMDGVTSEXkrUDjahdrvS5wuq1mXB48qMRdeehtvRswQC2bM/12Dx+Hhc
 ZMKD4SD2xCJpE4+8YJMR7nezdwOyG3h0h/LmMN3C/twl+c6o9jjcYG+lIXSjFUU2rFAq
 6Fng==
X-Gm-Message-State: APjAAAW5AaobDMa71mvKkUQ57mRBwJd99UWCsD/99cKxATZm1sIkvZlo
 r49InPK/0g0xNMd1nZWCvhqvnQ==
X-Google-Smtp-Source: APXvYqxvtipX5ZGjzUSMQiJMzVQY+uy2fllw+fKJ1JcU+ugIbvCyHpyFwIVkEqu5KPNs9bO3Ey+HMg==
X-Received: by 2002:adf:f646:: with SMTP id x6mr18613900wrp.18.1565275528042; 
 Thu, 08 Aug 2019 07:45:28 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id g15sm2009060wrp.29.2019.08.08.07.45.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 07:45:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	broonie@kernel.org
Date: Thu,  8 Aug 2019 15:45:03 +0100
Message-Id: <20190808144504.24823-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190808144504.24823-1-srinivas.kandagatla@linaro.org>
References: <20190808144504.24823-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v2 3/4] dt-bindings: ASoC: Add WSA881x bindings
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
