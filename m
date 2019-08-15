Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD428F224
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:27:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9F941679;
	Thu, 15 Aug 2019 19:26:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9F941679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565890030;
	bh=656WioQyuVNbQD/IMh9PMFGDOmjFkV7+nHIAeD3L4R8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Gelv94na0IWzzKfsCTmHHm3sLzF4rZALHsKm8zLF/ZuaUZAigryKPVk4b12sju7vf
	 lHgkm0WNzvtK+/kyTFOSR0+SKfBI141AESxZayvIZfcf4p+oA9MvHlVUV05vaGyO0k
	 H7IHDFK6Zn4nw0NCis1vfdORRh4NYMhP9KDY1CxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEDBFF80730;
	Thu, 15 Aug 2019 19:15:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7499DF805F8; Thu, 15 Aug 2019 19:15:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f100.google.com (mail-wr1-f100.google.com
 [209.85.221.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEF36F805F8
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:14:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEF36F805F8
Received: by mail-wr1-f100.google.com with SMTP id y8so2837018wrn.10
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=hvo1EnWObIjc8cgzVjI5oyqc1tcm26PERJDdCuksuoA=;
 b=VcYd9DMsIkptP/Zr/+A1pTzW0JFmf1wACykIfL4tGVU/TW8F1wC9LfrFFm2M8Jhr3J
 4F1NOSOS4emy1sS0c/Tydh8c4k7UzEZMev7tliaCWZs+EmrFpjhPDBJSbXanKWNssUWp
 4hrd2E1E3KuYqjd+BiwANALNSThxAocMfi/+xiWO+seYXAoXZU3Eg+w20dvMJhwNZZsm
 MR2AFevgz21Ze1XISW9LFlE7K2Mf6yHiSufl94vKgavmrguwJ+SdntkIHUysL6tA25t1
 MJwE81U+vfv4w9Ue4rDy/mwLfRnccjJwPdLABKaFfT3I/gQJIhKcHZenPM5PGK+1dGjN
 Iv9A==
X-Gm-Message-State: APjAAAX44S0n52lX7CtAPj94SjHOEBVBqfRCu4Q5yAUmPGWjshpoMSWo
 8LxF9S6LhlwxgGgtriQAvT6OugayMj+TFgJF78uy+ZcMMC9Lt0XeDt/8ttAaqUJ7kQ==
X-Google-Smtp-Source: APXvYqwPO9IMVEuBbyw4spZ+oufd8pC6QxP/EfFndhhHqyb1phYS9Uuz9ATo8LbYLMleuuu60dgsG8rzObRo
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr4504460wrn.223.1565889265464; 
 Thu, 15 Aug 2019 10:14:25 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id l2sm71317wrm.9.2019.08.15.10.14.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:14:25 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJKT-00051i-3B; Thu, 15 Aug 2019 17:14:25 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 81F622742BC7; Thu, 15 Aug 2019 18:14:24 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190815090157.70036-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190815171424.81F622742BC7@ypsilon.sirena.org.uk>
Date: Thu, 15 Aug 2019 18:14:24 +0100 (BST)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 brian.austin@cirrus.com, Paul.Handrigan@cirrus.com,
 linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: cs4349: Use PM ops 'cs4349_runtime_pm'"
	to the asoc tree
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

   ASoC: cs4349: Use PM ops 'cs4349_runtime_pm'

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

From bed7f1469f08fd123cdec7a351ef0d875feadcf6 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 15 Aug 2019 17:01:57 +0800
Subject: [PATCH] ASoC: cs4349: Use PM ops 'cs4349_runtime_pm'

sound/soc/codecs/cs4349.c:358:32: warning:
 cs4349_runtime_pm defined but not used [-Wunused-const-variable=]

cs4349_runtime_pm ops already defined, it seems
we should enable it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: e40da86 ("ASoC: cs4349: Add support for Cirrus Logic CS4349")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190815090157.70036-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs4349.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs4349.c b/sound/soc/codecs/cs4349.c
index 09716fab1e26..3381209a882d 100644
--- a/sound/soc/codecs/cs4349.c
+++ b/sound/soc/codecs/cs4349.c
@@ -378,6 +378,7 @@ static struct i2c_driver cs4349_i2c_driver = {
 	.driver = {
 		.name		= "cs4349",
 		.of_match_table	= cs4349_of_match,
+		.pm = &cs4349_runtime_pm,
 	},
 	.id_table	= cs4349_i2c_id,
 	.probe		= cs4349_i2c_probe,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
