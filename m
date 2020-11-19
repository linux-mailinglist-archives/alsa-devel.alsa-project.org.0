Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB8D2B8A76
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 04:43:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54A721701;
	Thu, 19 Nov 2020 04:42:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54A721701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605757406;
	bh=QswBh2k3kQmuLB4Ca3fM4xg49c/O5/pq3Sd4KoRGCcQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cXqDFQe9j0AGyoQLgVMQz/NUob3BOzQm9Xx8LTafWkDZNZ8vcFm2URkveg8t/vOXz
	 3XsUV6+C7TSVH2ZNO5FwDy9hwiX2/Kqqk6YZXCGkammKQTtrjsyUKjNH2qkpXNb+aN
	 cMzxDzF5VchypxcddsMgSf79QMgEYXH8+KdFQPJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C29D0F800EE;
	Thu, 19 Nov 2020 04:41:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC4C8F801ED; Thu, 19 Nov 2020 04:41:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM autolearn=disabled version=3.4.0
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7350F800EE
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 04:41:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7350F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="R6+L1rYP"
Received: by mail-qk1-x742.google.com with SMTP id v143so4205685qkb.2
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 19:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2UCTGtt+l2lmrlAsUlkjZzOKonkqwxx/4Smutp8nZw0=;
 b=R6+L1rYPzj0XjToNYfEyf+qnVRlLesTCejrvpsabpzRduFu34B8gDJ8kEbW1lJi2Rq
 AKukapca3tSWy1eAHxBbSztzVMuT+dW6YivMpRTn+AVZmLt/n0iiNY6g3r2tGGgDe/jw
 mp9ox1nkEroETCXZrlabKP0L+4SGjxOinZnBvVzRJnEaKcy5TETl0cxVD37H+xrPSDKQ
 Tt/yskp/7ROYyTTqWDsQieMjPUycaQ+rYXNkNwIHsk5c2jI7Q90IkEpOYFAxcoTJaSyt
 2blmtJ82ocx6/cMYVI8mOS2TBG4s/O4jp/QxKzbKRbZYgXKZ38A4TbAnHb5oaag7/TeK
 xBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2UCTGtt+l2lmrlAsUlkjZzOKonkqwxx/4Smutp8nZw0=;
 b=UHJxr9XskI1l7W08OH49W6Tm0KzRVt+HmcYgI6dqztegmQlVnM0At4gN+pXn1m89KK
 4Zr/7kRFi3EQweW82qHGT9aAEARjjL9w+gNI88waZpgbHZo+XIDSY7/TLaMAJ5ijZjTb
 EXqPL7BmVKqgOZub4U1/inMn7HanbIkpuuqlxRxB6WpR4OR9Y4a4gxKCWpwV8JzIX8hL
 yvhHwyx/B9A9SrM8W05t2fVIDE7TpwwotMqlBrz94d8QVImcox+H5rXWsgZb1MIirlRz
 J7+UP6vjFcs49+kOaXzFZvhO96uOJHsaSER5CNDtBH3pTLCIFu2fiC1Ptcx8pnsdBN5Y
 E0zQ==
X-Gm-Message-State: AOAM530NTj6JyLfe5EtQk6HKPeFyfY+UJJtgXRodpXUoGfhtfreWNItJ
 BhdMw8eDypJcIXOZu4gvDvw=
X-Google-Smtp-Source: ABdhPJyUe0CbtxiicmCBRxdGXq3RoSyTYtrrDryq2yNPJPCjIo4oTU78Q1lySKnSzmhaHc4nlapvCA==
X-Received: by 2002:ae9:f507:: with SMTP id o7mr8769974qkg.420.1605757281743; 
 Wed, 18 Nov 2020 19:41:21 -0800 (PST)
Received: from poirot.caas.local ([2605:a000:160c:8556:986:68fc:88ac:e7f2])
 by smtp.gmail.com with ESMTPSA id d12sm16800173qtp.77.2020.11.18.19.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 19:41:21 -0800 (PST)
From: Kyle Russell <bkylerussell@gmail.com>
To: broonie@kernel.org
Subject: [PATCH] ASoC: mmp-sspa: set phase two word length register
Date: Wed, 18 Nov 2020 22:41:06 -0500
Message-Id: <20201119034106.1273906-1-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kyle Russell <bkylerussell@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 lkundrak@v3.sk, linux-arm-kernel@lists.infradead.org,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
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

If hw params enables dual phase transmission, then the word length for
the second phase should be set to match the sample format instead of
remaining at the reset default.  This matches the configuration already
being done for the first phase.

This driver already sets the phase two sample size, so this should complete
the phase two configuration.

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 sound/soc/pxa/mmp-sspa.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index 52d4d8ace1c3..4803972ee655 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -246,6 +246,9 @@ static int mmp_sspa_hw_params(struct snd_pcm_substream *substream,
 	sspa_ctrl &= ~SSPA_CTL_XWDLEN1_MASK;
 	sspa_ctrl |= SSPA_CTL_XWDLEN1(bitval);
 
+	sspa_ctrl &= ~SSPA_CTL_XWDLEN2_MASK;
+	sspa_ctrl |= SSPA_CTL_XWDLEN2(bitval);
+
 	sspa_ctrl &= ~SSPA_CTL_XSSZ1_MASK;
 	sspa_ctrl |= SSPA_CTL_XSSZ1(bitval);
 
-- 
2.25.1

