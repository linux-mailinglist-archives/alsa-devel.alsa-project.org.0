Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 498768F215
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:23:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE0EA84F;
	Thu, 15 Aug 2019 19:22:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE0EA84F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565889830;
	bh=tiwu+giOEZKr5sbvM37IKe/WZjNYZsWC0zV8QlFw76I=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=SerncWI4o3JQpCXE32ZeC7pzSNWVD+53IAlvjap9AvXwBdksWKdPnsdD/0bQzfFiX
	 udQTECUJ2HbYHg6t5cBvqNb4PyYgbEPEyakn59okw8ClweKe6Qb9wQIlLdPpBpmgCO
	 29mCkzzV+jbIJ6Ox2ibnDoKeu4bXXMrzCuKE1kSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED215F805FF;
	Thu, 15 Aug 2019 19:15:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7973F80290; Thu, 15 Aug 2019 19:15:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f97.google.com (mail-wm1-f97.google.com
 [209.85.128.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F322DF805A9
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F322DF805A9
Received: by mail-wm1-f97.google.com with SMTP id 207so1877220wma.1
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=YrQsEFJ5XC+2bOl3bLXcIx2i2ZGtQ6HBlicu0o4QGgQ=;
 b=Q0NCzWg0IHmrkYMKmNK2u9I5oFI8T34W20z0jW7OYWDh7k5ojJMVg3zGz9wuVeIu8b
 vLfvyEgix/XBVg0jLkpnNv6/80PZkufTzSFcgdL9y3OK+kGnqTKVjIuYsiFhYNTtfMxm
 VDgFKEjXsu/nZLms7pKGMz3uuNhc4X41gaNBj2cHFiLk21NVD0tpGHuil30Of843HTdc
 lLTM9R80ZVtsMV7GY8MAv2LiiUVaDqFCIN0MBiOSd09/jRJaxFzZTQLtNtKQm624u6j1
 uc7LXToqKrkXIFISkIGIZkZReBMbtdNmwDy1qb9eEflHxXWd3iY2MTKeinV4gMEIHGHZ
 tQHg==
X-Gm-Message-State: APjAAAUv38TTZN3fiykgEcBvfmCI1nXjSH2+FPH96HV5jEVe7xxo+fZM
 RFuuxJcxo2u7dOYpafZjeAgukRDut2amydA/QcQstvFZKnL0rAbqNU1e61/M/ytohQ==
X-Google-Smtp-Source: APXvYqx1iRICMh93BpRXmF4AKcbCLW2jBBmcjI1MuOMZKItMXpIxLf8pu1aQLiSHmmf/yIjcZ4c3/NU4swrd
X-Received: by 2002:a1c:18d:: with SMTP id 135mr3701132wmb.171.1565889263498; 
 Thu, 15 Aug 2019 10:14:23 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id n10sm55657wrs.49.2019.08.15.10.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:14:23 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJKR-00051G-4X; Thu, 15 Aug 2019 17:14:23 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id AB4402742B9E; Thu, 15 Aug 2019 18:14:22 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190815092436.34632-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190815171422.AB4402742B9E@ypsilon.sirena.org.uk>
Date: Thu, 15 Aug 2019 18:14:22 +0100 (BST)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 brian.austin@cirrus.com, Paul.Handrigan@cirrus.com,
 linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: cs42l56: remove unused variable
	'adc_swap_enum'" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: cs42l56: remove unused variable 'adc_swap_enum'

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From e33d565795930d0341bb946aec457a814ccd53e6 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 15 Aug 2019 17:24:36 +0800
Subject: [PATCH] ASoC: cs42l56: remove unused variable 'adc_swap_enum'

sound/soc/codecs/cs42l56.c:206:30: warning:
 adc_swap_enum defined but not used [-Wunused-const-variable=]

It is never used, so can be removed.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190815092436.34632-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs42l56.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index b4d7627525f9..ac569ab3d30f 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -199,14 +199,6 @@ static const struct soc_enum beep_bass_enum =
 	SOC_ENUM_SINGLE(CS42L56_BEEP_TONE_CFG, 1,
 			ARRAY_SIZE(beep_bass_text), beep_bass_text);
 
-static const char * const adc_swap_text[] = {
-	"None", "A+B/2", "A-B/2", "Swap"
-};
-
-static const struct soc_enum adc_swap_enum =
-	SOC_ENUM_SINGLE(CS42L56_MISC_ADC_CTL, 3,
-			ARRAY_SIZE(adc_swap_text), adc_swap_text);
-
 static const char * const pgaa_mux_text[] = {
 	"AIN1A", "AIN2A", "AIN3A"};
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
