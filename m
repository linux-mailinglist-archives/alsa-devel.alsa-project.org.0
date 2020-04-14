Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE41B1A8081
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 16:55:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 625611678;
	Tue, 14 Apr 2020 16:54:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 625611678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586876118;
	bh=6FlzVgFnR7/VbGHrT+q6MkJEf3k+sVZfZKqi8DjGpRE=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=mgk37zljdzxJfLHrCxDOuj/IPdJPj9cqP1lDwXfIHpAhUFLEYS6jXD9R3jQ9ORuGS
	 5b4PWhZH6dZquDqE2mWD5Y4hK4VkrkU1ceCCZ/HF0KKkJVaayYvhoRKQKREYj9E+BT
	 E1eZNMVuNlkVtRUUpkFfnX/9Bx2EqmA/W9Ow5T0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B49FF80323;
	Tue, 14 Apr 2020 16:47:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15C51F8031A; Tue, 14 Apr 2020 16:47:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41AE3F80317
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:47:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41AE3F80317
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="O2hGsWeQ"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B9052085B;
 Tue, 14 Apr 2020 14:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586875625;
 bh=6FlzVgFnR7/VbGHrT+q6MkJEf3k+sVZfZKqi8DjGpRE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=O2hGsWeQgz1uXI04jUf2u5UfQTik+aYdUmfQK7aBdH8jA/NaZI6X2qSQdcDLDS1D+
 SyK9vZaufojA5p15LNY1Mw8EnCTIPtRVMBNrYSm9aY1ykPmYbpIjERQqIXhXXQTISu
 aTF5BqRN5x15H3S74YIs1xi961M1y1muZKa8wLxs=
Date: Tue, 14 Apr 2020 15:47:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Yan <yanaijie@huawei.com>
Subject: Applied "ASoC: wm8991: remove defined but not used
 'wm8991_dapm_rxvoice_controls'" to the asoc tree
In-Reply-To: <20200407082932.41511-3-yanaijie@huawei.com>
Message-Id: <applied-20200407082932.41511-3-yanaijie@huawei.com>
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

   ASoC: wm8991: remove defined but not used 'wm8991_dapm_rxvoice_controls'

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

From cdab86902d07800a6393af1967fe8d343a27e526 Mon Sep 17 00:00:00 2001
From: Jason Yan <yanaijie@huawei.com>
Date: Tue, 7 Apr 2020 16:29:30 +0800
Subject: [PATCH] ASoC: wm8991: remove defined but not used
 'wm8991_dapm_rxvoice_controls'
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the following gcc warning:

sound/soc/codecs/wm8991.c:480:38: warning:
‘wm8991_dapm_rxvoice_controls’ defined but not used
[-Wunused-const-variable=]
 static const struct snd_kcontrol_new wm8991_dapm_rxvoice_controls[] = {
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
Link: https://lore.kernel.org/r/20200407082932.41511-3-yanaijie@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8991.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/codecs/wm8991.c b/sound/soc/codecs/wm8991.c
index 93c156782d59..f8375d67e901 100644
--- a/sound/soc/codecs/wm8991.c
+++ b/sound/soc/codecs/wm8991.c
@@ -476,14 +476,6 @@ static SOC_ENUM_SINGLE_DECL(wm8991_ainrmux_enum,
 static const struct snd_kcontrol_new wm8991_dapm_ainrmux_controls =
 	SOC_DAPM_ENUM("Route", wm8991_ainrmux_enum);
 
-/* RXVOICE */
-static const struct snd_kcontrol_new wm8991_dapm_rxvoice_controls[] = {
-	SOC_DAPM_SINGLE_TLV("LIN4RXN", WM8991_INPUT_MIXER5, WM8991_LR4BVOL_SHIFT,
-		WM8991_LR4BVOL_MASK, 0, in_mix_tlv),
-	SOC_DAPM_SINGLE_TLV("RIN4RXP", WM8991_INPUT_MIXER6, WM8991_RL4BVOL_SHIFT,
-		WM8991_RL4BVOL_MASK, 0, in_mix_tlv),
-};
-
 /* LOMIX */
 static const struct snd_kcontrol_new wm8991_dapm_lomix_controls[] = {
 	SOC_DAPM_SINGLE("LOMIX Right ADC Bypass Switch", WM8991_OUTPUT_MIXER1,
-- 
2.20.1

