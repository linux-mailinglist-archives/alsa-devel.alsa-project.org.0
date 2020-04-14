Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7750B1A8084
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 16:56:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 264D816A5;
	Tue, 14 Apr 2020 16:55:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 264D816A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586876183;
	bh=uLxjlWo1GoRmvs1y0MBgcLwwGQKigiigM/W31Ot6no4=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=dVHTkFLNapcJ1kHCE1Rfr5cm7HU3K3U88uqox4P5VtM9Jmwz4Y/+HTlojM8wb3qwP
	 zeV8HX4yP92IZoNC0egVPUqiq5UbgicBxyVHDo1RFBs7v5G3NqaJgSn7hcRYYV2ux3
	 g7pfjzpZ9EwQCI6Y23hCBges7twk8GnQBL9gwPlw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1A19F80331;
	Tue, 14 Apr 2020 16:48:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 710F1F80329; Tue, 14 Apr 2020 16:47:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36DEEF800B9
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:47:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36DEEF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eKx0Mtvm"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 554A52087E;
 Tue, 14 Apr 2020 14:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586875630;
 bh=uLxjlWo1GoRmvs1y0MBgcLwwGQKigiigM/W31Ot6no4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=eKx0Mtvmgkn8tY8wT/C4JWFo1mQI9TgZ84ZKzpzzhc8DGWcsJhbpJY3OzPmyWyr/W
 QY17g12sRUohrKgoPQDBwFL/2govxhx9WzXqPF/VZh+j08UpzyN+EcTTYWQ4WLB8Zt
 ZI/K1r5oo8OeGhGdJ4bHpAn2ODDMa9ysDUiIyBW8=
Date: Tue, 14 Apr 2020 15:47:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Yan <yanaijie@huawei.com>
Subject: Applied "ASoC: wm8994: remove wm1811_snd_controls and
 mixin_boost_tlv" to the asoc tree
In-Reply-To: <20200407082932.41511-2-yanaijie@huawei.com>
Message-Id: <applied-20200407082932.41511-2-yanaijie@huawei.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 Hulk Robot <hulkci@huawei.com>, Mark Brown <broonie@kernel.org>
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

The patch

   ASoC: wm8994: remove wm1811_snd_controls and mixin_boost_tlv

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

From e8ec193e485d933946ca7cc788c5503cd38af1a2 Mon Sep 17 00:00:00 2001
From: Jason Yan <yanaijie@huawei.com>
Date: Tue, 7 Apr 2020 16:29:29 +0800
Subject: [PATCH] ASoC: wm8994: remove wm1811_snd_controls and mixin_boost_tlv
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the following gcc warning:

sound/soc/codecs/wm8994.c:736:38: warning: ‘wm1811_snd_controls’ defined
but not used [-Wunused-const-variable=]
 static const struct snd_kcontrol_new wm1811_snd_controls[] = {
                                      ^~~~~~~~~~~~~~~~~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
Link: https://lore.kernel.org/r/20200407082932.41511-2-yanaijie@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8994.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 15ce64a48a87..55d0b9be6ff0 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -285,7 +285,6 @@ static const DECLARE_TLV_DB_SCALE(st_tlv, -3600, 300, 0);
 static const DECLARE_TLV_DB_SCALE(wm8994_3d_tlv, -1600, 183, 0);
 static const DECLARE_TLV_DB_SCALE(eq_tlv, -1200, 100, 0);
 static const DECLARE_TLV_DB_SCALE(ng_tlv, -10200, 600, 0);
-static const DECLARE_TLV_DB_SCALE(mixin_boost_tlv, 0, 900, 0);
 
 #define WM8994_DRC_SWITCH(xname, reg, shift) \
 	SOC_SINGLE_EXT(xname, reg, shift, 1, 0, \
@@ -733,13 +732,6 @@ SOC_SINGLE_TLV("AIF2DAC Noise Gate Threshold Volume",
 	       7, 1, ng_tlv),
 };
 
-static const struct snd_kcontrol_new wm1811_snd_controls[] = {
-SOC_SINGLE_TLV("MIXINL IN1LP Boost Volume", WM8994_INPUT_MIXER_1, 7, 1, 0,
-	       mixin_boost_tlv),
-SOC_SINGLE_TLV("MIXINL IN1RP Boost Volume", WM8994_INPUT_MIXER_1, 8, 1, 0,
-	       mixin_boost_tlv),
-};
-
 /* We run all mode setting through a function to enforce audio mode */
 static void wm1811_jackdet_set_mode(struct snd_soc_component *component, u16 mode)
 {
-- 
2.20.1

