Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DE91791E6
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Mar 2020 15:04:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8CFD1668;
	Wed,  4 Mar 2020 15:03:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8CFD1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583330682;
	bh=eSVYZJogGpIujjiEdqEQQzEx1vzdrCNAPXgYaLvALM0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=enBiWyks86um/peIwbv1zyywtdIE8Xk/qDA55wptMLk4RcC2WqNS8r4Y7TRkhA5cs
	 C+Vrf0emWXRlMo7V+XU6fEOWPn+aZjCplcUnmVQlkHjvtL2jJxxUv8D/fu1cQlFiZf
	 yJHmejR5XqvGCxO0hLFbO0Y3IMFnbEIQ8zPN3RGE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBCFDF801F5;
	Wed,  4 Mar 2020 15:03:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA530F801ED; Wed,  4 Mar 2020 15:02:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABC51F800D8
 for <alsa-devel@alsa-project.org>; Wed,  4 Mar 2020 15:02:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABC51F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ingics-com.20150623.gappssmtp.com
 header.i=@ingics-com.20150623.gappssmtp.com header.b="YLQQtbyY"
Received: by mail-pj1-x1041.google.com with SMTP id d7so978193pjw.1
 for <alsa-devel@alsa-project.org>; Wed, 04 Mar 2020 06:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ingics-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jd3QBi0Z/HVtmKFucr+pRTHz2pW+2gUiKmDzk3hmOgM=;
 b=YLQQtbyYQmo/zFyQGFrhxPtZUa5XSYBm3Xvita114rktuoG/gisfoXltcqe96S1kWt
 P8Jn7B3pY5oGSUczhhy+GxgxgnUZMYAtj02pjeg8f6lbUYiy5OnTCzAG1sAe29auI/kO
 RkG9PEKw5dyt/R1ZAeJOSgSN2JEr/BR9ruSSSUdi++tPSQtDZci8qNcw04ghXLEv6vsP
 E7bB22o9x1ZW5A0c3vSJoNg8qMqxnWRa/0M+E9WLEeFzzu/7jKcTQbLjeolxi8Utv5E1
 jvFXt/aiKMIQYXsNWaK372liH7PMvug+pLFGEzDS9ILYxcc1uhfS8Ysw/D22LOlrVc0T
 I+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jd3QBi0Z/HVtmKFucr+pRTHz2pW+2gUiKmDzk3hmOgM=;
 b=KuNFXDYQl37Bm+zpHSahJPNwmSbwmvO/nC2GCMOZZckMIoJcFH+qNm+cnJ+Hhv8qMz
 uf4ek+KP+Hf6NXaAoo/C0GYuuxJ8bkBPSlCaNqtY4H1BldEcLSJ8RMKUbiCi+5dOBMX0
 0dhhVWaFpPy5XFxxcDXgKXlmrPbtg/+fDvv96frBq7XXWNCT8NxiuNAGKWutON3Qg3e/
 kK5R7N+2VdDi16XwcnIoN+X1YB/Z7vsWnsNI+hlWT5NPpu/2WLJurklVa6/DJatlnWz1
 1oJmtg/l3Qq9drppyMeb3JSv4fiWitS7KoxHLQXurzOgkxMYdXyhvbEfCgnPULh41Wk0
 dLNA==
X-Gm-Message-State: ANhLgQ3z/HcnGslTzicWkB4Uyv0tZe80UhN3ohxfYLvsfVUTCI6XiO2i
 +CVRsC2mr1a+I0pdCKp+yTm4aw==
X-Google-Smtp-Source: ADFU+vsL204RHDKo9b4bge+NlLGf+cxMd2U8YH8DgqhmkIQdOw+o/t0rRgoRjljh6ctB3V14wM6FAQ==
X-Received: by 2002:a17:90a:34f:: with SMTP id 15mr702004pjf.94.1583330571214; 
 Wed, 04 Mar 2020 06:02:51 -0800 (PST)
Received: from localhost.localdomain (220-133-186-239.HINET-IP.hinet.net.
 [220.133.186.239])
 by smtp.gmail.com with ESMTPSA id r9sm28937084pfl.136.2020.03.04.06.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 06:02:50 -0800 (PST)
From: Axel Lin <axel.lin@ingics.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: wm8741: Fix typo in Kconfig prompt
Date: Wed,  4 Mar 2020 22:02:41 +0800
Message-Id: <20200304140241.340-1-axel.lin@ingics.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Axel Lin <axel.lin@ingics.com>,
 Ian Lartey <ian@opensource.wolfsonmicro.com>,
 Sergej Sawazki <sergej@taudac.com>, Liam Girdwood <lgirdwood@gmail.com>
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

Fix trivial copy-n-paste mistake.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 sound/soc/codecs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 6aee70ed43df..fd09656d2f6b 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1486,7 +1486,7 @@ config SND_SOC_WM8737
 	depends on SND_SOC_I2C_AND_SPI
 
 config SND_SOC_WM8741
-	tristate "Wolfson Microelectronics WM8737 DAC"
+	tristate "Wolfson Microelectronics WM8741 DAC"
 	depends on SND_SOC_I2C_AND_SPI
 
 config SND_SOC_WM8750
-- 
2.20.1

