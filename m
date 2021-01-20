Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B682FD3FA
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 16:31:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E2FB17D1;
	Wed, 20 Jan 2021 16:30:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E2FB17D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611156662;
	bh=q5x4YK0Vymypua1G2yF/pTd3PN3/3289KItEyyTzcWA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J8aZXcnA5+qwPR1PY9fHjn9bCWllcjveQcq3MzLtqwzUoLvV/fJn3Y524NcR1w9Pz
	 ky1d9Z8yiVgdTu7MOrF6U/spDY5xFAvVM21TUfQFjGzEQfogIE4fqBefbA8F/pdjmf
	 q5EqcwzOE53QZiRipe25Cbako4tbB2zHHdahPRcM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77436F8019B;
	Wed, 20 Jan 2021 16:29:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D0EAF80253; Wed, 20 Jan 2021 16:29:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20C8BF80166
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 16:29:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20C8BF80166
IronPort-SDR: QMHlqzRPKg23VT9GIQ4wRxUiXrpa05XiAdBsa/lzDECwGWKGitBYbXBEL3KRa9Y0HgJPPBYtp5
 LXoUnMTDU0qQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="197850622"
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="197850622"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 07:28:56 -0800
IronPort-SDR: 2ogJmanXxKLLQk8TatZ1i54FJRGscLcST43fiNfvqJXuXpwnRwI20YoHD+WGvdViY/gDqIXr/1
 cx1ozv+OQX0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="354347835"
Received: from pi-desktop.igk.intel.com ([10.237.148.102])
 by orsmga006.jf.intel.com with ESMTP; 20 Jan 2021 07:28:54 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/5] ASoC: topology: Properly unregister DAI on removal
Date: Wed, 20 Jan 2021 16:28:42 +0100
Message-Id: <20210120152846.1703655-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120152846.1703655-1-amadeuszx.slawinski@linux.intel.com>
References: <20210120152846.1703655-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

DAIs need to be removed when topology unload function is called (usually
done when component is being removed). We can't do this when device is
being removed, as structures we operate on when removing DAI can already
be freed.

Fixes: 6ae4902f2f34 ("ASoC: soc-topology: use devm_snd_soc_register_dai()")
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/soc-topology.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 5476854c12b0..94a162b884c9 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -447,7 +447,7 @@ static void remove_dai(struct snd_soc_component *comp,
 {
 	struct snd_soc_dai_driver *dai_drv =
 		container_of(dobj, struct snd_soc_dai_driver, dobj);
-	struct snd_soc_dai *dai;
+	struct snd_soc_dai *dai, *_dai;
 
 	if (pass != SOC_TPLG_PASS_PCM_DAI)
 		return;
@@ -455,9 +455,9 @@ static void remove_dai(struct snd_soc_component *comp,
 	if (dobj->ops && dobj->ops->dai_unload)
 		dobj->ops->dai_unload(comp, dobj);
 
-	for_each_component_dais(comp, dai)
+	for_each_component_dais_safe(comp, dai, _dai)
 		if (dai->driver == dai_drv)
-			dai->driver = NULL;
+			snd_soc_unregister_dai(dai);
 
 	list_del(&dobj->list);
 }
@@ -1742,7 +1742,7 @@ static int soc_tplg_dai_create(struct soc_tplg *tplg,
 	list_add(&dai_drv->dobj.list, &tplg->comp->dobj_list);
 
 	/* register the DAI to the component */
-	dai = devm_snd_soc_register_dai(tplg->dev, tplg->comp, dai_drv, false);
+	dai = snd_soc_register_dai(tplg->comp, dai_drv, false);
 	if (!dai)
 		return -ENOMEM;
 
@@ -1750,6 +1750,7 @@ static int soc_tplg_dai_create(struct soc_tplg *tplg,
 	ret = snd_soc_dapm_new_dai_widgets(dapm, dai);
 	if (ret != 0) {
 		dev_err(dai->dev, "Failed to create DAI widgets %d\n", ret);
+		snd_soc_unregister_dai(dai);
 		return ret;
 	}
 
-- 
2.25.1

