Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A31FF8F216
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:24:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EDBC845;
	Thu, 15 Aug 2019 19:23:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EDBC845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565889864;
	bh=swITfAxdlwjBfKL0mUvmlClFtiHYn55jUZkWB5zHZSY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=lxoV2tHqR2r9nhIWCWV1QUU8sc5Ysa44lZDIdLb4h+9FNf0qNUESjRJ1Cqz19TCll
	 Ii7uYLB/9P1pjcR3G+CVaeTBg5w19LySfT6p7zB43/fltaDWU6ebobFhI8q+zIyuz3
	 dTCzM6fH4D00kdKbnwmnP+tUr4qx682tZ/HpgZKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A197CF8060F;
	Thu, 15 Aug 2019 19:15:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42B27F80678; Thu, 15 Aug 2019 19:15:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com
 [209.85.128.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED38AF805E1
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED38AF805E1
Received: by mail-wm1-f99.google.com with SMTP id o4so1874624wmh.2
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=qLZh8IhwQg9ydE/0+1Zpu/OWvv9AdAPsrO/K7o4vHUY=;
 b=U/EBg2bF47NhOgollL1L+A3hHib2VF74JkQ320dU2kJwH9prKmjrvy1HeMpbGyVw9o
 XSUmL9mnT2O+jNrqbDKVGAQSGNj5/SM6y2/HEub3fb4ZK9SOk7l7aB2yBzBpOR2XCIfH
 e/pCdtWrgwt2rvXVUNaeTGgZUmu2KbDPc55S6WLGGa54Fdy3jJkQwQZJyjVqjJculjai
 5ZCImLWBPSdnZJR3/oFxQvAa3ijA5c9qFqv+/UYbrdkB0VZ/MJqY/tLTtnYiH/V81Dmo
 WF/GZNokD+0n2ecFhaGdP7yna9WyuPFNE6kCD/jXGtnJKO3b30jTDHGirLXgRsJeia0h
 Kl2w==
X-Gm-Message-State: APjAAAVFINslTo+dXjChTpzWMGujKufsILSr4N3agOHTG5XSRt8XSZJE
 o66oxSyu+xDMR/ZcwgITE8WKKRZwru1clppTAyl5gS0wXzy+218JlqtqGlorqZRTyw==
X-Google-Smtp-Source: APXvYqwus8sMCeDcfNR/ErhO8PCbz1Pe+ABOtdCF2IXdy17QHyMub/fGageBGCgGJjKNz/akKGnSpIKz8V40
X-Received: by 2002:a1c:2dcf:: with SMTP id t198mr3503302wmt.147.1565889264289; 
 Thu, 15 Aug 2019 10:14:24 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id i11sm56780wrr.50.2019.08.15.10.14.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:14:24 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJKS-00051S-1K; Thu, 15 Aug 2019 17:14:24 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 74DB42742B9E; Thu, 15 Aug 2019 18:14:23 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190815091738.21680-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190815171423.74DB42742B9E@ypsilon.sirena.org.uk>
Date: Thu, 15 Aug 2019 18:14:23 +0100 (BST)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, afd@ti.com, Hulk Robot <hulkci@huawei.com>,
 Mark Brown <broonie@kernel.org>, colin.king@canonical.com
Subject: [alsa-devel] Applied "ASoC: tlv320aic31xx: remove unused variable
	'cm_m_enum'" to the asoc tree
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

   ASoC: tlv320aic31xx: remove unused variable 'cm_m_enum'

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

From 6d6376b143d59ab1b8635807c78d224d03580418 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 15 Aug 2019 17:17:38 +0800
Subject: [PATCH] ASoC: tlv320aic31xx: remove unused variable 'cm_m_enum'

sound/soc/codecs/tlv320aic31xx.c:261:29: warning:
 cm_m_enum defined but not used [-Wunused-const-variable=]

It is never used, so can be removed.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190815091738.21680-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tlv320aic31xx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 26a4f6cd3288..df627a08def9 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -258,7 +258,6 @@ static SOC_ENUM_SINGLE_DECL(mic1rp_p_enum, AIC31XX_MICPGAPI, 4,
 static SOC_ENUM_SINGLE_DECL(mic1lm_p_enum, AIC31XX_MICPGAPI, 2,
 	mic_select_text);
 
-static SOC_ENUM_SINGLE_DECL(cm_m_enum, AIC31XX_MICPGAMI, 6, mic_select_text);
 static SOC_ENUM_SINGLE_DECL(mic1lm_m_enum, AIC31XX_MICPGAMI, 4,
 	mic_select_text);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
