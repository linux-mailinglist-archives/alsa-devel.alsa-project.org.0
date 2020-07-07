Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3287216A27
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:24:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52DE01607;
	Tue,  7 Jul 2020 12:23:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52DE01607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594117471;
	bh=hQ3D2xyepyWmGLcKAIv2tyIEaznOFFCmVF1LlIRGzsw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oaVpNxtfCnD94NS3AEvfQvbajOD/BFUbqxBbF7cQeT8TBjzH1vCVDsX+LkM438zAw
	 V4n5qxO5zMoCgopswuwlUZNB+EH6Aj/3/1bMzKL7VXxb8cgLVjiaOJ3d9gZB27nYFl
	 tPNNUQbHODyZ7gpImLZTmcuWqKq0orYQnhjCJfus=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7407AF80306;
	Tue,  7 Jul 2020 12:17:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08920F80308; Tue,  7 Jul 2020 12:17:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A0D1F802E7
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A0D1F802E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="TiDsFIcm"
Received: by mail-wm1-x343.google.com with SMTP id l17so42690981wmj.0
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 03:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j306gyjagAnal9NO9hxv+ks7W0GYhjttqc5twDw7Zos=;
 b=TiDsFIcm82IMvKsBQX6/HNIU30n+rKxa8eOMBrBbtxHEawE+hUYaWGDqNZoQzgpzb4
 wpE/sDK5PJm5+ErIRCpPTGSUTLT2mQ4GwVCK9zcD8joRnlHa/IE4X6h8QBtW5pgd3UOg
 2JBLfOVGlUI+hRpujRyLnkTE2sf9blsqOfFszV7jUptZQ9MVIcjeN+ARhm+N6nVTdjrv
 5xPaYCX979M0/5uJ3eAAy0fUcI3h2hXJxoeADLr1m0Ju4iJ9a//jAnT8D9VglIw9PoGn
 5ti+fmywLzKuP10a61cwSFPawXqydZJ/TEqUsZT3Ruw+bpOLVIRvfRrdqIg5PO9hU9hN
 hwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j306gyjagAnal9NO9hxv+ks7W0GYhjttqc5twDw7Zos=;
 b=A0EwgJOj/XKS5XG/53EBolePPQK2vq/zPIdVijKJ0fs+xLP70t9peHiQQMjU7gUv+v
 gm3+FCAZ/Ktd4awspFaFzYwJvywBfjTOxYfbabW/5zrUbpIZyWSDmdwNj3DJhZRvykxI
 wxCJdVZOyWq+bybRV2t5ZD+jyhDtwTKWP+heX4ihuI8BtctfK00+6801Wc/bL9kjbzIr
 wola7xFp4eolwHgcJrWFhcf6G034oKiJqHJafycoJXYIPPOuf4T8uOdnSi7qVBQJkn4q
 T/hfHPkU5f01v0E1Dl6uHNkyFhf9Ka0pO4JdgkFNPzg8r3rsQJau8tQyk41KLl6aGk4H
 8Kig==
X-Gm-Message-State: AOAM533lGnKoWVhmtz8oCUnt5i4Y+438cBRLZw9F8FOnZL+04ENdXi41
 zbkZnPz9OaQdYO5Srb57ONcDqA==
X-Google-Smtp-Source: ABdhPJw5fQ+cD4J6acJX9hjTuDH1yBuLxCoSudpJcORTNYjASKSRDv3BMPijf/xqeQ+Ze5JdnB5tow==
X-Received: by 2002:a7b:c4d7:: with SMTP id g23mr3603144wmk.17.1594117022067; 
 Tue, 07 Jul 2020 03:17:02 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id z8sm469409wmg.39.2020.07.07.03.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:17:01 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 11/28] ASoC: pxa: pxa-ssp: Demote seemingly unintentional
 kerneldoc header
Date: Tue,  7 Jul 2020 11:16:25 +0100
Message-Id: <20200707101642.1747944-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707101642.1747944-1-lee.jones@linaro.org>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 Daniel Mack <daniel@zonque.org>
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

This is the only use of kerneldoc in the sourcefile and full
descriptions are not provided.

Fixes the following W=1 kernel build warning(s):

 sound/soc/pxa/pxa-ssp.c:186: warning: Function parameter or member 'ssp' not described in 'pxa_ssp_set_scr'

Cc: Daniel Mack <daniel@zonque.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/pxa/pxa-ssp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index 6a72cc1665b7c..d1e09ade0190d 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -178,7 +178,7 @@ static int pxa_ssp_resume(struct snd_soc_component *component)
 #define pxa_ssp_resume	NULL
 #endif
 
-/**
+/*
  * ssp_set_clkdiv - set SSP clock divider
  * @div: serial clock rate divider
  */
-- 
2.25.1

