Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7A74C9F6F
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:38:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 900FF1B2D;
	Wed,  2 Mar 2022 09:37:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 900FF1B2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646210320;
	bh=Y15SELyAfs0/MUYeZa+7/VJKEiKKJWTyPn3M56Kq/QY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RhqBD0Wl/VndNfU1zY+ERQQAldOYsyTnyyxw4sr8GVSwWxI+4YOJ50WoniOnqQ7Ke
	 jGM4GmkFM2fKNHQonIJ5R8U1wtRHGg6F5eoQ0cqZmpDRFk1OH3xhT3i7JclrJD+pao
	 KDtRptCtS8TtfSYzCx3eXCBjmBVOSLEnsS9fxSeU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE07FF80564;
	Wed,  2 Mar 2022 09:33:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 263FBF804BB; Sun, 27 Feb 2022 14:53:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1A17F80155
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 14:53:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1A17F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="gb15HBHg"
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 67F9D3FE4B
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 13:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645970026;
 bh=qpFiz05rVbRuRAHN9hg8SmLpkD4Xh7SLbxYijfSgBwA=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=gb15HBHgoa4/ayNDCdpdmkOHg8MUudIN5aCRt8kMUNQuhCGe0tXAgYg2BZ4Wgdm4M
 qBUCRTaxMvAfdfPwR6t21rNP810akTda5OJl3rrG66W94L60NkwzgdrO6LGHixEoC0
 mtL8XKljlgqmn9PDfs1pNLGg+G/hU/hx7RIGz76qfGuSLMDgc+Fiuq2YGOWcsz2Dtw
 ya2MFy+fIGgozBO4Q0HH8HHasTR4LIhfR22633fEJ9H+OXUrdtw93RQUvyRwzNHkJa
 i643G2PdQvtrnsoKvkikJGsKnEQEJEQhO49xmg958/SU430tuDIDLcYxFaV/y7CnAl
 LVOJyjKpyymvA==
Received: by mail-ed1-f69.google.com with SMTP id
 m12-20020a056402510c00b00413298c3c42so4244682edd.15
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 05:53:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qpFiz05rVbRuRAHN9hg8SmLpkD4Xh7SLbxYijfSgBwA=;
 b=whL0/Bjx1TnvOvngzl+x5I/scJNJqSKWtLOSrc9iTNyMAmGwplvQqqNaXG7NFrBsAr
 WmBfgvdFzkhD9JoGmvuEnFcdCzcwro/unh/Gt/rP4lFShO+VNG5y+2Pz8z1L8E0vRQuK
 3FRHx+wbvco8ntPdH6cj+7dYZ/5owJFIm+AYAd8UWn7fJuJU1X2kYxOmPOJGHNhK+OhE
 M6ResiLB1oDTVvTGZ5FB//w6fldFR+ksNEfgoeqnFioluTkp5jR2PjRu6Kj6XzC6HDqj
 CC9tWIkiRRnjrLoWjKr/9LYvJ3CDvkrl/Eo9rhr6e5aNNJevcyAVUuPfUUceHa6qDJbj
 6Suw==
X-Gm-Message-State: AOAM531W64aFh22f0lEV5BcPjGdxkbEo+fvLcGuvz05Kdn41o/R/Isx8
 bpU3rbEaKd8Ww7v6k8JV3kKNcE0aSif9/xeFtxM8+/4ffWzy3t4ToiQ1cumaR9poyBFTDnIQkkX
 EJRjdzX0XIs4iqigDd3e6x9afps7f4lwn5cDy0+E3
X-Received: by 2002:aa7:d98a:0:b0:410:b844:7889 with SMTP id
 u10-20020aa7d98a000000b00410b8447889mr15100891eds.109.1645970015739; 
 Sun, 27 Feb 2022 05:53:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhO9Sv0dF420J0f9IZ/pCEaONwOixtXPt4DqHWIJWIfdwGeQCrhRg50N3SHeq1oP4tMC2tSg==
X-Received: by 2002:aa7:d98a:0:b0:410:b844:7889 with SMTP id
 u10-20020aa7d98a000000b00410b8447889mr15100871eds.109.1645970015533; 
 Sun, 27 Feb 2022 05:53:35 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 w11-20020a056402128b00b00412ec3f5f74sm4600760edv.62.2022.02.27.05.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 05:53:34 -0800 (PST)
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
Subject: [PATCH v3 07/11] spi: Use helper for safer setting of driver_override
Date: Sun, 27 Feb 2022 14:53:25 +0100
Message-Id: <20220227135329.145862-1-krzysztof.kozlowski@canonical.com>
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
 drivers/spi/spi.c       | 26 ++++----------------------
 include/linux/spi/spi.h |  2 ++
 2 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 4599b121d744..9d0b11017741 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -72,29 +72,11 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct spi_device *spi = to_spi_device(dev);
-	const char *end = memchr(buf, '\n', count);
-	const size_t len = end ? end - buf : count;
-	const char *driver_override, *old;
-
-	/* We need to keep extra room for a newline when displaying value */
-	if (len >= (PAGE_SIZE - 1))
-		return -EINVAL;
-
-	driver_override = kstrndup(buf, len, GFP_KERNEL);
-	if (!driver_override)
-		return -ENOMEM;
+	int ret;
 
-	device_lock(dev);
-	old = spi->driver_override;
-	if (len) {
-		spi->driver_override = driver_override;
-	} else {
-		/* Empty string, disable driver override */
-		spi->driver_override = NULL;
-		kfree(driver_override);
-	}
-	device_unlock(dev);
-	kfree(old);
+	ret = driver_set_override(dev, &spi->driver_override, buf, count);
+	if (ret)
+		return ret;
 
 	return count;
 }
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 7ab3fed7b804..f99bbb20dd4b 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -136,6 +136,8 @@ extern int spi_delay_exec(struct spi_delay *_delay, struct spi_transfer *xfer);
  *	for driver coldplugging, and in uevents used for hotplugging
  * @driver_override: If the name of a driver is written to this attribute, then
  *	the device will bind to the named driver and only the named driver.
+ *	Do not set directly, because core frees it; use driver_set_override() to
+ *	set or clear it.
  * @cs_gpio: LEGACY: gpio number of the chipselect line (optional, -ENOENT when
  *	not using a GPIO line) use cs_gpiod in new drivers by opting in on
  *	the spi_master.
-- 
2.32.0

