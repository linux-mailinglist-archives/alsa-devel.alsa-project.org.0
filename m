Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 543754D7B3A
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 08:06:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD7B3181C;
	Mon, 14 Mar 2022 08:05:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD7B3181C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647241572;
	bh=+8rpeGk2uecRzz7AaVAGQuAyzyj/iNyvhVku6fu9XLk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SAIiR5bXTLB9ecXTt+kXUTJZAoME3g8Fa8+WW4sLKZk43CJxh92e+Iyt07BDEPZnI
	 UI0kKuaUp63EbjBzb0KJbMh0nIxNUkcCFzmSFF0fxkBiXgq1HNPTuRGu2Kr2peHfb/
	 lpId7Vx2H7aZO1WX5slMbb4SRQ7NwMa65LjA4rTc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98B45F805BB;
	Mon, 14 Mar 2022 07:59:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 191FDF80171; Sat, 12 Mar 2022 14:29:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8423F800D2
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 14:29:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8423F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="riQs3aOy"
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5F5E140826
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 13:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647091757;
 bh=omHdnhYiVzDdXVNfQeQ6+CS2gK0y2vQxkHVBCoxIVic=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=riQs3aOyr5F7izurCZgv4oj94XANlFy/Qrnr7mcfU1U5RCfUAaR8oDFeKjIWE4stW
 OYG9f8vO57nzQkWYu6UhEnTWulomHWZf6I78MKvC+oPNvwjrC/DAaduPDY8dBfzVsb
 IMZLQpDAGJn+Ol+JeuWPUYpfN+gJshJ/aEUL6BXr477ibC5SiC8SJIrbAmZShdgjSN
 xHKFZw32eInYbYqOoe15ah5n9ToD2H6p8XvV81GavXju9kJ2hhesjqnpVCy8kWR+cS
 5iBocKa7VWdX0Gbqgd9OyoraJMDetZXSiC5/WEI64jpLwyB5dEUG9s37WlTJXsbnUn
 CEQC6f6fOWkfw==
Received: by mail-wm1-f70.google.com with SMTP id
 q189-20020a1c43c6000000b003898de01de4so1318156wma.7
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 05:29:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=omHdnhYiVzDdXVNfQeQ6+CS2gK0y2vQxkHVBCoxIVic=;
 b=zmyQcghjK9wPDjDkMZ6wNJoVEkC8kSIeRXPyQhAxHlyu3dcFdOPWQWgOc8y19y1TF6
 OsT5FHrrAZAlLHFG8cJNIMsrpJ4stezt3i5d5qeh87ESEEJ+DlwpXpZ7IMfmXrjvKQJ8
 U/XGkNIhAa383WcBNRK4p6napc69I1Ioh0+G0rubWZxR63NfdTffSA8jg8IpdPRl55gL
 CiaWj/7Fr8TepOZA8yNfQ9rhXkoRg1uJx9a8ctwvkq4xcTglQW4Z03tRvPu9Zks+rd7v
 QeaBdCqSlcT3J4oDME4amEGYTAHGGq6kVsi6YJ6SMYzLTbav3wQNWUeTWhbXNAwGkCSF
 KuNg==
X-Gm-Message-State: AOAM531pF44iB/pxTKal5GoSx+4zUIZFBOsYF0BCrvkuxLoX9kiSAVez
 hxEQ/b2gXo3ETCWkNBlAi4omf0iLiGcmBVFnzQmFDTMlpdW7K0UThvm89tKjFkACC/V1713ksPo
 XfNTDwvKvmsDQi/DuU7bxpI+UH56m1XtZdPJopcSG
X-Received: by 2002:adf:f44d:0:b0:1f0:49bb:fead with SMTP id
 f13-20020adff44d000000b001f049bbfeadmr10583036wrp.586.1647091756882; 
 Sat, 12 Mar 2022 05:29:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/VzmVA5JNvsX6TR5L7X8QpqfI/POyM5THNfZEIE7XxPWAZ/IgTk7OADHiVtKc+QUuykZL9Q==
X-Received: by 2002:adf:f44d:0:b0:1f0:49bb:fead with SMTP id
 f13-20020adff44d000000b001f049bbfeadmr10583014wrp.586.1647091756718; 
 Sat, 12 Mar 2022 05:29:16 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 p22-20020a1c5456000000b00389e7e62800sm5751550wmi.8.2022.03.12.05.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Mar 2022 05:29:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v4 02/11] amba: Use driver_set_override() instead of
 open-coding
Date: Sat, 12 Mar 2022 14:28:47 +0100
Message-Id: <20220312132856.65163-3-krzysztof.kozlowski@canonical.com>
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

Use a helper to set driver_override to reduce amount of duplicated code.
Make the driver_override field const char, because it is not modified by
the core and it matches other subsystems.

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

