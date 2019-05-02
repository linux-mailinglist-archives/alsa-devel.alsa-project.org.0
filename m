Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C744111149
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 04:19:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 565FD1729;
	Thu,  2 May 2019 04:19:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 565FD1729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556763599;
	bh=OXzwWZssjGf0lvHIslJVSLrmoM6tf2b6qp5JxDe7mUg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=rlLSxWHdcsZBqydcOTe5i73u2WkKVdBebHev+gU9nXZm7HUhzB8uFlrFmLmsJTy+P
	 fL8OeHatFNsUrtxEOe/37VCc7FPCIMHxcwf8Au7IPtAX9QUsCuFlDBUgPZp2/v3sFQ
	 WXVcIC4OdBfSmdvb1xPvyHA7jx9SkVYQ7wxH/W/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7193F80722;
	Thu,  2 May 2019 04:18:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E651DF896EC; Thu,  2 May 2019 04:18:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 511AFF8075A
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 04:18:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 511AFF8075A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="FS4OsPvP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=2MkTic8qYYVB1ZVV0Tsz6rZK0u2mvP9sDOuHkRz1vDk=; b=FS4OsPvPMu2E
 XUFMNAYOq2ly2Yjtwx4BxWvOrrqnncemksyyCdxKkHqGf9ytLu7Js52EoQTM7faoPS1+7OfKiIUpP
 eObkuyWDnR0fMxRpd62mexihst1B9RG9Q6LD4RLuU4XzXnb3e1W8xbu1UGNQBDP5RdRsyUTlgxSE8
 DpiMU=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1IR-0005pk-U9; Thu, 02 May 2019 02:18:04 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id B70E7441D3C; Thu,  2 May 2019 03:18:00 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20190501101332.31190-1-ckeepax@opensource.cirrus.com>
X-Patchwork-Hint: ignore
Message-Id: <20190502021800.B70E7441D3C@finisterre.ee.mobilebroadband>
Date: Thu,  2 May 2019 03:18:00 +0100 (BST)
Cc: Stuart Henderson <stuarth@opensource.cirrus.com>,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com
Subject: [alsa-devel] Applied "ASoC: wm_adsp: Correct region base typo in
	wm_halo_setup_algs" to the asoc tree
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

   ASoC: wm_adsp: Correct region base typo in wm_halo_setup_algs

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

From b75a9799dc371ce5f51a73536f248f60a1be74ec Mon Sep 17 00:00:00 2001
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Wed, 1 May 2019 11:13:31 +0100
Subject: [PATCH] ASoC: wm_adsp: Correct region base typo in wm_halo_setup_algs

Due to a typo the wrong base is being supplied for the primary algorithm
on Halo firmwares, which will cause the controls to not function.

Fixes: 170b1e123f38 ("ASoC: wm_adsp: Add support for new Halo core DSPs")
Reported-by: Stuart Henderson <stuarth@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm_adsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index bb10c4aeceb4..b26e6b825a90 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -2445,7 +2445,7 @@ static int wm_halo_setup_algs(struct wm_adsp *dsp)
 	wmfw_v3_parse_id_header(dsp, &halo_id.fw, n_algs);
 
 	ret = wm_halo_create_regions(dsp, halo_id.fw.id,
-				     halo_id.ym_base, halo_id.ym_base);
+				     halo_id.xm_base, halo_id.ym_base);
 	if (ret)
 		return ret;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
