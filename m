Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EDB4C9F4D
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:35:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBD0C1935;
	Wed,  2 Mar 2022 09:34:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBD0C1935
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646210116;
	bh=oIbkzFRHs1hEeFLIyaHwCftDQ4LRd2fI57UaPD6vCt4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ar/QYyKMiE17Ta9Ju/cgcW3efPc9LFOr4J7ZSkwCfYFjoIrMIudxMrkfWrJ0SRTfp
	 YqBRzKHhzvI21uSXeJk20bZjGE8eO5dvQhTme4DuYraFhiYbCyJzDxSQJyPi5VMYLd
	 ah+rTiL30YyZXK6h2oe7Q4wk+dyWEJNqzob7O0N0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEDA9F804AC;
	Wed,  2 Mar 2022 09:33:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0C13F804BB; Sun, 27 Feb 2022 14:52:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3907F800B6
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 14:52:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3907F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="X52l0dLr"
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F2FCD3FCB0
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 13:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645969958;
 bh=pRyoy0wYqVh1vMWkfgiwvfL+uC0PF+MUz+uOlTyWlM0=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=X52l0dLr830YNL22Tsr99sXtPoa5ACOZsSRUEWtkbRA6l+njLu9eNmqc6P5o2qsL+
 8jP9uolUuACxpCqFZ36TwcciX1ske1daSCi0t1RJWEMf002M9/+XLKDqG1mfBW71fd
 nbWCM2yie3U44EAIDPHnfIw4fCB9hFJrADPucuvvJV+Xz02Lz5lFqmoQMNgwJ9uE1B
 A30m0QchjWf26IMMsWqgicgDa2UTQEROMa9r0U841rUHmnQvl9NwV85ilfJenCxmLN
 yOiIGJ5k4x0msSFMHNmscYceRyHokCophZ942tWQmKjSdMqadq7fxa7RDZ6AmJSvpE
 A7IZ4cqV8f8rw==
Received: by mail-ed1-f72.google.com with SMTP id
 l24-20020a056402231800b00410f19a3103so4259587eda.5
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 05:52:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pRyoy0wYqVh1vMWkfgiwvfL+uC0PF+MUz+uOlTyWlM0=;
 b=1FcjxWlsHt6gXxbRd5OBNOhwqhn6RmsykN5IHAG6pjX5g0fsksYR+XSbV01Wi6kaXm
 NEWG/V+0OmNTa0ywrCHyIJFfEyOJ3xu30Knyhi4XEZbXd2M4B0/BF3S939EYy8TMHduj
 C9JWobYvNqhZ5o8+xCGWKAIqlliRIxZkS+qd2J3pL3J2W1eygRWLDbrglD/+AoUFtevx
 oPrKgqYlD+eCc7dNSGPPw3DBUrrdlMlsIj+LuASCovjzSLgK2x1gbyRq2jd0o6gURZMv
 EPOYktKJ3012ppM6opQocsiEBFotBwIuUuPTeZWJpiyBJ6ax3LEU7cHfRDTcsGj8Lmip
 uHDg==
X-Gm-Message-State: AOAM5316z0SqL1k5W7mg9uyA5/kGJ+ufTYRlFqlsLYBPR8Hk6NfYiTlj
 XSAf/K2GI15+gY3uDvJfCc49sW1BL6XSx0SLIbWscnRqX9eSB1Ma8F+iIjiOkyPyfWiAe+tlNRL
 elGpBSfi18qld1PnDTv0z/iDY7B7U6oS9dF7pP1qk
X-Received: by 2002:a05:6402:1a55:b0:410:a4b4:2a9d with SMTP id
 bf21-20020a0564021a5500b00410a4b42a9dmr15356207edb.45.1645969957659; 
 Sun, 27 Feb 2022 05:52:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMCUVqX+GQTf3SH7q4WKAqDIKbuRWwlLyTqLEz2lVHwA8GB9LJKefEiix56LpqtlrzGflkbw==
X-Received: by 2002:a05:6402:1a55:b0:410:a4b4:2a9d with SMTP id
 bf21-20020a0564021a5500b00410a4b42a9dmr15356182edb.45.1645969957475; 
 Sun, 27 Feb 2022 05:52:37 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 r22-20020a17090638d600b006d584aaa9c9sm3393333ejd.133.2022.02.27.05.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 05:52:36 -0800 (PST)
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
Subject: [PATCH v3 04/11] hv: Use driver_set_override() instead of open-coding
Date: Sun, 27 Feb 2022 14:52:07 +0100
Message-Id: <20220227135214.145599-5-krzysztof.kozlowski@canonical.com>
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
 drivers/hv/vmbus_drv.c | 28 ++++------------------------
 include/linux/hyperv.h |  7 ++++++-
 2 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 12a2b37e87f3..a0ff4139c3d2 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -575,31 +575,11 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct hv_device *hv_dev = device_to_hv_device(dev);
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
-	old = hv_dev->driver_override;
-	if (strlen(driver_override)) {
-		hv_dev->driver_override = driver_override;
-	} else {
-		kfree(driver_override);
-		hv_dev->driver_override = NULL;
-	}
-	device_unlock(dev);
+	int ret;
 
-	kfree(old);
+	ret = driver_set_override(dev, &hv_dev->driver_override, buf, count);
+	if (ret)
+		return ret;
 
 	return count;
 }
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index fe2e0179ed51..beea11874be2 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -1257,7 +1257,12 @@ struct hv_device {
 	u16 device_id;
 
 	struct device device;
-	char *driver_override; /* Driver name to force a match */
+	/*
+	 * Driver name to force a match.
+	 * Do not set directly, because core frees it.
+	 * Use driver_set_override() to set or clear it.
+	 */
+	const char *driver_override;
 
 	struct vmbus_channel *channel;
 	struct kset	     *channels_kset;
-- 
2.32.0

