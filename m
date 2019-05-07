Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72999157C4
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 04:40:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A4F918F0;
	Tue,  7 May 2019 04:40:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A4F918F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557196855;
	bh=b2SgR1hW9mMGUsm/AxJvX04rq2CF0hgziUTJ3EBQGHk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bVJSQWqDPa5uWCAxoFtIx508mLUqhcebI/84JnApfhx8lUZwdZ0Ne7OPTKclMMi3c
	 mmXasbSm5C66Wsm1AwoJC9y3CQGIISLi9cyr9GNxzjOmfi/8rytqAcSqtc7K307i9r
	 c145mTW2q/CSqqDUqkOmeczIbvgxyIxS02GeLo/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6744F89776;
	Tue,  7 May 2019 04:30:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8655F89763; Tue,  7 May 2019 04:30:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C55AF8975C
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 04:30:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C55AF8975C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="YZep8Lvh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=l1MCCLzyBc8ySr9AXvECU1l7JN0T9zmmPlnw+KeUDRE=; b=YZep8Lvhtm0m
 u/RqiEQkn89+T2WO78VlNi5FEaiBKFY3wiRwP2g+O1pRlCfq6UISgu8zNY9dz8pu8RpG51022vSgq
 45FzEV/xh8UjEhfNwYF1a9PDvbHpRI+FUtsjZBiZA/p6FazabyNKVDqipPi+725AHtaAv/4GMTfwm
 3X/hY=;
Received: from kd111239185057.au-net.ne.jp ([111.239.185.57]
 helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hNpsS-0003Sn-G8; Tue, 07 May 2019 02:30:44 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id D5013440010; Tue,  7 May 2019 03:30:30 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20190506150224.1394-4-tiwai@suse.de>
X-Patchwork-Hint: ignore
Message-Id: <20190507023030.D5013440010@finisterre.sirena.org.uk>
Date: Tue,  7 May 2019 03:30:30 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: rockchip: Fix an uninitialized variable
	compile warning" to the asoc tree
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
Content-Type: multipart/mixed; boundary="===============8353707999669851046=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--===============8353707999669851046==
Content-Type: text/plain

The patch

   ASoC: rockchip: Fix an uninitialized variable compile warning

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From f153bf49ddf6169544b24ef5ea26fa3eb4996b95 Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 6 May 2019 17:02:24 +0200
Subject: [PATCH] ASoC: rockchip: Fix an uninitialized variable compile warning
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Paper over a trivial case leading to an uninitialized variable compile
warning:
  sound/soc/rockchip/rockchip_pdm.c:179:3: warning: ‘clk_out’ may be used uninitialized in this function [-Wmaybe-uninitialized]

Fixes: 624e8e00acaf ("ASoC: rockchip: pdm: fixup pdm fractional div")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/rockchip/rockchip_pdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index 6c0f242db5ef..b9c1d8ad77c1 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -158,7 +158,7 @@ static int rockchip_pdm_hw_params(struct snd_pcm_substream *substream,
 	struct rk_pdm_dev *pdm = to_info(dai);
 	unsigned int val = 0;
 	unsigned int clk_rate, clk_div, samplerate;
-	unsigned int clk_src, clk_out;
+	unsigned int clk_src, clk_out = 0;
 	unsigned long m, n;
 	bool change;
 	int ret;
-- 
2.20.1


--===============8353707999669851046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8353707999669851046==--
