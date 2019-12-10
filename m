Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76948118A10
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 14:41:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B1651688;
	Tue, 10 Dec 2019 14:40:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B1651688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575985283;
	bh=IndxgBIQixapyg1jaqvgK33rImpjnrWfkEeS8MUaAdU=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=oH9KjtWLXodILx1B5EcNVDCKtATQ+u3keEV+HEHK/K5fCk1rvpLmZqveb3U/nYa3x
	 I1fuL4MpnD30TDcIpxyj6ywIvChGVgwbyA9MDI+66BczCCMdIGW/+yJnQhxwl7x/Rq
	 WEMTXyLyHlwg2sZS1X2H8E5z1ZqpGIr0zNQXOdds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA67FF80385;
	Tue, 10 Dec 2019 14:23:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95DD1F8038D; Tue, 10 Dec 2019 14:23:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D91A1F80369
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 14:23:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D91A1F80369
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57AFB328;
 Tue, 10 Dec 2019 05:23:40 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC75C3F52E;
 Tue, 10 Dec 2019 05:23:39 -0800 (PST)
Date: Tue, 10 Dec 2019 13:23:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Dragos Tarcatu <dragos_tarcatu@mentor.com>
In-Reply-To: <20191210003939.15752-2-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191210003939.15752-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: topology: Check return value for
	snd_soc_add_dai_link()" to the asoc tree
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

   ASoC: topology: Check return value for snd_soc_add_dai_link()

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

From 76d2703649321c296df7ec0dafd50add96215de4 Mon Sep 17 00:00:00 2001
From: Dragos Tarcatu <dragos_tarcatu@mentor.com>
Date: Mon, 9 Dec 2019 18:39:38 -0600
Subject: [PATCH] ASoC: topology: Check return value for snd_soc_add_dai_link()

snd_soc_add_dai_link() might fail. This situation occurs for
instance in a very specific use case where a PCM device and a
Back End DAI link are given identical names in the topology.
When this happens, soc_new_pcm_runtime() fails and then
snd_soc_add_dai_link() returns -ENOMEM when called from
soc_tplg_fe_link_create(). Because of that, the link will not
get added into the card list, so any attempt to remove it later
ends up in a panic.

Fix that by checking the return status and free the memory in case
of an error.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Dragos Tarcatu <dragos_tarcatu@mentor.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191210003939.15752-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-topology.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 81d2af000a5c..65c2796b6e02 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1933,11 +1933,13 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	ret = soc_tplg_dai_link_load(tplg, link, NULL);
 	if (ret < 0) {
 		dev_err(tplg->comp->dev, "ASoC: FE link loading failed\n");
-		kfree(link->name);
-		kfree(link->stream_name);
-		kfree(link->cpus->dai_name);
-		kfree(link);
-		return ret;
+		goto err;
+	}
+
+	ret = snd_soc_add_dai_link(tplg->comp->card, link);
+	if (ret < 0) {
+		dev_err(tplg->comp->dev, "ASoC: adding FE link failed\n");
+		goto err;
 	}
 
 	link->dobj.index = tplg->index;
@@ -1945,8 +1947,13 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	link->dobj.type = SND_SOC_DOBJ_DAI_LINK;
 	list_add(&link->dobj.list, &tplg->comp->dobj_list);
 
-	snd_soc_add_dai_link(tplg->comp->card, link);
 	return 0;
+err:
+	kfree(link->name);
+	kfree(link->stream_name);
+	kfree(link->cpus->dai_name);
+	kfree(link);
+	return ret;
 }
 
 /* create a FE DAI and DAI link from the PCM object */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
