Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F1016B3F1
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Feb 2020 23:28:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 912E91679;
	Mon, 24 Feb 2020 23:27:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 912E91679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582583290;
	bh=/Db1hGkv61DSFydXkWXgcdnj364iw4h0/yproIBXzs0=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=hhXzT8/HNruVciIK76F2SOdfAcIkKJbCTO1E5eRHqKSzpmwdxh6i+seWYcfL0WVoZ
	 CmSPacaoQdlLKNBESZPj1RR4bNzt5QQJ3/Xk9Ri7Z2NFtaXG/5E+BWlIur/dAB+JI3
	 7ymf/Ll7OCy15ByMD0y5zfeyryxUlfTxrcR0ewgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E801F802E8;
	Mon, 24 Feb 2020 23:22:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A53E4F802E3; Mon, 24 Feb 2020 23:22:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 MIME_8BIT_HEADER, SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 9C790F802DD
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 23:22:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C790F802DD
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4FE630E;
 Mon, 24 Feb 2020 14:22:10 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A8953F534;
 Mon, 24 Feb 2020 14:22:10 -0800 (PST)
Date: Mon, 24 Feb 2020 22:22:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Subject: Applied "ASoC: Intel: Skylake: Fix available clock counter
 incrementation" to the asoc tree
In-Reply-To: <20200224125202.13784-1-amadeuszx.slawinski@linux.intel.com>
Message-Id: <applied-20200224125202.13784-1-amadeuszx.slawinski@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: "moderated list:INTEL ASoC DRIVERS" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
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

   ASoC: Intel: Skylake: Fix available clock counter incrementation

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

From 8308a09e87d2cb51adb186dc7d5a5c1913fb0758 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Date: Mon, 24 Feb 2020 07:52:02 -0500
Subject: [PATCH] ASoC: Intel: Skylake: Fix available clock counter
 incrementation
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Incrementation of avail_clk_cnt was incorrectly moved to error path. Put
it back to success path.

Fixes: 6ee927f2f01466 ('ASoC: Intel: Skylake: Fix NULL ptr dereference when unloading clk dev')
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200224125202.13784-1-amadeuszx.slawinski@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/skylake/skl-ssp-clk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/skl-ssp-clk.c b/sound/soc/intel/skylake/skl-ssp-clk.c
index 1c0e5226cb5b..bd43885f3805 100644
--- a/sound/soc/intel/skylake/skl-ssp-clk.c
+++ b/sound/soc/intel/skylake/skl-ssp-clk.c
@@ -384,9 +384,11 @@ static int skl_clk_dev_probe(struct platform_device *pdev)
 				&clks[i], clk_pdata, i);
 
 		if (IS_ERR(data->clk[data->avail_clk_cnt])) {
-			ret = PTR_ERR(data->clk[data->avail_clk_cnt++]);
+			ret = PTR_ERR(data->clk[data->avail_clk_cnt]);
 			goto err_unreg_skl_clk;
 		}
+
+		data->avail_clk_cnt++;
 	}
 
 	platform_set_drvdata(pdev, data);
-- 
2.20.1

