Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 223C9117C9D
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 01:45:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFA3B1672;
	Tue, 10 Dec 2019 01:44:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFA3B1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575938736;
	bh=xBcDpJLvTr+CLsa1Yu+fOAxx9byEoiF0T6OeujTkFR0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GYAWXw2HTS4I2Q2t+rq/GrZiif4T8cS58Uy6OkwKVrKIIJxARVgpJge7GZ/vze1PJ
	 tT1uF2UzYcVai5HXYj/7cygKmrPBcVgsDrLq4D8R7K245Tm7OTEur4amXVhS/MKvdo
	 wcKvZgKhzXxJlgtkJgg4WkjZKUMpSKu7xp0xJkAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D2C4F801F4;
	Tue, 10 Dec 2019 01:39:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D46BDF80245; Tue, 10 Dec 2019 01:39:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6714CF8011E
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 01:39:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6714CF8011E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 16:39:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,297,1571727600"; d="scan'208";a="210284346"
Received: from sneuhier-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.188.78])
 by fmsmga008.fm.intel.com with ESMTP; 09 Dec 2019 16:39:42 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 18:39:38 -0600
Message-Id: <20191210003939.15752-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210003939.15752-1-pierre-louis.bossart@linux.intel.com>
References: <20191210003939.15752-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Dragos Tarcatu <dragos_tarcatu@mentor.com>,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 1/2] ASoC: topology: Check return value for
	snd_soc_add_dai_link()
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

From: Dragos Tarcatu <dragos_tarcatu@mentor.com>

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
---
 sound/soc/soc-topology.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 248530d028a6..93ba6778ef27 100644
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
