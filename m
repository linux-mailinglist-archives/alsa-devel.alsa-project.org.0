Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E5E4DBFE4
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 08:02:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41EB618F0;
	Thu, 17 Mar 2022 08:02:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41EB618F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647500571;
	bh=pOrImP/ESzg4CLUIa9hvID3dx+nmAZPCJ8LLtPEQEio=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l3sku+9YYKCFU2jQ3ksvdFvJagxKOifc2MDFRdK0nKajw6fo8DLZeKOUobb/2gndL
	 WMx7v/qkBADRpoBbjuh6oiKVq+kfox9PBrLvyIla2fyaWHJHhNx6lz1/bYMiuKZ0Yg
	 9DSgSFkU+yA+O1prrE/QHS6/0lYSoGdtrm1QJWQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FD33F805D7;
	Thu, 17 Mar 2022 07:55:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30736F801F5; Wed, 16 Mar 2022 16:09:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B73B1F80087
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 16:09:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B73B1F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="Cmp6uJo3"
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 060D73F4CC
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 15:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647443338;
 bh=yjxT3cEgNPbxxzjxaxofFiViREMV9sxUDnIsV8OP+D8=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=Cmp6uJo3t4EV8dt+GE0CeAkGUBfejL367A567rpTxvyB48Lk4Z1bOvskK5ZIO5Aq/
 PfRCE2gAuAM4fAuh0hhmMAslRQar2RbSyCzOOln4Ca5axhTh4tdMeRj4UZhQc94Epw
 /oKaWKIwB2Wtx1YTsCsTiZQdXJ1co69h6ZAuQbXiqrrsPzC2mT6WtaHhcK4mzgVR8B
 fBwdBVV13uI/PS+b1xFFpREKqrtRk6v2xzZtHlB4g9Ls6PAtk4QcMzsF270D0u+b4D
 39gHxV4FiLc9YYgJGFXtZ5ACXvK3xyW7KH2OAHhPQlz3KoTbX8ACAUFjfdHKCTVmEV
 lbdtUgVWLeWhw==
Received: by mail-wm1-f70.google.com with SMTP id
 t2-20020a7bc3c2000000b003528fe59cb9so1147215wmj.5
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 08:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yjxT3cEgNPbxxzjxaxofFiViREMV9sxUDnIsV8OP+D8=;
 b=cUlZCli3e7veyB//+dmE3wggxQ/nU7cy06hxaM+GxhDx497rOijlNnR0ZcjdQ31ttr
 ZGzFHTTO19zHNgU1vWwL/MGNjWeWWVRn/9clmHmmqqyZyAomNtJ9K0YAHISryEiA014W
 FSIfKnmKmAC0/9OKBdE0E1K2vrcg4RTTSbisFa1L21KTIWMhzrVBVnquGKKeWd6BExYe
 gbeC3u+/tx2dWSiGUIJxT8vtj+GZcYsdIv1n5ESYKz2kfL7JliFQFWArkp13lqhHH4zW
 vaG+saKerkdDHspDQCac+hdAB6wn/8V7sJEIQZJ1kB1T/FDasbCehqqOotdQSn/uHMXl
 /ACA==
X-Gm-Message-State: AOAM532ii6fwn1oyON77XbfsDii1WPjSd5umYvLN04OovdpM6dLpw9/6
 3hz4CywGOxpybIn4Ba2BeSO22sh1ZtJMR8lsnbkGGsNj4tP2+EK1/Pc9zVvdddXhjdrW87NFRJ9
 +G2erlKH3wI/bs6SgrbAks2v8/UUEyIAWRItkX6fi
X-Received: by 2002:a05:600c:3d8d:b0:38c:6f6e:e61a with SMTP id
 bi13-20020a05600c3d8d00b0038c6f6ee61amr2475279wmb.101.1647443337715; 
 Wed, 16 Mar 2022 08:08:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxihfOFhqnyQOV2LqVMQfkoNfvlmhYMokdGWLXgOBRd3UZepsNC84lNIG8stGIAXm3FyJnJA==
X-Received: by 2002:a05:600c:3d8d:b0:38c:6f6e:e61a with SMTP id
 bi13-20020a05600c3d8d00b0038c6f6ee61amr2475269wmb.101.1647443337539; 
 Wed, 16 Mar 2022 08:08:57 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 u18-20020adfdd52000000b001f04e9f215fsm1895105wrm.53.2022.03.16.08.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 08:08:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v5 08/11] vdpa: Use helper for safer setting of driver_override
Date: Wed, 16 Mar 2022 16:08:00 +0100
Message-Id: <20220316150803.421897-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220316150533.421349-1-krzysztof.kozlowski@canonical.com>
References: <20220316150533.421349-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 17 Mar 2022 07:55:05 +0100
Cc: linux-hyperv@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, linux-pci@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
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

Use a helper to set driver_override to the reduce amount of duplicated
code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vdpa/vdpa.c  | 29 ++++-------------------------
 include/linux/vdpa.h |  4 +++-
 2 files changed, 7 insertions(+), 26 deletions(-)

diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
index 1ea525433a5c..2dabed1df35c 100644
--- a/drivers/vdpa/vdpa.c
+++ b/drivers/vdpa/vdpa.c
@@ -77,32 +77,11 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct vdpa_device *vdev = dev_to_vdpa(dev);
-	const char *driver_override, *old;
-	char *cp;
+	int ret;
 
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
-	old = vdev->driver_override;
-	if (strlen(driver_override)) {
-		vdev->driver_override = driver_override;
-	} else {
-		kfree(driver_override);
-		vdev->driver_override = NULL;
-	}
-	device_unlock(dev);
-
-	kfree(old);
+	ret = driver_set_override(dev, &vdev->driver_override, buf, count);
+	if (ret)
+		return ret;
 
 	return count;
 }
diff --git a/include/linux/vdpa.h b/include/linux/vdpa.h
index 721089bb4c84..37117404660e 100644
--- a/include/linux/vdpa.h
+++ b/include/linux/vdpa.h
@@ -64,7 +64,9 @@ struct vdpa_mgmt_dev;
  * struct vdpa_device - representation of a vDPA device
  * @dev: underlying device
  * @dma_dev: the actual device that is performing DMA
- * @driver_override: driver name to force a match
+ * @driver_override: driver name to force a match; do not set directly,
+ *                   because core frees it; use driver_set_override() to
+ *                   set or clear it.
  * @config: the configuration ops for this device.
  * @cf_mutex: Protects get and set access to configuration layout.
  * @index: device index
-- 
2.32.0

