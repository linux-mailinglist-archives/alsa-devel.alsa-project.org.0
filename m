Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F8AF970A
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 18:24:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1620F1676;
	Tue, 12 Nov 2019 18:23:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1620F1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573579443;
	bh=7Qx/6g77gP06sITb8xnUXJpXuPGtAocgQIzXlx2WiJY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=P9A7706qj4YfiEZG2iBp26j0v3jinjpi07cYNcGflLwkDP0pMaDV+AZBXyER4J+vg
	 foCij0R+0hA62x++JZplxvKpgTtklkpfAnQ4msDWjlBNAlx6FXvGMt8Vfx1Zh+wFMF
	 OS/ZVY1X879GbNXKqv6ZGllkFiEFvEkSh4CaMGqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B82C6F80679;
	Tue, 12 Nov 2019 18:16:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60F02F8060F; Tue, 12 Nov 2019 18:16:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE656F8049A;
 Tue, 12 Nov 2019 18:16:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE656F8049A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="DAxpL/ux"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=uH5W4LkNdtmlBfQoOHJn/edsAOkKzKLZXq5jRsDbWtE=; b=DAxpL/uxjJcP
 lC8CSzjXVLzRXISiIMv6CaJYX61YHMYEijss9PmYIKd8VmgCJNN2n7ROsGSgmdXPoI+sxpZsgd2UT
 CkPrL/dFJPnUzl7wQMGedFAW6blx4EKzl2U7xUhmdz0T3slc3fQA0uqh5OV57c/dC6Cr7/GO5k2MC
 gYJhQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iUZm7-0008Ik-IP; Tue, 12 Nov 2019 17:16:19 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id AD4AE274299F; Tue, 12 Nov 2019 17:16:18 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
In-Reply-To: <20191112130237.10141-1-pawel.harlozinski@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191112171618.AD4AE274299F@ypsilon.sirena.org.uk>
Date: Tue, 12 Nov 2019 17:16:18 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, patch@alsa-project.org, tiwai@suse.de,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 stable@vger.kernel.org, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: Jack: Fix NULL pointer dereference in
	snd_soc_jack_report" to the asoc tree
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

   ASoC: Jack: Fix NULL pointer dereference in snd_soc_jack_report

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

From 8f157d4ff039e03e2ed4cb602eeed2fd4687a58f Mon Sep 17 00:00:00 2001
From: Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
Date: Tue, 12 Nov 2019 14:02:36 +0100
Subject: [PATCH] ASoC: Jack: Fix NULL pointer dereference in
 snd_soc_jack_report

Check for existance of jack before tracing.
NULL pointer dereference has been reported by KASAN while unloading
machine driver (snd_soc_cnl_rt274).

Signed-off-by: Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
Link: https://lore.kernel.org/r/20191112130237.10141-1-pawel.harlozinski@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
 sound/soc/soc-jack.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/soc-jack.c b/sound/soc/soc-jack.c
index a71d2340eb05..b5748dcd490f 100644
--- a/sound/soc/soc-jack.c
+++ b/sound/soc/soc-jack.c
@@ -82,10 +82,9 @@ void snd_soc_jack_report(struct snd_soc_jack *jack, int status, int mask)
 	unsigned int sync = 0;
 	int enable;
 
-	trace_snd_soc_jack_report(jack, mask, status);
-
 	if (!jack)
 		return;
+	trace_snd_soc_jack_report(jack, mask, status);
 
 	dapm = &jack->card->dapm;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
