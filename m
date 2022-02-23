Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1A54C45A6
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:14:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACEAA1A99;
	Fri, 25 Feb 2022 14:13:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACEAA1A99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645794863;
	bh=7L+JcV+ysh2qWj1VtK95Z2qKP6x8+b4ODE7HLSGbUkk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pzE1y5BBqJkjDJoaSu8tuBmEvDefnn4FaYOpIBtVTxmTLjX1LwnLmAtNMejbWIvKU
	 48YYdIKNRnEc+mzBasVYk2pIN9vt+5Aii2pSakUhSgpoUZg0Z5ltNa3HP8p1xV8IP5
	 rbino2piOerfJmkCpav2i5kIgLuZY/kvFzSKTyfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CD1FF80537;
	Fri, 25 Feb 2022 14:11:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D776AF80118; Wed, 23 Feb 2022 20:14:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55DAEF8025D
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 20:14:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55DAEF8025D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="V7N3qndg"
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 000C23FCAF
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 19:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645643642;
 bh=6kmYalWKPfFv5VRw+oGSxmK6RPimpkHdVtl6uKB49Rw=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=V7N3qndgtP20tVoJCo3hoCNRSfBZXhftWTe0ajU8wLcyxofY4wzJbUOU1tFQhXkKV
 WqFYA91EV1MOmO49oVGjZ6ne9t+zlHB4cBj8YCqs6Nwd2RMmRRlhv0HvEddIWwmeAA
 Q7LbBJGxWIi4xqEgFUqPtBEKMRFgu3xG0isQr1b/DNVaEid+MUItfZNLXo+EElLA0G
 jd3olVbbQtiofexUFX7EjuWUaVAPcHCpZRAG5DraWY7mejyEuXFoLZd4Rq7N1wS1uE
 Ra25OlYGZfp9vHwOZwPIOgL9xvl7IWg0XJfHheQBYF81M0b5L0DafTa++KtXLIto5d
 77wQ3OLf9yHYQ==
Received: by mail-ed1-f70.google.com with SMTP id
 o5-20020a50c905000000b00410effbf65dso14047017edh.17
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 11:14:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6kmYalWKPfFv5VRw+oGSxmK6RPimpkHdVtl6uKB49Rw=;
 b=alLUp8Yc5sLTVkBOR5ijEzVpetfiXnnnuMjjT/ZH9urJ8Oejv6VUXdRi1Ceu7ub5bL
 ngudRtAH5IAXdisKWpHBI4MNYcjY334Iboq9RDFm0OwAYnE2NGRwSuIPXigNxhxVt1A8
 w957nRQyh0zFQfAApnmtSYqLFVbnj+gpSxjDeb9ocg3Wkl+9d+S/hYTc4QSHVgdAOip4
 XeWVNeqa2eaK3b0skHiQ9e5uM7+pi/hYVzWHBFmH2cHi2uh1vmnt261vtyBVU+7mxW0m
 8i8OPSBnSQ18VDer5HDnKOGO4j+WcRs3ambDjZX8aCrqoxBwJISXVVOxkdUZnBlqNGYr
 SmrA==
X-Gm-Message-State: AOAM532O8BcL9Uy2MR7M8FjR4R7231TYB+cvxef5hpk8PLq+EtbGpvtN
 nGJhtriiE88Eot1bBCvUXdmp4ZPOgvAdqe2I2r+x1cgC2BHGnf+9y6J2cPsq0oEdWQFLt+gYg+x
 yCKJF+Yx4aHabPGZrdEddlnz7h61MlEI1sPiBnwXn
X-Received: by 2002:a17:906:8517:b0:6d0:1de8:cb6e with SMTP id
 i23-20020a170906851700b006d01de8cb6emr879369ejx.686.1645643637567; 
 Wed, 23 Feb 2022 11:13:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxB+J8rGAXqipxoP9wQ6myB7nB+zWmd6qpvw2I7Sb7Voa93sYSAIKWPaoRnjyaDxxppMxF7NQ==
X-Received: by 2002:a17:906:8517:b0:6d0:1de8:cb6e with SMTP id
 i23-20020a170906851700b006d01de8cb6emr879348ejx.686.1645643637394; 
 Wed, 23 Feb 2022 11:13:57 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id q5sm212611ejc.115.2022.02.23.11.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 11:13:56 -0800 (PST)
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
Subject: [PATCH v2 04/11] hv: vmbus: use helper for safer setting of
 driver_override
Date: Wed, 23 Feb 2022 20:13:03 +0100
Message-Id: <20220223191310.347669-5-krzysztof.kozlowski@canonical.com>
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/hv/vmbus_drv.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 12a2b37e87f3..f2435cc8b680 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -575,31 +575,15 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct hv_device *hv_dev = device_to_hv_device(dev);
-	char *driver_override, *old, *cp;
+	int ret;
 
 	/* We need to keep extra room for a newline */
 	if (count >= (PAGE_SIZE - 1))
 		return -EINVAL;
 
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
-
-	kfree(old);
+	ret = driver_set_override(dev, &hv_dev->driver_override, buf);
+	if (ret)
+		return ret;
 
 	return count;
 }
-- 
2.32.0

