Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 830CD48767
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 17:37:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 220C617CE;
	Mon, 17 Jun 2019 17:36:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 220C617CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560785847;
	bh=ny8UByf3Nwkyi3Al+UK3tvquoDPi8q2ET6MJylnpjE4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bK4+qEJEH3wARnS+4NAagQjSwtfobLKKXBMv4AHCd3tom+nLR70VcyZa/Ml5q5cd/
	 tJOzVrcy7bHrlc/3wwMZY0/eSKCNRtIO/x3K9FzbaXe+V8ZDaXOMi9jjP7locC5Y+L
	 phAGi6/RyRNRJAAk3uw68i0tEOmIE4wSMRmcoV5s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DFE0F89788;
	Mon, 17 Jun 2019 17:25:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE4BDF8974C; Mon, 17 Jun 2019 17:24:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9E0DF8973F
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 17:24:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9E0DF8973F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="GDhzPi7t"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=XoQDaTK5OK6FeFm22sBmwitru6GTkPoBtwpOPiCyKv8=; b=GDhzPi7t4WBe
 p9D0zdH8cbiY1EcrC1QMWiuUWzQO0X36ueC/ecO+euBQQZmI8qqItoNEXjNggQlOh5G1oSEvO2xFN
 NPLOB57W7MJgy4PZOwSxKm5xVWZ/gy5lFqV39OY5cGW3X4VcBJLEwxhdbpaP1emURfkEeOb+W/ogB
 oL5CQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hctUi-0001ys-KF; Mon, 17 Jun 2019 15:24:28 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 27304440046; Mon, 17 Jun 2019 16:24:28 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20190612172347.22338-4-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190617152428.27304440046@finisterre.sirena.org.uk>
Date: Mon, 17 Jun 2019 16:24:28 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: topology: add cpu_dai_name for
	DAIs" to the asoc tree
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

   ASoC: SOF: topology: add cpu_dai_name for DAIs

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

From 1b7e1956860d7566325502651c6bf14f115cd91d Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Wed, 12 Jun 2019 12:23:35 -0500
Subject: [PATCH] ASoC: SOF: topology: add cpu_dai_name for DAIs

Add the cpu_dai_name member to snd_sof_dai and save the
cpu_dai_name while setting the DAI config.

The internal SOF representation will have to change at a later point
as well when we have multiple CPU dais.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/sof-priv.h | 1 +
 sound/soc/sof/topology.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 8760a4694d8f..8c3ac149bbb9 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -337,6 +337,7 @@ struct snd_sof_route {
 struct snd_sof_dai {
 	struct snd_sof_dev *sdev;
 	const char *name;
+	const char *cpu_dai_name;
 
 	struct sof_ipc_comp_dai comp_dai;
 	struct sof_ipc_dai_config *dai_config;
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index aaf459af89d0..178256e338b1 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2360,6 +2360,9 @@ static int sof_set_dai_config(struct snd_sof_dev *sdev, u32 size,
 			if (!dai->dai_config)
 				return -ENOMEM;
 
+			/* set cpu_dai_name */
+			dai->cpu_dai_name = link->cpus->dai_name;
+
 			found = 1;
 		}
 	}
@@ -2624,6 +2627,8 @@ static int sof_link_hda_process(struct snd_sof_dev *sdev,
 			if (!sof_dai->dai_config)
 				return -ENOMEM;
 
+			sof_dai->cpu_dai_name = link->cpus->dai_name;
+
 			/* send message to DSP */
 			ret = sof_ipc_tx_message(sdev->ipc,
 						 config->hdr.cmd, config, size,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
