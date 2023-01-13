Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B1B668D62
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 07:31:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C672A2FE0;
	Fri, 13 Jan 2023 07:30:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C672A2FE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673591474;
	bh=r7PJ/2yasq67K87T99aDymP4AnaDGSKuoBzyIiiSoDM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ANrH/WEq2gvLVig2kOB28Xc0fDzLDUen6vRZzq0rXxpaSRGCA3T42CerxziKnZWLp
	 i6IomdaUvkcGN6LXLjJUpz5sKe+Hsj0i86VoqgqNr3AzehJhy0z6I36MAWVt6/aLkO
	 FadhvS3/greuDe0dBQ3BnIW6kYQdy3CzXZDyYeyI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9CB8F80609;
	Fri, 13 Jan 2023 07:25:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC46DF80609; Fri, 13 Jan 2023 07:25:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD69CF80603
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 07:25:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD69CF80603
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=2+SiOyCv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=V1vQGE3XW96qQp3ejFsm70w3mnOS9+pWBLCZirkv1tk=; b=2+SiOyCvTzvDZZCeuwWrAYwhzj
 EWAQESOIDtQymDuYM0T7JpVes3xvB7NFWQ+KmJV1uAOpOiRJUBjTMIMZUpzF2ix6MOt0hGo62CWng
 diwLKN81u+WjRqFmLkwMZ873sIws+XMLCIUxrN4I7r+ZaeFve8swojZ2Nb8EGuKmlXeIEB1nRyph2
 AGmxrxbCZm5edKIVp4yRI47qeIEa85kNn0gl7iBuYuEaOtP2HtGe1Lkv6xia/XchQLm3DtxOaVah4
 5sBY0LpYQziGvInjmbVYYVxDsXL3Jm0yMz0PJd+Su5dRSgTKQwyncOI0wCWZmAu3ILcI2jS/gxiK0
 qG4NqsbA==;
Received: from [2001:4bb8:181:656b:9509:7d20:8d39:f895] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pGDUo-000m9z-Df; Fri, 13 Jan 2023 06:24:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 22/22] drivers: platform: remove early_platform_cleanup
Date: Fri, 13 Jan 2023 07:23:39 +0100
Message-Id: <20230113062339.1909087-23-hch@lst.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113062339.1909087-1-hch@lst.de>
References: <20230113062339.1909087-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-sh@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arch@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-gpio@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-i2c@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-rtc@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This weak stub was only overriden by the now remove sh architecture.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/base/platform.c         | 4 ----
 include/linux/platform_device.h | 3 ---
 2 files changed, 7 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 968f3d71eeab2e..eb3feabf6c2f53 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -1506,14 +1506,10 @@ struct device *platform_find_device_by_driver(struct device *start,
 }
 EXPORT_SYMBOL_GPL(platform_find_device_by_driver);
 
-void __weak __init early_platform_cleanup(void) { }
-
 int __init platform_bus_init(void)
 {
 	int error;
 
-	early_platform_cleanup();
-
 	error = device_register(&platform_bus);
 	if (error) {
 		put_device(&platform_bus);
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 894939a74dd20f..86692f730e3a12 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -352,7 +352,4 @@ extern int platform_pm_restore(struct device *dev);
 #define USE_PLATFORM_PM_SLEEP_OPS
 #endif
 
-/* For now only SuperH uses it */
-void early_platform_cleanup(void);
-
 #endif /* _PLATFORM_DEVICE_H_ */
-- 
2.39.0

