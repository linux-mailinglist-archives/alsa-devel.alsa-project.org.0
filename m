Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAADC8F211
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:23:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 451621669;
	Thu, 15 Aug 2019 19:22:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 451621669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565889782;
	bh=uATklGVMvMHpZArh6c0n8cUZkXKgGLnTmOsSC1za1Ic=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=c+VvtLQTOosrsIlYLANmY2SJDXULxsaByvZ7kBAdPzIkT/WqrBVNuWYuEI3tmyWKl
	 OZGwLyMeyuQB4qoiWUTD61amHy7pW539KpLsee33KxV/cdZj5TsYFAjuSIkb/KcdLW
	 8ZSlS3njX0Ci4rmhmJxhB8XsU1UJJNejHrhi24fQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03575F805FD;
	Thu, 15 Aug 2019 19:15:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86493F8065C; Thu, 15 Aug 2019 19:15:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f100.google.com (mail-wr1-f100.google.com
 [209.85.221.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5B58F805AF
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5B58F805AF
Received: by mail-wr1-f100.google.com with SMTP id t16so2862057wra.6
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=LkRo0LEpuvWQLdD7RS5Oy9z1REDgwUldokEQpfRcGzw=;
 b=GzapdD2sYUzyLwLLN7Bubr7SqyVHUd7jkn98Wjvu1okBOM5VlXUYsPyX9oDok6BZDI
 x2J5Pjn/wFkQWex8/beBTp66zR8ASC8NOG/y6uvjlW6JqUGHo64VZGjbr9huR5znC9hR
 OHR4fcpTtOz44VsVfM/hiMdmh0b8X1RddehHVZAt/Dk5AbWhl8OTEg2uUqy3NJvIg9QM
 gmYOjJq5MvK6izjNbF1cvLkvOr7f939PwrZhHwxipzvxZkbs+c+tC0MsDmXsf7PANbnx
 1ge0oeWhQOzPg6PIMoN4wC9BdGu4xsRAe3+JInMJ/7k0NOtv9qrtGtuWFJjLnYvqvbU/
 UPVA==
X-Gm-Message-State: APjAAAX8zAItGKD7r9ePgnSd14BKxw8QhkYe3M8u4IxsUb3OmYiLpBZY
 wU+nl7MYmRjl8utMpRXe3jJvV8ULCDfkG17AjELk+nI229cE9d8dIQcolQxMajbjhg==
X-Google-Smtp-Source: APXvYqwbgDkBSeusiCNHGIa5V444ZMTjGNsPfmPdlvjykZ+7aqKz5HZiNp4zQdXJ2talNWx4jCvTzou2WIG0
X-Received: by 2002:adf:b64e:: with SMTP id i14mr6661321wre.248.1565889264640; 
 Thu, 15 Aug 2019 10:14:24 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id c128sm12460wma.50.2019.08.15.10.14.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:14:24 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJKS-00051Y-BD; Thu, 15 Aug 2019 17:14:24 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id BA3862742BC7; Thu, 15 Aug 2019 18:14:23 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190815091534.57780-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190815171423.BA3862742BC7@ypsilon.sirena.org.uk>
Date: Thu, 15 Aug 2019 18:14:23 +0100 (BST)
Cc: kstewart@linuxfoundation.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>, Mark Brown <broonie@kernel.org>,
 allison@lohutok.net
Subject: [alsa-devel] Applied "ASoC: tlv320aic23: remove unused variable
	'tlv320aic23_rec_src'" to the asoc tree
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

   ASoC: tlv320aic23: remove unused variable 'tlv320aic23_rec_src'

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

From ab0ac2707784a966927c229752849c343bd1dbbf Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 15 Aug 2019 17:15:34 +0800
Subject: [PATCH] ASoC: tlv320aic23: remove unused variable
 'tlv320aic23_rec_src'

sound/soc/codecs/tlv320aic23.c:70:29: warning:
 tlv320aic23_rec_src defined but not used [-Wunused-const-variable=]

It is never used, so can be removed.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190815091534.57780-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tlv320aic23.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic23.c b/sound/soc/codecs/tlv320aic23.c
index 080a840c987a..f8e2f4b74db3 100644
--- a/sound/soc/codecs/tlv320aic23.c
+++ b/sound/soc/codecs/tlv320aic23.c
@@ -67,8 +67,6 @@ static SOC_ENUM_SINGLE_DECL(rec_src_enum,
 static const struct snd_kcontrol_new tlv320aic23_rec_src_mux_controls =
 SOC_DAPM_ENUM("Input Select", rec_src_enum);
 
-static SOC_ENUM_SINGLE_DECL(tlv320aic23_rec_src,
-			    TLV320AIC23_ANLG, 2, rec_src_text);
 static SOC_ENUM_SINGLE_DECL(tlv320aic23_deemph,
 			    TLV320AIC23_DIGT, 1, deemph_text);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
