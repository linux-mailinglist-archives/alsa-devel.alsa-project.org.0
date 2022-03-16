Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8C84DBFE9
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 08:03:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1617C18FA;
	Thu, 17 Mar 2022 08:02:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1617C18FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647500605;
	bh=OpmFEgV22dP/3IuNQSHVnK0GjzNIXI/K9eHc9v8MKg0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J/0rx2h5EATe8+dDXDKAIZZ+ib8hNoUVl6l2C2TyEjd6pVYiKl9I65NiGCYn4ct4h
	 OpISzbqWExw+yDlX8wSrNGvPXYIA6Tkx9kjflu90DBkrfdoO+B6Vu8R2ytMRUMroph
	 fYegm1MI/sXVXhOoqDu1we34JpL6mLbqIcORxmOw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 918AAF805E3;
	Thu, 17 Mar 2022 07:55:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62322F801F5; Wed, 16 Mar 2022 16:09:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B78DF80153
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 16:09:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B78DF80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="tylFDIpF"
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0073A3F32D
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 15:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647443346;
 bh=yPtLMahnwKOtCcXgH/ktoILLnjecC9LZzwZsY57u2dU=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=tylFDIpF86PSUTmS7l/zItKdjV8LJp7MVLgn9Jp51GjpdzVrLzP3Knq7FBreL863A
 EcpFyHfILedxYW/1GaZ3ysgSnbBkOYgXbvDCe6wUuJe00ph0eR0OQOrD5fTLcrqwPJ
 EQSpxHxE122nPInkENxZDtyprZ1Nq3ple+GrPQpd18xF1CUQ5EU77IRGiwHP01b59+
 eMa+66wGftTuKWImDEMChwsFIPGDCi2WA/RQWMMJx69o6VHIjE0CkOBmdz5WfMzNyN
 cGAvwVg2OQaG0wPBu8QxilElaDI8hYuzEdM+Z2CmHqZGY8HnZltGBfix4J4T3GF0j+
 4SVqQQq+IKeCA==
Received: by mail-wm1-f72.google.com with SMTP id
 l1-20020a1c2501000000b00389c7b9254cso2155695wml.1
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 08:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yPtLMahnwKOtCcXgH/ktoILLnjecC9LZzwZsY57u2dU=;
 b=M66uKnkm3oKqBDO1R0H5f9txVylaLm1Rr8V8d5z5wkv/8qf5t6JmhguC9utEixYYQ+
 t8lFyYTcBXQ16Ww/VdFwOC2DwHt7uVm6yeBKORw318mje4NU7AjMj5efiDLRREpBBZ3c
 pUoPM5scQ1bnqCySWc8H79ZzqxlHFymquwjCTVxKFtm9aXfFe6Y7B8OHW+YAo6VxVpyS
 ry1NI+CauyCCvAeIXRo/JTSaboinsNSONb1RB9+OrClbbQdjTX74niaaVd098xwcQHYk
 14YeAW9djme+mOXHhFwBvK6nrEVD3VmGCQ6VaSsMeE53i27GGz87fohuGjNv4O0nZ0IY
 LM1A==
X-Gm-Message-State: AOAM530I0aXC0YTpqlvFdAnfSRFBvfjKhh1LkMw0OlG7aRdL7jRG6Gf+
 Gx/uzMd73KW1+rA8uABDTNHa6FAVzKeMrcjKHser3Cd4BHNYtNu9pKqXVDKbNuGMrwdIK0QhD/o
 tYT809tpepRtPipeWnKJtN9by5oyTnMlxzoDjbLZE
X-Received: by 2002:a05:600c:1e1e:b0:38b:b31f:7fc with SMTP id
 ay30-20020a05600c1e1e00b0038bb31f07fcmr6700411wmb.191.1647443335039; 
 Wed, 16 Mar 2022 08:08:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLttuQcgADlzoGu5HiDZ52KZb2YEjo0lDq9KqKlAOh9CGx+bAznJO89SsLTaClQchjThu5dg==
X-Received: by 2002:a05:600c:1e1e:b0:38b:b31f:7fc with SMTP id
 ay30-20020a05600c1e1e00b0038bb31f07fcmr6700371wmb.191.1647443334858; 
 Wed, 16 Mar 2022 08:08:54 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 u18-20020adfdd52000000b001f04e9f215fsm1895105wrm.53.2022.03.16.08.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 08:08:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v5 07/11] spi: Use helper for safer setting of driver_override
Date: Wed, 16 Mar 2022 16:07:59 +0100
Message-Id: <20220316150803.421897-1-krzysztof.kozlowski@canonical.com>
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
 Haiyang Zhang <haiyangz@microsoft.com>, Mark Brown <broonie@kernel.org>,
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
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi.c       | 26 ++++----------------------
 include/linux/spi/spi.h |  2 ++
 2 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 6937cf2d59e0..34f311224c47 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -71,29 +71,11 @@ static ssize_t driver_override_store(struct device *dev,
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
index 5f8c063ddff4..f0177f9b6e13 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -138,6 +138,8 @@ extern int spi_delay_exec(struct spi_delay *_delay, struct spi_transfer *xfer);
  *	for driver coldplugging, and in uevents used for hotplugging
  * @driver_override: If the name of a driver is written to this attribute, then
  *	the device will bind to the named driver and only the named driver.
+ *	Do not set directly, because core frees it; use driver_set_override() to
+ *	set or clear it.
  * @cs_gpiod: gpio descriptor of the chipselect line (optional, NULL when
  *	not using a GPIO line)
  * @word_delay: delay to be inserted between consecutive
-- 
2.32.0

