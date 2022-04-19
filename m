Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5FF506B9A
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 13:59:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CB1118DB;
	Tue, 19 Apr 2022 13:58:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CB1118DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650369577;
	bh=diCgYnd1gy+qtOTmw7lDXsNkN3KR7aq5qRU2vNi7hmA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZP1ggZL2v14KseLGBUFPSQxBygglEWNQX8trv1MBgEtInD9fhntsFPaNCM7A8MkJ9
	 NAYgq3MBAVU8D930fgKxia//bCzVXWkpGDfoLWFby8rqeYXyNg8378mtmg5OF+6BsU
	 WlvYcToCVDY6/TPsdIcrYfcwM9qYe1u3QVKixsuc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FED1F805BF;
	Tue, 19 Apr 2022 13:52:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D514F804CB; Tue, 19 Apr 2022 13:35:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 906ADF80269
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 13:34:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 906ADF80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DTuv34MQ"
Received: by mail-ej1-x62d.google.com with SMTP id bv19so32283004ejb.6
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 04:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Keg7xeXtq8amo+bPOPiY0urtb62UU+nYY2PydP0Pktc=;
 b=DTuv34MQ33JHfqETATQCEFdNozHmI35rAUQVc6olY52FJAiDXlsoudP958Slrb5wG1
 DSPsGtDvlTAOkorBlo5mTDEsuc4ydyQ5Yf8AxUenxXPtL5w79pnDU8388VAXjO9mEVD+
 vEeppQOWxBuT/F1c/tirPFrwshVkv0IzHeXlVS3TRoe5HUqVwgpCDZbGYEjlScL0+6Vr
 hyS9XdBBr+bjvGu2LzcODR5O9YGPdmzXSE/BE4YQKhkbj4iyXXTmW7nwSDUIvjxekh2b
 pFhW9CQNJbOpAdevGaap0fwJd6ED38/k91U2fka9puKnEErIFBBucAn4aACWqEK20wY+
 fNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Keg7xeXtq8amo+bPOPiY0urtb62UU+nYY2PydP0Pktc=;
 b=cPg+BlgsOZN8k8npKueB77tqAgnFAQuX2byCJjQ1CSkD1Wd+x1J9GKIcLPygtx90gI
 ejMjKHXLreDE9ouBEj/PigqIvHyr0mUBSEbtm7zuC+yzUjWu8XI5aWzCU3bUb3Zs0t3b
 QQyhzDYvpyuNPKl+hBkAFS0981xsFR58E2vNqljAOacrfY9aSlWyRygw7/9+jHDZ5u3z
 pmWqUGNODnFdmrLGL/q5vqWusGnt4igUedFHbhFaqG1/8mJGIBZBmAgPVnd+krTAdhRu
 NGvzTm339hikdq5EB3U5mPOlkSyoHfLi5q8ifovmSNBRWvloKiAKZFO50Mh0kQtwfJAv
 tQCQ==
X-Gm-Message-State: AOAM530UF0PYXJgCAr77mQU/rUNHqi8JkEBEK//QnUKPFLnYvkvqdFA9
 9++byBdx8aXuoAqL5vsXwUt4uw==
X-Google-Smtp-Source: ABdhPJyVt0cgXUYUeGSEzHKPEQtYs3Qh+dbqLbNajfqREgpBOjCU9zh7evNxJ42COX+bjxL2ovpv7Q==
X-Received: by 2002:a17:906:d552:b0:6ef:c5a2:7e01 with SMTP id
 cr18-20020a170906d55200b006efc5a27e01mr5528474ejc.568.1650368093944; 
 Tue, 19 Apr 2022 04:34:53 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 ce21-20020a170906b25500b006e89869cbf9sm5608802ejb.105.2022.04.19.04.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 04:34:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v7 04/12] hv: Use driver_set_override() instead of open-coding
Date: Tue, 19 Apr 2022 13:34:27 +0200
Message-Id: <20220419113435.246203-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220419113435.246203-1-krzysztof.kozlowski@linaro.org>
References: <20220419113435.246203-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 19 Apr 2022 13:52:23 +0200
Cc: linux-hyperv@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>,
 linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, linux-clk@vger.kernel.org,
 linux-s390@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 virtualization@lists.linux-foundation.org, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-arm-msm@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Michael Kelley <mikelley@microsoft.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sven Schnelle <svens@linux.ibm.com>,
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Michael Kelley <mikelley@microsoft.com>
---
 drivers/hv/vmbus_drv.c | 28 ++++------------------------
 include/linux/hyperv.h |  6 +++++-
 2 files changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 14de17087864..607e40aba18e 100644
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

