Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FECE3C938
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2019 12:44:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04B6016F8;
	Tue, 11 Jun 2019 12:44:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04B6016F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560249895;
	bh=4OGivMHrU2eUpovIV//LaG2Si1RgXX15+kIJM4vYm2I=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s/93XV4R+ddibKr8szojZWuxvsONG3rAFkRIJ4+UQqkjONivb83oQRV5opoAv/69Q
	 +a44e9UCuy2Cp24M8y3R89m0sc28hfGev49LiEd/hPbmkJprbhxq8GHVaUedyAPKON
	 ATWU/bSxIGQrFSlioJtjZtddrB88h5FXWbRY+I/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A5D1F8973E;
	Tue, 11 Jun 2019 12:41:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57B7CF8971A; Tue, 11 Jun 2019 12:41:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9298CF80791
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 12:41:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9298CF80791
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="OQg8KvQS"
Received: by mail-wm1-x342.google.com with SMTP id s15so2341606wmj.3
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 03:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IyhckBm8THgO1AcZvtqNCZU3xMQ1j3cGrqaXKQ6WbdI=;
 b=OQg8KvQSnrphvOofdMTtzsvKGujUIWuYj1y2jJhYsUUJnfc5YvjQgj63rr2m+LiIt0
 3imTNZNG8Lci6WAr050UBiTC4xMuRbvBbLj+OzRZF+ZVxes6Rnd6qJSqEi47ylZsZNTz
 1bnnmMNh2VzawyKTFMnAQlX0NUbhTQvCyHYk+rrbOLjynzdhyjYgGudPPu2b5peh6e/W
 WIsWRIui9pT1KXuRPLflunZh5bFKClaFLv7JiUcjVXlhis1ALkbflrNmW51Y/e651F1L
 xhPAnH8+HBGsLGLVOsysHnb4om4QXPLAeLhS+oCmug5bI2VDO5u19U0uMJotsJxch5ak
 Ej/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IyhckBm8THgO1AcZvtqNCZU3xMQ1j3cGrqaXKQ6WbdI=;
 b=l7IHP4914XaY6VzfdXCyg6utHEKSeMUvWjd5P1yalmzA4OUEB2pcMH1SBGG3EF4l91
 w8aR86y4fD0TdV/6xa4j9MviNt8bdzoUCFYHWEmIvk0xogPsVbz/yb08zJqB5nT3h6HV
 vhZdp6UNKp/VBWlmXP+dGATGlSW/5adOPJgnubLun4FrQBVPiv4DRF9gZSfjHCOpO1ZA
 uMxty4NfdI9Coyi3ytzKAs/IN1rkTuocfMQWhXyLCvlB+YgbPFM9ufwZYGs/KSrot3hW
 ZmPxLEsTf5yoWwgv2S3PWDxekeMUDBm1qvEPXW4uZAVHlQGn6JVfqzmrD//4rxf5SvuZ
 JR/Q==
X-Gm-Message-State: APjAAAU3csveFqKkopngB76LZasiX3/VP8xaF2extmZZLYEjP4h+G8fB
 fsu3/rcy6oc6DYB+1Bpcq0S0vw==
X-Google-Smtp-Source: APXvYqw7U0OrxR281JBKNtGwW3T/tVCMLH0nKEqT8RKrvVAJtAC3Jt3/37FtCPWSnQMDlSVb6GPB5Q==
X-Received: by 2002:a1c:6242:: with SMTP id w63mr18506760wmb.161.1560249661813; 
 Tue, 11 Jun 2019 03:41:01 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id c65sm2359614wma.44.2019.06.11.03.41.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 03:41:01 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Date: Tue, 11 Jun 2019 11:40:41 +0100
Message-Id: <20190611104043.22181-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190611104043.22181-1-srinivas.kandagatla@linaro.org>
References: <20190611104043.22181-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, bgoswami@quicinc.com
Subject: [alsa-devel] [RFC PATCH 3/5] soundwire: add module_sdw_driver
	helper macro
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

This Helper macro is for SoundWire drivers which do not do anything special in
module init/exit. This eliminates a lot of boilerplate. Each module may only
use this macro once, and calling it replaces module_init() and module_exit()

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 include/linux/soundwire/sdw_type.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/soundwire/sdw_type.h b/include/linux/soundwire/sdw_type.h
index 9c756b5a0dfe..aaa7f4267c14 100644
--- a/include/linux/soundwire/sdw_type.h
+++ b/include/linux/soundwire/sdw_type.h
@@ -16,4 +16,15 @@ void sdw_unregister_driver(struct sdw_driver *drv);
 
 int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size);
 
+/**
+ * module_sdw_driver() - Helper macro for registering a Soundwire driver
+ * @__sdw_driver: soundwire slave driver struct
+ *
+ * Helper macro for Soundwire drivers which do not do anything special in
+ * module init/exit. This eliminates a lot of boilerplate. Each module may only
+ * use this macro once, and calling it replaces module_init() and module_exit()
+ */
+#define module_sdw_driver(__sdw_driver) \
+	module_driver(__sdw_driver, sdw_register_driver, \
+			sdw_unregister_driver)
 #endif /* __SOUNDWIRE_TYPES_H */
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
