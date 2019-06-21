Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F30684E733
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jun 2019 13:35:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42B701681;
	Fri, 21 Jun 2019 13:34:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42B701681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561116948;
	bh=yluMSvy8JQnQvgbZHZ/wC2giSpq08TYmQQ/dB9/1wwg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NQUqLCyBpdPUdJ855oY7Y5eUPg3tPKwg/E4DRF8+pgCnMWxYz4E43UmUbMPMvthRW
	 aV+3EMZ/jXe99fxxP/rJBJxj+zzIjEiz+UHYxFb5kRj/9cT9Wzh5Xr4+RQkOq9t2DJ
	 UfAoKdiiYpc35cpwm8vYFUGAhX1pG6w2MJMMOyLk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2997F896B8;
	Fri, 21 Jun 2019 13:34:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0BC1F896C7; Fri, 21 Jun 2019 13:34:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E22EF808AF
 for <alsa-devel@alsa-project.org>; Fri, 21 Jun 2019 13:33:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E22EF808AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="dkErER1z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vAum9r+cTFtt1A+kfiwJThOZ57jM6FC+5+se9oFWUHA=; b=dkErER1zL53TinPJkkfNLEDdDU
 lsUv6BSdLuZfDjrOC2lKumqE2G6/LIPE1rzoPOTsmq8TI+KSpKizYTt2TNE8skZA/JacvZ+fXubIR
 6VH6YPPmw0XZx2y2pRBAv0suWAHJJqNBB18M7yff3XVNxZyBSEx6MyDf0bbSmsjlsWSw=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1heHnq-0002PX-U9; Fri, 21 Jun 2019 11:33:58 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 495EF440041; Fri, 21 Jun 2019 12:33:57 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Date: Fri, 21 Jun 2019 12:33:57 +0100
Message-Id: <20190621113357.8264-2-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190621113357.8264-1-broonie@kernel.org>
References: <20190621113357.8264-1-broonie@kernel.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 stable@vger.kernel.org
Subject: [alsa-devel] [PATCH 2/2] ASoC: dapm: Adapt for debugfs API change
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

Back in ff9fb72bc07705c (debugfs: return error values, not NULL) the
debugfs APIs were changed to return error pointers rather than NULL
pointers on error, breaking the error checking in ASoC. Update the
code to use IS_ERR() and log the codes that are returned as part of
the error messages.

Fixes: ff9fb72bc07705c (debugfs: return error values, not NULL)
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
 sound/soc/soc-dapm.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 6b44b4a78b8e..f013b24c050a 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2156,23 +2156,25 @@ void snd_soc_dapm_debugfs_init(struct snd_soc_dapm_context *dapm,
 {
 	struct dentry *d;
 
-	if (!parent)
+	if (!parent || IS_ERR(parent))
 		return;
 
 	dapm->debugfs_dapm = debugfs_create_dir("dapm", parent);
 
-	if (!dapm->debugfs_dapm) {
+	if (IS_ERR(dapm->debugfs_dapm)) {
 		dev_warn(dapm->dev,
-		       "ASoC: Failed to create DAPM debugfs directory\n");
+			 "ASoC: Failed to create DAPM debugfs directory %ld\n",
+			 PTR_ERR(dapm->debugfs_dapm));
 		return;
 	}
 
 	d = debugfs_create_file("bias_level", 0444,
 				dapm->debugfs_dapm, dapm,
 				&dapm_bias_fops);
-	if (!d)
+	if (IS_ERR(d))
 		dev_warn(dapm->dev,
-			 "ASoC: Failed to create bias level debugfs file\n");
+			 "ASoC: Failed to create bias level debugfs file: %ld\n",
+			 PTR_ERR(d));
 }
 
 static void dapm_debugfs_add_widget(struct snd_soc_dapm_widget *w)
@@ -2186,10 +2188,10 @@ static void dapm_debugfs_add_widget(struct snd_soc_dapm_widget *w)
 	d = debugfs_create_file(w->name, 0444,
 				dapm->debugfs_dapm, w,
 				&dapm_widget_power_fops);
-	if (!d)
+	if (IS_ERR(d))
 		dev_warn(w->dapm->dev,
-			"ASoC: Failed to create %s debugfs file\n",
-			w->name);
+			 "ASoC: Failed to create %s debugfs file: %ld\n",
+			 w->name, PTR_ERR(d));
 }
 
 static void dapm_debugfs_cleanup(struct snd_soc_dapm_context *dapm)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
