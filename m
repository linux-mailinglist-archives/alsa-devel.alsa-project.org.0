Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0CB4D7B3B
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 08:06:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A82417EE;
	Mon, 14 Mar 2022 08:05:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A82417EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647241590;
	bh=rLnr/gGzPIfVlv5ijCM1TSxhf7l+LPM/p7eMgVEbk/I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mlK/ahLrTY2ad86DIfkZLZA425hrH7pNq46Cv4gRL9exSuwXN0m/8cOnZ/oVOJOFw
	 xAOIawBh2WzT6NMXWUWpQlDDxGrz+ErQyQ570vH2XyR76iytNyQwB3VISdMsj2eCLL
	 RIqJMuV3WbJDvCmN058k38B9Qj5ZBcjb2SSixzxw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C30FF805C0;
	Mon, 14 Mar 2022 07:59:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0C24F8027D; Sat, 12 Mar 2022 14:29:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0836F801D5
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 14:29:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0836F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="nMIrOf5w"
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 66568405B3
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 13:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647091764;
 bh=Z+Z1CBBLpVo7KqzVCsMaZv4r7Tw7oQzghpWsDjTy8tg=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=nMIrOf5wOadSMpx8GWi5HCYhXdR/gIZO6sADDSC/qQsq6X9Lyaou5S2aZVsJC7kcc
 EFk5j7ojLHRkoKeGj8eumkdUiGFxD092SIP7vPPdxqGmRvsmKGfZ8tDgWSa1LET+vI
 gCKUzqpeqIhzFckqT2Ks9smL3orTdFPihnWnDuzXU4kbPnF+hNEy3dYpiNf7SfdhCb
 yjj/q6kTHXLoPWhiysxuG1sKCHRF8yVdHGNex9VKGumGdLEivf/wIDDIi8QxoO/5xN
 8X8TnuJNrZy7VpizTayNkhbZqITnZRLwXBgZ9Ue7ErDmg98Miie6ud0V5J5QZhOB/i
 ukAko+zAF0Mow==
Received: by mail-wm1-f72.google.com with SMTP id
 f189-20020a1c38c6000000b0037d1bee4847so6884746wma.9
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 05:29:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z+Z1CBBLpVo7KqzVCsMaZv4r7Tw7oQzghpWsDjTy8tg=;
 b=G/MDL5TNPazJc9BouiRuCXfJTrhrpUGiVphN/kGScm1zbU/bJIXDjbrdJrshQ//cqq
 1mZQaavP3WwSqg7WQ2amD80fVHtZEUmNI+Dk+ZyCWbbaOuUEb7NCxLUO96rKt6Hl4fpi
 CaNA6uhoN/01i2v9X9TYTjYmQ7jalv7dNGBD35cyXdqj3VySmYq4X+wjqoM76AGSULag
 hRib66mbs6dUmPMd4MQ9M0ksy7k0QOltXWesQI3wPZ2yrLiv+G9hxNZNFUDu6UswXsDs
 WMbqWr/n3y+aqO2vEgy3WSWNNGfe3Z9tXD/WuQ29KBcVwAcfWcoZTUYi31Jx+OFhkiqC
 dsQA==
X-Gm-Message-State: AOAM532N/QZ1sosqdf6H8bfAG0tsFhfjNUHcIgRP9aAHAaGZaBBeTSoP
 WPClRC+CunNCH0ww1WF/lKPrhZDoSPIeRZ5JkbQJK2AmBxzdMop4MZ0eHaIkeJH+V58tTdGXlah
 775Nv0yy197a4ih1+yUHg/QSnp/528uULL3/yKQOU
X-Received: by 2002:a05:6000:1a8e:b0:202:8714:d312 with SMTP id
 f14-20020a0560001a8e00b002028714d312mr10815828wry.683.1647091763732; 
 Sat, 12 Mar 2022 05:29:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjYZfFJ+GUQwy/f/MdbbiQp6L99Sn+ofXO+Q8l7XBFVGS1E/0dNsBqx+eOeH3/7jrINWLOsQ==
X-Received: by 2002:a05:6000:1a8e:b0:202:8714:d312 with SMTP id
 f14-20020a0560001a8e00b002028714d312mr10815805wry.683.1647091763553; 
 Sat, 12 Mar 2022 05:29:23 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 p22-20020a1c5456000000b00389e7e62800sm5751550wmi.8.2022.03.12.05.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Mar 2022 05:29:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v4 06/11] s390/cio: Use driver_set_override() instead of
 open-coding
Date: Sat, 12 Mar 2022 14:28:51 +0100
Message-Id: <20220312132856.65163-7-krzysztof.kozlowski@canonical.com>
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
Acked-by: Vineeth Vijayan <vneethv@linux.ibm.com>
---
 drivers/s390/cio/cio.h |  6 +++++-
 drivers/s390/cio/css.c | 28 ++++------------------------
 2 files changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/s390/cio/cio.h b/drivers/s390/cio/cio.h
index 1cb9daf9c645..fa8df50bb49e 100644
--- a/drivers/s390/cio/cio.h
+++ b/drivers/s390/cio/cio.h
@@ -103,7 +103,11 @@ struct subchannel {
 	struct work_struct todo_work;
 	struct schib_config config;
 	u64 dma_mask;
-	char *driver_override; /* Driver name to force a match */
+	/*
+	 * Driver name to force a match.  Do not set directly, because core
+	 * frees it.  Use driver_set_override() to set or clear it.
+	 */
+	const char *driver_override;
 } __attribute__ ((aligned(8)));
 
 DECLARE_PER_CPU_ALIGNED(struct irb, cio_irb);
diff --git a/drivers/s390/cio/css.c b/drivers/s390/cio/css.c
index fa8293335077..913b6ddd040b 100644
--- a/drivers/s390/cio/css.c
+++ b/drivers/s390/cio/css.c
@@ -338,31 +338,11 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct subchannel *sch = to_subchannel(dev);
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
-	old = sch->driver_override;
-	if (strlen(driver_override)) {
-		sch->driver_override = driver_override;
-	} else {
-		kfree(driver_override);
-		sch->driver_override = NULL;
-	}
-	device_unlock(dev);
+	int ret;
 
-	kfree(old);
+	ret = driver_set_override(dev, &sch->driver_override, buf, count);
+	if (ret)
+		return ret;
 
 	return count;
 }
-- 
2.32.0

