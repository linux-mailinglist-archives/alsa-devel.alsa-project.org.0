Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEC84C45C3
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:16:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 264D81B43;
	Fri, 25 Feb 2022 14:16:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 264D81B43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645795012;
	bh=TEtnRO7KQkF4rixo15TnFN7WwQuTPPQR9hi/BxMe2d4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IvddTAPacATdJDpiYjJJs2KIvbAGZaHooiM1E6Yb5EONxMeXIVMmEYvrJfpGxmrl8
	 Y2ZUKscFzcrwtIvvPjppTwktA9ht2sGNB3WfvVugld+7MDkL9ou7ZmK+yfqGJKKExE
	 yaSTDlYKRe0kx3HT0cuo5czAQuXrieGqF/SRLoac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C58BF80589;
	Fri, 25 Feb 2022 14:11:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E292F8025D; Wed, 23 Feb 2022 20:15:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCDC8F800B6
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 20:15:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCDC8F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="ZxnwEOrf"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id ACC0C3FCAF
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 19:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645643741;
 bh=7X8ZF+SfQI2ha/R62opt5Mpi3EJQ2IXnqtdf8o/szaw=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=ZxnwEOrfUoHvBZ4YSumWdgIelYc44n0NIDNeSw2XgDxKYnTkBCV+wpUA5uMyFeBnb
 0jgJS4v1MOzny6yOc0TaWYTTCRlfKM1ScYgb5v6Ds0bEfwgqsjoy2GRUIWnxxsNRKG
 YFeFdoFgFsL6pFVGRx66HVs+VsTsPsvrkkcvKbBhvR0t4GWwjp313JYgLeTE8XutFT
 hOax1z5wMv+pKSxveGZyAO0tJHU0u5t5W1i/lweQEiZI25SKxgCYJ4uGxxR0a5x36J
 sQnCoxl04K9ShkE+TL59UYJcHrHV6Rtf4OIBcX7PS9DCBam0Ng/TgUggCQpKmeCaUt
 A96zR0EU9d+1Q==
Received: by mail-ej1-f69.google.com with SMTP id
 mp5-20020a1709071b0500b0069f2ba47b20so7403381ejc.19
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 11:15:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7X8ZF+SfQI2ha/R62opt5Mpi3EJQ2IXnqtdf8o/szaw=;
 b=vSP5zY2A+PiwA/FwXr2eEzgtDATCrLJsujJbJUn0WmATVNRWwLtSdaHTg/fDjZixut
 QNnYTFjkd7GNydZCz7+ZSdtCLwxgWriOVxM5GQRXFPbNHYoIqqDL9rzO2fhTO7/6JmjF
 oW+RoIK9ve7Nb9qcxdlxCc7saPI/CWONZR/K0mJxGKxRYPHVr4k8F3KgM47OcyU8L3B/
 M/DF/usZMdWAbap58CGbP5ne4UpOkf29oTYzojVd6da+iJVLnckxn2bbu/G914mk2FJf
 S0ng/jDDWGWuzxcTFtfjrExc2zQzOwQ/W7PV3rBUSLveasjijDzW5V4albWpBUTzjBzU
 nxDg==
X-Gm-Message-State: AOAM530SUz6jfNviLHH99SE+q+IQWIQYBfWU5vqy2cqhLQsnyZaWebC8
 AWVygvlfn8noj/u3efqeQGhIK8+HYDkX/BQq27xjhxGcJIuLE6HhwkorbX8K5j90MhBfTQYagys
 nAF0+rSiXzANKxfr2Kl6KEo8SrBJuEyS4gvyKDAu6
X-Received: by 2002:a17:906:130a:b0:6b7:5e48:350a with SMTP id
 w10-20020a170906130a00b006b75e48350amr887342ejb.184.1645643731004; 
 Wed, 23 Feb 2022 11:15:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzAUHN+IckyCUDaf6b+egXxiKcwH4G6el1z4Ve3vQHF0MnEv7U39pYdE62mAB1vpTAj/GhtQ==
X-Received: by 2002:a17:906:130a:b0:6b7:5e48:350a with SMTP id
 w10-20020a170906130a00b006b75e48350amr887325ejb.184.1645643730755; 
 Wed, 23 Feb 2022 11:15:30 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id b3sm208368ejl.67.2022.02.23.11.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 11:15:30 -0800 (PST)
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
Subject: [PATCH v2 11/11] rpmsg: fix kfree() of static memory on setting
 driver_override
Date: Wed, 23 Feb 2022 20:14:41 +0100
Message-Id: <20220223191441.348109-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220223191310.347669-1-krzysztof.kozlowski@canonical.com>
References: <20220223191310.347669-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 25 Feb 2022 14:11:18 +0100
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, stable@vger.kernel.org,
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

The driver_override field from platform driver should not be initialized
from static memory (string literal) because the core later kfree() it,
for example when driver_override is set via sysfs.

Use dedicated helper to set driver_override properly.

Fixes: 950a7388f02b ("rpmsg: Turn name service into a stand alone driver")
Fixes: c0cdc19f84a4 ("rpmsg: Driver for user space endpoint interface")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/rpmsg/rpmsg_internal.h | 13 +++++++++++--
 drivers/rpmsg/rpmsg_ns.c       | 14 ++++++++++++--
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index b1245d3ed7c6..c7bd0a3c802d 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -92,10 +92,19 @@ int rpmsg_release_channel(struct rpmsg_device *rpdev,
  */
 static inline int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev)
 {
+	int ret;
+
 	strcpy(rpdev->id.name, "rpmsg_chrdev");
-	rpdev->driver_override = "rpmsg_chrdev";
+	ret = driver_set_override(&rpdev->dev, &rpdev->driver_override,
+				  "rpmsg_chrdev");
+	if (ret)
+		return ret;
+
+	ret = rpmsg_register_device(rpdev);
+	if (ret)
+		kfree(rpdev->driver_override);
 
-	return rpmsg_register_device(rpdev);
+	return ret;
 }
 
 #endif
diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
index 762ff1ae279f..1c9f9cf065b0 100644
--- a/drivers/rpmsg/rpmsg_ns.c
+++ b/drivers/rpmsg/rpmsg_ns.c
@@ -20,12 +20,22 @@
  */
 int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
 {
+	int ret;
+
 	strcpy(rpdev->id.name, "rpmsg_ns");
-	rpdev->driver_override = "rpmsg_ns";
+	ret = driver_set_override(&rpdev->dev, &rpdev->driver_override,
+				  "rpmsg_ns");
+	if (ret)
+		return ret;
+
 	rpdev->src = RPMSG_NS_ADDR;
 	rpdev->dst = RPMSG_NS_ADDR;
 
-	return rpmsg_register_device(rpdev);
+	ret = rpmsg_register_device(rpdev);
+	if (ret)
+		kfree(rpdev->driver_override);
+
+	return ret;
 }
 EXPORT_SYMBOL(rpmsg_ns_register_device);
 
-- 
2.32.0

