Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3240F506B92
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 13:58:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B60E618B0;
	Tue, 19 Apr 2022 13:57:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B60E618B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650369483;
	bh=lIx+sgLJIxn+1QDkTtU4eRp9lnoIxQOEvnu7sfanTa8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WBxEGqV2CjVcyQRGNUN3pr2v34POoTUKUW6EVcze1hVEKgNPMDZgccjKwVyys1z3p
	 PBV6gEdDzkXOH9bPsPFZtuI3UjukkAyGQdcfHKkilKLOQ0kCrlipPtL/EfT5Xlr3+P
	 +wOFxw0v8rxfGZiZTaVpVZYA+vlUui/7ApETcGV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A40AF80589;
	Tue, 19 Apr 2022 13:52:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D1EFF80237; Tue, 19 Apr 2022 13:34:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27951F80237
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 13:34:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27951F80237
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="wDYr6X1n"
Received: by mail-ej1-x634.google.com with SMTP id k23so32262440ejd.3
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 04:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HY9U4vOykWH8wF1ONfAZKbafXk/aaWhsWEuamddfz70=;
 b=wDYr6X1nep660ZU0le0m9vGrkcYG86Q9uw+WX9QsexbUZj3TdqiR6kJGkJHj2fJFJK
 tOYZDfF3fdauTN3w+Mq6hMvqiAelBlJ9gCCYuHpcZU7s3OnvAc3nmvXulgXkNZmmwDd/
 a7mlepqVn0/I3WPG3aP1zHojesyPizaMJjAfsHPG+vOgdbadsKfMXXhQvbRLSoEWZkdS
 Ar9OfsB/Kni8J8fySu3JD/9kl/ANLOSivfD7RmeVHezh+V7kpeoY2kk0/w/jZTF0dbfr
 1HMf0aXKM/O8kfl2mCmJVGk3xRlz571oWkmeVov2rfx9aWjguGeUVqqkWJMmazoeHYDD
 hLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HY9U4vOykWH8wF1ONfAZKbafXk/aaWhsWEuamddfz70=;
 b=U/90+QvTJf13mx0Hr18ERXg8X2M/gMmUHTO/tcEk/vyclPcJoVw2mvhNjD8FBjURDV
 KMktBOTZv1CyCQSu02FQzei+wpIMFC3bD8GJBFxD2UnYkRR4+XZSwrrV11AOyI9KA5bb
 cngLoDAQga58o8G87YJxZ25DOAddzoyfPDv1BkQJ1rMQh1nBr+3uZ8f86P1sjj5cxBDv
 V6BQtBpsHcklHYEwZu2t2prC1QDki5hoqofk3Yz9awrbUZN8lLw8XNs19LMN/wkUSm1F
 zhjRs+d0k2F111mN8RLX+6XRxIALdLFh4Dqt97HxkxQjyesw4d1k5gfwZb0ME/ztSi5C
 rs0g==
X-Gm-Message-State: AOAM531xo1kxBmYKK5ApZ+d9Gzz6NzkyVNFI1nIuhhacrRrRnx46CmkM
 8uFI3NDfDc3WVIwaXZoFtXc4vA==
X-Google-Smtp-Source: ABdhPJzV5zBjPHcLCYZtorKmaSvPgaRxmn7gXtVxb+rzY+QyuWkf0Jvg5Wfc7/sniNLjLep/KfWouQ==
X-Received: by 2002:a17:907:7f8d:b0:6db:7227:daea with SMTP id
 qk13-20020a1709077f8d00b006db7227daeamr12850859ejc.100.1650368089047; 
 Tue, 19 Apr 2022 04:34:49 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 ce21-20020a170906b25500b006e89869cbf9sm5608802ejb.105.2022.04.19.04.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 04:34:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v7 01/12] driver: platform: Add helper for safer setting of
 driver_override
Date: Tue, 19 Apr 2022 13:34:24 +0200
Message-Id: <20220419113435.246203-2-krzysztof.kozlowski@linaro.org>
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

Several core drivers and buses expect that driver_override is a
dynamically allocated memory thus later they can kfree() it.

However such assumption is not documented, there were in the past and
there are already users setting it to a string literal. This leads to
kfree() of static memory during device release (e.g. in error paths or
during unbind):

    kernel BUG at ../mm/slub.c:3960!
    Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
    ...
    (kfree) from [<c058da50>] (platform_device_release+0x88/0xb4)
    (platform_device_release) from [<c0585be0>] (device_release+0x2c/0x90)
    (device_release) from [<c0a69050>] (kobject_put+0xec/0x20c)
    (kobject_put) from [<c0f2f120>] (exynos5_clk_probe+0x154/0x18c)
    (exynos5_clk_probe) from [<c058de70>] (platform_drv_probe+0x6c/0xa4)
    (platform_drv_probe) from [<c058b7ac>] (really_probe+0x280/0x414)
    (really_probe) from [<c058baf4>] (driver_probe_device+0x78/0x1c4)
    (driver_probe_device) from [<c0589854>] (bus_for_each_drv+0x74/0xb8)
    (bus_for_each_drv) from [<c058b48c>] (__device_attach+0xd4/0x16c)
    (__device_attach) from [<c058a638>] (bus_probe_device+0x88/0x90)
    (bus_probe_device) from [<c05871fc>] (device_add+0x3dc/0x62c)
    (device_add) from [<c075ff10>] (of_platform_device_create_pdata+0x94/0xbc)
    (of_platform_device_create_pdata) from [<c07600ec>] (of_platform_bus_create+0x1a8/0x4fc)
    (of_platform_bus_create) from [<c0760150>] (of_platform_bus_create+0x20c/0x4fc)
    (of_platform_bus_create) from [<c07605f0>] (of_platform_populate+0x84/0x118)
    (of_platform_populate) from [<c0f3c964>] (of_platform_default_populate_init+0xa0/0xb8)
    (of_platform_default_populate_init) from [<c01031f8>] (do_one_initcall+0x8c/0x404)

