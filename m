Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C842C1118C
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 04:34:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6367E16B5;
	Thu,  2 May 2019 04:34:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6367E16B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556764491;
	bh=1LllnXGE2uNEZeUPrvd0XQEQkttJSxRvoF/qJmsU9tc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Twczhiri/fayz9HOqrrNPDZPC+NX6EoDHebUAmIJBBDh+wioXtCy3ejA4St4cUeoF
	 175D7/hn2sqQdNK5/r/VWAN0etpWmiRUT31vdS92B1BHmrXufSHOtHuU38pSkvj1MW
	 i4zQ8tbbWizNCn66Fbelijhhga053G0c3EKuUH/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0964F8979B;
	Thu,  2 May 2019 04:19:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 397E3F89758; Thu,  2 May 2019 04:19:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B654F89739
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 04:18:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B654F89739
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Ks9gDZ1v"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=0yDQ8mpJU01WNjUag4mEZvrS2eyoOFnSJkZ+fvTaTrg=; b=Ks9gDZ1vx9BH
 GbMROOxW7vHVAStgwwSZZ2FuGChyLsoHMuiazpw8hAWgEfab9jfufpBL8aVECnJEJHx1p/M6fMzOk
 jipUepVcKekmC2DPz6+Wkos2jcpsKwUtCEl0Gg1y0d7FSFHkFPO1YuHpnqdyL+usY4oR/hxp/XhA9
 1jWBw=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1Iz-0005sb-FU; Thu, 02 May 2019 02:18:37 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 90851441D3B; Thu,  2 May 2019 03:18:34 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190416144718.25576-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190502021834.90851441D3B@finisterre.ee.mobilebroadband>
Date: Thu,  2 May 2019 03:18:34 +0100 (BST)
Cc: alexandre.belloni@bootlin.com, alsa-devel@alsa-project.org,
 nicolas.ferre@microchip.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>, ludovic.desroches@microchip.com,
 Mark Brown <broonie@kernel.org>, tiwai@suse.com,
 codrin.ciubotariu@microchip.com, peda@axentia.se,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: atmel: tse850: Make some functions
	static" to the asoc tree
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

   ASoC: atmel: tse850: Make some functions static

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 6f547c96b45de0d42de91ef56c7d291aa6d3c88f Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 16 Apr 2019 22:47:18 +0800
Subject: [PATCH] ASoC: atmel: tse850: Make some functions static

Fix sparse warnings:

sound/soc/atmel/tse850-pcm5142.c:120:5: warning: symbol 'tse850_get_mix' was not declared. Should it be static?
sound/soc/atmel/tse850-pcm5142.c:132:5: warning: symbol 'tse850_put_mix' was not declared. Should it be static?
sound/soc/atmel/tse850-pcm5142.c:154:5: warning: symbol 'tse850_get_ana' was not declared. Should it be static?
sound/soc/atmel/tse850-pcm5142.c:187:5: warning: symbol 'tse850_put_ana' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/atmel/tse850-pcm5142.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/atmel/tse850-pcm5142.c b/sound/soc/atmel/tse850-pcm5142.c
index 214adcad5419..ae445184614a 100644
--- a/sound/soc/atmel/tse850-pcm5142.c
+++ b/sound/soc/atmel/tse850-pcm5142.c
@@ -117,8 +117,8 @@ static int tse850_put_mux2(struct snd_kcontrol *kctrl,
 	return snd_soc_dapm_put_enum_double(kctrl, ucontrol);
 }
 
-int tse850_get_mix(struct snd_kcontrol *kctrl,
-		   struct snd_ctl_elem_value *ucontrol)
+static int tse850_get_mix(struct snd_kcontrol *kctrl,
+			  struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kctrl);
 	struct snd_soc_card *card = dapm->card;
@@ -129,8 +129,8 @@ int tse850_get_mix(struct snd_kcontrol *kctrl,
 	return 0;
 }
 
-int tse850_put_mix(struct snd_kcontrol *kctrl,
-		   struct snd_ctl_elem_value *ucontrol)
+static int tse850_put_mix(struct snd_kcontrol *kctrl,
+			  struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kctrl);
 	struct snd_soc_card *card = dapm->card;
@@ -151,8 +151,8 @@ int tse850_put_mix(struct snd_kcontrol *kctrl,
 	return 1;
 }
 
-int tse850_get_ana(struct snd_kcontrol *kctrl,
-		   struct snd_ctl_elem_value *ucontrol)
+static int tse850_get_ana(struct snd_kcontrol *kctrl,
+			  struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kctrl);
 	struct snd_soc_card *card = dapm->card;
@@ -184,8 +184,8 @@ int tse850_get_ana(struct snd_kcontrol *kctrl,
 	return 0;
 }
 
-int tse850_put_ana(struct snd_kcontrol *kctrl,
-		   struct snd_ctl_elem_value *ucontrol)
+static int tse850_put_ana(struct snd_kcontrol *kctrl,
+			  struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kctrl);
 	struct snd_soc_card *card = dapm->card;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
