Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B25D42C82
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 18:40:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA8D9178A;
	Wed, 12 Jun 2019 18:40:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA8D9178A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560357656;
	bh=VzeQqn4FdIR3uzPC4q8XuySLEeE0Jh1WYEG7GN5om1I=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GrQTwdGhuVfU++19Rli/c8xgeympL29a7KUHlMZtzqft8oQrPrgUjUEQRVDvTaNVp
	 wAsKN69r18pG611/VBuC1RCvF8UoJ0NBIveafDaRVsjuzd7AZfS//q0vn7Jex5BCLT
	 hJNCB8ZiaMoH5yvk9eAdhc7CuHj/Gt5pI1zyS0EU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F5E4F896EA;
	Wed, 12 Jun 2019 18:39:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35D6EF896E0; Wed, 12 Jun 2019 18:39:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53979F80791
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 18:39:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53979F80791
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 09:39:04 -0700
X-ExtLoop1: 1
Received: from adorrell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.122])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2019 09:39:02 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 11:38:45 -0500
Message-Id: <20190612163845.10671-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: soc-topology: fix modern dai link style
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

The topology code can create a FE DAI link but did not allocate the
memory for a platform component - whose name can be overridden at a
later time.

Fixes: 23b946ce2808b ("ASoC: soc-topology: use modern dai_link style")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/soc-topology.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index f485f7f751a1..b538412e4bcf 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1882,8 +1882,8 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	struct snd_soc_dai_link_component *dlc;
 	int ret;
 
-	/* link + cpu + codec */
-	link = kzalloc(sizeof(*link) + (2 * sizeof(*dlc)), GFP_KERNEL);
+	/* link + cpu + codec + platform */
+	link = kzalloc(sizeof(*link) + (3 * sizeof(*dlc)), GFP_KERNEL);
 	if (link == NULL)
 		return -ENOMEM;
 
@@ -1891,9 +1891,11 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 
 	link->cpus	= &dlc[0];
 	link->codecs	= &dlc[1];
+	link->platforms	= &dlc[2];
 
 	link->num_cpus	 = 1;
 	link->num_codecs = 1;
+	link->num_platforms = 1;
 
 	if (strlen(pcm->pcm_name)) {
 		link->name = kstrdup(pcm->pcm_name, GFP_KERNEL);
@@ -1907,6 +1909,8 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	link->codecs->name = "snd-soc-dummy";
 	link->codecs->dai_name = "snd-soc-dummy-dai";
 
+	link->platforms->name = "snd-soc-dummy";
+
 	/* enable DPCM */
 	link->dynamic = 1;
 	link->dpcm_playback = le32_to_cpu(pcm->playback);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
