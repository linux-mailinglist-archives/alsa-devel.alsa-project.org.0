Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C68BC4DBFCB
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 07:59:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F3F91891;
	Thu, 17 Mar 2022 07:58:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F3F91891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647500375;
	bh=9HjgmmAQq3v09PQ7r2Q0vlm0l5Ppx5DcX6pHd3tzgew=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a4LM7uWiGbdOe/BGfYx0ViJ5+CrzDi5VCpYR1lK3gnQSa+pkvwrBuIXYNZRfMwj3a
	 N5Qj5WM9dL5D0RIc/VHanmJt03mpKX+0vBLztU/hkfNbnUHklp+KBj0eBDxjWr2XjY
	 8dNh+8pgo/Rom9FbWT0ju3p3iUyXb/N8xogUUEcU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B1E0F80568;
	Thu, 17 Mar 2022 07:55:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00C71F80240; Wed, 16 Mar 2022 16:06:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52EAFF80087
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 16:06:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52EAFF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="VbKoKSLy"
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EFE823F7DF
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 15:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647443192;
 bh=LxSp3r31kTKgdYVIAcfNeHGsMIq2YcJzJF2DRNz1kEo=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=VbKoKSLyyO5O+dEhysOQcpuaEqIX8eTQ8E3FSvRyJ2Y8rJfS/6EzezyTFa5fGqvk9
 h8sIJ47fr4tDoPGf7dDhHp5iOJhtw+Gt8kUAzGYNI0pSCcfwgLSrfX3AXxOLVtlr6g
 wtGqNtlCShAtuptYjZgWwUrlma7nQCwOgtAL1X6DmSz3KsfBr/s+LdpB3ZyfufCTTq
 9Ut6MauGpkl1eWohFY9yLVv7Be7n8c6TIY7+JPszlID2wIpA+b2zye6m3vwSrOiXvx
 dHeAoDZ1TsdMfpMkykT2fJdU/2M7n6wBcKiLDazWy9wbuOO8LMlyEiGOUJAn66+LNO
 +xHpkHJvQv9iA==
Received: by mail-wm1-f72.google.com with SMTP id
 m34-20020a05600c3b2200b0038115c73361so808125wms.5
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 08:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LxSp3r31kTKgdYVIAcfNeHGsMIq2YcJzJF2DRNz1kEo=;
 b=ycAj76oFfZQazR7U/ul6ykpmr2sz4z2FwRoePtMm2MratKs+jaf1TpxgDB8bMpZNIU
 frtVI0/EloQI4PRY9sY0DHFW3EVaglJYWXMe3b5JdnIgilMgWOtutb48BYAApXKewvr3
 et2qx2QizqP8BPzuQUyV/X8I5knKuuQURu8k3zuB2SInY+3ZInSyrwivneYr1rY84ynt
 3EydVBUknTrThj2J77NIqrvwvXkVf21VtDhcIXgYwbY7ypsbHavlu0OHhK2L35qi1471
 S9MmDlRPX/R3p+ZZ+fyd75SGwh6ZpskDbW6bV1vo9JpH3QA2wq4ZKNHu+Cr2tvbsiL+V
 F78g==
X-Gm-Message-State: AOAM530Qs9K6LQm8Mx4RGaoLzrE3jckK9iU7acK2MW9ExO3TlTSPVxGM
 KWlpWWrpk9ev3qKJqil0jgyKFa02pSJm5vcL4CwfIaLmQLA0HhrctM7k2UxcbplVa4wgYDu7pF6
 RC0EMKei9MrLooPNkZj4fJTcilCdMdffMbzyIP7bL
X-Received: by 2002:a7b:c5d0:0:b0:355:482a:6f44 with SMTP id
 n16-20020a7bc5d0000000b00355482a6f44mr130535wmk.58.1647443190445; 
 Wed, 16 Mar 2022 08:06:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdXtZV1RU4W+D/CxNpLgNYuPn/wREOODQjEf3w6MZJYByf0aAfpBebBFJL0kKpQw0vNQJhuw==
X-Received: by 2002:a7b:c5d0:0:b0:355:482a:6f44 with SMTP id
 n16-20020a7bc5d0000000b00355482a6f44mr130503wmk.58.1647443190091; 
 Wed, 16 Mar 2022 08:06:30 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 p14-20020a5d59ae000000b00203dcc87d39sm3130155wrr.54.2022.03.16.08.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 08:06:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v5 02/11] amba: Use driver_set_override() instead of
 open-coding
Date: Wed, 16 Mar 2022 16:05:24 +0100
Message-Id: <20220316150533.421349-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220316150533.421349-1-krzysztof.kozlowski@canonical.com>
References: <20220316150533.421349-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 17 Mar 2022 07:55:05 +0100
Cc: linux-hyperv@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>,
 linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, linux-clk@vger.kernel.org,
 linux-s390@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Dexuan Cui <decui@microsoft.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 virtualization@lists.linux-foundation.org, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-arm-msm@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>,
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/amba/bus.c       | 28 ++++------------------------
 include/linux/amba/bus.h |  6 +++++-
 2 files changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/amba/bus.c b/drivers/amba/bus.c
index d3bd14aaabf6..f3d26d698b77 100644
--- a/drivers/amba/bus.c
+++ b/drivers/amba/bus.c
@@ -94,31 +94,11 @@ static ssize_t driver_override_store(struct device *_dev,
 				     const char *buf, size_t count)
 {
 	struct amba_device *dev = to_amba_device(_dev);
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
-	device_lock(_dev);
-	old = dev->driver_override;
-	if (strlen(driver_override)) {
-		dev->driver_override = driver_override;
-	} else {
-		kfree(driver_override);
-		dev->driver_override = NULL;
-	}
-	device_unlock(_dev);
+	int ret;
 
-	kfree(old);
+	ret = driver_set_override(_dev, &dev->driver_override, buf, count);
+	if (ret)
+		return ret;
 
 	return count;
 }
diff --git a/include/linux/amba/bus.h b/include/linux/amba/bus.h
index 6562f543c3e0..93799a72ff82 100644
--- a/include/linux/amba/bus.h
+++ b/include/linux/amba/bus.h
@@ -70,7 +70,11 @@ struct amba_device {
 	unsigned int		cid;
 	struct amba_cs_uci_id	uci;
 	unsigned int		irq[AMBA_NR_IRQS];
-	char			*driver_override;
+	/*
+	 * Driver name to force a match.  Do not set directly, because core
+	 * frees it.  Use driver_set_override() to set or clear it.
+	 */
+	const char		*driver_override;
 };
 
 struct amba_driver {
-- 
2.32.0

