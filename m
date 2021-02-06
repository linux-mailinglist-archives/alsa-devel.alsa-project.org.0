Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C226B311DA4
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Feb 2021 15:24:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3637115E0;
	Sat,  6 Feb 2021 15:23:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3637115E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612621478;
	bh=m3v+ImLGIY1R2VVy4138bNMFpKbARsPxJX0jEPtm0g4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gLoYrNKzKo8t01ZRoS4/3ju6OiRTS2Axo1JDb/qJLIgNO52kiwha5G8wn7aQ+wRLm
	 PvaWx+XMjwDcAl8x9jfXWJfdgwZOxIVK8VV1JeXHCwpv919CTpebLE95z8BXgepno/
	 Y7xJ0uVbsFf86xhwLPtus2baU9IAeU6bDuLzGtLA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CAAAF800B8;
	Sat,  6 Feb 2021 15:23:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAFB6F80171; Sat,  6 Feb 2021 15:23:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEAEBF800B8
 for <alsa-devel@alsa-project.org>; Sat,  6 Feb 2021 15:23:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEAEBF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mUcL8Fc9"
Received: by mail-qk1-x732.google.com with SMTP id k193so9904491qke.6
 for <alsa-devel@alsa-project.org>; Sat, 06 Feb 2021 06:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=krbAckb/MhWT+Qt1YzEWVenXC2f25RXSxxOWkIAJa0s=;
 b=mUcL8Fc9KfaLrtg3HjTR03t/Ms3uaW+teIVI1Tp36TuUj/U8jDJl0W/YR6pu3G5UvE
 O9IvQWBiH+aOTnInjZx8jQ8XyMvdLDpm7K1DGaDB2ySwR63dDvBYqvZ1MTijA7tMIJY+
 xf+lATX8GWcpeAsGZR1sqfIQstbHv04lzeotFtEj5qTL2uE6XkJvC0xvoqB7uudbcvAQ
 8q1LMK+/E5qN+iODk3Uny+tNrQCMklRZBL/Jzp9hW94sAqrPISXzEiTzsscCq3IGm0oN
 3naNRIfJue6zR9acp951Phi3UB78Qad1H2oDWmk8xGtTaotn7vyCTim07ald3Km+k9lM
 nCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=krbAckb/MhWT+Qt1YzEWVenXC2f25RXSxxOWkIAJa0s=;
 b=DJ587zslsUPNepckn1MAhT1k4alK7GmN+3cSGv9YqScDmZPWdSrMBn3HBUlBJbIcye
 DraSYUjOeUvnlJrbQjMnU33dDCADK+6LLQpF9uD7tL1bs+D1oir6JP6UmLxYrBClHJd1
 JjvLKNK8KX4Yk3Vzpjo4yfIGFA9nqcYjU3wsbav2msDuK3zWHOmwyCfPTjt5asNs9MOu
 5wez7cq05FwXGCMJ/RTOjrPtmrXBh3YrG9qC/GzWNp4VVUCL+GaXgu/eT66MKVYDXoT8
 KjL2FQLyski/fnIodHUegNOwDV2Ds06Ul+8lkJ9EjFhnbv1InyAS8I9jxFgDtSVjfuog
 Thfw==
X-Gm-Message-State: AOAM530xZvfbhxYSNcdf8GrWq3jzN5vyU5qdVOfBP1SqUeaAAm3639Y+
 LqSD0JVOQLs7pI3C/7J5pt8=
X-Google-Smtp-Source: ABdhPJwGAfqVL+LKsXJ66wmpIrjljbvov7SDaABcTwocvk4bhK20MFVpZRZFgm2RvACFs3jz9cGOdg==
X-Received: by 2002:a05:620a:22c5:: with SMTP id
 o5mr8734577qki.364.1612621378893; 
 Sat, 06 Feb 2021 06:22:58 -0800 (PST)
Received: from localhost.localdomain ([2804:431:d77f:e61e:c875:9def:11d8:cdcf])
 by smtp.gmail.com with ESMTPSA id m21sm11667512qtq.52.2021.02.06.06.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Feb 2021 06:22:58 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH] ASoC: fsl_esai: Remove unused 'imx' field
Date: Sat,  6 Feb 2021 11:22:43 -0300
Message-Id: <20210206142243.535544-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: nicoleotsuka@gmail.com, Fabio Estevam <festevam@gmail.com>,
 alsa-devel@alsa-project.org, shengjiu.wang@gmail.com
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

The 'imx' field is not used anywhere, so get rid of it.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 sound/soc/fsl/fsl_esai.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 614e22a95f53..ae679fa4aed9 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -27,7 +27,6 @@
  * @reset_at_xrun: flags for enable reset operaton
  */
 struct fsl_esai_soc_data {
-	bool imx;
 	bool reset_at_xrun;
 };
 
@@ -86,17 +85,14 @@ struct fsl_esai {
 };
 
 static struct fsl_esai_soc_data fsl_esai_vf610 = {
-	.imx = false,
 	.reset_at_xrun = true,
 };
 
 static struct fsl_esai_soc_data fsl_esai_imx35 = {
-	.imx = true,
 	.reset_at_xrun = true,
 };
 
 static struct fsl_esai_soc_data fsl_esai_imx6ull = {
-	.imx = true,
 	.reset_at_xrun = false,
 };
 
-- 
2.17.1

