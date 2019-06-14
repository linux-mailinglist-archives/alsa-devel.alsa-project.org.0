Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD65F4632F
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 17:45:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 485261889;
	Fri, 14 Jun 2019 17:44:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 485261889
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560527110;
	bh=g9J6bWhV6wHc0rang/P6x8z5e0Cr6LjrExD5SEwTneY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jDKuxMzTYV9HxfmptUow7fuuFnw90ouPhVJvgs6k8aCwCWMXM+c+E5SKRHdroxRId
	 WWAOmyirPGbQo68CfsXvtNAubaCE8L3RQXoT1DhrQ+IKkgklvER7MEhxG7PkGc02tH
	 +QOcw/UqRFDA7SrphM0kdNdrpwWs7uxTh5H/Gp/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAB05F896E0;
	Fri, 14 Jun 2019 17:43:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B693FF896E0; Fri, 14 Jun 2019 17:43:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64D46F80794
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 17:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64D46F80794
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Tklp6Ep0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=waysawTKWSDWL55nIwMGUqiO6DLfl3CQxKLPOVlUA3M=; b=Tklp6Ep0i/1Y
 g4/Ts6XVU5w10OpgMOa6Raom5U3au2EAuQryzilQGZ8oXRiHJeB6sUsp02XQA30aYmeM2oziSlblz
 mi0zGwxcVKtpyvQs56Aq13kvlap8gH+SixuC6idelnd80/kMvyMtDXORRJOkK0MTBmPmg/ZFOVUJt
 JDfyE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hboMJ-0008Bk-2V; Fri, 14 Jun 2019 15:43:19 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 94311440049; Fri, 14 Jun 2019 16:43:18 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <20190614094756.2965-3-gregkh@linuxfoundation.org>
X-Patchwork-Hint: ignore
Message-Id: <20190614154318.94311440049@finisterre.sirena.org.uk>
Date: Fri, 14 Jun 2019 16:43:18 +0100 (BST)
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: wm_adsp: no need to check return value
	of debugfs_create functions" to the asoc tree
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

   ASoC: wm_adsp: no need to check return value of debugfs_create functions

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

From 7f807f280964e31fb32fe6aaa263cfa2488236d8 Mon Sep 17 00:00:00 2001
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 14 Jun 2019 11:47:54 +0200
Subject: [PATCH] ASoC: wm_adsp: no need to check return value of
 debugfs_create functions

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm_adsp.c | 37 +++++++------------------------------
 1 file changed, 7 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index b26e6b825a90..8f301cb07745 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -731,41 +731,18 @@ static void wm_adsp2_init_debugfs(struct wm_adsp *dsp,
 	struct dentry *root = NULL;
 	int i;
 
-	if (!component->debugfs_root) {
-		adsp_err(dsp, "No codec debugfs root\n");
-		goto err;
-	}
-
 	root = debugfs_create_dir(dsp->name, component->debugfs_root);
 
-	if (!root)
-		goto err;
-
-	if (!debugfs_create_bool("booted", 0444, root, &dsp->booted))
-		goto err;
+	debugfs_create_bool("booted", 0444, root, &dsp->booted);
+	debugfs_create_bool("running", 0444, root, &dsp->running);
+	debugfs_create_x32("fw_id", 0444, root, &dsp->fw_id);
+	debugfs_create_x32("fw_version", 0444, root, &dsp->fw_id_version);
 
-	if (!debugfs_create_bool("running", 0444, root, &dsp->running))
-		goto err;
-
-	if (!debugfs_create_x32("fw_id", 0444, root, &dsp->fw_id))
-		goto err;
-
-	if (!debugfs_create_x32("fw_version", 0444, root, &dsp->fw_id_version))
-		goto err;
-
-	for (i = 0; i < ARRAY_SIZE(wm_adsp_debugfs_fops); ++i) {
-		if (!debugfs_create_file(wm_adsp_debugfs_fops[i].name,
-					 0444, root, dsp,
-					 &wm_adsp_debugfs_fops[i].fops))
-			goto err;
-	}
+	for (i = 0; i < ARRAY_SIZE(wm_adsp_debugfs_fops); ++i)
+		debugfs_create_file(wm_adsp_debugfs_fops[i].name, 0444, root,
+				    dsp, &wm_adsp_debugfs_fops[i].fops);
 
 	dsp->debugfs_root = root;
-	return;
-
-err:
-	debugfs_remove_recursive(root);
-	adsp_err(dsp, "Failed to create debugfs\n");
 }
 
 static void wm_adsp2_cleanup_debugfs(struct wm_adsp *dsp)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
