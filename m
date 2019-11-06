Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D31F1B1F
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 17:25:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65DEE16A2;
	Wed,  6 Nov 2019 17:24:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65DEE16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573057509;
	bh=k1uM62MlQ07x9qkI7wzqpO1kgD+MD1wMlnaZHHFW5rw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=pNy26DLRg1aNW9vlNmUMMsnYJPa/ZnLawPn1zUo8B1lzHm82g9LZzzkmkigy1jFYa
	 fH+4/pI+NDqYH1/kOuxK7VAOMHKj8jd5IsXBG6Qc4RxAINJPtgrH7NfhEZDICcd2na
	 JBjFErYbII3GuSm+5kqLqUBEh3+VNUNycAD6fHxg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 449F9F8060E;
	Wed,  6 Nov 2019 17:21:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69C2DF803D0; Wed,  6 Nov 2019 17:21:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E3DFF80321
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 17:21:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E3DFF80321
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="APDEnw0l"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=9rREpoZVbGDCP5L1TVBJpt4KDb/OpRNb5vjJi47HMuM=; b=APDEnw0lFOv6
 bxUyQiGx7V4jUlps0jgCUw8knU6+FffTaIQmRNjz+OLXbL3jR2W4IhlilmxZrX0LvYguJft/90rj/
 rHSkAf8mBnvjV/daKIlJ1uHT5d3WU+HepZ1tpdBDaMb1c3trLAa129whe65hoAIxoEC4Bc7X0TisK
 g58zc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iSO42-0001or-Mt; Wed, 06 Nov 2019 16:21:46 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 292802743193; Wed,  6 Nov 2019 16:21:46 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Dragos Tarcatu <dragos_tarcatu@mentor.com>
In-Reply-To: <20191106145816.9367-1-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191106162146.292802743193@ypsilon.sirena.org.uk>
Date: Wed,  6 Nov 2019 16:21:46 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, Jaska Uimonen <jaska.uimonen@intel.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: topology: Fix bytes control size
	checks" to the asoc tree
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

   ASoC: SOF: topology: Fix bytes control size checks

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

From 9508ef5a980f5d847cad9b932b6ada8f2a3466c1 Mon Sep 17 00:00:00 2001
From: Dragos Tarcatu <dragos_tarcatu@mentor.com>
Date: Wed, 6 Nov 2019 08:58:16 -0600
Subject: [PATCH] ASoC: SOF: topology: Fix bytes control size checks

When using the example SOF amp widget topology, KASAN dumps this
when the AMP bytes kcontrol gets loaded:

[ 9.579548] BUG: KASAN: slab-out-of-bounds in
sof_control_load+0x8cc/0xac0 [snd_sof]
[ 9.588194] Write of size 40 at addr ffff8882314559dc by task
systemd-udevd/2411

Fix that by rejecting the topology if the bytes data size > max_size

Fixes: 311ce4fe7637d ("ASoC: SOF: Add support for loading topologies")
Reviewed-by: Jaska Uimonen <jaska.uimonen@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Dragos Tarcatu <dragos_tarcatu@mentor.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191106145816.9367-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/topology.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 0aabb3190ddc..4452594c2e17 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -543,15 +543,16 @@ static int sof_control_load_bytes(struct snd_soc_component *scomp,
 	struct soc_bytes_ext *sbe = (struct soc_bytes_ext *)kc->private_value;
 	int max_size = sbe->max;
 
-	if (le32_to_cpu(control->priv.size) > max_size) {
+	/* init the get/put bytes data */
+	scontrol->size = sizeof(struct sof_ipc_ctrl_data) +
+		le32_to_cpu(control->priv.size);
+
+	if (scontrol->size > max_size) {
 		dev_err(sdev->dev, "err: bytes data size %d exceeds max %d.\n",
-			control->priv.size, max_size);
+			scontrol->size, max_size);
 		return -EINVAL;
 	}
 
-	/* init the get/put bytes data */
-	scontrol->size = sizeof(struct sof_ipc_ctrl_data) +
-		le32_to_cpu(control->priv.size);
 	scontrol->control_data = kzalloc(max_size, GFP_KERNEL);
 	cdata = scontrol->control_data;
 	if (!scontrol->control_data)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
