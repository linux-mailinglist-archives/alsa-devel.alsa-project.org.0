Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B091057FF
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 18:08:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C3F81774;
	Thu, 21 Nov 2019 18:07:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C3F81774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574356094;
	bh=13iyqeeRHLigbPZGIbnB/O46Uiro/CrnpkqeT1vGqB8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GTkLQE2cqCEk0YYjYrwJn/xit7nK728jyk97EabYnsdxrQGmQFfcxk/lxBPvmI42/
	 gkkax95uCvV1ybOcGft1bG8xWV6CujdXwdMMnREM4crJtnhQy4e2ENQLcBlwj5jORO
	 y99hmueKha43/0nq2sXwsBv8TJp2HLeamf7+z9rc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3BC0F8014F;
	Thu, 21 Nov 2019 18:05:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B400F8014F; Thu, 21 Nov 2019 18:05:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 336ADF800C1
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 18:05:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 336ADF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Us9Hd7aE"
Received: by mail-wm1-x341.google.com with SMTP id j18so8202777wmk.1
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 09:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ni1slmKblcP7bhdBCafwyoLiq6dGHkojE+w33IiAhYs=;
 b=Us9Hd7aEldRuCy/GB17vScL/hwvyN4isjOgJHPcWinn31uhbMPzHXFhDjC7SVEAP+0
 cQi+kAIZd/0Y9fqZqp+uQLgld9UZ0l6evS/20UL5ykJfyPuwboBoTBDUxmdEMdh+XGtw
 EvdfubsYSRgsh4ZgjTbh52RBaj556kYOZnZfioWkBupX1U8q3DbxEsRI7UvlOkcnVA89
 nvrVpkoj7b5LImBkAfPiUlRar7kcoQrEyAH8qliA+Fj+YQrGYUIbatzJ3Nziq6gH9EFz
 jCgVPD/wXWOp3EUyd88pO4rW1Gsw5MI5ZEldL99KIdrr1efzN0G4+PlRHFsDF0PPb9gU
 zNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ni1slmKblcP7bhdBCafwyoLiq6dGHkojE+w33IiAhYs=;
 b=ILhIwNT5UpIfzPBBO9v86lotpaL6swtdElPAdUMfYrev3npWmk5cRS2AYWIYUdiwJ8
 gs+sLNewJFBuIw30O5OM+bl1B7t3BCfcCYv18o+g/55Nn/dMEwaYlD7/FA6yqBZjWsI8
 RpTJi++sduL+erwCOla74bdJo5joUjPVLvlOiK6BfzQKvEprlaLEyoiHAXaY/5Nd35Q5
 hfQJf9kQYBwHUNj4ywq885bRO1UGxMIqQ/OvACY++Up+Mf1MLlbC2UMjHLNk+TKDl8Gz
 XJDlP2+QnOMD8AzlviFQNUF+s7h6jc682VUJddfixO5Z6OVjSzVNOnLfICYy/UTKKcWE
 o+vw==
X-Gm-Message-State: APjAAAWcT27mP77JKKepqiDLjsGtgkw2sIjgpksGk4v7DBjGxuO1dTf7
 y2pDv3oDriMFtz//boDN6WdRXg==
X-Google-Smtp-Source: APXvYqyFBwhhDzfAVf2MIn4g4BX1O/RFfrBJPwqTyqZDbSVj0e/yeO40DOWs3aWJpcE87bhq6Pr9gA==
X-Received: by 2002:a1c:544e:: with SMTP id p14mr10890566wmi.17.1574355939461; 
 Thu, 21 Nov 2019 09:05:39 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id i71sm4423731wri.68.2019.11.21.09.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 09:05:38 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh@kernel.org, broonie@kernel.org, lee.jones@linaro.org,
 linus.walleij@linaro.org
Date: Thu, 21 Nov 2019 17:04:58 +0000
Message-Id: <20191121170509.10579-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191121170509.10579-1-srinivas.kandagatla@linaro.org>
References: <20191121170509.10579-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, vinod.koul@linaro.org, spapothi@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v4 01/12] dt-bindings: SLIMBus: add slim
	devices optional properties
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

This patch adds an optional SLIMBus Interface device phandle property
that could be used by some of the SLIMBus devices.

Interface device is mostly used with devices that are dealing
with streaming.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/slimbus/bus.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/slimbus/bus.txt b/Documentation/devicetree/bindings/slimbus/bus.txt
index 52fa6426388c..bbe871f82a8b 100644
--- a/Documentation/devicetree/bindings/slimbus/bus.txt
+++ b/Documentation/devicetree/bindings/slimbus/bus.txt
@@ -32,6 +32,10 @@ Required property for SLIMbus child node if it is present:
 	 	  Product Code, shall be in lower case hexadecimal with leading
 		  zeroes suppressed
 
+Optional property for SLIMbus child node if it is present:
+- slim-ifc-dev	- Should be phandle to SLIMBus Interface device.
+		  Required for devices which deal with streams.
+
 SLIMbus example for Qualcomm's slimbus manager component:
 
 	slim@28080000 {
@@ -43,8 +47,14 @@ SLIMbus example for Qualcomm's slimbus manager component:
 		#address-cells = <2>;
 		#size-cell = <0>;
 
+		codec_ifd: ifd@0,0{
+			compatible = "slim217,60";
+			reg = <0 0>;
+		};
+
 		codec: wcd9310@1,0{
 			compatible = "slim217,60";
 			reg = <1 0>;
+			slim-ifc-dev  = <&codec_ifd>;
 		};
 	};
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
