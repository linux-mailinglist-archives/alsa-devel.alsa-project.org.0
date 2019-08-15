Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC6D8F221
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:26:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9C3D1661;
	Thu, 15 Aug 2019 19:25:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9C3D1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565889985;
	bh=fkWC0/8bwFs5Mx1BcIQCuWW+ep8YO+zWHySFEOunFoY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=mH00FVu4Akb9UbMTgg2BDIe0DFvrj67EFH5rcw9ZnqSnJQvNLOs3UzfEit5Uy+VsA
	 AG5dT74imghbZBrkHC1khb8WRsCrfXynpGeMPSEh7Qlzp7D30bYaJyiDhFX7OJo++z
	 hxtutRd/68ZFZakQfPmGZ/V0njFIcIBgDCZieQNY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C4D9F8071F;
	Thu, 15 Aug 2019 19:15:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 212BBF806E7; Thu, 15 Aug 2019 19:15:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f99.google.com (mail-wr1-f99.google.com
 [209.85.221.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9100F805F5
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:14:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9100F805F5
Received: by mail-wr1-f99.google.com with SMTP id r3so2880300wrt.3
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=hSu/SLnQ2ByBr5pdkyn5uB1emX/lLSkUY37nX1yG4go=;
 b=M+b8drPd+RAF7+2oH6oBd6jMuxPWRM8K28lghQwo79fNWnWyU2yGzUkeukznRfEXXi
 yejn7f73+7OAe7fwrvyqA+uzoY4YZS+ZgpJOK15Ok57ed9G95VI/Zax2Jl/E7tpjZ/DZ
 XUzAtKiyktqCldjDSxOgBhG4ssYKrmeij1pNcYh51RKYoXMsO1gKuiNUX5Gn1RRHQs7e
 Z8OpWisZ7Fxvd+0aJHFrfM8s8+4AsUiw6z5GgJMm3WhsT5JwbR11/w6QMnFX9lnjpNSu
 ospNvyc4iHbU22gx7RUUh0CuvE5SJfpJWTC3cfTr6iBqaqTuNckdZtiF4+Hek1P6z367
 wZ1Q==
X-Gm-Message-State: APjAAAVSj+YmcI+Mvbl9xOhFqJ51umTcDAGYxqWJULsoVn/FWukh6VLd
 vgDbq8uP36cgCAaYPRin3kNQM/KVNtCDcfDq1GFqoVJUs3Tt3lroUIJ5AVs9nXGZ4A==
X-Google-Smtp-Source: APXvYqyzs4bzOJy9UjY85Ntaekkn/sUNlavyIQBsoxeAByy98K5scrReehdsP3FDc/HaeAnYfxxc7rZnA2nr
X-Received: by 2002:adf:f54a:: with SMTP id j10mr6641463wrp.220.1565889265735; 
 Thu, 15 Aug 2019 10:14:25 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id k3sm51635wrw.32.2019.08.15.10.14.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:14:25 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJKT-00051n-D2; Thu, 15 Aug 2019 17:14:25 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id C54642742BD6; Thu, 15 Aug 2019 18:14:24 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190815085454.30384-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190815171424.C54642742BD6@ypsilon.sirena.org.uk>
Date: Thu, 15 Aug 2019 18:14:24 +0100 (BST)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 brian.austin@cirrus.com, Paul.Handrigan@cirrus.com,
 linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: cs42l73: remove unused variables
	'vsp_output_mux' and 'xsp_output_mux'" to the asoc tree
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

   ASoC: cs42l73: remove unused variables 'vsp_output_mux' and 'xsp_output_mux'

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

From c25b456dc579298ac0ed7304f7d06a66288e96df Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 15 Aug 2019 16:54:54 +0800
Subject: [PATCH] ASoC: cs42l73: remove unused variables 'vsp_output_mux' and
 'xsp_output_mux'

sound/soc/codecs/cs42l73.c:276:38: warning:
 vsp_output_mux defined but not used [-Wunused-const-variable=]
sound/soc/codecs/cs42l73.c:279:38: warning:
 xsp_output_mux defined but not used [-Wunused-const-variable=]

They are never used, so can be removed.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190815085454.30384-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs42l73.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/cs42l73.c b/sound/soc/codecs/cs42l73.c
index a81739367109..36089f8bcf0a 100644
--- a/sound/soc/codecs/cs42l73.c
+++ b/sound/soc/codecs/cs42l73.c
@@ -273,12 +273,6 @@ static SOC_ENUM_SINGLE_DECL(xsp_output_mux_enum,
 			    CS42L73_MIXERCTL, 4,
 			    cs42l73_spo_mixer_text);
 
-static const struct snd_kcontrol_new vsp_output_mux =
-	SOC_DAPM_ENUM("Route", vsp_output_mux_enum);
-
-static const struct snd_kcontrol_new xsp_output_mux =
-	SOC_DAPM_ENUM("Route", xsp_output_mux_enum);
-
 static const struct snd_kcontrol_new hp_amp_ctl =
 	SOC_DAPM_SINGLE("Switch", CS42L73_PWRCTL3, 0, 1, 1);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
