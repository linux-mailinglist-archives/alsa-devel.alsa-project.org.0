Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFFB4C4592
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:13:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52B171949;
	Fri, 25 Feb 2022 14:12:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52B171949
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645794784;
	bh=4OxoJPDPDcTmA1eXUj8BGHm/BCwIkobZ8rBlzjTEuZY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yy7GmPd0qGXjmcadCX52TQFsyGdNZm7yMzxtLLuLE+TAadjRMEbNbdRpO9RPvD6XH
	 MtiI+U/Aa/Jk+hCXuKkk0UKr3lFJkC8jjzxdCDkmTdyVGXFmBIC33I8arSs8rTwSId
	 ToQNG/XAO5l9XZTZOu9NLW1L/wQFpDCUkDcgsquE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C815CF8051D;
	Fri, 25 Feb 2022 14:11:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50737F802E3; Wed, 23 Feb 2022 20:14:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D6A5F800B6
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 20:14:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D6A5F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="f+ceqsv4"
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 71CF33FCA9
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 19:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645643640;
 bh=rf7a9EFQwPOyocENu81tYUT+5dnJvDmCZPPvLR/17AA=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=f+ceqsv4pvZHP257w8BdgIPI5o3FDlW8a6hbBjiz1RvtSa1juNWOviEgpaas82WXY
 pdYGhLhD3k7/1wKJlAu7hEHaaWlL1VTMXHVZX0uW/kKjBGeTq4IUyyJbpvbI7nq78p
 SUf546blbwfhXIayCslnSmqk3eqDi5t/c1XfzcDjsK5JkUAQMHjTmEBNB4EmwUuPMr
 qhDfvhJ9nGm9fx5pypKlI8Vh7ALbwpeJrKRALaH/ppDR0iLi8RgeSimgWk/12ojpny
 exvVH2BNB/TpMduToqj5lGJHVg0l98NdNwDnQgUwvuKtnR+nQRUcMr0lGLZWFVAC5d
 wNKE3xrkwWhgQ==
Received: by mail-ej1-f71.google.com with SMTP id
 o22-20020a1709061d5600b006d1aa593787so3596386ejh.0
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 11:14:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rf7a9EFQwPOyocENu81tYUT+5dnJvDmCZPPvLR/17AA=;
 b=7TB29jpmX2wqEHYIygWtrdzZDhjcgL5RGaX+0AHrX9rAVM0A0cNNjYlVjevddDb6PG
 aJ+mdkdBo0V36rmR+gqXaMGQ9t58QRWQlSS2YcImh5sl7PMTTEQ49pr3bRHdm+ohJL2g
 Ohf7dyBptvhUCyU0wjyHWiDgHukr/xho3RIS2i4dPyKPeBPis5V8LItAM+ajDtyDjvkk
 eEXZUUndIAJcw97Ul0fygbrzkqhJhNdvRvbfDBSI9nXZ9WmplugAViFVAWy1YAfvSHjr
 JpViE5UOREmLOGgp7bV31XBILi6n+qcsZIeR6rHiebwxAjQkoPU8QvGWVWHmSiaqdjOO
 c2dA==
X-Gm-Message-State: AOAM5317gg1rzOA2v+ppNwGpgPe43MwAYJZvM/ZiEUk3ppCcbQujlRft
 Vb84aPxJWCf2yRlAqrlvrSVaxidE9jwiisxN4pCrEhT776udDddNUfrHaVPjaniQFrRFErT+yPw
 xscWZmTR6ck67xvsIiLGMw754CYYgfq3ay51qAP/R
X-Received: by 2002:a17:906:e244:b0:6cd:24e3:ab8b with SMTP id
 gq4-20020a170906e24400b006cd24e3ab8bmr856426ejb.633.1645643640106; 
 Wed, 23 Feb 2022 11:14:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXgfLS9GHyX1kCvT/o1Mu24QLFIsYnwLPgsBOYcxKH/GiFu7jQtQB6sjAsK4TU39w3xnST4g==
X-Received: by 2002:a17:906:e244:b0:6cd:24e3:ab8b with SMTP id
 gq4-20020a170906e24400b006cd24e3ab8bmr856416ejb.633.1645643639914; 
 Wed, 23 Feb 2022 11:13:59 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id q5sm212611ejc.115.2022.02.23.11.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 11:13:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2 05/11] pci: use helper for safer setting of driver_override
Date: Wed, 23 Feb 2022 20:13:04 +0100
Message-Id: <20220223191310.347669-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220223191310.347669-1-krzysztof.kozlowski@canonical.com>
References: <20220223191310.347669-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 25 Feb 2022 14:11:18 +0100
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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

Use a helper for seting driver_override to reduce amount of duplicated
code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/pci/pci-sysfs.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 602f0fb0b007..16a163d4623e 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -567,31 +567,15 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
-	char *driver_override, *old, *cp;
+	int ret;
 
 	/* We need to keep extra room for a newline */
 	if (count >= (PAGE_SIZE - 1))
 		return -EINVAL;
 
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
-
-	kfree(old);
+	ret = driver_set_override(dev, &pdev->driver_override, buf);
+	if (ret)
+		return ret;
 
 	return count;
 }
-- 
2.32.0