Provide a helper which clearly documents the usage of driver_override.
This will allow later to reuse the helper and reduce the amount of
duplicated code.

Convert the platform driver to use a new helper and make the
driver_override field const char (it is not modified by the core).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/base/driver.c           | 69 +++++++++++++++++++++++++++++++++
 drivers/base/platform.c         | 28 ++-----------
 include/linux/device/driver.h   |  2 +
 include/linux/platform_device.h |  6 ++-
 4 files changed, 80 insertions(+), 25 deletions(-)

diff --git a/drivers/base/driver.c b/drivers/base/driver.c
index 8c0d33e182fd..1b9d47b10bd0 100644
--- a/drivers/base/driver.c
+++ b/drivers/base/driver.c
@@ -30,6 +30,75 @@ static struct device *next_device(struct klist_iter *i)
 	return dev;
 }
 
+/**
+ * driver_set_override() - Helper to set or clear driver override.
+ * @dev: Device to change
+ * @override: Address of string to change (e.g. &device->driver_override);
+ *            The contents will be freed and hold newly allocated override.
+ * @s: NUL-terminated string, new driver name to force a match, pass empty
+ *     string to clear it ("" or "\n", where the latter is only for sysfs
+ *     interface).
+ * @len: length of @s
+ *
+ * Helper to set or clear driver override in a device, intended for the cases
+ * when the driver_override field is allocated by driver/bus code.
+ *
+ * Returns: 0 on success or a negative error code on failure.
+ */
+int driver_set_override(struct device *dev, const char **override,
+			const char *s, size_t len)
+{
+	const char *new, *old;
+	char *cp;
+
+	if (!override || !s)
+		return -EINVAL;
+
+	/*
+	 * The stored value will be used in sysfs show callback (sysfs_emit()),
+	 * which has a length limit of PAGE_SIZE and adds a trailing newline.
+	 * Thus we can store one character less to avoid truncation during sysfs
+	 * show.
+	 */
+	if (len >= (PAGE_SIZE - 1))
+		return -EINVAL;
+
+	if (!len) {
+		/* Empty string passed - clear override */
+		device_lock(dev);
+		old = *override;
+		*override = NULL;
+		device_unlock(dev);
+		kfree(old);
+
+		return 0;
+	}
+
+	cp = strnchr(s, len, '\n');
+	if (cp)
+		len = cp - s;
+
+	new = kstrndup(s, len, GFP_KERNEL);
+	if (!new)
+		return -ENOMEM;
+
+	device_lock(dev);
+	old = *override;
+	if (cp != s) {
+		*override = new;
+	} else {
+		/* "\n" passed - clear override */
+		kfree(new);
+		*override = NULL;
+	}
+	device_unlock(dev);
+
+	kfree(old);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(driver_set_override);
+
 /**
  * driver_for_each_device - Iterator for devices bound to a driver.
  * @drv: Driver we're iterating.
diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 8cc272fd5c99..b684157b7f2f 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -1275,31 +1275,11 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	char *driver_override, *old, *cp;
-
-	/* We need to keep extra room for a newline */
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
-	device_lock(dev);
-	old = pdev->driver_override;
-	if (strlen(driver_override)) {
-		pdev->driver_override = driver_override;
-	} else {
-		kfree(driver_override);
-		pdev->driver_override = NULL;
-	}
-	device_unlock(dev);
+	int ret;
 
-	kfree(old);
+	ret = driver_set_override(dev, &pdev->driver_override, buf, count);
+	if (ret)
+		return ret;
 
 	return count;
 }
diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
index 15e7c5e15d62..700453017e1c 100644
--- a/include/linux/device/driver.h
+++ b/include/linux/device/driver.h
@@ -151,6 +151,8 @@ extern int __must_check driver_create_file(struct device_driver *driver,
 extern void driver_remove_file(struct device_driver *driver,
 			       const struct driver_attribute *attr);
 
+int driver_set_override(struct device *dev, const char **override,
+			const char *s, size_t len);
 extern int __must_check driver_for_each_device(struct device_driver *drv,
 					       struct device *start,
 					       void *data,
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 7c96f169d274..582d83ed9a91 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -31,7 +31,11 @@ struct platform_device {
 	struct resource	*resource;
 
 	const struct platform_device_id	*id_entry;
-	char *driver_override; /* Driver name to force a match */
+	/*
+	 * Driver name to force a match.  Do not set directly, because core
+	 * frees it.  Use driver_set_override() to set or clear it.
+	 */
+	const char *driver_override;
 
 	/* MFD cell pointer */
 	struct mfd_cell *mfd_cell;
-- 
2.32.0

