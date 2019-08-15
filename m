Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E132C8F231
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:29:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87428167A;
	Thu, 15 Aug 2019 19:28:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87428167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565890187;
	bh=/tbslC8v0AZoDNpxPU2/1WyE9fGPoxh2UsZlqFJd6iA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=fvcMME/5PZ/UXl5WbmQA8CNVcErysadFHlv4ot18cxAP9pmDLf0pK/55m4oAhDMxf
	 WefYKSSm9lhZn0IuCWlFKavvkE06+x4qeDareX5qfUkpxN6qurQ+r5wZeR2c4zEAA6
	 OeV9f5ZKD78KSqMXhMH1XXZGIGCk+OQdgMFR4t0Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C91C8F8076C;
	Thu, 15 Aug 2019 19:15:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8B91F806F8; Thu, 15 Aug 2019 19:15:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com
 [209.85.128.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5E18F805FD
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:14:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5E18F805FD
Received: by mail-wm1-f99.google.com with SMTP id 207so1877375wma.1
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=ktHQVRXcVTWduz8swL4HEDKPCJFrS626b0N3hJB5CIw=;
 b=VtD999+SGm9d9Q9D9kBPTCkJidqmfwACKy4Su5o+6UC/SQ0E+sdWK5c7WTg2LQXCEn
 TeTIPkokcfCVlZRMvAz+0sSrS2qtOVumfdmZtg7c1f6i5ocTIxFcGYBMcFrc5ZkS4jsc
 sJdu/UucXFiXqHGe7oxXTh9Imdxz+FlGfnUZpJP/vHUY/JT83qP9nUTtK5L3Do4xPtfe
 WiN8NRuuzCmcLN7JdLHW9agR3ItvwfUZpruk7ns5YXjpe9CrzE/B21gETgp9XJfaOJoi
 yRs1YpUkoLWGEaZvw1xrtLk5dAcXcHP/0hMSlTEU+PQEWZsWhjUeHxbSXawEoxsUQTLH
 8M7A==
X-Gm-Message-State: APjAAAXZ6zqcp++RErwL2TMRwED9/E1BrbGJwOSKx9WUK43PNp9BzPg9
 Gb9F8/P8BoObV2HJxRjCFLyt/ZLYsiJmg7xe9RHrBuL2ENHTsImicSQf9b8dzsMYjA==
X-Google-Smtp-Source: APXvYqz593JC7GQMYbu1GxOUwKcrOXtQYzMmeCdp/fhU+K9XVH/UT4jeR5d4UU5AvxOfFy4M6CfYxZQpDBTP
X-Received: by 2002:a1c:a5c2:: with SMTP id o185mr3641291wme.172.1565889267387; 
 Thu, 15 Aug 2019 10:14:27 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id h1sm10489wmb.39.2019.08.15.10.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:14:27 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJKU-00052E-V1; Thu, 15 Aug 2019 17:14:27 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 567272742BD6; Thu, 15 Aug 2019 18:14:26 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190813142501.13080-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190815171426.567272742BD6@ypsilon.sirena.org.uk>
Date: Thu, 15 Aug 2019 18:14:26 +0100 (BST)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, Hulk Robot <hulkci@huawei.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: Fix -Wunused-const-variable
	warning" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: soc-core: Fix -Wunused-const-variable warning

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 0faf1237c60a3791d7ff32035d3097d3e022e68f Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 13 Aug 2019 22:25:01 +0800
Subject: [PATCH] ASoC: soc-core: Fix -Wunused-const-variable warning

If CONFIG_DMI is not set, gcc warns:

sound/soc/soc-core.c:81:27: warning:
 dmi_blacklist defined but not used [-Wunused-const-variable=]

Add #ifdef guard around it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190813142501.13080-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e9f44505cc3e..abe2f47cee6e 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -73,6 +73,7 @@ static int pmdown_time = 5000;
 module_param(pmdown_time, int, 0);
 MODULE_PARM_DESC(pmdown_time, "DAPM stream powerdown time (msecs)");
 
+#ifdef CONFIG_DMI
 /*
  * If a DMI filed contain strings in this blacklist (e.g.
  * "Type2 - Board Manufacturer" or "Type1 - TBD by OEM"), it will be taken
@@ -87,6 +88,7 @@ static const char * const dmi_blacklist[] = {
 	"Board Product Name",
 	NULL,	/* terminator */
 };
+#endif
 
 static ssize_t pmdown_time_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
