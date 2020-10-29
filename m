Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBFA29E56E
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 08:57:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9157C16A6;
	Thu, 29 Oct 2020 08:56:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9157C16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603958263;
	bh=rP/oEFJ2Z+OYoWnAVscS1zNkkLk8bhbTfWTGk9/npJo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FY4cQ1v26UhgZ8BYYjaT4MpM/pFsD3cS7AGc8UnkS8qsb4C50t7QgMhK6VQRbBpl4
	 4TKh1ej0HDjQ2mimkummEnbJcY9gOiqBpoBU+hRD/989Ci3LmfMmRou9ReCUA/GFt1
	 yypR5zxCy9xLxZ7pH0ijiiA3IuYzoH5V5wTFxw9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFAB6F8053B;
	Thu, 29 Oct 2020 08:50:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 551B6F8020D; Thu, 29 Oct 2020 08:45:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EDD1F800FF
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 08:45:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EDD1F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="J6Pse+8q"
Received: by mail-pg1-x544.google.com with SMTP id r186so1676090pgr.0
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 00:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lZ+bCLUPWFW4dhgVkM+HvetJi7WpGsivphFjqhZjB18=;
 b=J6Pse+8qTJnodLorMXhsLMbxAUsZqi6tDRGHyvRXfxKQCWDh2jC/bIDV11ZL5Bw/3Q
 ARowBURGJUnIK+NKb7hNvjieet9WHjE1K4Ab2sMAVamYFbwjozMn86+Zo5hJQf28IFYK
 VRFnzPyydM0zp+FfX9Dv7ntSvGEF1sS3/MbJCbZDgjPSPFbhuqdHCyQKfB0adogZqfW+
 oefhCIo1ErN/lKsHP9sgQsUGRO3F4ROzewcP786E5g0hrkYaHUTEekyMU2dRxZ4Wz9/3
 jrO+eHEt0KjhdaJ2eAjx+MqoHGCM76zKG41hYs6vEfZfILGuV+V8QQFDjfAgqOUpcpdf
 i53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lZ+bCLUPWFW4dhgVkM+HvetJi7WpGsivphFjqhZjB18=;
 b=CcK0fSGi+aLfAtHJx838M4bismpA5Q53yikHjTlZjW5kOZMOQVHZJsUISlQGsUAlP3
 /hlAlDkv8A+vFxKNnNiszmD0x3EtT6Blwm7sgOUV/ljXSqxgA1fgS7tWifeiZES6jmcc
 ukQYSCO2kJ0zC2mszzsOlo/uGwhZE3KC45Yiz/DlFI8u2AulcYHlSZhBWythcJeZRpea
 c4ST45OqnYAHPcRipwCx+yooFINDvRJZwFyFyJXGFlj2kbTIzQ+B12Cwgta7D3FSRZxp
 ljXxdYEEzO2ad+nmu7lcFHeDE/PumhLnUE7rRPH9Fj6BMyTTTx059cj22WnxDXE6DF08
 8xYQ==
X-Gm-Message-State: AOAM533XggLJc+71qCR+1xajuGLZQNX/jk3MxvNJxKPqOp0gXZaWGcEc
 1qKlIrO5dTtXsYDII9mqjomWo3ZRixYrurzS
X-Google-Smtp-Source: ABdhPJw/tJMsfwgAxL9DNye+HsiaMI0nNmTnp3B33iBd0z4Mx+94V5Um/rn74SNsIYg1B7bUMAGcQw==
X-Received: by 2002:a17:90a:1189:: with SMTP id
 e9mr3139594pja.124.1603957545181; 
 Thu, 29 Oct 2020 00:45:45 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id y5sm1665220pgo.5.2020.10.29.00.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:45:44 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 18/25] ASoC: codecs: max98373: remove unnecessary
 CONFIG_PM_SLEEP
Date: Thu, 29 Oct 2020 15:42:54 +0800
Message-Id: <20201029074301.226644-18-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074301.226644-1-coiby.xu@gmail.com>
References: <20201029074301.226644-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:49:55 +0100
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>
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
 sound/soc/codecs/max98373-i2c.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/max98373-i2c.c b/sound/soc/codecs/max98373-i2c.c
index 92921e34f948..f847e7e76635 100644
--- a/sound/soc/codecs/max98373-i2c.c
+++ b/sound/soc/codecs/max98373-i2c.c
@@ -468,7 +468,6 @@ static struct snd_soc_dai_driver max98373_dai[] = {
 	}
 };
 
-#ifdef CONFIG_PM_SLEEP
 static int max98373_suspend(struct device *dev)
 {
 	struct max98373_priv *max98373 = dev_get_drvdata(dev);
@@ -487,7 +486,6 @@ static int max98373_resume(struct device *dev)
 	regcache_sync(max98373->regmap);
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops max98373_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(max98373_suspend, max98373_resume)
-- 
2.28.0

