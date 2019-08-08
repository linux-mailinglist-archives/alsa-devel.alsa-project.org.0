Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 966ED86D0A
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 00:20:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14983857;
	Fri,  9 Aug 2019 00:19:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14983857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565302844;
	bh=pN/xCAaI6BVdnjPs6reyKn3pZAhaJirv8pUndU+oI2c=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sPaUSHjQ+gcuQWukD36KjvgQFzDGVOfuZHSNK64VpEdRMw+s9CZOSeMl83ORos+v5
	 5qR6mrNM2IGRwOwpUdv6PpD9ejRFNlttTSQSyccLNzLHMTNMpGzjGb2wKbAnZykIaJ
	 /3JHGEOKXL7ogMKSUm+Qxm38i6S5jML8jNGm2qEw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35757F804FF;
	Fri,  9 Aug 2019 00:19:00 +0200 (CEST)
X-Original-To: alsa-devel@Alsa-project.org
Delivered-To: alsa-devel@Alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D908F80534; Fri,  9 Aug 2019 00:18:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3456F803F3
 for <alsa-devel@Alsa-project.org>; Fri,  9 Aug 2019 00:18:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3456F803F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="hQt8lUc8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0fHyooWX4YfWNSEA+xxXc9BQYNHmBsni7NuDnl1CB1Q=; b=hQt8lUc8f1BHN0qNkcjgPVTWx
 QTPJro3oXhsQLoALaKT4WOmMChkHpc/p9QlLTqc2ubfnzUifzs1TdsDNPEjEN9D6FHowj+YNOUs93
 NqL3W3DFTJR9cOp3B/fVx3FO7XUkmZJTNUeqr3aFRhAuU0qpzAfA1fx0LIiANpzzUJl64=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvqkI-0004DK-4X; Thu, 08 Aug 2019 22:18:54 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 4ECEF2742BDD; Thu,  8 Aug 2019 23:18:53 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Thu,  8 Aug 2019 23:18:50 +0100
Message-Id: <20190808221850.25963-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@Alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH] ASoC: sof: Fix warning when IPC flood test is
	not enabled
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

dentry is only used when the flood test is done so move the declaration
of the variable inside the ifdef for the flood test.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/debug.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 40940b2fe9d5..54cd431faab7 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -221,7 +221,6 @@ static ssize_t sof_dfsentry_read(struct file *file, char __user *buffer,
 {
 	struct snd_sof_dfsentry *dfse = file->private_data;
 	struct snd_sof_dev *sdev = dfse->sdev;
-	struct dentry *dentry;
 	loff_t pos = *ppos;
 	size_t size_ret;
 	int skip = 0;
@@ -229,6 +228,8 @@ static ssize_t sof_dfsentry_read(struct file *file, char __user *buffer,
 	u8 *buf;
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST)
+	struct dentry *dentry;
+
 	dentry = file->f_path.dentry;
 	if ((!strcmp(dentry->d_name.name, "ipc_flood_count") ||
 	     !strcmp(dentry->d_name.name, "ipc_flood_duration_ms")) &&
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
