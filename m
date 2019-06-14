Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E66E245A10
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 12:10:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CB4D185E;
	Fri, 14 Jun 2019 12:09:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CB4D185E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560507043;
	bh=z8Lxm4/LKvNC+z6GPDKBSbbekkWxTA+zx+MPQh7Sy8A=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sKTM3UEHDaBc27J15aOXhyq3D3WfncfZlA7Tq0kjudqpPAY7w/CMVr9KI1GFGg9a/
	 ABwIH2eVyDW2lM3DiUxulqtG0LH6iiGftpD0K4ka6Rbtf0O9NR2HrxBFvesgqiPdtN
	 Vo1iU8Fcr2S56WBVrbpdX3fMjVoaF/5cGJNKCSRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4636BF89733;
	Fri, 14 Jun 2019 12:07:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CAD7F89717; Fri, 14 Jun 2019 12:07:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0F91F80794
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 12:07:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0F91F80794
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ofyuCR5w"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BDD462168B;
 Fri, 14 Jun 2019 09:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560505699;
 bh=jFu36D2rc2mLIqiJkTJO3lU5SCNFwL1AqltQ4iD1Xo4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ofyuCR5wcdB1L8eh/XlJTVGufFi3It0A/ZeVRfxeIesQ9zrVv6y9ylymF0w6XL3z0
 nluZYDW03Gl2SLApb+KW8Fdh3d1T+EfqG3gFSEfvTsiyXgcwAUK06ChXS6RWAJB3tQ
 bpOUIKpov9NrgZUxgjMiM8BJV0szIbTR3MQqZpdg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Date: Fri, 14 Jun 2019 11:47:55 +0200
Message-Id: <20190614094756.2965-4-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190614094756.2965-1-gregkh@linuxfoundation.org>
References: <20190614094756.2965-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>
Subject: [alsa-devel] [PATCH 4/5] sound: soc: fsl: no need to check return
	value of debugfs_create functions
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Timur Tabi <timur@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: <alsa-devel@alsa-project.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
