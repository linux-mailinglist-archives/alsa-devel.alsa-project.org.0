Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C631849FB
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 15:52:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 702F6181E;
	Fri, 13 Mar 2020 15:51:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 702F6181E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584111165;
	bh=V49ubTP6N2D8LL49Lg7qpumk1c+YzgpQWrKPSa3Bz8k=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=eADkZ8Z/6PED6VsQ/aj/34dJGv8Kn7bBEfRqJ4i4d5zWTZD3xn45pRV+DGnzgGQh+
	 BAAfB8h4/OKIc7DDmilAhpfBHU9xmgZ6zuFluCi/i2UswMfh2TwW88lMRz6ESecKko
	 YYe8bxNtBoY1MmGEV/yVr1nhDJcSlw0guj+hoK+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46FE5F8013E;
	Fri, 13 Mar 2020 15:50:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 841F9F8021D; Fri, 13 Mar 2020 15:50:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 8D6DDF801EB
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 15:50:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D6DDF801EB
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FCF230E;
 Fri, 13 Mar 2020 07:50:18 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D96AD3F67D;
 Fri, 13 Mar 2020 07:50:17 -0700 (PDT)
Date: Fri, 13 Mar 2020 14:50:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Applied "ASoC: wm_adsp: Use scnprintf() for the limited buffer
 output" to the asoc tree
In-Reply-To: <20200313130334.9028-1-tiwai@suse.de>
Message-Id: <applied-20200313130334.9028-1-tiwai@suse.de>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
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

   ASoC: wm_adsp: Use scnprintf() for the limited buffer output

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

From 578194290d0bf85b087e73e35ea74574012cfd96 Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 13 Mar 2020 14:03:34 +0100
Subject: [PATCH] ASoC: wm_adsp: Use scnprintf() for the limited buffer output

snprintf() is a hard-to-use function, it's especially difficult to use
it for concatenating substrings in a buffer with a limited size.
Since snprintf() returns the would-be-output size, not the actual
size, the subsequent use of snprintf() may point to the incorrect
position.

Use scnprintf() instead for fixing such potential errors.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20200313130334.9028-1-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm_adsp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 2a9b610f6d43..9e5b6c4ac475 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -1432,12 +1432,12 @@ static int wm_adsp_create_control(struct wm_adsp *dsp,
 		subname = NULL; /* don't append subname */
 		break;
 	case 2:
-		ret = snprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
+		ret = scnprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
 				"%s%c %.12s %x", dsp->name, *region_name,
 				wm_adsp_fw_text[dsp->fw], alg_region->alg);
 		break;
 	default:
-		ret = snprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
+		ret = scnprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
 				"%s %.12s %x", dsp->name,
 				wm_adsp_fw_text[dsp->fw], alg_region->alg);
 		break;
-- 
2.20.1

