Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B537C328
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 15:19:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4D7716DF;
	Wed, 31 Jul 2019 15:18:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4D7716DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564579159;
	bh=xSlZa/0GSIkjf/vsO0RuSx6YlfqRZ/nhdn8lxSOXsPo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qCmM5KYjjpLX5U6E+AgzeLSh0euuW+NGDsv4YIZqv+y4oMQyZEkgOdPYicpwIUNhv
	 mhsN0gL7zuPASB2jKqPXS+4MHg4VvZ6Y919kxeHb5eKc3XZRZ/xDz4SfGggs2JM6eD
	 6lwn41F4/NLovysE0stUkfsToeOb4kCMC4DUF7Us=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E649BF8048E;
	Wed, 31 Jul 2019 15:17:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A0DFF80483; Wed, 31 Jul 2019 15:17:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E44DF80214
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 15:17:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E44DF80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="wRTzeAyQ"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E530520693;
 Wed, 31 Jul 2019 13:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564579047;
 bh=cF0NqJioENF5goZLqgUeSulLM0pCLtXDe1MVNQ85T3Y=;
 h=From:To:Cc:Subject:Date:From;
 b=wRTzeAyQ/PW9eoQQfPqQEyxXufqMQSzfAHvoTNhz6kRfVGwj0vAG14YbhAklvcD3p
 7D/FArTDS7WPLvEG82eXDEGLcRYUsfUdDz59pGmoenmhEsHY4+usWKyCFdUrcc69ha
 luLfwmpt9ti/HGr/3siKbpOfskDBhgKsGbWGJw3s=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Date: Wed, 31 Jul 2019 15:17:14 +0200
Message-Id: <20190731131716.9764-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jie Yang <yang.jie@linux.intel.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 1/3] ASoC: Intel: SoC: skylake: no need to
	check return value of debugfs_create functions
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

Also, if a debugfs call fails, userspace is notified with an error in
the log, so no need to log the error again.

Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Jie Yang <yang.jie@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2: rebase on 5.3-rc1
    change Subject line to match the subsystem better
    rework based on debugfs core now reporting errors.

 sound/soc/intel/skylake/skl-debug.c | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-debug.c b/sound/soc/intel/skylake/skl-debug.c
index b9b4a72a4334..1d6240ad6112 100644
--- a/sound/soc/intel/skylake/skl-debug.c
+++ b/sound/soc/intel/skylake/skl-debug.c
@@ -162,10 +162,8 @@ void skl_debug_init_module(struct skl_debug *d,
 			struct snd_soc_dapm_widget *w,
 			struct skl_module_cfg *mconfig)
 {
-	if (!debugfs_create_file(w->name, 0444,
-				d->modules, mconfig,
-				&mcfg_fops))
-		dev_err(d->dev, "%s: module debugfs init failed\n", w->name);
+	debugfs_create_file(w->name, 0444, d->modules, mconfig,
+			    &mcfg_fops);
 }
 
 static ssize_t fw_softreg_read(struct file *file, char __user *user_buf,
@@ -222,34 +220,18 @@ struct skl_debug *skl_debugfs_init(struct skl *skl)
 		return NULL;
 
 	/* create the debugfs dir with platform component's debugfs as parent */
-	d->fs = debugfs_create_dir("dsp",
-				   skl->component->debugfs_root);
-	if (IS_ERR(d->fs) || !d->fs) {
-		dev_err(&skl->pci->dev, "debugfs root creation failed\n");
-		return NULL;
-	}
+	d->fs = debugfs_create_dir("dsp", skl->component->debugfs_root);
 
 	d->skl = skl;
 	d->dev = &skl->pci->dev;
 
 	/* now create the module dir */
 	d->modules = debugfs_create_dir("modules", d->fs);
-	if (IS_ERR(d->modules) || !d->modules) {
-		dev_err(&skl->pci->dev, "modules debugfs create failed\n");
-		goto err;
-	}
 
-	if (!debugfs_create_file("fw_soft_regs_rd", 0444, d->fs, d,
-				 &soft_regs_ctrl_fops)) {
-		dev_err(d->dev, "fw soft regs control debugfs init failed\n");
-		goto err;
-	}
+	debugfs_create_file("fw_soft_regs_rd", 0444, d->fs, d,
+			    &soft_regs_ctrl_fops);
 
 	return d;
-
-err:
-	debugfs_remove_recursive(d->fs);
-	return NULL;
 }
 
 void skl_debugfs_exit(struct skl *skl)
-- 
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
