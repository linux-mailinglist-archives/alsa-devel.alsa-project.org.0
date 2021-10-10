Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3E44283EE
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Oct 2021 23:57:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B88D167D;
	Sun, 10 Oct 2021 23:57:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B88D167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633903077;
	bh=e8RTZXD5QTUofNkZ4RNO8R1URtpbDdtF+YCVLaP/siI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qyfQAQLfen0JL7jzdim/6HlBQ/Lk1dNNVxs3HMXplW9IquM+pu6LKeFbjILn228M5
	 St0byLVvxEmiiegJrQMC5tZ6kygbzel7QE/OsvBGmW6C+Vx6P0/5YFJjqOSCS+h83d
	 lX5od6jpF9NnyPOcq+pvXjXitIE1WbKntnIy7i7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0E42F80212;
	Sun, 10 Oct 2021 23:56:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63982F801F7; Sun, 10 Oct 2021 23:56:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48C53F8016D
 for <alsa-devel@alsa-project.org>; Sun, 10 Oct 2021 23:56:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48C53F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VtRSwv+T"
Received: by mail-qt1-x831.google.com with SMTP id r17so9454927qtx.10
 for <alsa-devel@alsa-project.org>; Sun, 10 Oct 2021 14:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jJbVzM7l1D7JuwqpAtI5nI7LnVZbvtzYKA+zk7EWtHU=;
 b=VtRSwv+TAjnM/7UgaXIXwuA4sdNX3Yyrgv0NaB8ScyZrroWaYPWsvfZfwY2yLQN7pE
 E0SJCYR5fOR5SulTnrIb417GrpSYo0DcyPvvLMCLdkdEJ7y6DT4w+0Acl4q+e21gW1t6
 AIh/YSakbWaNy+is/VTAFywLZHqjLupRNA4RKD3fN2vim+PARDioldLQHZiaqZDNSVK1
 UoivOuewKg9BcZjWmcOje5CLAjrY7fTEVSSABQ1z4H28S7nkx1ul+I3nS3+5BUR422MH
 8lXFbYCpJGjtPHsb8tvI+kYFdWqRLy81G3r0vQX9ATQhiSGa6ALOo3TniCpPP7GdyORq
 4Nmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jJbVzM7l1D7JuwqpAtI5nI7LnVZbvtzYKA+zk7EWtHU=;
 b=X/0/On/IqIfO9TE8lFGqWXVWJcBNz2fZbrNcH5UEqA83M9TRo5/1Gvf5ci1IjX/Ghy
 PlabYpxcb56jLJDaB1NBWtS8D5x6YqASjiq0sgjvXYwFvyuxfSOzdkpXCYjUEaLiPfx4
 XYdoiAcOYrhrw1JoXkIKE4iXlI23or80/6aXKOAePuDyyT8oFgLFfeMq8H/XGexxbs4d
 tk+pEI08uPKpGHOPYdAfrBaR2bkIvFqMMDnYlj1S/0njoifj4pWmyLOKEpyFJqHk7AV3
 HI9QFqfnUiql+Nj9PhteFIP1ajF8HwHMG4Ck62LF9vLj1uTWF1ta6dNWqfqSvBpeOlER
 DkoA==
X-Gm-Message-State: AOAM532VmAg46Ib65DkjidoBTJPkX6YY74+SYjfEB7aO3Xi4Sei2w38m
 7idw5F9ns9Wi1UowuW9rzFA=
X-Google-Smtp-Source: ABdhPJy2Uxes532xgkBffYFXTLfI44OGqyQwMouf2EzqAGyGgrgAVWINChSTbrTrXuZd2/8FBsc9FA==
X-Received: by 2002:a05:622a:11c9:: with SMTP id
 n9mr11536236qtk.295.1633902993496; 
 Sun, 10 Oct 2021 14:56:33 -0700 (PDT)
Received: from localhost.localdomain ([67.8.38.84])
 by smtp.gmail.com with ESMTPSA id t11sm1851951qkm.92.2021.10.10.14.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 14:56:33 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fix unmet dependency on GPIOLIB
Date: Sun, 10 Oct 2021 17:56:27 -0400
Message-Id: <20211010215627.17869-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: bgoswami@codeaurora.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, ajitp@codeaurora.org
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

When SND_SOC_SC7180 or SND_SOC_STORM is selected,
and GPIOLIB is not selected, Kbuild gives the following
warning:

WARNING: unmet direct dependencies detected for SND_SOC_MAX98357A
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
  Selected by [y]:
  - SND_SOC_STORM [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_QCOM [=y]
  - SND_SOC_SC7180 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_QCOM [=y] && I2C [=y]

This is because SND_SOC_MAX98357A is selected
by SND_SOC_STORM and SND_SOC_SC7180, but
these config options do not select or depend on
GPIOLIB, despite SND_SOC_MAX98357A depending on
GPIOLIB.

These unmet dependency bugs were detected by Kismet,
a static analysis tool for Kconfig. Please advise if this
is not the appropriate solution.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 sound/soc/qcom/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index cc7c1de2f1d9..8c5c1ed54bc7 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -38,6 +38,7 @@ config SND_SOC_LPASS_SC7180
 
 config SND_SOC_STORM
 	tristate "ASoC I2S support for Storm boards"
+	depends on GPIOLIB
 	select SND_SOC_LPASS_IPQ806X
 	select SND_SOC_MAX98357A
 	help
@@ -141,7 +142,7 @@ config SND_SOC_SM8250
 
 config SND_SOC_SC7180
 	tristate "SoC Machine driver for SC7180 boards"
-	depends on I2C
+	depends on I2C && GPIOLIB
 	select SND_SOC_QCOM_COMMON
 	select SND_SOC_LPASS_SC7180
 	select SND_SOC_MAX98357A
-- 
2.25.1

