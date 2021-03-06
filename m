Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C686432FA5F
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Mar 2021 12:56:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 651901B01;
	Sat,  6 Mar 2021 12:55:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 651901B01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615031794;
	bh=e22yP+PhgtbY/9C6JdC3PdMzwvyPC+8nVD95ySi3m10=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WGltM1EPg1uuCWT68d0u4P/ibQQURDUyylcZRwLop+pDsaoxeC01I6jVbIUtuIIfI
	 rsnDutBoG8MM1uEWYwPmz25H8lWPvPkJbW/SmSZGl8DJUq7opfCv6/kt/o+zZqiYmy
	 Ts07g1lR6Hhg+l30o4nbBVdFxCKStxiA0gIBfEdo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF074F8025B;
	Sat,  6 Mar 2021 12:55:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D908F80269; Sat,  6 Mar 2021 12:55:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A588F800ED
 for <alsa-devel@alsa-project.org>; Sat,  6 Mar 2021 12:54:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A588F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kOYYCzuv"
Received: by mail-qk1-x729.google.com with SMTP id z128so4690816qkc.12
 for <alsa-devel@alsa-project.org>; Sat, 06 Mar 2021 03:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+D7wE8hqhj+u3/A4MDh5ToEYR7A6GBul6TjtK8PAwFg=;
 b=kOYYCzuvIpWfcsFVA+Vm5gphdzTeiTaxbM9nNUaJsO0fQfT9zrxlGxw8tqJ8bFLOie
 LUGiKgiSqW5Rav/ZgTcGH9FU3Gy5b77DFrs4WwUVTNLJXNaAErPOYbMR+eyVhi5nkedQ
 yEYJBq/3GkR92zT9uiigNb+WTGur1UqbvQzt+CF8HO2XtO0YCzN4C3LUkRZk5Kz2HJnE
 iMDZbb1V7CMcaFzwHWB9cUtkTVkldLd3AIjY1pOP82N8L/0+QKa5ATIPqgd/qDYhjAdR
 ntmTZmoKI7tx1eBG+acn/+nNKASYCnm0rIo2LgQ7dWcwnEvwecxmqYOfVU3NbkHnsoFH
 LSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+D7wE8hqhj+u3/A4MDh5ToEYR7A6GBul6TjtK8PAwFg=;
 b=dWGYuUX1P6bIF9SkDxkiK/75YoC+33PjXUfFVBaxYVF1+1+RYopcye5CW0tyFI9NOp
 8ONrrxV6bxnBhqQDXOBD8q96sOuZy9xri9TmxW8CwjCDn+hL5CMUbLT+jZewzHz3qaqE
 p2LFcm/5nBYqv3YVWcecTbslHPFxLCnVDOU8WeVBo0iyzf6eI7wu314F1RGRNSE2etUB
 ToLBUZFBV3T8hUpoOL5ttuagGV2SntmOCg3ZEpRiLBRmBT/FNlk72UJkz+drO7tIAU+C
 VNv7Nd/na1wwHwUo1u+ElTLz2UAFk7DNZ2XgKLaWqdz4djw4qjbvOXBLvzlHu5+/sVPZ
 cvuQ==
X-Gm-Message-State: AOAM532jaZjLNGXzqhz/kFnoPxgubws+EfPxBV84iikToGH41yNojX5i
 p2j1BCHLWOFTZsg3q9au6+U=
X-Google-Smtp-Source: ABdhPJxQqsn1DCr5BflNfEfvSuiQWgWDFs9zXst6srNskXXUuRSVBA/Kbpl3ACGwInOSqdV1enXiyQ==
X-Received: by 2002:a37:9e56:: with SMTP id h83mr13445402qke.38.1615031692557; 
 Sat, 06 Mar 2021 03:54:52 -0800 (PST)
Received: from localhost.localdomain ([143.244.44.230])
 by smtp.gmail.com with ESMTPSA id v4sm683186qte.18.2021.03.06.03.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 03:54:51 -0800 (PST)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 kuninori.morimoto.gx@renesas.com, gustavoars@kernel.org,
 ckeepax@opensource.cirrus.com, peter.ujfalusi@ti.com,
 unixbhaskar@gmail.com, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] sound: soc: codecs: Fix a spello in the file wm8955.c
Date: Sat,  6 Mar 2021 17:21:51 +0530
Message-Id: <20210306115151.31759-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: rdunlap@infradead.org
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


s/sortd/sorted/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 sound/soc/codecs/wm8955.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8955.c b/sound/soc/codecs/wm8955.c
index 513df47bd87d..538bb8b0db39 100644
--- a/sound/soc/codecs/wm8955.c
+++ b/sound/soc/codecs/wm8955.c
@@ -151,7 +151,7 @@ static int wm8955_pll_factors(struct device *dev,
 	/* The oscilator should run at should be 90-100MHz, and
 	 * there's a divide by 4 plus an optional divide by 2 in the
 	 * output path to generate the system clock.  The clock table
-	 * is sortd so we should always generate a suitable target. */
+	 * is sorted so we should always generate a suitable target. */
 	target = Fout * 4;
 	if (target < 90000000) {
 		pll->outdiv = 1;
--
2.26.2

