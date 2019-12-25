Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E810512A525
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Dec 2019 01:10:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72C3416A9;
	Wed, 25 Dec 2019 01:10:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72C3416A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577232650;
	bh=9iTZOsFORwaQq36iJ1ElKcqAw9/N1AJvyHbMy8EhtPE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=qoRJ+sAkLTJdMYN6IUYX+NvILGS75irhGSuNkvG2l+Ceoxbh7dOVVypVfSjovFbdy
	 Q49NAUYBDo45STzz7/hWWvPWkA+Mbj/pVu8G7HzOh7lZ6gIMgS5r8IM1AeHeA29whY
	 ehZXDLLOU56w3ZvQ1CE0TOseYWCT8aMxb3Kf9F0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01EECF80269;
	Wed, 25 Dec 2019 01:09:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61B57F80247; Wed, 25 Dec 2019 01:09:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_29,SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 922B8F800E3
 for <alsa-devel@alsa-project.org>; Wed, 25 Dec 2019 01:08:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 922B8F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="DOI33U7I"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=mSFUdtnl076QRNW8MS7MC3xO9q4FWSjjgOMtTTBta+I=; b=DOI33U7IjMXb
 UAC1lXvhqvrXXlHexBLQblkN/1xKYxqRH0ynh6HeejolwwZK70gfCAGKT5mMKW67S3WHD8/N2jnJe
 qMwD1waDAm4lZk6dK+2A8YjEoAOAUFy+SzZMZ2nq21Ly1iuDVtSiUqEBwAE/SRIIzvbrddYW4p+kK
 6XDZU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ijuEU-0007Kh-D4; Wed, 25 Dec 2019 00:08:58 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id BD3ECD01A47; Wed, 25 Dec 2019 00:08:57 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20191220170531.10423-1-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191220170531.10423-1-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Date: Wed, 25 Dec 2019 00:08:57 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: imx8: Fix dsp_box offset" to the
	asoc tree
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

   ASoC: SOF: imx8: Fix dsp_box offset

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

From dcf08d0f8f09081b16f69071dd55d51d5e964e84 Mon Sep 17 00:00:00 2001
From: Daniel Baluta <daniel.baluta@nxp.com>
Date: Fri, 20 Dec 2019 11:05:31 -0600
Subject: [PATCH] ASoC: SOF: imx8: Fix dsp_box offset

dsp_box is used to keep DSP initiated messages. The value of dsp_offset
is set by the DSP with the first message, so we need a way to bootstrap
it in order to get the first message.

We do this by setting the correct default dsp_box offset which on i.MX8
is not zero.

Very interesting is why it has worked until now.

On i.MX8, DSP communicates with ARM core using a shared SDRAM memory
area. Actually, there are two shared areas:
	* SDRAM0 - starting at 0x92400000, size 0x800000
	* SDRAM1 - starting at 0x92C00000, size 0x800000

SDRAM0 keeps the data sections, starting with .rodata. By chance
fw_ready structure was placed at the beginning of .rodata.

dsp_box_base is defined as SDRAM0 + dsp_box_offset and it is placed
at the beginning of SDRAM1 (dsp_box_offset should be 0x800000). But
because it is zero initialized by default it points to SDRAM0 where
by chance the fw_ready was placed in the SOF firmware.

Anyhow, SOF commit 7466bee378dd811b ("clk: make freq arrays constant")
fw_ready is no longer at the beginning of SDRAM0 and everything shows
how lucky we were until now.

Fix this by properly setting the default dsp_box offset.

Fixes: 202acc565a1f050 ("ASoC: SOF: imx: Add i.MX8 HW support")
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191220170531.10423-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/imx/imx8.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 9d926b1df0d7..aef6ca167b9c 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -304,6 +304,9 @@ static int imx8_probe(struct snd_sof_dev *sdev)
 	}
 	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
 
+	/* set default mailbox offset for FW ready message */
+	sdev->dsp_box.offset = MBOX_OFFSET;
+
 	return 0;
 
 exit_pdev_unregister:
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
