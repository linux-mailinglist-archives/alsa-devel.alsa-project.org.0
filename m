Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15166216A5F
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:34:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8170168B;
	Tue,  7 Jul 2020 12:33:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8170168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594118050;
	bh=EM4xc4zuTfNJJOw9xsPbDmQgs87yP6MPx3rgM1fs9FM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NR5O73UdtsBcm2pAXk6azSDsEDvxwYcyUWTcPN8tm2a6y05Kbr9lhMmB3Tnzm+uk6
	 42Uwnz3rWO9jDonM+wUiqQL7XkY9PfrJqSL2aOEAuq2Ie6/KZ8Ml5N+P498HuBu4oZ
	 q5b2FX4vw9M5QuK0MwoATzIzWbzv/5nWcbqK848I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 123D5F803D6;
	Tue,  7 Jul 2020 12:18:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B166DF80323; Tue,  7 Jul 2020 12:17:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3623F802E8
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:17:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3623F802E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Y6F9hlhl"
Received: by mail-wm1-x342.google.com with SMTP id o2so45891476wmh.2
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 03:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GL1MoJKxnZtWyOmgkHZ5ZdLcj+7xXQIgEe9rUvPd4fk=;
 b=Y6F9hlhltdfKqf7rUHge+Z/I8Om08eU1SVFzRpv3TDOhmPvM9NURwqhOyyLVfI1Vb4
 BqUBp0JbKvL5b8IjHEUFXRsWnP36t2lkN2REOpkuVSjdiuAe56EMv2KCjf7uDPtI0Lpi
 jOTz+FHuWVueoCq7I7YD4Uv+TqF/FEaBTg8jla19QgpBMo1Pio0tYDrtAFkgsdqCz9N6
 fpFI3yKqDfH1I/os94fMLiK9ei7oND1VEkkMLIUYq13l9KmD6P8SyzeiTXRJkr5e9v1H
 JgC+/inW/oO6efg0baiUOq+sZeQQGGrv2ZIbVih4nL+lFEk2d1gDBg+PELv6YK8Oevnl
 HEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GL1MoJKxnZtWyOmgkHZ5ZdLcj+7xXQIgEe9rUvPd4fk=;
 b=f8b6QfFnFTRuuMyHENjY+WGxIOnTpvlMKxaat5cRfuGfW2RNz1LcO8e/z/QidKlyCx
 TjvaFYTiR563nLaeZHZyNjsqTwfJJM1Fthp0Ttm8e73oBWn+NE+q571cYRqXVgGCjbFy
 vDOBUw8N5WKFJp7kYU4ap10uc0zkCm47URBKtCuFMq/xkoasEjgHPaUNwmRbz40g52mF
 950L+R0pd67CIZTt5CdcciqVRvETtDZGTApCVs4w8rQ6afuJzvCJtsvARK4H/mP2F4Jk
 GpUeYVMFdAGI8ICw0hemYWnhbK5SWU3580ILJV8NdvRQzoBBt0Itb2k2ayPutpKzJmyk
 qc5A==
X-Gm-Message-State: AOAM531Hx8DtKt1UdBi8yBNRkbHCwG01yltK6U33MKxyB0hGKjj7zGbJ
 n6+x+JvHg2+zsUgt5src3q2hYg==
X-Google-Smtp-Source: ABdhPJys3a86OxKV+EWBwNFIyLWi784LN6fGl3f7t0+dy9DQHj3SWrOybRjJElejQDlEqlUS/0V1dA==
X-Received: by 2002:a7b:c208:: with SMTP id x8mr3446081wmi.49.1594117041183;
 Tue, 07 Jul 2020 03:17:21 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id z8sm469409wmg.39.2020.07.07.03.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:17:20 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 27/28] ASoC: codecs: tlv320aic26: Demote seemingly
 unintentional kerneldoc header
Date: Tue,  7 Jul 2020 11:16:41 +0100
Message-Id: <20200707101642.1747944-28-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707101642.1747944-1-lee.jones@linaro.org>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>,
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

This is the only use of kerneldoc in the sourcefile and no
descriptions are provided.

Fixes the following W=1 kernel build warning(s):

 sound/soc/codecs/tlv320aic26.c:138: warning: Function parameter or member 'dai' not described in 'aic26_mute'
 sound/soc/codecs/tlv320aic26.c:138: warning: Function parameter or member 'mute' not described in 'aic26_mute'

Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Grant Likely <grant.likely@secretlab.ca>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/codecs/tlv320aic26.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic26.c b/sound/soc/codecs/tlv320aic26.c
index 032b397356438..4569bbc08acb3 100644
--- a/sound/soc/codecs/tlv320aic26.c
+++ b/sound/soc/codecs/tlv320aic26.c
@@ -131,7 +131,7 @@ static int aic26_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-/**
+/*
  * aic26_mute - Mute control to reduce noise when changing audio format
  */
 static int aic26_mute(struct snd_soc_dai *dai, int mute)
-- 
2.25.1

