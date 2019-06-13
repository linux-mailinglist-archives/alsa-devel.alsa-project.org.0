Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9632744BE6
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 21:14:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CAB61883;
	Thu, 13 Jun 2019 21:13:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CAB61883
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560453268;
	bh=O+sFtfJyYvQnexOPySIFHlmPpskWWlrI7hb1BAwJvnU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jcrfDkLBJD0iyNGgRkUPqkMDtBAso+Q+gS4xqsdZEWn2sIhbGfRdqw+UTHkcrw4QD
	 TCsY+0Hk+FatKwXunZHYnFiNHgnS/VeatgVXuDQsKaGr0uYoVVYaP4RLQR3EEWvjt7
	 sAcMw9OwywadXxlvi7Ni5lr5owPCqEid1hbBUJBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56263F89761;
	Thu, 13 Jun 2019 21:06:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE5CCF89769; Thu, 13 Jun 2019 21:06:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4046F8975D
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 21:06:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4046F8975D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ktd58G5o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=vcr+KUvwtJ40fjb6+fbnwyWPfqRN9CVsuJX4JNI8B9g=; b=ktd58G5oPFqY
 UA28lhtzjbM9wLW/08W/TI3mvTuy9YdMOg5FI/2Aq0IHbSTeM12ki9Er7pQgbK6CKvJ4p8Syl2lMI
 N9G3aJjpGTglffPwLKfWnTiA4Yu3lUWoAKC1pze37iIVtzgp+C9ZHVKzJ3VoTAew1D29LsinbGLo9
 nMOaE=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hbV2z-0005Ra-ED; Thu, 13 Jun 2019 19:06:05 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 19E58440046; Thu, 13 Jun 2019 20:06:00 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>
In-Reply-To: <20190612170148.15327-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190613190600.19E58440046@finisterre.sirena.org.uk>
Date: Thu, 13 Jun 2019 20:06:00 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: topology: add min/max step for
	volume_table" to the asoc tree
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

   ASoC: SOF: topology: add min/max step for volume_table

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From aa66fd80e0813fab0146e001b8bef8c4ffe0ba3a Mon Sep 17 00:00:00 2001
From: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>
Date: Wed, 12 Jun 2019 12:01:45 -0500
Subject: [PATCH] ASoC: SOF: topology: add min/max step for volume_table

add two units min_volume_step and max_volume_step to the snd_sof_control
struct, for the min and max step of the volume_table.

Signed-off-by: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/sof-priv.h | 2 ++
 sound/soc/sof/topology.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 17f3d2a5a701..8760a4694d8f 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -297,6 +297,8 @@ struct snd_sof_pcm {
 struct snd_sof_control {
 	struct snd_sof_dev *sdev;
 	int comp_id;
+	int min_volume_step; /* min volume step for volume_table */
+	int max_volume_step; /* max volume step for volume_table */
 	int num_channels;
 	u32 readback_offset; /* offset to mmaped data if used */
 	struct sof_ipc_ctrl_data *control_data;
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index a13233ae6d0e..1c661dec8dd4 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -451,6 +451,8 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 		return -ENOMEM;
 
 	scontrol->comp_id = sdev->next_comp_id;
+	scontrol->min_volume_step = le32_to_cpu(mc->min);
+	scontrol->max_volume_step = le32_to_cpu(mc->max);
 	scontrol->num_channels = le32_to_cpu(mc->num_channels);
 
 	/* set cmd for mixer control */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
