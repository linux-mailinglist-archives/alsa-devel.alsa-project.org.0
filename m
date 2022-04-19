Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72210506B93
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 13:58:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF0461820;
	Tue, 19 Apr 2022 13:57:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF0461820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650369499;
	bh=/sYYZJIKuj5wkljIb7nQ1eboEvTzKEWoG2yG3BmzF5E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mjcrHcdGMjlarX+OReJzZfnerKpVIfYy4E+XTJsRNEM6bBtAo5lCte+0Vp/Ps1qBT
	 VGUuY8UF1WmMso9yjunai/7H1+yeLgwFG+CjVKYpQ5N/4y253TnXR/LNhHvIf56Ypq
	 Htb8+/5HgBfrnkZBnZrr67vU1bO+FiF7S/t1AhIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC957F8058C;
	Tue, 19 Apr 2022 13:52:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F22EF804A9; Tue, 19 Apr 2022 13:35:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8F1DF80116
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 13:34:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8F1DF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="hxNjQS3z"
Received: by mail-ej1-x634.google.com with SMTP id s18so32355161ejr.0
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 04:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nKruD0hbBUx+nn+GE9l7RUaXsMouYslDmZcMsioEI1Q=;
 b=hxNjQS3zh1TQ37oSrtUfwGeYt8aW2l1Sm9h+uqAsWbZdx5+TPuoUvrKY8uokxdMtKF
 mLleac6wVOFOW7qIB9iinBjCBoXX/FzWvlxYEZVhYw7BCc4WpSuZLt5wiVLIRDX5VNXA
 EFZhQhF/6rxTsmb8pJWhxF1tp3Za3zoA9fhB9WtIt9/kJJ274ZiN1OG2yJ5VN6t5Q8tF
 z2mkOIFH34l1KyNXFjitqrXaPshNh57GLfsfYeuhRIumEncNvFdkH5ZeibHt5U0Vo1mV
 w3TldCvphkT2yXiXTbOEEORvl3SIruFqbopdn22vRIZgwmnKeXZBCaUuInNWhNmv7xIJ
 kTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nKruD0hbBUx+nn+GE9l7RUaXsMouYslDmZcMsioEI1Q=;
 b=F6lq4ysqvKzwAlIJ3TNY3V6t8d9txR95AXcTm8MbkESymPFVM1uFicPdmJX/kVNLgN
 65ps+dr5DSsgBrCN/vDYvvI0zKo7S20/Z3v3/WmgQBTSQxKjwTPB+Mfo3lN/XhGYroLp
 qj8qFCArAEYrOztqDEwHAUafJ9kkliX0vftCMSmJfutTDqV9X9N77e/Zo74wOfRpQFdR
 ZAXn8ZXcH5IwwHyps7KxqY5JV3dKKvxkhliTWgW8jWmRbrBB3KXrU0ay6UJjjVkI53JU
 3j5YaNp+FgITnDFORrjVN4IiqPCU+cVTLauJb5Qs1nWJDR2DruR+qpfvQDci9+r2g0+a
 tHrw==
X-Gm-Message-State: AOAM532JYbZG7O6yv24BZvAMop/yagc1V9Wnx3zxMICzRYVAga2PoKkD
 ToQ2yEcz9BOqZXCkz44aG0hZ/Q==
X-Google-Smtp-Source: ABdhPJym75DUa6YNLz0AzuXs59T5CIn4fkAzbWaGNW1BaMcFnN8QHFCcwCaQ7sI4GiRmHTg63Mvf6A==
X-Received: by 2002:a17:907:1c82:b0:6ef:69a5:35bf with SMTP id
 nb2-20020a1709071c8200b006ef69a535bfmr13318299ejc.142.1650368092317; 
 Tue, 19 Apr 2022 04:34:52 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 ce21-20020a170906b25500b006e89869cbf9sm5608802ejb.105.2022.04.19.04.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 04:34:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v7 03/12] fsl-mc: Use driver_set_override() instead of
 open-coding
Date: Tue, 19 Apr 2022 13:34:26 +0200
Message-Id: <20220419113435.246203-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220419113435.246203-1-krzysztof.kozlowski@linaro.org>
References: <20220419113435.246203-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 19 Apr 2022 13:52:23 +0200
Cc: linux-hyperv@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>,
 linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, linux-clk@vger.kernel.org,
 linux-s390@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 virtualization@lists.linux-foundation.org, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-arm-msm@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sven Schnelle <svens@linux.ibm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
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

Use a helper to set driver_override to reduce the amount of duplicated
code.  Make the driver_override field const char, because it is not
modified by the core and it matches other subsystems.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/bus/fsl-mc/fsl-mc-bus.c | 25 ++++---------------------
 include/linux/fsl/mc.h          |  6 ++++--
 2 files changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index 8fd4a356a86e..ba01c7f4de92 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -166,31 +166,14 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
-	char *driver_override, *old = mc_dev->driver_override;
-	char *cp;
+	int ret;
 
 	if (WARN_ON(dev->bus != &fsl_mc_bus_type))
 		return -EINVAL;
 
-	if (count >= (PAGE_SIZE - 1))
-		return -EINVAL;
-
-	driver_override = kstrndup(buf, count, GFP_KERNEL);
-	if (!driver_override)
-		return -ENOMEM;
-
-	cp = strchr(driver_override, '\n');
-	if (cp)
-		*cp = '\0';
-
-	if (strlen(driver_override)) {
-		mc_dev->driver_override = driver_override;
-	} else {
-		kfree(driver_override);
-		mc_dev->driver_override = NULL;
-	}
-
-	kfree(old);
+	ret = driver_set_override(dev, &mc_dev->driver_override, buf, count);
+	if (ret)
+		return ret;
 
 	return count;
 }
diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
index 7b6c42bfb660..7a87ab9eba99 100644
--- a/include/linux/fsl/mc.h
+++ b/include/linux/fsl/mc.h
@@ -170,7 +170,9 @@ struct fsl_mc_obj_desc {
  * @regions: pointer to array of MMIO region entries
  * @irqs: pointer to array of pointers to interrupts allocated to this device
  * @resource: generic resource associated with this MC object device, if any.
- * @driver_override: driver name to force a match
+ * @driver_override: driver name to force a match; do not set directly,
+ *                   because core frees it; use driver_set_override() to
+ *                   set or clear it.
  *
  * Generic device object for MC object devices that are "attached" to a
  * MC bus.
@@ -204,7 +206,7 @@ struct fsl_mc_device {
 	struct fsl_mc_device_irq **irqs;
 	struct fsl_mc_resource *resource;
 	struct device_link *consumer_link;
-	char   *driver_override;
+	const char *driver_override;
 };
 
 #define to_fsl_mc_device(_dev) \
-- 
2.32.0

