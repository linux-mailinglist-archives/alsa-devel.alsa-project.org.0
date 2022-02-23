Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B5E4C4599
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:13:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C9DF186C;
	Fri, 25 Feb 2022 14:13:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C9DF186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645794833;
	bh=1JvYsJXa/834jOsoa3ss/A3PMaW57Q9uLJ0uIj03wig=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UufbAq59bdRsfeqo8n5PibCZywSyELWxzlku826/hH02ffBJTBPtiUgulFEsu6KTv
	 V/KLi86MYDmCI0DnRb8t0NtTguPGGE8Eogqi8qoSfrYTYySctB5EKpBbRNVJ+M9Jzj
	 ZgYa83l9u/b9DQzrdRHXYRrc8ayON136g5mHi/Ug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6467FF8052F;
	Fri, 25 Feb 2022 14:11:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89281F8019D; Wed, 23 Feb 2022 20:14:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB68BF80237
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 20:14:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB68BF80237
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="lF+u9h7M"
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CBD6B4030C
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 19:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645643633;
 bh=HpbyTrdXrFaP+pceEvy/NrkKlPBl1rW1ivTy++yPdQg=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=lF+u9h7M8SaGGj+BVyjX0jOZumxyccm+OdEcAbmYNGxAwerixclXgNWSgohMe+KOS
 Z47RNhg+hCoxblhOMU9LreR/HJ+Zn5M7ODjqWJeBuBxeaGwb4nBzg30oV6qCkl050l
 kjQeCvYrlUhxnEXYiywittN0rtgZ2lBKDITs7P/fE/FuRGqlpNonAbQdG7NCymUF3q
 aA268kbG940a/TIehbDStEeaE1qBXigBvVvH/iGe2FsRlPNoBYPtW+Ixw3Bc6xHQAm
 +b8mNNvI7bm3D0CsmZQw1uiYxl4beUlCWgnRlhpyv3S/lQKmPqpvnLZXgnQKU4DRkv
 yd+GYNWHgLfWQ==
Received: by mail-ed1-f72.google.com with SMTP id
 j10-20020a05640211ca00b004090fd8a936so14063449edw.23
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 11:13:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HpbyTrdXrFaP+pceEvy/NrkKlPBl1rW1ivTy++yPdQg=;
 b=L4N2vWrJ535w0h6J+RomhRsaaWu9Z/LzB+tzd5YjA6Shst92ZxeXsww6h6/oqd3vHr
 cI4lTO2OV5t2k0CpQuc/wKETD+6RNbFrqQtA7JELyJ2Z4l6fayNMfP/cUfdQlYKKzNsq
 NIaprGgdjvC1RwfgTCr/iPbUeB9CbOzjTN6EOpO9zs6bvrMNMqMW8ftO804A4jhVNsiy
 0lJwCybednljs7jl1/wS87NixmC2/DoL1T1kZ7Lv95xk9sAKdwXleG+gb4w07bJ2JKU6
 gHGUHusgM8M7PsIk9iow5MtdPLHWlS4iknsH8LLpicJ9DyFGUlSetxhjClIVnoQdTGgm
 IxSQ==
X-Gm-Message-State: AOAM533ANTyB8RdjCYwkjClSl6a2O/KSv1WGqKdwsmqJGWO+mpVLNvBU
 lsob4JNi1if61plsX1y/cMe69Q+BFPGuHyw9/wuSPCKhUA00uyqER6bQS9Py98Xmig+kGQmQ0ze
 QhwxB2oh9DwgqhyN5q4bAGVJqEjVTHvSz81YpllGv
X-Received: by 2002:a05:6402:d05:b0:412:e171:28d9 with SMTP id
 eb5-20020a0564020d0500b00412e17128d9mr848362edb.169.1645643633264; 
 Wed, 23 Feb 2022 11:13:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYG5EE1VK62qsOOiEHtkeJRCih/epa6U/E9Szqr9uJDRTwmiXA+urJE3qxE0O0qjjabVNPNQ==
X-Received: by 2002:a05:6402:d05:b0:412:e171:28d9 with SMTP id
 eb5-20020a0564020d0500b00412e17128d9mr848325edb.169.1645643633058; 
 Wed, 23 Feb 2022 11:13:53 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id q5sm212611ejc.115.2022.02.23.11.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 11:13:51 -0800 (PST)
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
Subject: [PATCH v2 02/11] amba: use helper for safer setting of driver_override
Date: Wed, 23 Feb 2022 20:13:01 +0100
Message-Id: <20220223191310.347669-3-krzysztof.kozlowski@canonical.com>
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
 drivers/amba/bus.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/amba/bus.c b/drivers/amba/bus.c
index e1a5eca3ae3c..12410c05ec70 100644
--- a/drivers/amba/bus.c
+++ b/drivers/amba/bus.c
@@ -94,31 +94,15 @@ static ssize_t driver_override_store(struct device *_dev,
 				     const char *buf, size_t count)
 {
 	struct amba_device *dev = to_amba_device(_dev);
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
-	device_lock(_dev);
-	old = dev->driver_override;
-	if (strlen(driver_override)) {
-		dev->driver_override = driver_override;
-	} else {
-		kfree(driver_override);
-		dev->driver_override = NULL;
-	}
-	device_unlock(_dev);
-
-	kfree(old);
+	ret = driver_set_override(_dev, &dev->driver_override, buf);
+	if (ret)
+		return ret;
 
 	return count;
 }
-- 
2.32.0

