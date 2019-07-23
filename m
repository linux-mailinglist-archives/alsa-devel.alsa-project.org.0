Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8741971746
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 13:40:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 201771684;
	Tue, 23 Jul 2019 13:39:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 201771684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563882022;
	bh=HvgOPLtw+eVxs/HkVJFOSMiCQOf3FNxZch1hTg+sAgQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=R1+x4WPDbEQijAWJ+E64umJPfv29UHBJU6n3PKUtkgykaGKoYttrpe7IttaBXh5uR
	 iL8XNLuJPw5GZ3nPm+v85DrORdO8OrCZr/KvDpzSm5Mx4pLa/XB9o1L9mzkcPVuP7S
	 xNxldWo3EHskMdZU/gYiZMPNOv91Bm9xY+VMIw80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB36EF80639;
	Tue, 23 Jul 2019 13:29:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51469F80481; Tue, 23 Jul 2019 13:29:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEC82F8049C
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 13:29:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEC82F8049C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="jMSg+s0c"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=LBkLutZagK2wUrP5/Pig1PnJfcQg1JDo6CmuUAQDcgI=; b=jMSg+s0cnpNS
 i7XjG0MV+tsJx8D1Cu7mYBvPpMOUkYPYbPGCciuC28DlLEjJOYMLlwIpodlB7KQKcNm308PpVqNzw
 i9I/k2QRTuBbFRKGjmakQQ0VLEfxT+dCy48AACFLpb3ygrLenSA0QK4yP9yRmCwKpyC6y/TXDOoBS
 HoGUY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpsyo-0003Jj-PN; Tue, 23 Jul 2019 11:29:14 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 335DB2742BAC; Tue, 23 Jul 2019 12:29:14 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20190722141402.7194-7-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190723112914.335DB2742BAC@ypsilon.sirena.org.uk>
Date: Tue, 23 Jul 2019 12:29:14 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Introduce
	snd_sof_dsp_get_bar_index ops" to the asoc tree
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

   ASoC: SOF: Introduce snd_sof_dsp_get_bar_index ops

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

From ce8234a6357ec8f81b977d8536ff941dbd4162f3 Mon Sep 17 00:00:00 2001
From: Daniel Baluta <daniel.baluta@nxp.com>
Date: Mon, 22 Jul 2019 09:13:47 -0500
Subject: [PATCH] ASoC: SOF: Introduce snd_sof_dsp_get_bar_index ops

FW encapsulates information about section types (e.g DRAM, IRAM)
inside module block header. This information can be used in order
to correctly load the section to the appropriate place in memory.

SOF Linux driver needs to know for each platform how to map the
section type with the corresponding memory BAR. So, this patch
introduces get_bar_index, a new operation inside snd_sof_dsp_ops.

Intel platforms, usually load all the section in a contiguous memory
area (usually denoted by sdev->mmio_bar) so things are relatively
simple there. Anyhow, on i.MX8 IRAM and DRAM for example are mapped
to distinct BARs.

By default, if no get_bar function is provided the core implementation
will always return sdev->mmio_bar so that there will be no need for
a change to existing Intel code.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190722141402.7194-7-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/ops.h      | 19 +++++++++++++++++++
 sound/soc/sof/sof-priv.h |  3 +++
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index b1c27615b805..8fda42748f39 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -100,6 +100,25 @@ static inline int snd_sof_dsp_post_fw_run(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+/* misc */
+
+/**
+ * snd_sof_dsp_get_bar_index - Maps a section type with a BAR index
+ *
+ * @sdev: sof device
+ * @type: section type as described by snd_sof_fw_blk_type
+ *
+ * Returns the corresponding BAR index (a positive integer) or -EINVAL
+ * in case there is no mapping
+ */
+static inline int snd_sof_dsp_get_bar_index(struct snd_sof_dev *sdev, u32 type)
+{
+	if (sof_ops(sdev)->get_bar_index)
+		return sof_ops(sdev)->get_bar_index(sdev, type);
+
+	return sdev->mmio_bar;
+}
+
 /* power management */
 static inline int snd_sof_dsp_resume(struct snd_sof_dev *sdev)
 {
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index fa5cb7d2a660..a6ec9115a9fb 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -196,6 +196,9 @@ struct snd_sof_dsp_ops {
 	int (*trace_trigger)(struct snd_sof_dev *sdev,
 			     int cmd); /* optional */
 
+	/* misc */
+	int (*get_bar_index)(struct snd_sof_dev *sdev,
+			     u32 type); /* optional */
 	/* DAI ops */
 	struct snd_soc_dai_driver *drv;
 	int num_drv;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
