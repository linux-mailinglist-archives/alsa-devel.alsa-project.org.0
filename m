Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BE64C45C5
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:17:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F7941B3F;
	Fri, 25 Feb 2022 14:16:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F7941B3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645795032;
	bh=uB366MvSNkK6wUsT5oNTT92aauQj8LsoFzy4s736oXU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b/bRmvgfOJnJfRKnkG3BglE2XbIj2N6F1MYjuM69yy4w/8RsFlugdLLfN1ORtQyYk
	 AUy0O6oG6kxVolemBxHkUGFFPnnFx/q5/g6XVQkQd6l3oSK3+EpCoSK8+oGBrFozxd
	 VqSxvzcmY6iC91AxLhhsqKshUf6KOgO3IhjVa84Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7C3EF8058C;
	Fri, 25 Feb 2022 14:11:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E665F8019D; Wed, 23 Feb 2022 20:15:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EBF9F800B6
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 20:15:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EBF9F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="iSbmatwU"
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3C2C53FCAE
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 19:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645643742;
 bh=7IYTHmQXzsIW766tCpVJPfNTfO+AmvxjDRcTslL8YGA=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=iSbmatwUCPgPpRwKw1XYPpt+x2hvTw+2/M/Wf4+cGE7AbReDqlOBxu99Eg/ckei+H
 SS3e/6WSystsPPaZIHCvTBPr9qwiJh6jSad0eiOfYe7+c2yQQhrOpUxra3mCpOXGMH
 lgN6SXGpHJl32m6ZJ6JNk4avKdR1VmvkPn9pAAybP+qSSUKYdAbELj8ZC41Cnc5gHP
 545F6iP65hxL+vTMLjCwHMpgb69m/wSzkhZdiSt73yFtyeHMvJao/aaDpbrMXB8Ih7
 sLnFEJj5SYg01JJZsFxNDqmd+q2eTncrTzxW4DNjOIPDNJ/q2rN9g2ikSHVKt1M8vb
 +73zlaGI3kU1Q==
Received: by mail-lj1-f197.google.com with SMTP id
 x8-20020a2ea7c8000000b00246215e0fc3so7760716ljp.8
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 11:15:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7IYTHmQXzsIW766tCpVJPfNTfO+AmvxjDRcTslL8YGA=;
 b=Gc1kQiREZhwWorokLadW4bywVrQbfg+TW8oa8LA1BkKJB4VOKTNCUUF/ciDr/Zqc26
 em5r2Sa4GvfXRumGRzTj8Slyp9KUmht7i+e3Gqtl2r5yBp/biVcB0cE2IQHXo+KODXl2
 FU9UlIG1qmDqzIA6Lm2Eb3h/5VYrqoh7HEtzZ1jyTiCCIy9HSzDSrzM/SaUQa2FVSVoz
 9m8ujvPCwaytp8hhMr9zvZEst+Pea0qA4Htu4EMwQW1+lOhEehkMEWOruIGkDOJ2GgBA
 xHRw3XY/B9NoVmmyHZ+IfTbaXND/HeSnNmDxz8Y6bGtRkjwAKtVIOKVwF6+SSQS2agr5
 +SAg==
X-Gm-Message-State: AOAM532ApUsuNq92eaSci63PmX+G28JluizxPldVoxhdeKs/CMO5ayCO
 xk8z7Zxy3zXaDg2uhuhjKUae76bNfqG5gObRCJMIXyZpUewVjZhgv44TXSzQjdW8WmRV9Nli9G1
 7lmA6T6TfLFjSbmfqB0CByi2mIGJxqXQn7xlHd/eP
X-Received: by 2002:a17:906:b57:b0:6ce:e31a:524 with SMTP id
 v23-20020a1709060b5700b006cee31a0524mr898075ejg.290.1645643723447; 
 Wed, 23 Feb 2022 11:15:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXaymv6Y03sx5emAtiihVKDslUlZDj5+bUOqZTX2T0tvcmba61MgF/pNNazmHUobDDFmGa2g==
X-Received: by 2002:a17:906:b57:b0:6ce:e31a:524 with SMTP id
 v23-20020a1709060b5700b006cee31a0524mr898038ejg.290.1645643723190; 
 Wed, 23 Feb 2022 11:15:23 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id b3sm208368ejl.67.2022.02.23.11.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 11:15:22 -0800 (PST)
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
Subject: [PATCH v2 07/11] spi: use helper for safer setting of driver_override
Date: Wed, 23 Feb 2022 20:14:37 +0100
Message-Id: <20220223191441.348109-1-krzysztof.kozlowski@canonical.com>
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

Remove also "const" from the definition of spi_device.driver_override,
because it is not correct.  The SPI driver already treats it as
dynamic, not const, memory.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/spi/spi.c       | 20 ++++----------------
 include/linux/spi/spi.h |  2 +-
 2 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 4599b121d744..0c7e2c34f4a3 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -74,27 +74,15 @@ static ssize_t driver_override_store(struct device *dev,
 	struct spi_device *spi = to_spi_device(dev);
 	const char *end = memchr(buf, '\n', count);
 	const size_t len = end ? end - buf : count;
-	const char *driver_override, *old;
+	int ret;
 
 	/* We need to keep extra room for a newline when displaying value */
 	if (len >= (PAGE_SIZE - 1))
 		return -EINVAL;
 
-	driver_override = kstrndup(buf, len, GFP_KERNEL);
-	if (!driver_override)
-		return -ENOMEM;
-
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
+	ret = driver_set_override(dev, &spi->driver_override, buf);
+	if (ret)
+		return ret;
 
 	return count;
 }
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 7ab3fed7b804..01224d07aaff 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -184,7 +184,7 @@ struct spi_device {
 	void			*controller_state;
 	void			*controller_data;
 	char			modalias[SPI_NAME_SIZE];
-	const char		*driver_override;
+	char			*driver_override;
 	int			cs_gpio;	/* LEGACY: chip select gpio */
 	struct gpio_desc	*cs_gpiod;	/* chip select gpio desc */
 	struct spi_delay	word_delay; /* inter-word delay */
-- 
2.32.0

