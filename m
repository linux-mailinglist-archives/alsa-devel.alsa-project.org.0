Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C20F2506B9B
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 13:59:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5347318E2;
	Tue, 19 Apr 2022 13:59:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5347318E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650369592;
	bh=dfpWEMNWb1KiBtuAGos36u6gYnI0vIliqkKIij+lMFA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qoodBDcNaE3pbmqCdQHuiFvm7kgSuStMM4WpauzV0fWLauKk0LF9LUB/VQDPQkuup
	 lfpRzaZ2+/AmB9BZbpKvocIxuh11jm+m1sIv01j16ax0m0bCRNYE2DfTm/kruBT6Yo
	 ANp22QxFNPzfoU51k/2cL7rYkk9QoNyLwi6jPeKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1757F805C6;
	Tue, 19 Apr 2022 13:52:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03919F8025D; Tue, 19 Apr 2022 13:35:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77C55F80116
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 13:35:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77C55F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="WxMg6XUg"
Received: by mail-ej1-x632.google.com with SMTP id k23so32263304ejd.3
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 04:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7atrdHIPQWrKPdmTA65creUl3MO148uK4lDHmIisbDg=;
 b=WxMg6XUgp81lXoeea6Vkx3cBnSpHn5GDg4Xb06H7rvL8o6r9kDTwT+y+cwIcbumpid
 5qIHq+cB77g+DzrnMjqL9f/Ed57GfS5yxtrVc6ASVSzZHsJgtj5aKznr0s595wUoxAnN
 E/S59Yi0tUvqKEu/O4lE69dAXqFwBPc+QSW0laxY134MT7i+ojjBgD2IE/n6Bg3JBK93
 Lhu1zjZTUDvZFXPj1n6KqXKzWC2AmiaAXacBHU2rGY3ZqPv3n2RRFu2/8vB3K1vvwjTm
 QoCq5W4VtfwwNz1R3vc2qvcpdZ7AyY7MmyP985K0TFgeeES2okX68npv32Q+7bUR1Vam
 JqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7atrdHIPQWrKPdmTA65creUl3MO148uK4lDHmIisbDg=;
 b=kN/48dzRjXTKQCFChMEzBt1T0KFLwlhAVL0FyXuBTuMENnB2cgO8E7Cro79EqJhzn2
 LSqtxg3He3lHJo0+2WPTaLHNkRG/v0NoEOqavEhjllIob4cEkOEtCGIKOhmEfNeQ6jag
 u+Mv230zYAmEWDgc6jX7PmkqNW1aOsW76f5ofQvdSo6+cb+0qJAB989x+cz42O/Ed5zC
 OFy/zwaIT1Q1rXD6lBxd9JRioTxpZNcGKt8MH2qwGMN/4tL2/JfSwwszDqVoxiSUgdse
 U1n8vK8jyuqnnGyZnRwOiaAl4LTIaUy8gXiJzOKY6ojhy0PWE6N4flc0Wno9k7rUV5U1
 OI6Q==
X-Gm-Message-State: AOAM532jLRVBo0jGicUpImCrkviVEQ62ryOLDfF1/flFqi4yyvwGS7Im
 0DMJnvKj+uhgdg0RNQ3NuZVlzw==
X-Google-Smtp-Source: ABdhPJy/HDdRnFcEBc8e1p8gVzy6WYfbU/9ZfvPlCkGd8Q6ySzsHA+NJEntfhZ+3uR4IyIIiCxdJng==
X-Received: by 2002:a17:906:6a1e:b0:6e8:aa9d:d8b8 with SMTP id
 qw30-20020a1709066a1e00b006e8aa9dd8b8mr13070576ejc.269.1650368100023; 
 Tue, 19 Apr 2022 04:35:00 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 ce21-20020a170906b25500b006e89869cbf9sm5608802ejb.105.2022.04.19.04.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 04:34:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v7 08/12] vdpa: Use helper for safer setting of driver_override
Date: Tue, 19 Apr 2022 13:34:31 +0200
Message-Id: <20220419113435.246203-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220419113435.246203-1-krzysztof.kozlowski@linaro.org>
References: <20220419113435.246203-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 19 Apr 2022 13:52:23 +0200
Cc: linux-hyperv@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, linux-pci@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, linux-clk@vger.kernel.org,
 linux-s390@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 virtualization@lists.linux-foundation.org, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-arm-msm@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sven Schnelle <svens@linux.ibm.com>,
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vdpa/vdpa.c  | 29 ++++-------------------------
 include/linux/vdpa.h |  4 +++-
 2 files changed, 7 insertions(+), 26 deletions(-)

diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
index 2b75c00b1005..33d1ad60cba7 100644
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
index 8943a209202e..c0a5083632ab 100644
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

