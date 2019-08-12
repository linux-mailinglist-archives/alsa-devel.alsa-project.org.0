Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7709A89F91
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 15:23:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F22B816A8;
	Mon, 12 Aug 2019 15:23:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F22B816A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565616238;
	bh=dXbNJ1jwmYbhrQa3SSwtt9HBfZ25R7ZRG/Menp1WEUs=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=I3pVD3xcddrbFabuNkuC0eO1stCHn1WNdR/0vUl8+OmwwJsofidL9qWw6iC4tygdw
	 WxAtTLBuSSi7NAzrhiW1LJjvP1kqrYQuaU3qxHvGoR27bopuU3D7zgHWV2ZbVdaC6S
	 faKoGRjOK2GJUANGmSFIcH8BxzKdJn3lXb5oBNog=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E46CDF8065D;
	Mon, 12 Aug 2019 15:16:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8C81F80518; Mon, 12 Aug 2019 15:10:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 526A2F805A9
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 15:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 526A2F805A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="vQ9Q8r/R"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=HVNj3Ld0hKi40/xT7Aq5XTKPrDb7GnPkRvchPN62MxU=; b=vQ9Q8r/R87Y3
 AHUjCNlSwQpvWLTmVnssHaSaqdVnQvH0ZcC1hMopfk8USAsdceDYY6liHJH+rWQGNuBIPNYHcDYbw
 K/KPQMnG5v5FWXq9hiYRBMMebUeW6D5WvuVx1iW20KXTCVO7NTJHtCUPX7qmelSBdlsaJ48B/23Bs
 /f+XA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hxA58-0001Lt-KR; Mon, 12 Aug 2019 13:09:50 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 241962740CB7; Mon, 12 Aug 2019 14:09:50 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Sathya Prakash M R <sathya.prakash.m.r@intel.com>
In-Reply-To: <20190809232236.21182-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190812130950.241962740CB7@ypsilon.sirena.org.uk>
Date: Mon, 12 Aug 2019 14:09:50 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: boards: Match Product Family
	instead of product" to the asoc tree
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

   ASoC: Intel: boards: Match Product Family instead of product

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

From 1a3fb5d3f420d5f022768fcff091e5a9862f5877 Mon Sep 17 00:00:00 2001
From: Sathya Prakash M R <sathya.prakash.m.r@intel.com>
Date: Fri, 9 Aug 2019 18:22:33 -0500
Subject: [PATCH] ASoC: Intel: boards: Match Product Family instead of product

The generic machine driver of sof_rt5682
supports more platforms of same product family.
hence match the product family instead of product name.

Signed-off-by: Sathya Prakash M R <sathya.prakash.m.r@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190809232236.21182-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/sof_rt5682.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index daeaa396d928..c1181bc0119e 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -91,8 +91,7 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 	{
 		.callback = sof_rt5682_quirk_cb,
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Hatch"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Hatch"),
 		},
 		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
 					SOF_RT5682_MCLK_24MHZ |
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
