Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A121599F17
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 20:43:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B302165D;
	Thu, 22 Aug 2019 20:42:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B302165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566499415;
	bh=BlNhNFxXCDvcehLNvx5soYNGxEdK7bGc/hMPwG1BwQo=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=sFE2D0KKUc9gBGAQxqwcw1pnkQQdUyLewoFitjym7dunlO2jQ/p1hqqtSn9J2Uj2t
	 aks1M3wMiOT16LEUP6V+UKgW3ompgYf2dFewlm65i4uex2qyvh0RK7hnvG3MureQuV
	 KPkBWxa8eRRMFEgavMP5/wZ37FYS12fQOQ9AdnHw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0939F806F5;
	Thu, 22 Aug 2019 20:33:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7147AF80639; Thu, 22 Aug 2019 20:33:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BC73F805E0
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 20:33:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BC73F805E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="djfZW1du"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=QvbtlpNGECvp8d0MV5UXor4WYBMzN8LWn966kYEwpDU=; b=djfZW1duzVOb
 bHHONTlk49MhT/yg2fXrfBEyRcDgzNFuZ0yPJbEBfY7HYns2+eVWi/wEYg46cUPAVFPlPtl8AP17y
 VOqPrivspFkJ4uvIjnY/U8z9g1PNO2avmpE/pWK8N1eLBBxYNA98dQzTLXcttzlc9ZHRWnoU/2DOb
 +Gp0g=;
Received: from 92.40.26.78.threembb.co.uk ([92.40.26.78]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i0rtR-0007fh-KZ; Thu, 22 Aug 2019 18:33:06 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 4E189D02CE7; Thu, 22 Aug 2019 19:32:57 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190822143608.59824-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190822183257.4E189D02CE7@fitzroy.sirena.org.uk>
Date: Thu, 22 Aug 2019 19:32:57 +0100 (BST)
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org, tiwai@suse.com,
 yuehaibing@huawei.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>, Mark Brown <broonie@kernel.org>,
 patches@opensource.cirrus.com, tglx@linutronix.de, info@metux.net,
 allison@lohutok.net
Subject: [alsa-devel] Applied "ASoC: wm8988: fix typo in
	wm8988_right_line_controls" to the asoc tree
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

   ASoC: wm8988: fix typo in wm8988_right_line_controls

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

From c101fb29737f4558bf589d0d66371d9e21040568 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 22 Aug 2019 22:36:08 +0800
Subject: [PATCH] ASoC: wm8988: fix typo in wm8988_right_line_controls

sound/soc/codecs/wm8988.c:270:30: warning:
 wm8988_rline_enum defined but not used [-Wunused-const-variable=]

wm8988_rline_enum should be used in wm8988_right_line_controls.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 5409fb4e327a ("ASoC: Add WM8988 CODEC driver")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190822143608.59824-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8988.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8988.c b/sound/soc/codecs/wm8988.c
index 25e74cf0666a..85bfd041d546 100644
--- a/sound/soc/codecs/wm8988.c
+++ b/sound/soc/codecs/wm8988.c
@@ -273,7 +273,7 @@ static const struct soc_enum wm8988_rline_enum =
 			      wm8988_line_texts,
 			      wm8988_line_values);
 static const struct snd_kcontrol_new wm8988_right_line_controls =
-	SOC_DAPM_ENUM("Route", wm8988_lline_enum);
+	SOC_DAPM_ENUM("Route", wm8988_rline_enum);
 
 /* Left Mixer */
 static const struct snd_kcontrol_new wm8988_left_mixer_controls[] = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
