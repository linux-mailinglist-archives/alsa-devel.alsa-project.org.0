Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5434C4594
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:13:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6B8E1A92;
	Fri, 25 Feb 2022 14:12:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6B8E1A92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645794803;
	bh=3tVanHjB6TuEVn/9k2FRA473+PlLQjgU7jYi+aSa6hU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iVkgIttMu7tmadyInxx/BjDt4LKNMlPIXtAJk3J/Kki2jEN7NxRNU7SbYsU/8GM9A
	 4K844Lbwo12UXlU0adhdl0eepw/fKJI4uGRyeECr8ZbI/VxfbpRUJ+uH1TByyW1IkP
	 v4vcjd4UCF4qfBW/mf3PBBGD9RFPSvppJ5853XcI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48495F80524;
	Fri, 25 Feb 2022 14:11:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB87BF802A0; Wed, 23 Feb 2022 20:14:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71DC7F80118
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 20:14:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71DC7F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="KWA8gA6e"
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 70D5B3FCA4
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 19:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645643637;
 bh=fyZde4QL+5WSjtUcZmZyQ9LOCmYULjkOm0dq/nBIuzo=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=KWA8gA6eZk+VF9RtUiIH1BZ8HI+U22YJ4F942wUbe4OCgDWhuQaijiKrD9bnT78FE
 sIhed1vdkI1JKCMMMchm4H2AQBw6GdL6MweIMw79iDKqORazt6BHqs1L7jcbqv/ZoM
 6dRz4Y/UZbQ7PwSOo/Gz7tkONMx//pl9VTOpg3SrByRvMbjUidHDu4GQWGo6rlg7Nd
 KdAzbBSxd6U5cDVYaaVgswNPe/4LsF0+bqAUqPdLxOXcfSkzSFp+npyR3MG8ZRPaP7
 CGyuLT5vJ7jjYwku9bwIOIQF7jivgYyL3Dctc8c4iyhbb/m505d7RbrEb59ow/WEZp
 fchLDATn3kdGQ==
Received: by mail-ed1-f71.google.com with SMTP id
 l14-20020aa7cace000000b003f7f8e1cbbdso14056679edt.20
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 11:13:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fyZde4QL+5WSjtUcZmZyQ9LOCmYULjkOm0dq/nBIuzo=;
 b=PfDeke1o/SoR+HRCOX53CImeK/4cszkn9BDI8MehP3D9zVWnm+xuJaBQpj03IL+HxM
 jmBr5mCDXUQs6HatcbKGyfNVHOCLXyi6KFYSGkze2OSzOErBhFwNyhGJsC3ugruPzlXK
 1UuGYRvGMoVionsR4brbz/8RVRFOyhGrNRXSqlSB1faR3bD2j9jtWZPRVS+i9b5qq8mF
 oxKV838h15Gv1K7o2WoNwfoDwukzxTmSwdmpiSq41NGB2y+bhTGuLA4KR9erdX9sKw4y
 cLBiqyFZ8VI3BAjaoVGF2drqGk3QGTCYPAT5f3Vai7sfNKOxVpQqkR9vI6HV4RhfIYTu
 i7Ig==
X-Gm-Message-State: AOAM530KY0MzUj/T7Y/FPwwos+C7kWAjXvBSLiYGDx4owVm0aGOZyci3
 o8cW90BSAZFM/ie53WVIeKPWEN01TXEUVMRs0t3uCF0a9GkG2y47KUzDu/E8kwrPtrAFx2VjofU
 oGhNjNrherePH3Fi45mMO52GXLZNOJ8GRVTymy/bx
X-Received: by 2002:a17:906:a384:b0:6ce:c3f4:c59a with SMTP id
 k4-20020a170906a38400b006cec3f4c59amr870079ejz.580.1645643635869; 
 Wed, 23 Feb 2022 11:13:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQC18HONgcYdOr4fLdW/4QMQU7ra3n8dm0IepMHQhTlzr1OkJDjXXGMuSAKvUFTDXd0c3row==
X-Received: by 2002:a17:906:a384:b0:6ce:c3f4:c59a with SMTP id
 k4-20020a170906a38400b006cec3f4c59amr870048ejz.580.1645643635630; 
 Wed, 23 Feb 2022 11:13:55 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id q5sm212611ejc.115.2022.02.23.11.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 11:13:54 -0800 (PST)
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
Subject: [PATCH v2 03/11] fsl-mc: use helper for safer setting of
 driver_override
Date: Wed, 23 Feb 2022 20:13:02 +0100
Message-Id: <20220223191310.347669-4-krzysztof.kozlowski@canonical.com>
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
 drivers/bus/fsl-mc/fsl-mc-bus.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index 8fd4a356a86e..d93f4f680f82 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -166,8 +166,7 @@ static ssize_t driver_override_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
-	char *driver_override, *old = mc_dev->driver_override;
-	char *cp;
+	int ret;
 
 	if (WARN_ON(dev->bus != &fsl_mc_bus_type))
 		return -EINVAL;
@@ -175,22 +174,9 @@ static ssize_t driver_override_store(struct device *dev,
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
-	if (strlen(driver_override)) {
-		mc_dev->driver_override = driver_override;
-	} else {
-		kfree(driver_override);
-		mc_dev->driver_override = NULL;
-	}
-
-	kfree(old);
+	ret = driver_set_override(dev, &mc_dev->driver_override, buf);
+	if (ret)
+		return ret;
 
 	return count;
 }
-- 
2.32.0

