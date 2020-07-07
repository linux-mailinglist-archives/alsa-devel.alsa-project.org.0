Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6044E216EFC
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 16:40:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDF881607;
	Tue,  7 Jul 2020 16:39:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDF881607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594132825;
	bh=bB/EsNMT3r4QSVJf/UJcZsfcfVuUyBDo8aqPvM5R5ZA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ckasRgHXbWr5DeKQYJFsX6GmjoZwQgNoSH2oMCPztodLvvKT7pmgZ/gHihN/n4sUY
	 TkweO08oNnSBrcuOB3neEUjHAbNloWSwXqnWAqkUab8fqKwKLTJJiDdJJCGuJYc0T8
	 +lWuocw7f7FSnUfu+mtv5THzBI3Gxgtmy4rb4Z34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FAE7F802A9;
	Tue,  7 Jul 2020 16:38:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53CD5F802BC; Tue,  7 Jul 2020 16:37:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 609E4F8011F
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 16:37:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 609E4F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="XXmCFCqQ"
Received: by mail-wr1-x443.google.com with SMTP id f7so42387060wrw.1
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 07:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Ojcexqfn/ZS3noXIMdqlD9+JbA+cGF+iBmDVVcfGM0=;
 b=XXmCFCqQ7/7qI24vHpYIeRwak6no+ngDN4qxhtx2B+ciF+xekdDDosz8fuWrt1r7Hu
 SGxtSTZbjq7aFHyn1q3uOMUtuTvj5pzK+miMZjM6zYEALDDu+EV/+0HVBzbAsGhcej/8
 GhiBeAzCFt848KYViMxL9IaPiARSHzpUEmYwvKvqRDlHvNuYou9kQvS7JUTFrpeylQdn
 ovTftEAwgfH2tXOQOYkfUfLQOYu4j/oCtF8h1KTHKgCr+aybzMwet4dozFF+jypqljGP
 86/kp70dU8LvS5YTSIJ3e6T6VbpWEvZPkEhUGDabaYF1sELRkcxNFdq8rBl6tJ1AKOqS
 /NEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Ojcexqfn/ZS3noXIMdqlD9+JbA+cGF+iBmDVVcfGM0=;
 b=AsmBnHRh+ZishfEi/digbZSuJcLJx0gw8MANBMTHo+fecdIbZM9RsIrEnlDjhX+eRZ
 VmFJIRIqsoonvs6DpgIfhZhUOYRIKsyEsmov5xbmn2sFClU95/HVtcPeaKY0etijqxCL
 DwklPp6lUwMDId1WEcXI/5zfTroAVm5JzRcNCqaM6UrIicq9QLwnrk0lZeUFrE6uPXSq
 uarHNtJlvFgRshimF7OMUAtmTr5mTUDP0Hh1bcGT2yX3hyXA2I3Q1RIq6yFEfVKG3kX9
 B/mJH+Am8+FyK+ADZ1xwEQxyJ1LlF709wkA7IeFsOjUnP+hgUeULtUxbIFypt7xUZeVo
 Hhtg==
X-Gm-Message-State: AOAM532AYyj3hpERFtKVm5iSLTbTbOehCyNy2w7OFy8e6Gk1KWnTaIJM
 lUdhys1zXsVY342+MHv0GiKlGw==
X-Google-Smtp-Source: ABdhPJx0KvnunMH4xk0hxU1AAKtAAjTTj1cxtsLaXSEvWPc8oupZRfIVKuJnEp7OVTzb9qi611+2bg==
X-Received: by 2002:a5d:6990:: with SMTP id g16mr45393223wru.131.1594132668511; 
 Tue, 07 Jul 2020 07:37:48 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 07:37:47 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 02/28] ASoC: atmel: atmel_ssc_dai: Demote function header
 which is clearly not kerneldoc
Date: Tue,  7 Jul 2020 15:37:16 +0100
Message-Id: <20200707143742.2959960-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707143742.2959960-1-lee.jones@linaro.org>
References: <20200707143742.2959960-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Sedji Gaouaou <sedji.gaouaou@atmel.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Frank Mandarino <fmandarino@endrelia.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
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

No attempt has been made to document the demoted function here.

Fixes the following W=1 kernel build warning(s):

 sound/soc/atmel/atmel_ssc_dai.c:892: warning: Function parameter or member 'ssc_id' not described in 'atmel_ssc_set_audio'

Cc: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Sedji Gaouaou <sedji.gaouaou@atmel.com>
Cc: Frank Mandarino <fmandarino@endrelia.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/atmel/atmel_ssc_dai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
index 0f18dfb85bfed..3a0335864034a 100644
--- a/sound/soc/atmel/atmel_ssc_dai.c
+++ b/sound/soc/atmel/atmel_ssc_dai.c
@@ -885,7 +885,7 @@ static int asoc_ssc_init(struct device *dev)
 	return 0;
 }
 
-/**
+/*
  * atmel_ssc_set_audio - Allocate the specified SSC for audio use.
  */
 int atmel_ssc_set_audio(int ssc_id)
-- 
2.25.1

