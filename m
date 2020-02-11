Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E3F159424
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 17:01:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A0CA15F2;
	Tue, 11 Feb 2020 17:00:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A0CA15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581436871;
	bh=rEGpdcyJnoXmr+5DtsJkb6m+k+9sEdbBJvzcd431bwY=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=fttXJgEln0uQzxJ5WhE97MfpCZ6k9SreeaUWqNH+FVdQznUwIRMcAXc4O9l4SKcJp
	 XNGBsIoB6PE8J4/vADjVMpTmgVYYBHeInTxAs11VATyQdTKCW8582nKsRv9/grx0kx
	 QK5kbdEIN0wyPGd1Rvk9XItbCxXlfA1n1k6rVnIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F434F80346;
	Tue, 11 Feb 2020 16:49:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD81FF80339; Tue, 11 Feb 2020 16:49:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 7B210F80308
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 16:49:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B210F80308
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4065113E;
 Tue, 11 Feb 2020 07:49:05 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A5013F68E;
 Tue, 11 Feb 2020 07:49:05 -0800 (PST)
Date: Tue, 11 Feb 2020 15:49:03 +0000
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20200210150421.34680-1-yuehaibing@huawei.com>
Message-Id: <applied-20200210150421.34680-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, yuehaibing@huawei.com,
 lgirdwood@gmail.com, Hulk Robot <hulkci@huawei.com>,
 Mark Brown <broonie@kernel.org>, srinivas.kandagatla@linaro.org
Subject: [alsa-devel] Applied "ASoC: wcd934x: Remove set but not unused
	variable 'hph_comp_ctrl7'" to the asoc tree
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

   ASoC: wcd934x: Remove set but not unused variable 'hph_comp_ctrl7'

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

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

From da22a95313197a349c557b98e3bee4e2b04d4f9d Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 10 Feb 2020 23:04:21 +0800
Subject: [PATCH] ASoC: wcd934x: Remove set but not unused variable
 'hph_comp_ctrl7'

sound/soc/codecs/wcd934x.c: In function wcd934x_codec_hphdelay_lutbypass:
sound/soc/codecs/wcd934x.c:3395:6: warning: variable hph_comp_ctrl7 set but not used [-Wunused-but-set-variable]

commit da3e83f8bb86 ("ASoC: wcd934x: add audio routings")
involved this unused variable.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20200210150421.34680-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wcd934x.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index e780ecd554d2..aefaadfba8a1 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -3388,18 +3388,15 @@ static void wcd934x_codec_hphdelay_lutbypass(struct snd_soc_component *comp,
 {
 	u8 hph_dly_mask;
 	u16 hph_lut_bypass_reg = 0;
-	u16 hph_comp_ctrl7 = 0;
 
 	switch (interp_idx) {
 	case INTERP_HPHL:
 		hph_dly_mask = 1;
 		hph_lut_bypass_reg = WCD934X_CDC_TOP_HPHL_COMP_LUT;
-		hph_comp_ctrl7 = WCD934X_CDC_COMPANDER1_CTL7;
 		break;
 	case INTERP_HPHR:
 		hph_dly_mask = 2;
 		hph_lut_bypass_reg = WCD934X_CDC_TOP_HPHR_COMP_LUT;
-		hph_comp_ctrl7 = WCD934X_CDC_COMPANDER2_CTL7;
 		break;
 	default:
 		return;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
