Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACBFF4B65
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2019 13:23:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3DD41685;
	Fri,  8 Nov 2019 13:22:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3DD41685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573215802;
	bh=mOQ5WlXY7q8BHBL0K3wF2TfcWsbruOp7ioawe7b5Mtk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=e4SZ8wh81lGUzzVEZwSUOyoW6CamC6QUjK+vryDQzPoWRLu5fYPWx4KI9LyA8bxK5
	 V0I7weOgfUKrSzinl2iAwqwzgbs6clRTpXSpCPBxr1615Gfppawf871h8R/cMnk/H5
	 tVmYOfZMh5fAA8w3S//VrkXdqJjK+BOY0PVdgax0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B270F805DF;
	Fri,  8 Nov 2019 13:21:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5933BF805A1; Fri,  8 Nov 2019 13:20:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96E37F800F3
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 13:20:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96E37F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="lv3gemje"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=PG+E89gZ+SXpKfqD/xBgZiX4wiFqe8oiafjOapjyPck=; b=lv3gemje7CAQ
 ZsqXAWlSnRctHpjEU3jaIHmnjpCxO7nkGG/roXXZRmxpmvv8SQG06yNcr77mtc/74PrsSsb1Ob2pg
 1lMIknqLf30Fs5h5i1UPE4aPHmbbqupL9NFivZCbG84tr8hpwGk/QZ64nEYOcoxqbIIQehukGAvw1
 nWkEA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iT3Ft-0007Eg-Q0; Fri, 08 Nov 2019 12:20:45 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3BF0F2741450; Fri,  8 Nov 2019 12:20:45 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20191101170916.26517-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191108122045.3BF0F2741450@ypsilon.sirena.org.uk>
Date: Fri,  8 Nov 2019 12:20:45 +0000 (GMT)
Cc: tiwai@suse.de, Keqiao Zhang <keqiao.zhang@intel.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: topology: fix missing NULL pointer
	check" to the asoc tree
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

   ASoC: SOF: topology: fix missing NULL pointer check

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

From 8cd73ce7ba6381feb9df763240dee3a6d4aff1ca Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Fri, 1 Nov 2019 12:09:14 -0500
Subject: [PATCH] ASoC: SOF: topology: fix missing NULL pointer check

Add check to avoid possible NULL pointer dereference issue.

This issue was reported by static analysis tools, we didn't face this
issue but we can't rule it out either as a false positive.

Reported-by: Keqiao Zhang <keqiao.zhang@intel.com>
Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191101170916.26517-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/topology.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 143b8259a70a..6096731e89ce 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -150,6 +150,11 @@ static int sof_keyword_dapm_event(struct snd_soc_dapm_widget *w,
 
 	/* get runtime PCM params using widget's stream name */
 	spcm = snd_sof_find_spcm_name(sdev, swidget->widget->sname);
+	if (!spcm) {
+		dev_err(sdev->dev, "error: cannot find PCM for %s\n",
+			swidget->widget->name);
+		return -EINVAL;
+	}
 
 	/* process events */
 	switch (event) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
