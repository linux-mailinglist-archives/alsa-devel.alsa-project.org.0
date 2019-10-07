Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B14DCE2A0
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 15:05:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CC2785D;
	Mon,  7 Oct 2019 15:04:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CC2785D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570453548;
	bh=r+AsPkWfSZjIKaJul+/TMySjkIg88YYEgsb3uZVPIPc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=uS45uXIF97is4KPOtuGvPqytYl6qY60fbqcd0b9de623ca9ZCIdAi8EvkawQy6gF7
	 vfGPdOnrvUjGCUEIzRhUVIw07WDXhWazv9G2q8A3BqfgTxeVmzD+aRVL3L3jm4XTkv
	 X9UQPaTGLIwQU3bNxaOv/evJzyhLiijJJ92cBRNo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD334F80323;
	Mon,  7 Oct 2019 15:03:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D62BDF802FB; Mon,  7 Oct 2019 15:03:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 715BEF80273
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 15:03:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 715BEF80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="mI4Vjrd9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=x4Q5Fw1BDyl4t0AU/NTrnqILLuoKT+8rnheL1D6GfOo=; b=mI4Vjrd9GwX+
 udlkxLNKbHTOYa2mbeeJPBAQr5gpfLvgWyQrmm1qW2r3r2qc11kd5gOZZo6yQgsSxraoR9WDWvJPu
 NRkol+GMrrh6W7puJVpJjohffujyLnZIfO0VhfTT9YNXR/3UxMrKu23m/PO+ci3UXNtEa49FSy+I5
 NzSVk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHSfP-0003Qr-83; Mon, 07 Oct 2019 13:03:11 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 7E7F227431ED; Mon,  7 Oct 2019 14:03:10 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20191005212202.5206-1-hdegoede@redhat.com>
X-Patchwork-Hint: ignore
Message-Id: <20191007130310.7E7F227431ED@ypsilon.sirena.org.uk>
Date: Mon,  7 Oct 2019 14:03:10 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: core: Fix pcm code debugfs error" to
	the asoc tree
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

   ASoC: core: Fix pcm code debugfs error

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

From 0632fa042541dbb3b8b960a8cd519eb9b6b584c0 Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Sat, 5 Oct 2019 23:22:02 +0200
Subject: [PATCH] ASoC: core: Fix pcm code debugfs error

We can have 2 dcpm-s with the same backend and frontend name
(capture + playback pair), this causes the following debugfs error
on Intel Bay Trail systems:

[  298.969049] debugfs: Directory 'SSP2-Codec' with parent 'Baytrail Audio Port' already present!

This commit adds a ":playback" or ":capture" postfix to the debugfs dir
name fixing this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/r/20191005212202.5206-1-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index a1b99ac57d9e..b600d3eaaf5c 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1146,6 +1146,7 @@ static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
 {
 	struct snd_soc_dpcm *dpcm;
 	unsigned long flags;
+	char *name;
 
 	/* only add new dpcms */
 	for_each_dpcm_be(fe, stream, dpcm) {
@@ -1171,9 +1172,15 @@ static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
 			stream ? "<-" : "->", be->dai_link->name);
 
 #ifdef CONFIG_DEBUG_FS
-	dpcm->debugfs_state = debugfs_create_dir(be->dai_link->name,
-						 fe->debugfs_dpcm_root);
-	debugfs_create_u32("state", 0644, dpcm->debugfs_state, &dpcm->state);
+	name = kasprintf(GFP_KERNEL, "%s:%s", be->dai_link->name,
+			 stream ? "capture" : "playback");
+	if (name) {
+		dpcm->debugfs_state = debugfs_create_dir(name,
+							 fe->debugfs_dpcm_root);
+		debugfs_create_u32("state", 0644, dpcm->debugfs_state,
+				   &dpcm->state);
+		kfree(name);
+	}
 #endif
 	return 1;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
