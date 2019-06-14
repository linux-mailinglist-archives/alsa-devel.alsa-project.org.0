Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B30B459FB
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 12:09:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D95E7185C;
	Fri, 14 Jun 2019 12:08:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D95E7185C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560506955;
	bh=3EKPbZfTuw3jdy+uOtzan+eyFKB0tkwxzH161YVxSQk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BHzaEz1Uf2JUNXzi0YfybhgPof56x1aRackcNS/Q458biDzFdAZEr+UUSyLjVXpDW
	 qCrwY2VhNivxrh+fjuXDaCFdgxRF9xcRpvB7lZ2czdF/aTMC1++iEoV5C0EFqVvX9y
	 hirs07lVtbuFhRKSISbFKlHHHfaHos3ZloThxNhQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32705F896CE;
	Fri, 14 Jun 2019 12:07:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82B03F896E3; Fri, 14 Jun 2019 12:07:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3B9FF8076F
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 12:07:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3B9FF8076F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xX7OubIk"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4EE7321537;
 Fri, 14 Jun 2019 09:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560505696;
 bh=lewnruf08KpEZI1dNrw2nv+WDkht3JN3yjh14aAkQvs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xX7OubIkaBnuKF/GMShWWWq/2OMWQVOzaUGxKuR0J9OCtTnE9Yj9WKY0T/LsU9CLE
 dA5SuK3lxGprxfSVyiB/lXewanaSmnrwSX3OFZwL+FX97EuXRh5QgWALwBWbiQdomD
 ejcJp4xSzdTMjRK3rGUXDJr2aWvd7Do6YfNme8oo=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Date: Fri, 14 Jun 2019 11:47:54 +0200
Message-Id: <20190614094756.2965-3-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190614094756.2965-1-gregkh@linuxfoundation.org>
References: <20190614094756.2965-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, patches@opensource.cirrus.com
Subject: [alsa-devel] [PATCH 3/5] sound: soc: codecs: wm_adsp: no need to
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

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: <patches@opensource.cirrus.com>
Cc: <alsa-devel@alsa-project.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
