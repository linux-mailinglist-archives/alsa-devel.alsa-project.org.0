Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F78E74E2
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 16:20:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D146C207E;
	Mon, 28 Oct 2019 16:19:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D146C207E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572276024;
	bh=cTXpT5lHbmMGmOlmXmIYkrY3zuAwiK3/zK2bI0pSIvQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=IbxQ9EMTVP84+1RTAzyp19+/RUTMhmeU/u8H50vsNtX+yLoysi+51CdWim4doL220
	 IobT+MhtmwZpEDY86cLWXUDBOAmxi8gJTIKQEpTtuc+eAj9BWIwRrQQOIQLT2ABTtk
	 6IIYR0ol9Jg6V/YFJuaW+bfqWmg15S4cBWB5kp+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53085F80CBE;
	Mon, 28 Oct 2019 15:57:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57E3CF8071F; Mon, 28 Oct 2019 15:57:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03188F80612
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 15:56:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03188F80612
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="BlTZDNuc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=tN8epsZEkS31NtdlX45cDOmGF5PCzR59bS9MnzLxSmg=; b=BlTZDNucaG1B
 kxm0DU1bGKzsOQw96Q+YQqdQrdJSBmRSPt3YiBXWZYnVqeOZwTh5ybIKq65Ybktnp1pZSbLBHnPeb
 YFvUMyj0QqiJJI+DP8LQsNT1jquBZ4kK3//kxlYFxXMe3j5ACViX2bRNToEsbRiDliprT/JOrLKaA
 VsgpA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iP6Rj-0008Rp-Hj; Mon, 28 Oct 2019 14:56:39 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3045F27414F2; Mon, 28 Oct 2019 14:56:38 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
In-Reply-To: <20191027215330.12729-1-navid.emamdoost@gmail.com>
X-Patchwork-Hint: ignore
Message-Id: <20191028145638.3045F27414F2@ypsilon.sirena.org.uk>
Date: Mon, 28 Oct 2019 14:56:38 +0000 (GMT)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pan Xiuli <xiuli.pan@linux.intel.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, kjlu@umn.edu,
 Liam Girdwood <lgirdwood@gmail.com>,
 Slawomir Blauciak <slawomir.blauciak@linux.intel.com>, emamd001@umn.edu,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, smccaman@umn.edu,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "Cc:"@sirena.co.uk
Subject: [alsa-devel] Applied "ASoC: SOF: ipc: Fix memory leak in
	sof_set_get_large_ctrl_data" to the asoc tree
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

   ASoC: SOF: ipc: Fix memory leak in sof_set_get_large_ctrl_data

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

From 45c1380358b12bf2d1db20a5874e9544f56b34ab Mon Sep 17 00:00:00 2001
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Sun, 27 Oct 2019 16:53:24 -0500
Subject: [PATCH] ASoC: SOF: ipc: Fix memory leak in
 sof_set_get_large_ctrl_data

In the implementation of sof_set_get_large_ctrl_data() there is a memory
leak in case an error. Release partdata if sof_get_ctrl_copy_params()
fails.

Fixes: 54d198d5019d ("ASoC: SOF: Propagate sof_get_ctrl_copy_params() error properly")
Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
Link: https://lore.kernel.org/r/20191027215330.12729-1-navid.emamdoost@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/ipc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index b2f359d2f7e5..086eeeab8679 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -572,8 +572,10 @@ static int sof_set_get_large_ctrl_data(struct snd_sof_dev *sdev,
 	else
 		err = sof_get_ctrl_copy_params(cdata->type, partdata, cdata,
 					       sparams);
-	if (err < 0)
+	if (err < 0) {
+		kfree(partdata);
 		return err;
+	}
 
 	msg_bytes = sparams->msg_bytes;
 	pl_size = sparams->pl_size;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
