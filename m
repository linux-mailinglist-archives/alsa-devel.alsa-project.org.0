Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A972A4D7B3E
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 08:07:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 426521843;
	Mon, 14 Mar 2022 08:06:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 426521843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647241638;
	bh=doq3avG0q2ilFE3YDDxEJqvpTfvzWi/xGai3JqL9QJc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A/n+Bm1wMYdlo3tUmXyCLIkPLA+vo/LqUwqmYAPzSg60elbWzZerFWtCzc1S/8z96
	 qpMnIXYqyT6LmljbEfnsv8Te8NyYfrAFjtZx5EhM27H6TQDqjJXYfYooS0kqzM/Qsb
	 oUL9I2dDip96157VtkT6CvRft2FqJPmjLa0mrE7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A054FF805C9;
	Mon, 14 Mar 2022 07:59:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC524F804AC; Sat, 12 Mar 2022 14:29:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5377CF801D5
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 14:29:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5377CF801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="LideUy4H"
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 45EBD3F19E
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 13:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647091773;
 bh=7mUFbCJbIndj6M7s/RjbSIBZAkFNvJ9seQGSdX0sCHc=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=LideUy4HU692ieL3kT/cVKz2WzgKIPJ1pc5Jn8vKH0EStlrWxrYUBlPAYUdio5Rr7
 CZE5DIvNIERInenYj3lcux63N3/s/WDX7K0Kx215heuKB5aTzSh9qpqeE93KBJ0MoG
 pAKqh01ei02bx9fxaadkxTj7wl9ZDK8hvH61YcbnLXeAi5OhCjPaFLHKZWyGQPyVB+
 vsPAogRXcOnYItzXTWdElC9BH9DJRj+JtvzsKL2PLGEWRp64uZeWYIFW2wM9FHE0ng
 AlbZRyjks9puU8s1EXAWL+Qr4B5FKoxtp/2Zwwq/+Xrk0RXmoqXXVa8/ha2+hXr9m7
 EObj433qCXSmg==
Received: by mail-ej1-f72.google.com with SMTP id
 hx13-20020a170906846d00b006db02e1a307so6342994ejc.2
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 05:29:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7mUFbCJbIndj6M7s/RjbSIBZAkFNvJ9seQGSdX0sCHc=;
 b=t2d5O9NBACr4GOPantBCzWqTFEvAc/R5K/P5Au7rD/GZHtK5TPYNTn0qBLj6c7OuPw
 38eSxw94wdyBnB+/D7DtunQkbUCepzEZO4Heme91q6Ngu9YB/QmZFhVoJIeMlpJKcQvI
 B4nqqfCJ7DuLELSOMcec4KtoS9AggrYnQFIPS4gw7YGFYcgBgZg1oPzxeQF2R6lG0MH6
 LNq97L3urChFHVTI7UhAZRWanLzJLYSpPjHT+F3vyPqrNdtvvHurVUKq+jDldQu/Sp3S
 SSAMO7yAQVPhDt0yXL7F1OLode9be4ZqtvNudUB34INafzqZJ7h1JupCzAzf16WCEJaG
 jF+w==
X-Gm-Message-State: AOAM532VGtzrx0v0VMAibn+zL0zJis93ahXPdDjaL4hTnHCd5eaKBY6w
 CQK41b+mQqb3lYolpwckyMFBYhscH9xF0iIGfph4vjj+KkCHneAf41eUquCBJ9iuvIuKRmPgCR/
 ZaxhEdWvpgFy+uhPPUvdWKHtyjH7yPhnx8GxMAxWs
X-Received: by 2002:a5d:5512:0:b0:1ef:5f08:29fb with SMTP id
 b18-20020a5d5512000000b001ef5f0829fbmr10682384wrv.653.1647091762091; 
 Sat, 12 Mar 2022 05:29:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwL9N8cHHsfR6QUZ51LIW64l7WzEaKnb3KtvzXdONbhu6n0rj400RLdEGB8nEbZlW8twybECA==
X-Received: by 2002:a5d:5512:0:b0:1ef:5f08:29fb with SMTP id
 b18-20020a5d5512000000b001ef5f0829fbmr10682372wrv.653.1647091761844; 
 Sat, 12 Mar 2022 05:29:21 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 p22-20020a1c5456000000b00389e7e62800sm5751550wmi.8.2022.03.12.05.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Mar 2022 05:29:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v4 05/11] PCI: Use driver_set_override() instead of open-coding
Date: Sat, 12 Mar 2022 14:28:50 +0100
Message-Id: <20220312132856.65163-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220312132856.65163-1-krzysztof.kozlowski@canonical.com>
References: <20220312132856.65163-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 14 Mar 2022 07:58:51 +0100
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

Use a helper to set driver_override to reduce amount of duplicated code.
Make the driver_override field const char, because it is not modified by
the core and it matches other subsystems.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pci-sysfs.c | 28 ++++------------------------
 include/linux/pci.h     |  6 +++++-
 2 files changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 602f0fb0b007..5c42965c32c2 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -567,31 +567,11 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
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
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 60d423d8f0c4..415491fb85f4 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -516,7 +516,11 @@ struct pci_dev {
 	u16		acs_cap;	/* ACS Capability offset */
 	phys_addr_t	rom;		/* Physical address if not from BAR */
 	size_t		romlen;		/* Length if not from BAR */
-	char		*driver_override; /* Driver name to force a match */
+	/*
+	 * Driver name to force a match.  Do not set directly, because core
+	 * frees it.  Use driver_set_override() to set or clear it.
+	 */
+	const char	*driver_override;
 
 	unsigned long	priv_flags;	/* Private flags for the PCI driver */
 
-- 
2.32.0

