Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8408D6200
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 14:06:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49136166B;
	Mon, 14 Oct 2019 14:05:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49136166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571054809;
	bh=Vhq7KFtTQd4HpPhKXgeeapA5L08gtZfqNikZEH1ARmM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=YK+YMcdbS+t8StZm87RoAEHUqmO3oXm5dA+ZAT5MIeYnOp9VSRgSgaNa6zutO6Nru
	 3YrkTpG5LKlGK1aiiV2LbcCOiMaWwac2GC+ZYrKBGZ7qkTzh/hDU5bZdoJwXWsIzl3
	 vCmpIDjgAbWrzShF7tcv9wqHAnAnMHEWznHmQDpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47296F8045D;
	Mon, 14 Oct 2019 14:05:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A532BF80377; Mon, 14 Oct 2019 14:05:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2EFAF80138
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 14:04:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2EFAF80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="taouMYfR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Eh3VcCfJ67wTWtT6LlFNsP/koien6uAdsPqIsxvluzs=; b=taouMYfRjuUG
 aSM7n7CSPCAi6ARkKx29mVmBiwm8ihfz08l77NyZWZCfLiHp6HktP/UtdgkneS9/1zpP5trSq07Pk
 vxxZcB9AwcKzva8XhiHrt+A2zwGVTKnT3hK7jjcoq5nwGF2KLGPZZ6hCriuEyYd0UlwmjXKvYGVUY
 wRLbA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iJz5t-0007WB-ND; Mon, 14 Oct 2019 12:04:57 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 1466A2741EF2; Mon, 14 Oct 2019 13:04:57 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20191011164312.7988-4-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191014120457.1466A2741EF2@ypsilon.sirena.org.uk>
Date: Mon, 14 Oct 2019 13:04:57 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: topology: remove always-true
	redundant test" to the asoc tree
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

   ASoC: SOF: topology: remove always-true redundant test

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

From 494e8f65da24d550a5e7c6a85b9433ffb181705c Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Fri, 11 Oct 2019 11:43:11 -0500
Subject: [PATCH] ASoC: SOF: topology: remove always-true redundant test

Address cppcheck warning:

sound/soc/sof/topology.c:2322:6: style: Condition 'pcm' is always true
[knownConditionTrueFalse]
 if (pcm) {
     ^

sound/soc/sof/topology.c:2311:6: note: Assuming that condition '!pcm'
is not redundant
 if (!pcm)
     ^

sound/soc/sof/topology.c:2322:6: note: Condition 'pcm' is always true
 if (pcm) {
     ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191011164312.7988-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/topology.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index a29109ea3c06..3fad1d5cb2ca 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2308,10 +2308,9 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 	spcm->stream[SNDRV_PCM_STREAM_PLAYBACK].comp_id = COMP_ID_UNASSIGNED;
 	spcm->stream[SNDRV_PCM_STREAM_CAPTURE].comp_id = COMP_ID_UNASSIGNED;
 
-	if (pcm) {
-		spcm->pcm = *pcm;
-		dev_dbg(sdev->dev, "tplg: load pcm %s\n", pcm->dai_name);
-	}
+	spcm->pcm = *pcm;
+	dev_dbg(sdev->dev, "tplg: load pcm %s\n", pcm->dai_name);
+
 	dai_drv->dobj.private = spcm;
 	list_add(&spcm->list, &sdev->pcm_list);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
