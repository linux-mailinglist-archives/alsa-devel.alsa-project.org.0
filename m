Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0E81A8171
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 17:08:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4C6116EC;
	Tue, 14 Apr 2020 17:07:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4C6116EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586876909;
	bh=zxxglKCwONkxQvlp+eACcSzxEjvzXi7T8JNshXROFDU=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bnqchgFPPJnR7M5ZZxhWaTVsPjfITIyxksHfBhIxf5ipIptB3c5mm+uNqZ3KYVGLv
	 7NeWd5h9iJAn7X3uiRm0CRrQuxtbKylDpTxRkg88/jk2DMQeqI7lgUDNx4Ap4AfpDt
	 1P/coe9eB55TsKoRx05lzz6NeGOvNMj5f6bD3NeY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01449F8041E;
	Tue, 14 Apr 2020 16:49:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D1A7F803FC; Tue, 14 Apr 2020 16:49:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B00FF803F3
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B00FF803F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mBn8b2xs"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1351120787;
 Tue, 14 Apr 2020 14:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586875739;
 bh=zxxglKCwONkxQvlp+eACcSzxEjvzXi7T8JNshXROFDU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=mBn8b2xsr4N20yQqj0LXBnD5lVnmIWM9Mnx/7Td6Q+X9AIcALeLmWbdN6bUGOzz9Y
 vifV9oQPo/4uACuEbP4ZlKLoOVjxGs2dyxLQAJCS5NVQLVNNbk1sJ6p5kru001kcbF
 R4CULgFaaGMC6/5R87os+Sp8y3yOQ6JQiLg41jjU=
Date: Tue, 14 Apr 2020 15:48:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Applied "ASoC: SOF: Intel: hda: log number of microphones detected in
 NHLT tables" to the asoc tree
In-Reply-To: <20200409184416.15591-4-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200409184416.15591-4-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

   ASoC: SOF: Intel: hda: log number of microphones detected in NHLT tables

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

From 642646cc4f84e1a7a0002f8ac4660576011abffe Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Thu, 9 Apr 2020 13:44:15 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda: log number of microphones detected in
 NHLT tables

Log the information extracted from NHLT tables to help support users
who report non-functional digital mics with SOF.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/20200409184416.15591-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 6cbe2edc868c..263937357ea3 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1006,6 +1006,10 @@ static int hda_generic_machine_select(struct snd_sof_dev *sdev)
 			if (!tplg_filename)
 				return -EINVAL;
 
+			dev_info(bus->dev,
+				 "DMICs detected in NHLT tables: %d\n",
+				 dmic_num);
+
 			pdata->machine = hda_mach;
 			pdata->tplg_filename = tplg_filename;
 		}
-- 
2.20.1

