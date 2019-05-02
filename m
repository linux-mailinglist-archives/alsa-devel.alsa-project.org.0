Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5870F11191
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 04:36:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E17A11654;
	Thu,  2 May 2019 04:35:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E17A11654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556764610;
	bh=i0KETutJ7HTLEcLamDqMDo8SkmJE/7YFgUvd5GntEtQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=OfXTJFXQeXleogU5ZLHnEa7vc0DFfHfKbhvsFaZFXOlWKqZ98EEhjc+eLT3Vrv1os
	 IK3nFNhH4xrZcls5b0Ka1UYKS1rT5aRBOZ6lbUXwps3cm3lmYxF1735AJUJwFyzQ6x
	 GHaSnEVWmMhYOkONd4zSo8P4Uai7m5d1OKiUw7Ec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01F11F897AB;
	Thu,  2 May 2019 04:19:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1E59F8975C; Thu,  2 May 2019 04:19:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 442A3F89746
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 04:18:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 442A3F89746
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="NRigOCsL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=L9kr2PyDG3ONEeQqCQol/NtkqBAJzA6CBfbpNXHI7e8=; b=NRigOCsL9VTh
 hIVKdYkuZzJPn5rhWY3aLBT5Q7sVYIvQYAl0imp0EmDf9xmXfmvh1vb7Uhohndl5WIWVFn1GVY83x
 viLsYljAkYFXpwzaCc18jFOfNVXDC2MNomP95SFTEjgyOKlAC4GhiiOfNSsVtORa5N8o/ycSAgCSs
 wnqqM=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1J5-0005t8-SH; Thu, 02 May 2019 02:18:44 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id C9330441D3C; Thu,  2 May 2019 03:18:40 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190417150157.24044-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190502021840.C9330441D3C@finisterre.ee.mobilebroadband>
Date: Thu,  2 May 2019 03:18:40 +0100 (BST)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: tlv320aic32x4: Remove set but not used
	variable 'mclk_rate'" to the asoc tree
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

   ASoC: tlv320aic32x4: Remove set but not used variable 'mclk_rate'

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

From 83b4f50ca2b2e93346195b51f58e8089f9f35c0b Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 17 Apr 2019 23:01:57 +0800
Subject: [PATCH] ASoC: tlv320aic32x4: Remove set but not used variable
 'mclk_rate'

Fixes gcc '-Wunused-but-set-variable' warning:

sound/soc/codecs/tlv320aic32x4.c: In function 'aic32x4_setup_clocks':
sound/soc/codecs/tlv320aic32x4.c:669:16: warning: variable 'mclk_rate' set but not used [-Wunused-but-set-variable]

It is not used since introduction in
commit 96c3bb00239d ("ASoC: tlv320aic32x4: Dynamically Determine Clocking")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tlv320aic32x4.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 6edee05ff9f0..83608f386aef 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -684,9 +684,8 @@ static int aic32x4_setup_clocks(struct snd_soc_component *component,
 	u8 madc, nadc, mdac, ndac, max_nadc, min_mdac, max_ndac;
 	u8 dosr_increment;
 	u16 max_dosr, min_dosr;
-	unsigned long mclk_rate, adc_clock_rate, dac_clock_rate;
+	unsigned long adc_clock_rate, dac_clock_rate;
 	int ret;
-	struct clk *mclk;
 
 	struct clk_bulk_data clocks[] = {
 		{ .id = "pll" },
@@ -700,9 +699,6 @@ static int aic32x4_setup_clocks(struct snd_soc_component *component,
 	if (ret)
 		return ret;
 
-	mclk = clk_get_parent(clocks[1].clk);
-	mclk_rate = clk_get_rate(mclk);
-
 	if (sample_rate <= 48000) {
 		aosr = 128;
 		adc_resource_class = 6;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
