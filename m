Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAC64C9F5A
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:37:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F1ED1A4C;
	Wed,  2 Mar 2022 09:36:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F1ED1A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646210241;
	bh=JgZzkTfko9foLgfq2Vpx79Ep6D3Ru7Hj6CNrzuAED58=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=seU0Pg2MlPo3aXMFTT2vuiOfJLYhjgfkEBNREdFTmJwgHCDxUeXikEyBB+4ixKB+c
	 6u3YlPd6L6U9uciQ/w04N2eetFwBA/SqzctXCxtzkaJmeDNzQIPcNAesfwVimLt8SK
	 McN0zzKKSaz7icToE2dQnopaVPP2FNpFeNaKREZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADA38F80538;
	Wed,  2 Mar 2022 09:33:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8A78F80158; Sun, 27 Feb 2022 14:52:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B574F80137
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 14:52:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B574F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="fN2t5/EE"
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E27264030C
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 13:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645969970;
 bh=ovOgd1VJlKyRzMY+TlP34IMSMGHGw8uakjQlL885+iI=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=fN2t5/EE2yhwXd0uArW+F/K+cHueu8APZJPBMtBVxrSBENxOvTULI4qFYk82aWCCO
 RwF9mhHhUtr7RoOqNoXxdDAOzRpNF3+zgIYyHBVEsZuJ4tqDRbdb15GjJV2Jx2USRZ
 fr7V489qhuLTKsO+/Z3M5XWyXDqDNVqpd7yyPIlWm2N2rT4busKiowhLeo3fkF1Xdl
 15gDTK6fxcKMkVY+8BdJsqeIDYRsIaIimLpuV8qWBgCG46oY2Jqy0vhDys/p7oTbVj
 wMETxWlEsvzi7+DUhi8ZHuQbd7aa7+pDDaf1HZzygG0DuUOy/mrrvRex/RKXo6IqH+
 psweF0VmAgKCg==
Received: by mail-wm1-f70.google.com with SMTP id
 az39-20020a05600c602700b00380e48f5994so4591296wmb.0
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 05:52:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ovOgd1VJlKyRzMY+TlP34IMSMGHGw8uakjQlL885+iI=;
 b=evCAKw8RQIBlwqrAavOjOA3iN1Vyt1IYljPBDS0nGyDeLJcNJorkgD/RRuNvRUnG/+
 3FyT7bsErhPukxipt/0Fx3lU92YNfmnx69EA4VZG6BVdK2Go9lXLQp9/gxsEb+pbEhQa
 VQYx5MU8AYl9YfzXnXArMRZsLntV8eMcGtih+ENDG8pq6Btmei4JMkFYvk9x8VO+Ov9H
 DujrmhwG/HSxnWPeL1l6kc84RJLsDK+I9D3yFJWgWAEE/e6+49prL2rGiWxbwAz6GDwZ
 Ol9HlIqztzB6/+K+/IdaJwsdU83goPqEAak5UxO01DyPDHqwfbjcSOIHP3EUixlZvaMe
 tMtw==
X-Gm-Message-State: AOAM531O4F6AnTZDkrw4keEA7vUxbCHIQY1HY82O6EJuAJagNHHM1UbK
 niElX+jmzDYSazU1yfgGqd7LMwDojXAx7OoIHd5d5jvt6lOoCUvYV2rYqxVyPgxEbCqblyOoe0b
 eTgjMqvHCjuZPo+atCxQF8mABl8lNO/Cr106TLwwR
X-Received: by 2002:a17:906:82cf:b0:6d0:3d6:8f27 with SMTP id
 a15-20020a17090682cf00b006d003d68f27mr11873399ejy.236.1645969959556; 
 Sun, 27 Feb 2022 05:52:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaPeLTnbLCXr36eOWjnDy8E4LI71/jJS3zMt9CSPHhfhuyTLYqyLKvSg58uZ5j7Z3tq7CVSw==
X-Received: by 2002:a17:906:82cf:b0:6d0:3d6:8f27 with SMTP id
 a15-20020a17090682cf00b006d003d68f27mr11873353ejy.236.1645969959366; 
 Sun, 27 Feb 2022 05:52:39 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 r22-20020a17090638d600b006d584aaa9c9sm3393333ejd.133.2022.02.27.05.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 05:52:38 -0800 (PST)
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
Subject: [PATCH v3 05/11] PCI: Use driver_set_override() instead of open-coding
Date: Sun, 27 Feb 2022 14:52:08 +0100
Message-Id: <20220227135214.145599-6-krzysztof.kozlowski@canonical.com>
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
 drivers/pci/pci-sysfs.c | 28 ++++------------------------
 include/linux/pci.h     |  7 ++++++-
 2 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 602f0fb0b007..5c42965c32c2 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -567,31 +567,11 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
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
-	old = pdev->driver_override;
-	if (strlen(driver_override)) {
-		pdev->driver_override = driver_override;
-	} else {
-		kfree(driver_override);
-		pdev->driver_override = NULL;
-	}
-	device_unlock(dev);
+	int ret;
 
-	kfree(old);
+	ret = driver_set_override(dev, &pdev->driver_override, buf, count);
+	if (ret)
+		return ret;
 
 	return count;
 }
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 8253a5413d7c..5c00a8aebdf9 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -516,7 +516,12 @@ struct pci_dev {
 	u16		acs_cap;	/* ACS Capability offset */
 	phys_addr_t	rom;		/* Physical address if not from BAR */
 	size_t		romlen;		/* Length if not from BAR */
-	char		*driver_override; /* Driver name to force a match */
+	/*
+	 * Driver name to force a match.
+	 * Do not set directly, because core frees it.
+	 * Use driver_set_override() to set or clear it.
+	 */
+	const char	*driver_override;
 
 	unsigned long	priv_flags;	/* Private flags for the PCI driver */
 
-- 
2.32.0

