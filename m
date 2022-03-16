Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A35F4DBFE3
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 08:02:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA48018E9;
	Thu, 17 Mar 2022 08:01:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA48018E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647500556;
	bh=hUy2ooyML1mxb5UkIHiYMoiFeYUVNxQHjS/khmsRRuc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nn5jfbsi40uvwvODVKLE/ZCw1iC968GNS60hWY/kwMNxKn2fb74YsuKElZmnJZcWx
	 nExcuqwUYlgmfjYfY6t9ppcnoxv3eg2QCKy+0Qq+VLzrhyV4l9E/TaxAY/+hQAdhRl
	 XIL0AmMP67IZ/9Ne1g1XDsmqDYBgqeLDsotScaGE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A26D7F805C7;
	Thu, 17 Mar 2022 07:55:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BF93F801F5; Wed, 16 Mar 2022 16:07:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0386BF80087
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 16:06:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0386BF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="DX7mGveJ"
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 657493F4CC
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 15:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647443215;
 bh=QAEyo1xXNWnC/wTobDlvVW3kuxucr7Y+nryukeY/7zA=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=DX7mGveJmsPVSxH8t9VB5qeyz8X8Fe6PSXGK9i6kzGfrv9ouwCHJkZs8XS7IV1Sah
 dYd3ILgMWrML6jCGpXfwuGjA0w23+3Zfa0zVe3dK1+W3yLFYMxP+w6wjNn7Rm9ymVE
 sb75IFGgFLnUoVnQWFj++S36QaJas/FGbtuGu86zn3x9oE9Y9rWLTwmuebHZaBFv16
 KR89W2wZgdZXqfB2++kyo30du3Q7hTDaRN8vHsf46ExBTR+Ge09MuZTVpO7btumJ1F
 QMkPrmk7PyJSx4GaLSo27mJsTGLZ1tYRZO2WTrDHlSoTYQvU2oyEzfktHnKZDcrqoy
 ZhxgGqqDWpAHg==
Received: by mail-ed1-f71.google.com with SMTP id
 l24-20020a056402231800b00410f19a3103so1489731eda.5
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 08:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QAEyo1xXNWnC/wTobDlvVW3kuxucr7Y+nryukeY/7zA=;
 b=HXbfDmXENGqAv5yw9k1SptsQBtYEA5pGf2Qu+5keHiqOSVifd4LyRbeGsZdmj8YcQ9
 TJBa4vEy4FwLJniA2SdB5hfNXNLSNRySWzxz57k0m7zSMjjVIAGmAyw5/eZRXRkWEPhN
 f0v6LiaJSvb4XbV9cWPi5Eiv+sWDHcQv2dhlIAms3Cu64FZF6gxW4qPQx/FejJgzwoHF
 8bKJSujqV5FdbW52BPdM1d9wi0/qCrGT2Vo1ZAhsqP5OmrYhWAZ8gnBn4rDJxH3vN46R
 E7mSmludfhI3YMbelDu6TMAA1qe0sO1ECu1mj9h03IER/lA1SaIChkJdEbFsL/NuW6Qa
 6VSg==
X-Gm-Message-State: AOAM5327DXhs7V9jc+7eC7TlZ4qoHJh4NQZbuAyHdhWJght1BGlQZOEe
 Z5VQvAzM/N/uiuy6ATvNl7NF8fGg9RfDsRcxHT7NK+bSPz3gYC4ANkUOeCSW/nyhBfwuREKG7CS
 wLENLa0MXhSumyuuloTvfaTVqeqkZeusk14hsw4ZU
X-Received: by 2002:a5d:55c5:0:b0:1f0:7672:637d with SMTP id
 i5-20020a5d55c5000000b001f07672637dmr349041wrw.170.1647443202242; 
 Wed, 16 Mar 2022 08:06:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxweeXNXzqSiK6jLHKTzxTuSJXVd/nxHPvdpHWEAERfetg3Sykd8n3TukHieLMV78+GWu3x+Q==
X-Received: by 2002:a5d:55c5:0:b0:1f0:7672:637d with SMTP id
 i5-20020a5d55c5000000b001f07672637dmr349028wrw.170.1647443202062; 
 Wed, 16 Mar 2022 08:06:42 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 p14-20020a5d59ae000000b00203dcc87d39sm3130155wrr.54.2022.03.16.08.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 08:06:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v5 06/11] s390/cio: Use driver_set_override() instead of
 open-coding
Date: Wed, 16 Mar 2022 16:05:28 +0100
Message-Id: <20220316150533.421349-7-krzysztof.kozlowski@canonical.com>
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
Acked-by: Vineeth Vijayan <vneethv@linux.ibm.com>
---
 drivers/s390/cio/cio.h |  6 +++++-
 drivers/s390/cio/css.c | 28 ++++------------------------
 2 files changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/s390/cio/cio.h b/drivers/s390/cio/cio.h
index 1cb9daf9c645..fa8df50bb49e 100644
--- a/drivers/s390/cio/cio.h
+++ b/drivers/s390/cio/cio.h
@@ -103,7 +103,11 @@ struct subchannel {
 	struct work_struct todo_work;
 	struct schib_config config;
 	u64 dma_mask;
-	char *driver_override; /* Driver name to force a match */
+	/*
+	 * Driver name to force a match.  Do not set directly, because core
+	 * frees it.  Use driver_set_override() to set or clear it.
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

