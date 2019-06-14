Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9CA46335
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 17:46:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79B7018A2;
	Fri, 14 Jun 2019 17:45:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79B7018A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560527156;
	bh=5VOfr3kCHGDEf6dgFclLb5RscCTHVy4mi3MCrHOz+Cs=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=FLtljwQub2orVbQ94plIi/OT+GTP6wi6PfRh1ZyHOF9VnQ9aIC1pVzipw6KT/nUjg
	 wvvfyc7v/ZYdXumeuOxlbXfrSMhj6yS20YHw4B2N33RHKzN0v+5AyzbpW5gSjthKys
	 rRZuYBKhY6AqTYxXavp7nUzdDldhGxkjyROCCbSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A4D6F89719;
	Fri, 14 Jun 2019 17:43:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B98F5F89733; Fri, 14 Jun 2019 17:43:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53206F89719
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 17:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53206F89719
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="OVza4ee4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=nw6RmIHYkn+nKtlL98Zn6OhVuqC594OUeyqBpWnGegc=; b=OVza4ee4KtED
 5hWuqpbiAg5Mb5FeLtP9HMIcfi/VWdWl6UYWaEif3PJJKxsd6R9zGq0pMJbFCkmBzR/wkA0yPLPnf
 r+E2KBFmcWgqqzij+yL0+JOjEtpxdp3MzcAgZedx9GHold1/mSsLB4KXGvXW6xWLfsCxZZDNA2HAD
 mM0PE=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hboMI-0008Bj-Ke; Fri, 14 Jun 2019 15:43:18 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 0B8A7440046; Fri, 14 Jun 2019 16:43:18 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <20190614094756.2965-4-gregkh@linuxfoundation.org>
X-Patchwork-Hint: ignore
Message-Id: <20190614154318.0B8A7440046@finisterre.sirena.org.uk>
Date: Fri, 14 Jun 2019 16:43:17 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [alsa-devel] Applied "ASoC: fsl: no need to check return value of
	debugfs_create functions" to the asoc tree
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

   ASoC: fsl: no need to check return value of debugfs_create functions

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

From 227ab8baa15bdd7a48acfb7b61c52a7a5eb87e72 Mon Sep 17 00:00:00 2001
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 14 Jun 2019 11:47:55 +0200
Subject: [PATCH] ASoC: fsl: no need to check return value of debugfs_create
 functions

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_ssi.c     |  4 +---
 sound/soc/fsl/fsl_ssi.h     |  8 +++-----
 sound/soc/fsl/fsl_ssi_dbg.c | 18 ++++--------------
 sound/soc/fsl/imx-audmux.c  | 10 ++--------
 4 files changed, 10 insertions(+), 30 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 09b2967befd9..fa862af25c1a 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -1582,9 +1582,7 @@ static int fsl_ssi_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = fsl_ssi_debugfs_create(&ssi->dbg_stats, dev);
-	if (ret)
-		goto error_asoc_register;
+	fsl_ssi_debugfs_create(&ssi->dbg_stats, dev);
 
 	/* Initially configures SSI registers */
 	fsl_ssi_hw_init(ssi);
diff --git a/sound/soc/fsl/fsl_ssi.h b/sound/soc/fsl/fsl_ssi.h
index 0bdda608d414..db57cad80449 100644
--- a/sound/soc/fsl/fsl_ssi.h
+++ b/sound/soc/fsl/fsl_ssi.h
@@ -270,7 +270,6 @@ struct device;
 
 struct fsl_ssi_dbg {
 	struct dentry *dbg_dir;
-	struct dentry *dbg_stats;
 
 	struct {
 		unsigned int rfrc;
@@ -299,7 +298,7 @@ struct fsl_ssi_dbg {
 
 void fsl_ssi_dbg_isr(struct fsl_ssi_dbg *ssi_dbg, u32 sisr);
 
-int fsl_ssi_debugfs_create(struct fsl_ssi_dbg *ssi_dbg, struct device *dev);
+void fsl_ssi_debugfs_create(struct fsl_ssi_dbg *ssi_dbg, struct device *dev);
 
 void fsl_ssi_debugfs_remove(struct fsl_ssi_dbg *ssi_dbg);
 
@@ -312,10 +311,9 @@ static inline void fsl_ssi_dbg_isr(struct fsl_ssi_dbg *stats, u32 sisr)
 {
 }
 
-static inline int fsl_ssi_debugfs_create(struct fsl_ssi_dbg *ssi_dbg,
-					 struct device *dev)
+static inline void fsl_ssi_debugfs_create(struct fsl_ssi_dbg *ssi_dbg,
+					  struct device *dev)
 {
-	return 0;
 }
 
 static inline void fsl_ssi_debugfs_remove(struct fsl_ssi_dbg *ssi_dbg)
diff --git a/sound/soc/fsl/fsl_ssi_dbg.c b/sound/soc/fsl/fsl_ssi_dbg.c
index 6f6294149476..2a20ee23dc52 100644
--- a/sound/soc/fsl/fsl_ssi_dbg.c
+++ b/sound/soc/fsl/fsl_ssi_dbg.c
@@ -126,25 +126,15 @@ static int fsl_ssi_stats_show(struct seq_file *s, void *unused)
 
 DEFINE_SHOW_ATTRIBUTE(fsl_ssi_stats);
 
-int fsl_ssi_debugfs_create(struct fsl_ssi_dbg *ssi_dbg, struct device *dev)
+void fsl_ssi_debugfs_create(struct fsl_ssi_dbg *ssi_dbg, struct device *dev)
 {
 	ssi_dbg->dbg_dir = debugfs_create_dir(dev_name(dev), NULL);
-	if (!ssi_dbg->dbg_dir)
-		return -ENOMEM;
 
-	ssi_dbg->dbg_stats = debugfs_create_file("stats", 0444,
-						 ssi_dbg->dbg_dir, ssi_dbg,
-						 &fsl_ssi_stats_fops);
-	if (!ssi_dbg->dbg_stats) {
-		debugfs_remove(ssi_dbg->dbg_dir);
-		return -ENOMEM;
-	}
-
-	return 0;
+	debugfs_create_file("stats", 0444, ssi_dbg->dbg_dir, ssi_dbg,
+			    &fsl_ssi_stats_fops);
 }
 
 void fsl_ssi_debugfs_remove(struct fsl_ssi_dbg *ssi_dbg)
 {
-	debugfs_remove(ssi_dbg->dbg_stats);
-	debugfs_remove(ssi_dbg->dbg_dir);
+	debugfs_remove_recursive(ssi_dbg->dbg_dir);
 }
diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
index 04e59e66711d..b2351cd33b0f 100644
--- a/sound/soc/fsl/imx-audmux.c
+++ b/sound/soc/fsl/imx-audmux.c
@@ -141,17 +141,11 @@ static void audmux_debugfs_init(void)
 	char buf[20];
 
 	audmux_debugfs_root = debugfs_create_dir("audmux", NULL);
-	if (!audmux_debugfs_root) {
-		pr_warning("Failed to create AUDMUX debugfs root\n");
-		return;
-	}
 
 	for (i = 0; i < MX31_AUDMUX_PORT7_SSI_PINS_7 + 1; i++) {
 		snprintf(buf, sizeof(buf), "ssi%lu", i);
-		if (!debugfs_create_file(buf, 0444, audmux_debugfs_root,
-					 (void *)i, &audmux_debugfs_fops))
-			pr_warning("Failed to create AUDMUX port %lu debugfs file\n",
-				   i);
+		debugfs_create_file(buf, 0444, audmux_debugfs_root,
+				    (void *)i, &audmux_debugfs_fops);
 	}
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
