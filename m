Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 311B62CA16
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 17:14:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C33F717F4;
	Tue, 28 May 2019 17:13:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C33F717F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559056479;
	bh=vTU1eOHFicjXo4vIfCm0o/erYyrIZxw5lONuJdE/OFk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=StvVNYit8XvH+DNHpdplDJhCiLAsM80tyRBV6REYCEDhPR4L78BOu7wRSum+tsBJP
	 2DyAbvAxVWuFB03QpafXgvh8q4yr72Djv3C68Gt+JV9UNGtxUnGhrZ4y+VGqR4qlT/
	 LC/BY9nGZWHBhUBDHqMfjWAsM987SYNGlvQrA6Fs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9F75F89762;
	Tue, 28 May 2019 17:07:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6BDEF8970A; Tue, 28 May 2019 17:07:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43500F89728
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 17:07:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43500F89728
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="HDbyzRgF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=xTvcCMD3rJvmWElreUErZsAW+Mm0lt0NoqPGWud+h2U=; b=HDbyzRgFsRBS
 3zw8Icq3m1QGBlVWet1YRPEpkCa0pDzY07+eiLwPCes95Ns7y7cYQDnt26hJ8TAVJfEdNMfldFvJn
 dSDfjLImi0zouhkivWIsW+Xg0wnZ8Nn7glkqiz60kr8XxfRRMEY4BVPUc8N3e6wYSHfbi81dVInNC
 gzbr8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hVdgt-0002ov-Md; Tue, 28 May 2019 15:07:03 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 1A718440049; Tue, 28 May 2019 16:07:03 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20190524190925.5931-7-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190528150703.1A718440049@finisterre.sirena.org.uk>
Date: Tue, 28 May 2019 16:07:03 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: control: correct the copy size for
	bytes kcontrol put" to the asoc tree
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

   ASoC: SOF: control: correct the copy size for bytes kcontrol put

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From 5661ad9490ee4abdb27295880e524acc656c89e7 Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Fri, 24 May 2019 14:09:22 -0500
Subject: [PATCH] ASoC: SOF: control: correct the copy size for bytes kcontrol
 put

The size for the bytes kcontrol should include the abi header, that is,
data->size + sizeof(*data), it is also aligned with get method after
this change.

Fixes: c3078f53970 ("ASoC: SOF: Add Sound Open Firmware KControl support")
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/control.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 11762c4580f1..84e2cbfbbcbb 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -349,6 +349,7 @@ int snd_sof_bytes_put(struct snd_kcontrol *kcontrol,
 	struct snd_sof_dev *sdev = scontrol->sdev;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	struct sof_abi_hdr *data = cdata->data;
+	size_t size = data->size + sizeof(*data);
 	int ret, err;
 
 	if (be->max > sizeof(ucontrol->value.bytes.data)) {
@@ -358,10 +359,10 @@ int snd_sof_bytes_put(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	}
 
-	if (data->size > be->max) {
+	if (size > be->max) {
 		dev_err_ratelimited(sdev->dev,
-				    "error: size too big %d bytes max is %d\n",
-				    data->size, be->max);
+				    "error: size too big %zu bytes max is %d\n",
+				    size, be->max);
 		return -EINVAL;
 	}
 
@@ -375,7 +376,7 @@ int snd_sof_bytes_put(struct snd_kcontrol *kcontrol,
 	}
 
 	/* copy from kcontrol */
-	memcpy(data, ucontrol->value.bytes.data, data->size);
+	memcpy(data, ucontrol->value.bytes.data, size);
 
 	/* notify DSP of byte control updates */
 	snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
