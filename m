Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB90C1A817E
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 17:10:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 895B91704;
	Tue, 14 Apr 2020 17:09:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 895B91704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586877007;
	bh=+AiyV5aVNdgSUCYuTyhuj7BAxEB+jkBkgxes5+zrcd4=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=YB2EB1Ms+aCp/HwG7SH5+abu1t1fzVZZE1yzxyuT71BfPyv2hsnB9NEJeC3GowNNZ
	 RvvtAnSFi+TQjNaHCW9gkF/zcSsRL5lB26PyPfbYcWXkuF6VH1z7Y6df9m8OsK1Du4
	 D6OLbX0C09KwB/MMVeo7uAz9V4rDS6qMRASw7qjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87FB6F80441;
	Tue, 14 Apr 2020 16:49:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A7E4F80441; Tue, 14 Apr 2020 16:49:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EA81F80435
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:49:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EA81F80435
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hfjJnfmt"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8369920578;
 Tue, 14 Apr 2020 14:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586875755;
 bh=+AiyV5aVNdgSUCYuTyhuj7BAxEB+jkBkgxes5+zrcd4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=hfjJnfmtwDPj2JVZTXmiH5XhKX2x7lW5YQB5Rv49P89LI8MKjc95csPY2eaxH8ZhK
 L3+7IJso+60fCG88NGmYfbCiwjyzP7J36AQGpwQ2BtG6jzklapUwHbBXE7U6G8A2hU
 OwcpFopJ9UNNq44N1aisOC8k2uKkOkumPrAszvnM=
Date: Tue, 14 Apr 2020 15:49:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Payal Kshirsagar <payalskshirsagar1234@gmail.com>
Subject: Applied "ASoC: SOF: Intel: hda: remove unnecessary parentheses" to
 the asoc tree
In-Reply-To: <20200409184853.15896-3-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200409184853.15896-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

   ASoC: SOF: Intel: hda: remove unnecessary parentheses

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

From 805a23de2657c10c2ca96588a309a42df947bb36 Mon Sep 17 00:00:00 2001
From: Payal Kshirsagar <payalskshirsagar1234@gmail.com>
Date: Thu, 9 Apr 2020 13:48:53 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda: remove unnecessary parentheses

Remove unnecessary parentheses around the right hand side of an assignment
and align the code.

Signed-off-by: Payal Kshirsagar <payalskshirsagar1234@gmail.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/20200409184853.15896-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-dsp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 99087b6afb67..c780e1e6f895 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -226,10 +226,10 @@ bool hda_dsp_core_is_enabled(struct snd_sof_dev *sdev,
 
 	val = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPCS);
 
-	is_enable = ((val & HDA_DSP_ADSPCS_CPA_MASK(core_mask)) &&
-			(val & HDA_DSP_ADSPCS_SPA_MASK(core_mask)) &&
-			!(val & HDA_DSP_ADSPCS_CRST_MASK(core_mask)) &&
-			!(val & HDA_DSP_ADSPCS_CSTALL_MASK(core_mask)));
+	is_enable = (val & HDA_DSP_ADSPCS_CPA_MASK(core_mask)) &&
+		    (val & HDA_DSP_ADSPCS_SPA_MASK(core_mask)) &&
+		    !(val & HDA_DSP_ADSPCS_CRST_MASK(core_mask)) &&
+		    !(val & HDA_DSP_ADSPCS_CSTALL_MASK(core_mask));
 
 	dev_dbg(sdev->dev, "DSP core(s) enabled? %d : core_mask %x\n",
 		is_enable, core_mask);
-- 
2.20.1

