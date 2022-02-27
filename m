Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 019154C9F4C
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:34:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B080192A;
	Wed,  2 Mar 2022 09:33:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B080192A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646210085;
	bh=JPx0VKaVGxybsjEKcNSWe2uEFD8YkIsps/bhL7b1mTo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hXcmGFx8G/ChfU9SCsZPHQmHGS5d5R1HSqXcXHjhhF170SGU4eS7zNmzyFcyyjvJU
	 R8b9kgxGtKQytkmHZdIX42hkupWlPCWiCSXuby6v4nK632tvXCJPBVoCXd0Z8gJIO0
	 9uydZUiC7B+mQAx6f1OXb6rp6MI6eUuI1ZzSP2T8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C6FBF80154;
	Wed,  2 Mar 2022 09:33:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F6ADF8016C; Sun, 27 Feb 2022 14:52:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5C8EF80155
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 14:52:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5C8EF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="oxTHKuiz"
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A64D340295
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 13:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645969954;
 bh=m4/zffFNkZQ1c8QkZX27EHIqdt+D+lrYYYcC+6RBnKM=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=oxTHKuizKnfVrMj+ob15reDKgFyQGVThIe6lFkgledhCWWerBcS4wlg2oLYhIG1Le
 zh2NWcWeQPeEHdTe3A6dJW8Z4i/KAFzVHokYwn8TEfP3u0mPo3Ut9Wsys9GfpyJQrr
 btrqe0tHJcsACxOZ7tke6amglpbi1721YVRq1AIyCODdEXONE0pwMt9b3BU4sTZSQ7
 8fZnwQJl2Xg7hEIAk/XcYJqu2Gis3Ry9YbH57FHnW1M7XrV0rS0FGc1zzyVBJzEJdn
 NszgSCTalQiNKV0ga0bq2lbV7AKgT8HCaxk3s0TPEGYEPHcxcPzjOltcld2zk8pLHq
 aXKqvrZIgh/9g==
Received: by mail-ed1-f69.google.com with SMTP id
 m11-20020a056402430b00b00410678d119eso4223265edc.21
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 05:52:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m4/zffFNkZQ1c8QkZX27EHIqdt+D+lrYYYcC+6RBnKM=;
 b=1WHT9eh/vVeuVku7mXnTkXpK7Hn+OebDdNxxzjZGTxEUJ4l8iGwOnm/WP6S5Kzp1Id
 LdECC1F7+DRKoOou6hjdD+Ufe+f7vnlPlhFv5GXxePAiprTLVEQ5spIzbKbD2Bl3KDEE
 CAXeT3XeBNCT3Ao8+AjFhwZlAPtTXBHlq7J0e8mIIe8mxwmvVRWJ5AFi3g4Iniq45JdS
 FyJK2eWVIc9BFW+G5/whrH2UMm17Xss3anfR4J1xUP4xtnck6VtfyK/4HAx3rRQOIMUJ
 h3xS72/m4kE0lfYO8YzFpFenA07us+0uYToYl82NxQA7Woc2DK2xyABbS6CPKipMweOO
 IDUA==
X-Gm-Message-State: AOAM530PR4Qqb9OQiIW/hDceX9L1F1IorNFEZU/yi0igMrv1teAuuT+T
 1tfDZ64dG+qc4dlUsmjhdDmKISLgiIrG+hCNoHkCBQ3BW1JDtv3xAb1uYjEe1Hzz0NweXnHfY71
 h8QYv4fKUw/pmjYxPI3BDK5DDid9Y2qCZaOknAm6E
X-Received: by 2002:a17:906:4a09:b0:6d0:7f19:d738 with SMTP id
 w9-20020a1709064a0900b006d07f19d738mr12036144eju.76.1645969954374; 
 Sun, 27 Feb 2022 05:52:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDrA1IPUhAcFT/Pi1MZ832Wj6CLhe3h27Schy7iuQVqfDwWSjNQI4J+6UflVGRe+cHgFDDSw==
X-Received: by 2002:a17:906:4a09:b0:6d0:7f19:d738 with SMTP id
 w9-20020a1709064a0900b006d07f19d738mr12036129eju.76.1645969954167; 
 Sun, 27 Feb 2022 05:52:34 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 r22-20020a17090638d600b006d584aaa9c9sm3393333ejd.133.2022.02.27.05.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 05:52:33 -0800 (PST)
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
Subject: [PATCH v3 02/11] amba: Use driver_set_override() instead of
 open-coding
Date: Sun, 27 Feb 2022 14:52:05 +0100
Message-Id: <20220227135214.145599-3-krzysztof.kozlowski@canonical.com>
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
 drivers/amba/bus.c       | 28 ++++------------------------
 include/linux/amba/bus.h |  7 ++++++-
 2 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/drivers/amba/bus.c b/drivers/amba/bus.c
index e1a5eca3ae3c..9dffa17f50c0 100644
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
index 6c7f47846971..7c703cb7a3cf 100644
--- a/include/linux/amba/bus.h
+++ b/include/linux/amba/bus.h
@@ -70,7 +70,12 @@ struct amba_device {
 	unsigned int		cid;
 	struct amba_cs_uci_id	uci;
 	unsigned int		irq[AMBA_NR_IRQS];
-	char			*driver_override;
+	/*
+	 * Driver name to force a match.
+	 * Do not set directly, because core frees it.
+	 * Use driver_set_override() to set or clear it.
+	 */
+	const char		*driver_override;
 };
 
 struct amba_driver {
-- 
2.32.0

