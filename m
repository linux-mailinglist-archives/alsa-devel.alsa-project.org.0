Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBCFEB14B
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Oct 2019 14:35:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9AA520D5;
	Thu, 31 Oct 2019 14:34:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9AA520D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572528927;
	bh=qjNTdkUHOzdLxJYnyhzuGUjfTPzfyne9rLBlIWfAacw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=eUPDAkE6GhkDvbf8EPFNy6KIWmbX4reDd3BOPyJgjEPqnp3bnNILz6kBGcFwATE55
	 xFMzlWyOBOKCj6Ia9Vjl2XXHaQ7xluoxdFWuZPf4+n83eNOTikqEVDjjFz8sfPAsIE
	 E7BExJGf/t0X6BzmX+DSySNsdV+ha6bfI/6LYalU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAA68F805AE;
	Thu, 31 Oct 2019 14:33:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 505B6F805AE; Thu, 31 Oct 2019 14:33:39 +0100 (CET)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20DEEF8015A
 for <alsa-devel@alsa-project.org>; Thu, 31 Oct 2019 14:23:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20DEEF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="xFn9MWrw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=mKkghNZSXiFuRRm6DpsxZSfhKlhwhBnu9OMgTJ2+JhI=; b=xFn9MWrwDcE7
 Cqn1cWaOxIu/kY9JKIE6QIMdnCjaHteUQHG/QlkY0fxSYsxyKgsHq5ImX3BiMrG8sgaEzyeQZUepj
 0tHWvBww85GZo7mae9bhb3L1sigt8ISAJq35TUYCvXBvWyWVXIIDTU3yLrdKu18bnJl2LT6jEMlSm
 fVQew=;
Received: from [91.217.168.176] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iQAQK-0007oT-G7; Thu, 31 Oct 2019 13:23:36 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 2D592D020AD; Thu, 31 Oct 2019 13:23:36 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Shuming Fan <shumingf@realtek.com>
In-Reply-To: <20191031115436.21055-1-shumingf@realtek.com>
X-Patchwork-Hint: ignore
Message-Id: <20191031132336.2D592D020AD@fitzroy.sirena.org.uk>
Date: Thu, 31 Oct 2019 13:23:36 +0000 (GMT)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, tzungbi@google.com,
 Mark Brown <broonie@kernel.org>, derek.fang@realtek.com, flove@realtek.com
Subject: [alsa-devel] Applied "ASoC: rt1011: add the range check for
	temperature_calib from device property" to the asoc tree
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

   ASoC: rt1011: add the range check for temperature_calib from device property

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 98b6b8df06c7929de65ca3bf28a13b11170943e3 Mon Sep 17 00:00:00 2001
From: Shuming Fan <shumingf@realtek.com>
Date: Thu, 31 Oct 2019 19:54:36 +0800
Subject: [PATCH] ASoC: rt1011: add the range check for temperature_calib from
 device property

The driver will check the range for temperature_calib.
It should be from 1 to 255.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Link: https://lore.kernel.org/r/20191031115436.21055-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1011.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index 2f1de933f3ac..f2c581b66d32 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -2341,7 +2341,8 @@ static void rt1011_calibration_work(struct work_struct *work)
 	rt1011_reg_init(component);
 
 	/* Apply temperature and calibration data from device property */
-	if (rt1011->temperature_calib) {
+	if (rt1011->temperature_calib <= 0xff &&
+		rt1011->temperature_calib > 0) {
 		snd_soc_component_update_bits(component,
 			RT1011_STP_INITIAL_RESISTANCE_TEMP, 0x3ff,
 			(rt1011->temperature_calib << 2));
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
