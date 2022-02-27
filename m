Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AEA4C9F5C
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:37:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A46D1B0D;
	Wed,  2 Mar 2022 09:37:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A46D1B0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646210271;
	bh=cL1O9sYJpeYMj5w91fdIUG1GJQICiWSNR+yfb8G2wDM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vmidOVYpFWA45x9P6R2++U7mQS9Z8q8uc3la8Bj+tN0Tc/lVNx6IIeiSKA6LTQhPs
	 20Tv/zYmxQDnrs2SWHwkf76US1CPyVjSM6YQ7CpcR0LHpG3bVOL/pWMigze7JRAvO6
	 rsOmSl5kEfn5X+8/eTH9slpHf10X5XaJjrbPNUKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B624F80549;
	Wed,  2 Mar 2022 09:33:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A3BCF80155; Sun, 27 Feb 2022 14:53:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E974F80128
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 14:53:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E974F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="cDWFSmZZ"
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B242C3FCAD
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 13:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645970017;
 bh=npGNvoQmcQXzOf9MUvG7bOfkjnwx60Xk35PbEgCfPxw=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=cDWFSmZZYRtPsJ2YUaiCLsFkh01X49HLxMar5FmeYO5fYHIrCKOQuRkjvscYN2MWz
 DI0coHFZV3p5iEYQ+IM2O6KgP9XmWWpxXiM84woucYZYReMlN9MuzQxYAnsOLCa+g+
 bU2PWii9gvUJJy1Kp5IW5zmPmnV+10vY406IK1+zgPTghhZTraeyZkewyrs4Du2yNq
 skz7IBlRNp1sjoukGdChB+/SX+Egm0v6lld7YSgUFA20Zjz+kDqE1HEfRFhkYkvCic
 lo6sEdPUMxQ+qWRmBLu0+2MRswe3kCIqCBibYpn+vpqBViN2/ZUHe4y8fbe7+Fb+38
 X2y25DTZkZrVQ==
Received: by mail-ed1-f70.google.com with SMTP id
 y10-20020a056402358a00b00410deddea4cso4232178edc.16
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 05:53:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=npGNvoQmcQXzOf9MUvG7bOfkjnwx60Xk35PbEgCfPxw=;
 b=sbO20xx+F8QE32SXL3VDtVwB8+nJ4NjZyuQsDNA5OytO2wH1TWt8HZyGDn/R0140Gx
 grFZGtSzei8vlZJgmalRcEopFz+11XauAAHIeRxObhchGSS6scTzIgG+yxBBs0LdUjxk
 1vepvCI1V3i/TOc+3Rfb8Vk4o4FtX3wLgP++3UFUmjOK8Z+jWAAo04H9ZSEPsEr1VXBH
 UB6ZaV9cLzOY3t8taiymjFGLdYJ+Zvre9vAlRdF0+lnxd6hHPlwY7STHua+wztBZXr19
 6d1UCkg1r3IWQXR0KdmHif39yPeyJjkoLVXuaB3oSEVgPkl3IRlTpwFXlAo/lZDg0Tp2
 CsRw==
X-Gm-Message-State: AOAM530BQbYjfIspTOBFN635kcPP+bsa1wV36pErClGsJpRCYDD8wLuH
 zRE1N8FBd/senZwJTwUIfjbo8ofNoISI2CkMb5dKPjTc02pRkBDcrUL5FtGRfplulC0sM3InAhg
 3in/iwJEy0vdxQIqdGmUoZv8ytIwkAmiwWrz6QMbH
X-Received: by 2002:aa7:d49a:0:b0:410:875c:e21b with SMTP id
 b26-20020aa7d49a000000b00410875ce21bmr15261486edr.357.1645970017414; 
 Sun, 27 Feb 2022 05:53:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzicu7l4IEwzqhlq2xIFoxdFytokSeMFkgjaEtpJW9Dl/uL3ibJtEoSzuA4VDSoAwu8n3nm0A==
X-Received: by 2002:aa7:d49a:0:b0:410:875c:e21b with SMTP id
 b26-20020aa7d49a000000b00410875ce21bmr15261460edr.357.1645970017251; 
 Sun, 27 Feb 2022 05:53:37 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 w11-20020a056402128b00b00412ec3f5f74sm4600760edv.62.2022.02.27.05.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 05:53:36 -0800 (PST)
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
Subject: [PATCH v3 08/11] vdpa: Use helper for safer setting of driver_override
Date: Sun, 27 Feb 2022 14:53:26 +0100
Message-Id: <20220227135329.145862-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220227135214.145599-1-krzysztof.kozlowski@canonical.com>
References: <20220227135214.145599-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:34 +0100
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
 drivers/vdpa/vdpa.c  | 29 ++++-------------------------
 include/linux/vdpa.h |  4 +++-
 2 files changed, 7 insertions(+), 26 deletions(-)

diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
index 9846c9de4bfa..2d924a89ce28 100644
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
index 2de442ececae..89ec4e4d4cdc 100644
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

