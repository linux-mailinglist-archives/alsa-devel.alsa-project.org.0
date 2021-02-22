Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4623324F33
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 12:30:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46FF1168B;
	Thu, 25 Feb 2021 12:29:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46FF1168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614252626;
	bh=jN8o3bmCJQh9UFyhuwAvEeC4yj4cxiRvskBBuHglTQ0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O9ICj4LZ0OK53zj4MR5BQiDewG2iB5QJl0t+ngtFvFuoGSQ7t/lseEKz4AVh+WP15
	 8luxzclEOR7Grc+ndv17yVgxHbJ1M3Dq595wF54gy2GPEFBQxw353u14iTji5mQZ/c
	 d+5p/LKUCBDeWV4gl1h2IF7c76zoRr2fh71b8BFY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF984F804CF;
	Thu, 25 Feb 2021 12:25:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8642F8016C; Mon, 22 Feb 2021 22:44:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 643E1F800CE
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 22:44:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 643E1F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="D/+0Js26"
Received: by mail-qk1-x729.google.com with SMTP id 204so9314590qke.11
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 13:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1dNKSWdiyZdcySCS8Mo5qwTMLCVeoueOOG2rvs262jo=;
 b=D/+0Js26+HlfFQqMWd4QnMQ98GQQuoxrWwxYY4jKjloItBDrEbKRDIRnoTvrj2jsLZ
 +VoTol7Zos8swZE8ooW4d1tt0+p1lR5qQIoUcSHDclxVP74QbKjUCb5LhB1psGs5W7jm
 CMDz31J8BQZDT7LiXnP7QISkZdobC/4AgRZojU1mUaGhYCmUrUuUZPdWB7o28JPxfR7c
 qCdWM7U0A+eu5D62AdYAoOvpAHKn/AtdToFOTQuVexockM6ZbpwWZhx5tz7KHlpP9l6G
 tPFToFt0L1pEZKyMqOCcTugeGGxw1TAomprjAeH/dPHmFXZpbV3qW+kCNEah/QMt8RXn
 u4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=1dNKSWdiyZdcySCS8Mo5qwTMLCVeoueOOG2rvs262jo=;
 b=i5RtGuufT9vT52q575YW5J+lnuBoB/QCr7MBEAyaPbgGPzGZJVjQmyYGMiIuTK2jck
 SqIpCId8uT1XtbAkT3ukFWhId0wrEgS/Lp19je6cH7+m3pLhmZ/l4Cr1BjtNHvg9uvJG
 2ODlgyvSuqe7ZRSUVUeeFEu71YNUpT3NWu8l4jY+yLQtYlMwDcXbJf8zJLU/HBj71Rod
 HfPzToZvI4jZaxIIZMwkbOM0xQp7vDLsxLYT5BwDSYlavjz+G9uGakH/AuvkpCoSA5MO
 GWM0MWpz33KF/KDb9/IX5HZtnRo6CKuilbDo3ZxiMP2QaklSmAWVtKEgTcugJiYzy1iu
 aMAQ==
X-Gm-Message-State: AOAM5324jxd9YtZgNsLKJWKK1qtm+akWOMtgaDZtdwJWyuNLoNxMznfH
 DT1LR42/tpB0e+e5U64tvuU=
X-Google-Smtp-Source: ABdhPJwFSCSJLOSqsPqKt3URkuoEibnPZ79qNnVRlvLNBOgSLG7t2y7e0ZwQSSypqQB5QOdocrILKA==
X-Received: by 2002:a05:620a:22a3:: with SMTP id
 p3mr22841037qkh.13.1614030294650; 
 Mon, 22 Feb 2021 13:44:54 -0800 (PST)
Received: from localhost.localdomain ([208.64.158.253])
 by smtp.gmail.com with ESMTPSA id j5sm11595009qth.80.2021.02.22.13.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 13:44:54 -0800 (PST)
From: Julian Braha <julianbraha@gmail.com>
To: perex@perex.cz
Subject: [PATCH] sound: soc: codecs: fix kconfig dependency on GPIOLIB
Date: Mon, 22 Feb 2021 16:44:44 -0500
Message-Id: <20210222214444.23340-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 25 Feb 2021 12:25:30 +0100
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

When SND_SOC_DMIC is enabled and GPIOLIB is disabled,
Kbuild gives the following warning:

WARNING: unmet direct dependencies detected for SND_SOC_DMIC
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
  Selected by [y]:
  - SND_SOC_AMD_RENOIR_MACH [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AMD_RENOIR [=y]

This is because SND_SOC_AMD_RENOIR_MACH selects SND_SOC_DMIC,
without depending on or selecting GPIOLIB, despite that config option
depending on GPIOLIB.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 sound/soc/amd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index a6ce000fac3f..5480dff7a1ad 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -46,6 +46,7 @@ config SND_SOC_AMD_RENOIR
 
 config SND_SOC_AMD_RENOIR_MACH
 	tristate "AMD Renoir support for DMIC"
+	select GPIOLIB
 	select SND_SOC_DMIC
 	depends on SND_SOC_AMD_RENOIR
 	help
-- 
2.27.0

