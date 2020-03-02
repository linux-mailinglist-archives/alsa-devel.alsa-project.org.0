Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C4F175D77
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Mar 2020 15:43:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD7FF16C0;
	Mon,  2 Mar 2020 15:42:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD7FF16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583160227;
	bh=XGyxMyaEHf54dcEpdc2/wE3et618rSb73lxFzQI+vrk=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=owIf0w38AvQC3B2B0plFdT95aScj48O5oKXJP82U7icAMR3NDhLH3v3h1LMMRSz67
	 C38i1LRgIAehsJGBnPAKU2fScFSBSY5zm7JWwUCAWWQ+NVLtK84uICbBYBM0VsPleL
	 NKyJOHveXPnEDgQkoup9DZ+Rb128LIv7ECC3k3+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BEEFF802E1;
	Mon,  2 Mar 2020 15:37:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECE08F802E0; Mon,  2 Mar 2020 15:37:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 23D71F802DC
 for <alsa-devel@alsa-project.org>; Mon,  2 Mar 2020 15:37:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23D71F802DC
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6D0E2F;
 Mon,  2 Mar 2020 06:37:32 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A63A3F534;
 Mon,  2 Mar 2020 06:37:32 -0800 (PST)
Date: Mon, 02 Mar 2020 14:37:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Jack Yu <jack.yu@realtek.com>
Subject: Applied "ASoC: rt1015: add operation callback function for
 rt1015_dai[]" to the asoc tree
In-Reply-To: <20200302015424.9075-1-jack.yu@realtek.com>
Message-Id: <applied-20200302015424.9075-1-jack.yu@realtek.com>
X-Patchwork-Hint: ignore
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 kent_chen@realtek.com, kenny_chen@realtek.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, derek.fang@realtek.com, shumingf@realtek.com,
 mingjane_hsieh@realtek.com, flove@realtek.com
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

   ASoC: rt1015: add operation callback function for rt1015_dai[]

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

From d237851d5d9dff5973160737197e825f05715ba3 Mon Sep 17 00:00:00 2001
From: Jack Yu <jack.yu@realtek.com>
Date: Mon, 2 Mar 2020 09:54:24 +0800
Subject: [PATCH] ASoC: rt1015: add operation callback function for
 rt1015_dai[]

Add operation callback function for rt1015_dai[].

Signed-off-by: Jack Yu <jack.yu@realtek.com>
Link: https://lore.kernel.org/r/20200302015424.9075-1-jack.yu@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1015.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 6d490e2dbc25..9f151c7c3d2d 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -857,6 +857,7 @@ struct snd_soc_dai_driver rt1015_dai[] = {
 			.rates = RT1015_STEREO_RATES,
 			.formats = RT1015_FORMATS,
 		},
+		.ops = &rt1015_aif_dai_ops,
 	}
 };
 
-- 
2.20.1

