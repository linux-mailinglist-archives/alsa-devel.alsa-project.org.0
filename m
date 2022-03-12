Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF824D7B37
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 08:05:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C71B817BF;
	Mon, 14 Mar 2022 08:05:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C71B817BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647241556;
	bh=56NCITslvlMJHko/gPg4iuEbBe/9tFfJnXk2PtKlQGw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OJ2GplpeFKiCth7I+zU+dFoX7rk028jTvxkUImiqTG2UjDnU+3RnodDQvTRz7Prwv
	 jJay7QoBer8hQ7TVw8LWaCp4Yk6QKicWBqiESS5ajKzeTLd5p2VSEeO6vwtoU7R3Ry
	 benPjR+SbKy+frFOPBxI2nA/kipqvYBXMuXD8GtE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAF2CF805B1;
	Mon, 14 Mar 2022 07:59:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69BBBF804D1; Sat, 12 Mar 2022 14:29:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15321F80095
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 14:29:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15321F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="X2ang2Ef"
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A0A043F7DF
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 13:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647091755;
 bh=7mOTYavhbaOCHBinVaeIjk1F4Njvbmx0c9zMxK/oqtw=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=X2ang2EfvApaduex0oywYTPf0AB+HnSWhFDlzk3WtuH5iQzHwVwsegfoFa1LG0NeR
 Bd+rUECVr0p98HKl8BEhpwcooVArxuG89FSr92+iohYI3+PYWbsYtFll7H+F6+H7VY
 3AtfXOIyHe81E5Uh+OMwL0tJR5xJFhalIe/SBsX1paxtKxQbI0Imc09o4LkwqzAuBv
 qnIr+uUovKZMN2Bvf9jiKBB1495dcksEisXo/GMFCItDB4N6zwjpulMx2Nk3eE2ZIR
 fHfek6Px2VMSz4NRgIJPZ18K9sA379gl3nL+1MxWwtaBnYx8liSnF2TjjNNXF4ynJ2
 dWs2xNkSi9lvg==
Received: by mail-wm1-f71.google.com with SMTP id
 20-20020a05600c231400b00389886f6b23so4381581wmo.6
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 05:29:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7mOTYavhbaOCHBinVaeIjk1F4Njvbmx0c9zMxK/oqtw=;
 b=1Vk4D7VH5JW+uYKWlgrP+Pt9HG/joLe8kH0ROJTsNRI4UZjPd2m5h9SPoIc3mRgq/L
 Ri+zmoAUvx/c1KMS1jeFFuQidyHiKg9R/LxPYRezivEIrNTL05mMX8LaDi8k34P6An86
 yrtk49I+HrGvrD6vs32awzYjVC7gUBcBg/lSshdsSYh/mOmrUYOvduTAbmwoBVidfgd4
 CjuJm/ecgvkvK5zCqU7YR2TUZgvYHDrCc+yqkH9P2qhPZIpNb7oFOaKa22i35Hxe0a3U
 Wg4iwWoOINl1MtCNxVDb9YX3I43NzXVbdWWOpyPYmoBA2oJS6dsZ8RxFVvCQ+kWScMXB
 9kSw==
X-Gm-Message-State: AOAM533ppFmPREbARl7PebHO7Nmv8OYAmxVGJBGcBRdnY7OSUBV+2GYl
 a+wJvG34ZPKFahfmLIntEwA6sSPCTY0hg01/ZpiM13qDNAp+mc8tLL5eBNwO4Hd5oZv+H9LylBi
 dzQvS4hj3Oayl2eXMaek9Q4p5ZSHKhDhM8SM2MbjA
X-Received: by 2002:a5d:4dc4:0:b0:1ef:7aa9:5a8e with SMTP id
 f4-20020a5d4dc4000000b001ef7aa95a8emr10482276wru.168.1647091755224; 
 Sat, 12 Mar 2022 05:29:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXkoKZNYuYe4AkUgBAiVP2OmAVWKev57rMrweGnbvTXkJE3UDv1vBAWJ9Qno8Byea/hz/PPw==
X-Received: by 2002:a5d:4dc4:0:b0:1ef:7aa9:5a8e with SMTP id
 f4-20020a5d4dc4000000b001ef7aa95a8emr10482245wru.168.1647091754950; 
 Sat, 12 Mar 2022 05:29:14 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 p22-20020a1c5456000000b00389e7e62800sm5751550wmi.8.2022.03.12.05.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Mar 2022 05:29:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v4 01/11] driver: platform: Add helper for safer setting of
 driver_override
Date: Sat, 12 Mar 2022 14:28:46 +0100
Message-Id: <20220312132856.65163-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220312132856.65163-1-krzysztof.kozlowski@canonical.com>
References: <20220312132856.65163-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 14 Mar 2022 07:58:50 +0100
Cc: linux-hyperv@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-pci@vger.kernel.org,
 Jason Wang <jasowang@redhat.com>, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Abel Vesa <abel.vesa@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Dexuan Cui <decui@microsoft.com>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>, virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Sven Schnelle <svens@linux.ibm.com>, Shawn Guo <shawnguo@kernel.org>
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
    (do_one_initcall) from [<c0f012c0>] (kernel_init_freeable+0x3d0/0x4d8)
    (kernel_init_freeable) from [<c0a7def0>] (kernel_init+0x8/0x114)
    (kernel_init) from [<c01010b4>] (ret_from_fork+0x14/0x20)

Provide a helper which clearly documents the usage of driver_override.
This will allow later to reuse the helper and reduce amount of
duplicated code.

Convert the platform driver to use new helper and make the
driver_override field const char (it is not modified by the core).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/base/driver.c           | 56 +++++++++++++++++++++++++++++++++
 drivers/base/platform.c         | 28 +++--------------
 include/linux/device/driver.h   |  2 ++
 include/linux/platform_device.h |  6 +++-
 4 files changed, 67 insertions(+), 25 deletions(-)

diff --git a/drivers/base/driver.c b/drivers/base/driver.c
index 8c0d33e182fd..ba2510117484 100644
--- a/drivers/base/driver.c
+++ b/drivers/base/driver.c
@@ -30,6 +30,62 @@ static struct device *next_device(struct klist_iter *i)
 	return dev;
 }
 
+/**
+ * driver_set_override() - Helper to set or clear driver override.
+ * @dev: Device to change
+ * @override: Address of string to change (e.g. &device->driver_override);
+ *            The contents will be freed and hold newly allocated override.
+ * @s: NUL terminated string, new driver name to force a match, pass empty
+ *     string to clear it
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
+	if (!dev || !override || !s)
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
+	new = kstrndup(s, len, GFP_KERNEL);
+	if (!new)
+		return -ENOMEM;
+
+	cp = strchr(new, '\n');
+	if (cp)
+		*cp = '\0';
+
+	device_lock(dev);
+	old = *override;
+	if (cp != new) {
+		*override = new;
+	} else {
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

