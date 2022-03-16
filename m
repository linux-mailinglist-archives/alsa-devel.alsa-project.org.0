Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF92E4DBFE1
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 08:02:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CF3F18E2;
	Thu, 17 Mar 2022 08:01:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CF3F18E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647500539;
	bh=2Bq0q7vTZa7/mWz2yB9iAG0pGHl2C5lFYjKZNPZV+wk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JbN4JeaiFY3Fe9CrQ2Jnxw2Cy3NQQhsZJb2eroCSKNPv4JH6+1s+Eecy48OgZxkns
	 PbRMm/pjlejRgR68LVxLFXg/q+mxhF7STBa0DTImlXRY+8QH5Chw2h0+WwmVCXX48X
	 owtx0KfP88ozsX/gUTlPJ51LopM5h7N+R8BeEb50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23C83F805C6;
	Thu, 17 Mar 2022 07:55:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AACBEF80087; Wed, 16 Mar 2022 16:06:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61548F80087
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 16:06:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61548F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="fC4wu2Pb"
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 040A63F1B3
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 15:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647443212;
 bh=JNKVE+3JexqhZeL95jpZ7AxMh5V3BiZd1u/ZcabQDj4=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=fC4wu2PbTpZ6FOxB5WhrZKMy1NKPGdwvnnXmUm92vr5zwP0/cKBA3mGVmcrVEW45O
 ZIQbRnUbJh/1goNyHQHYijMR6WFf9MrMeW+HSKxtL/mm5LlQJqF0rraxfjdrtglIvY
 xKkKr6/pg2wmNjqqbabOlG6NHPMWNd3HsSOMz1FFaJtSwFWOnIJPbQIkLeOFiiUm+x
 BcSZ0I39F8T+2EzTyyWfE5prilqdNelrjt+VummNtbZF2n8amgFqmO7KtGIcDmRdzG
 YUEAF1fEz50L6jP/sZg0HbiIFdTz613f2Y55Wcsbn5XVVmbfI24moRW0UeAPeqtw4x
 yIf/V7zOk0N8w==
Received: by mail-lf1-f72.google.com with SMTP id
 s17-20020ac25ff1000000b0044877550d2aso846622lfg.2
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 08:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JNKVE+3JexqhZeL95jpZ7AxMh5V3BiZd1u/ZcabQDj4=;
 b=vvhpoT8qyAf19NKqB6GIie6aUBaZuEHBs9T0XXPrVFXlTnSFP77362C0dZrPSkJoub
 c96LVTa5XOAuovoSURT5Ot1ciRPrrOvIAI/DKj2NOKRFT5qiPPIxUbsqzVXRCOLC6f56
 lVEyu0vTNayT+zbskplhg/yDLM6/r4nyqwJvP+ZDdRNrebcmSg/9tBLUKST9CLo7thBB
 xmzO9qynCBdTqSgvzVKiao4Lm5rhCPa99us+l4UV5OJeroZKJHUHVIi03v0NLR7mtKU2
 U1Fu0udYnxM/SerM4nV07oPsicg326Z/Dvaj77HpNrGIvP5SHettVqPp5uku8AbC72d+
 Lp8A==
X-Gm-Message-State: AOAM531NvFeHdsfjk2rQYJZDLPVuFynFm0FeWvN9DwhZq/VLzWUKZgVE
 4AOdYccU+oKktSA65COq5fEvXR63tHmlNG+YW1eZPZ3i4UQ+AVyLsjRfDtT3XkwCTCBG+6Kgcup
 IyewfJDr0+L4PjI6IR/9bAoaPlI5HsNtp4N61kJu+
X-Received: by 2002:adf:e6c7:0:b0:1ed:9f7c:c99e with SMTP id
 y7-20020adfe6c7000000b001ed9f7cc99emr338958wrm.0.1647443200062; 
 Wed, 16 Mar 2022 08:06:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCUhxAKawe3MPuphaitMx3nXTnkxh9V6g1RJgrcVXBEtRF7kgts/Kf4MtPXL4nFMNuuGjZig==
X-Received: by 2002:adf:e6c7:0:b0:1ed:9f7c:c99e with SMTP id
 y7-20020adfe6c7000000b001ed9f7cc99emr338940wrm.0.1647443199883; 
 Wed, 16 Mar 2022 08:06:39 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 p14-20020a5d59ae000000b00203dcc87d39sm3130155wrr.54.2022.03.16.08.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 08:06:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v5 05/11] PCI: Use driver_set_override() instead of open-coding
Date: Wed, 16 Mar 2022 16:05:27 +0100
Message-Id: <20220316150533.421349-6-krzysztof.kozlowski@canonical.com>
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
code.  Make the driver_override field const char, because it is not
modified by the core and it matches other subsystems.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pci/pci-sysfs.c | 28 ++++------------------------
 include/linux/pci.h     |  6 +++++-
 2 files changed, 9 insertions(+), 25 deletions(-)

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
index b957eeb89c7a..5ecbb845aa21 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -516,7 +516,11 @@ struct pci_dev {
 	u16		acs_cap;	/* ACS Capability offset */
 	phys_addr_t	rom;		/* Physical address if not from BAR */
 	size_t		romlen;		/* Length if not from BAR */
-	char		*driver_override; /* Driver name to force a match */
+	/*
+	 * Driver name to force a match.  Do not set directly, because core
+	 * frees it.  Use driver_set_override() to set or clear it.
+	 */
+	const char	*driver_override;
 
 	unsigned long	priv_flags;	/* Private flags for the PCI driver */
 
-- 
2.32.0

