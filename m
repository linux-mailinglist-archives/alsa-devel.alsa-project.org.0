Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8453129E56C
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 08:57:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 156B31699;
	Thu, 29 Oct 2020 08:56:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 156B31699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603958224;
	bh=Kxo4SjZ4fzmci+jlMDvCpnUR45QjDzr4aNvwXuhUb5I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZY11ynJWXTaS2IbIMDTSkGmNPTemPSsH7TbkwzFprchsNRphwbqQIE3Fg3OpIYACX
	 l+SAciwPZ/LC64HXiTHs0pENiNezKbXFdQOc1Sfce0qVIAHQyHJnyur6suy40M62JN
	 LqSimn6PUUsEFGsAAoL2aIm3LECrCIKjQXYhItNI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D64C3F80533;
	Thu, 29 Oct 2020 08:50:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 285E6F8020D; Thu, 29 Oct 2020 08:45:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EC4CF800FF
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 08:45:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EC4CF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oisQJdTz"
Received: by mail-pf1-x444.google.com with SMTP id y14so1627011pfp.13
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 00:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yud4LFo3ZtN8YB5h2zgMiUFZ5gtVLkjhEUnn5lF5Ujo=;
 b=oisQJdTzCQ1BpXv3Ln1D5dP8ROZCbsZGjFZ6m944zrR8HRDDm2St51OhpWpuOqy8S5
 ClpBqdSH7BlOncB5aYQqBsdxdQAUBKmOMcfIn1+R5TjfHRpBZdkhJi1eTzgjaAHMFOCw
 fc0AvqTxuk8rvCHhoCzKNbu6WgCVSizKQCTETCND3zYc8/x2L3KdIXweJBNS3gdQ4DI7
 bdzNWvJjr5uvqfTfLe7V3StvR5rmPFHi3kAXDl1Bo0PzBWAc0RfWTzI+uqyY1kXdZuZM
 ORxrkpYRK6SfLT3xEEled1rVjzESfhmwa/ctxRqBZfrutBdYATAtNGj57xQpN2aN97sD
 6hZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yud4LFo3ZtN8YB5h2zgMiUFZ5gtVLkjhEUnn5lF5Ujo=;
 b=iPCRyO4iNwyQTlSLPwt+pG3n0lrr6lEe6arejcSZzUSH0kCC6s4bwzp8jEVhkR8A0e
 hcNbo4vZrhrR2sbVu9aQ0pKowszRXBLUbGHitPoPXIPpWtt4N8/sh80YfRm9YalySXMt
 H1JxP4Dlvw6aminiIzw0fg8cIUhjeouVvf2zJLrh38nL7Fs07yqODFiIxXB/heiSH8FN
 zxNQ79rCmLowr3JLLTZehPgzuYrZ77oMmfcQXqau2icO37+h2kzwKePpt61pHsQTMlwt
 DdJIgNP2jIHYRoXE+t5NrXq0KCmWQ/AIwCSKbXjQUhU3c2dxtnGfbQl5L9lWeBFSmenb
 lqHg==
X-Gm-Message-State: AOAM532JIPKImbgD62NMfcODbG66LEcDTDdImoJx02O0l8o/MXj5eKHm
 4DewsA5JzGXOtCz3WzmwZ3I=
X-Google-Smtp-Source: ABdhPJzYOaREJky9YPVbrpsi34cw/1JYIXt6d1J7PjFokyFWL3AZPbsBHCjkKDcJlm3lKgjwNeJwCg==
X-Received: by 2002:a17:90a:10c1:: with SMTP id
 b1mr3057967pje.58.1603957503735; 
 Thu, 29 Oct 2020 00:45:03 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id j6sm1650239pgt.77.2020.10.29.00.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:45:03 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 16/25] ASoC: sirf: remove unnecessary CONFIG_PM_SLEEP
Date: Thu, 29 Oct 2020 15:42:52 +0800
Message-Id: <20201029074301.226644-16-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074301.226644-1-coiby.xu@gmail.com>
References: <20201029074301.226644-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:49:55 +0100
Cc: Barry Song <baohua@kernel.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/CSR SIRFPRIMA2 MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
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

SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 sound/soc/sirf/sirf-usp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/sirf/sirf-usp.c b/sound/soc/sirf/sirf-usp.c
index 2af0c6f14ee6..ae2890827414 100644
--- a/sound/soc/sirf/sirf-usp.c
+++ b/sound/soc/sirf/sirf-usp.c
@@ -313,7 +313,6 @@ static int sirf_usp_pcm_runtime_resume(struct device *dev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int sirf_usp_pcm_suspend(struct device *dev)
 {
 	struct sirf_usp *usp = dev_get_drvdata(dev);
@@ -340,7 +339,6 @@ static int sirf_usp_pcm_resume(struct device *dev)
 	}
 	return 0;
 }
-#endif
 
 static const struct snd_soc_component_driver sirf_usp_component = {
 	.name		= "sirf-usp",
-- 
2.28.0

