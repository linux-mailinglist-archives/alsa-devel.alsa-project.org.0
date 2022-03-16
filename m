Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E9C4DBFDF
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 08:02:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CED6718D6;
	Thu, 17 Mar 2022 08:01:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CED6718D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647500522;
	bh=o7K7rn8MX0SDcZ6EY7/dK7n/CryedeSS4TXQLimdDNA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RQ/AqxzNsyXZRJ81pBIC5BBBrnD9XIuC6z1Ywbxo7KU/9eV9+wvMIVR8vDdwqvdjD
	 umWbQIQpUmpvDBjP0x0XBPpZmJZ7Bpx00BGBtmNXXV8M56K3eUhrRD17xYBLF8enDg
	 b3DhIIR/gHr9L8ywHphxzBcfF3f0R+4r/tE2xTh4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CAFBF805BF;
	Thu, 17 Mar 2022 07:55:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 901DBF8019D; Wed, 16 Mar 2022 16:06:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7141DF80087
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 16:06:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7141DF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="PgLhZzJv"
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6F0823F798
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 15:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647443197;
 bh=qe4dhnprNWM6uzn5SGQYSUaT3EAa0OIFZFVGuX4NqAE=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=PgLhZzJvZM9Q93vnKuw+yR2JWmF7ADjg0cv3fMnPPQMDmov11PhsokIzXO/HTH5rF
 W/zq0vEw6Mnw8onC75AJxqt0DO6A1m46R1dQ8x5WQPBKVQlN4foo9Bz+/Nv0bwG9BZ
 1jmhdngGfUhyhzdfAdRHZMlY4IT0IssOmGzCvj6/1zP9GQhLGI8TBWWDDbmIYy72Kv
 kiJFakwJmzcd8WX92H24m4PbcfCrYyIAW6I2GwArhzjVOUMonnz2P1uMPiirtB8AUf
 Qi/Honyxk0IGmT5p9eqGCumOdDo5Es99xXugCD0t8GS4wNG5g1ytUbpsvRR/3o7p31
 qiuHPBKBg0iDQ==
Received: by mail-wr1-f70.google.com with SMTP id
 t15-20020adfdc0f000000b001ef93643476so672364wri.2
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 08:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qe4dhnprNWM6uzn5SGQYSUaT3EAa0OIFZFVGuX4NqAE=;
 b=SqpT2Sa5ve0L1nWdHKupjezI+6yzyGhZEQvwGd7CVPtzwzzBpk/O3aFUAuocn+qDTm
 b8lAPfBRNBe+BQm8YzhaLfaipWRGkU+pEdPupqemWj9zlKHZZ8g6LfaJzt4vidthk053
 O+9BzEC8mqAbTFjMhbzsTwbSpjP3GVooZOFoi9+EV7CFUYkCebrJxUJdnpEL59ajL57H
 4/YCO17kE8CLMc0mZnJKJoBgaWqcNCeNpQ8WEEkI+7trN/Qei9HcoLckUZQVz25zSem/
 /zmC+qudq/B+RxyYtBCumnb3EzOYylGwxBz+D+62aTK/GA8R0YIz3NRr+PDDEISvoMkh
 Zmbg==
X-Gm-Message-State: AOAM531K1gS5WocIm7tbRJZz236suA2CWvG48FtT6U8kaFIVQheP342U
 HFyghFzQQX+h0oGxZqmp6PMBaAbv7G1/0BZWLPix6No1lG2qgRPBRpXFJ6xCttjsBFuESicrsxn
 sSSPaq+Njhzbc3wFNP+UZ6ObyrQgEVc1dU8nWMqeG
X-Received: by 2002:adf:f48d:0:b0:1ed:e2d7:d5e0 with SMTP id
 l13-20020adff48d000000b001ede2d7d5e0mr339350wro.252.1647443196958; 
 Wed, 16 Mar 2022 08:06:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLiBCbgm6QRK3G0rpLKvHnouae5z5SEdfWjFsLkOL7izSJ06dvAGkwNICqtwmEJDwxDDgSbw==
X-Received: by 2002:adf:f48d:0:b0:1ed:e2d7:d5e0 with SMTP id
 l13-20020adff48d000000b001ede2d7d5e0mr339317wro.252.1647443196762; 
 Wed, 16 Mar 2022 08:06:36 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 p14-20020a5d59ae000000b00203dcc87d39sm3130155wrr.54.2022.03.16.08.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 08:06:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v5 04/11] hv: Use driver_set_override() instead of open-coding
Date: Wed, 16 Mar 2022 16:05:26 +0100
Message-Id: <20220316150533.421349-5-krzysztof.kozlowski@canonical.com>
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
 linux-arm-kernel@lists.infradead.org, Michael Kelley <mikelley@microsoft.com>,
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
Reviewed-by: Michael Kelley <mikelley@microsoft.com>
---
 drivers/hv/vmbus_drv.c | 28 ++++------------------------
 include/linux/hyperv.h |  6 +++++-
 2 files changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 60ee8b329f9e..66213ce5579d 100644
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
index fe2e0179ed51..12e2336b23b7 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -1257,7 +1257,11 @@ struct hv_device {
 	u16 device_id;
 
 	struct device device;
-	char *driver_override; /* Driver name to force a match */
+	/*
+	 * Driver name to force a match.  Do not set directly, because core
+	 * frees it.  Use driver_set_override() to set or clear it.
+	 */
+	const char *driver_override;
 
 	struct vmbus_channel *channel;
 	struct kset	     *channels_kset;
-- 
2.32.0

