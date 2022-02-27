Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDDE4C9F4F
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:35:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BC1E1A47;
	Wed,  2 Mar 2022 09:34:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BC1E1A47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646210145;
	bh=QjVEcn9LYrpOMfeerwBRqFM0TX7GD+VBTo54DkQ9X+c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KDQZfli/tc7sdncKnLXwFrctcjzjMq9zJ3XPLLxNejbO4FyIKEkiCXBIg4FPSG9EP
	 4IC6tnGID7w9MFRS6Fp3hXxjfh69ukXlcYz5DlWK3yCGPB0Xf22DyJ3DSJMk42ZiR8
	 8KAiXFzV7e6VFXjIszoj7eNAe1CaUF2y0MJ8i6vc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B692AF8051A;
	Wed,  2 Mar 2022 09:33:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E612DF804DA; Sun, 27 Feb 2022 14:52:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32E8DF80158
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 14:52:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32E8DF80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="WlQEnPKI"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BAA46405F2
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 13:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645969963;
 bh=kn+qF0tdCo1etTHWEFOqoxtrhJ+rC4czu2ZZy5+SihI=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=WlQEnPKIEePgugSx9iUYOn0DTmnQ+d7BtOIg4MGaZ+9cGE5YCqkk8Ofshq7hBm9Tr
 FLW6tnN5BgDuLs6McmJLswvsUbjdaPITe+HzA3UDzCe0JdLfeqhzLrFKlAQIX2QlmW
 D6f/l3UX0Szlk1hEA9r+jNp/m9IoLjR3gtKjVb0JP8HG6LY48++sIs7rLwjj2gVz2V
 /GQQMSU5qDA1VJM3tnsSk7LqH3riSbdq54vvrybAxGgsVpga4Sn+wmlGQ/SoCPF7hk
 uHoLl/yrkSqYCVNFYZ9UvvYPUD8jl5LWfGmD7FdK56ktalmwzFJNN2GCXWfVgoN/rs
 ZsRgk3vKodZ2A==
Received: by mail-ej1-f69.google.com with SMTP id
 m12-20020a1709062acc00b006cfc98179e2so4371211eje.6
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 05:52:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kn+qF0tdCo1etTHWEFOqoxtrhJ+rC4czu2ZZy5+SihI=;
 b=N+Xj1HUuQd+9/Qfn9/B2gqPF1LhhTbB5IJ13JLaXsInhjDg0Cxj56HZ+N5q7vIBeXP
 X3mebRtBZfhnR5RlPpAk2CgNpwxOu/JU6n6fkfraA6z70cwSbQ7efpEN9Q4jhdGjISNg
 dqfXQ06tvfndEQeE0sbL8/w6Pkp/WnxksiR9M911vbI8k3ibkbUosNyEHPTN3sYZnbpK
 kx1XEzgntEqmLoT6gAJVtgc8QOFwjslstOUvOOlSUIPeKvZKU1TDWM/MF/nflJYFtM0Y
 RJywr+Kr5sT2Nog2Wp3uDvs7JGcTPVMCZGdBJ7WkTiMhMjAFPoh86DCF+JpBMXijuaEk
 sMHg==
X-Gm-Message-State: AOAM531hOs7r+1PWv2ahPbYa08Ncw8/LCZo7GBtJFVyz+xKwY/f1JGub
 Q+LlfNlye9oMwxyQzDbaX81SuUb4iqLT6JBFkHdqgKblwo+lmWyvFHh4GFgTHagMqG7x63uIi99
 wdSC4AtQyntM6tVwBqRLbC03OPxyQXjUHvPqrpSia
X-Received: by 2002:aa7:c4da:0:b0:410:bb1d:8232 with SMTP id
 p26-20020aa7c4da000000b00410bb1d8232mr15075934edr.333.1645969961200; 
 Sun, 27 Feb 2022 05:52:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhg/i5aHofZaz+ahzc6dFTcb8xbpOjhh0OtL6Jhkm85pFdhXbdMsjLVRzYgEWWn1QmpSdqKg==
X-Received: by 2002:aa7:c4da:0:b0:410:bb1d:8232 with SMTP id
 p26-20020aa7c4da000000b00410bb1d8232mr15075900edr.333.1645969960978; 
 Sun, 27 Feb 2022 05:52:40 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 r22-20020a17090638d600b006d584aaa9c9sm3393333ejd.133.2022.02.27.05.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 05:52:40 -0800 (PST)
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
Subject: [PATCH v3 06/11] s390: cio: Use driver_set_override() instead of
 open-coding
Date: Sun, 27 Feb 2022 14:52:09 +0100
Message-Id: <20220227135214.145599-7-krzysztof.kozlowski@canonical.com>
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
code. Make the driver_override field const char, because it is not
modified by the core and it matches other subsystems.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/s390/cio/cio.h |  7 ++++++-
 drivers/s390/cio/css.c | 28 ++++------------------------
 2 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/drivers/s390/cio/cio.h b/drivers/s390/cio/cio.h
index 1cb9daf9c645..e110c10613e8 100644
--- a/drivers/s390/cio/cio.h
+++ b/drivers/s390/cio/cio.h
@@ -103,7 +103,12 @@ struct subchannel {
 	struct work_struct todo_work;
 	struct schib_config config;
 	u64 dma_mask;
-	char *driver_override; /* Driver name to force a match */
+	/*
+	 * Driver name to force a match.
+	 * Do not set directly, because core frees it.
+	 * Use driver_set_override() to set or clear it.
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

