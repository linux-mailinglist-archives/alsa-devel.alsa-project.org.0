Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B9CD45AE
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2019 18:46:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C0A2166F;
	Fri, 11 Oct 2019 18:45:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C0A2166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570812409;
	bh=eOjeZbVNGviKcQzXHVTt1X9UAXPcFNf9q4V01aYhBX0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uak5R6HtDmj7kVqafws0B5OLrzeGCH6jqYEiFgZr05Tm6/Z1V5DF4MVDJyt3/7hl0
	 yrE1gAfOXCGraoVXHy8I3MFeu5rYIYySbC+sd3GnB1KrhVALcqZEZ0MkFHoLZH5KSz
	 B6h+jlmijjHJ2EKhbf5eFBk70gOKy13/VSVWc6eI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1745BF805FD;
	Fri, 11 Oct 2019 18:43:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C6A1F805FA; Fri, 11 Oct 2019 18:43:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A72EBF8026F
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 18:43:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A72EBF8026F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Oct 2019 09:43:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,284,1566889200"; d="scan'208";a="224387821"
Received: from askelkar-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.181.148])
 by fmsmga002.fm.intel.com with ESMTP; 11 Oct 2019 09:43:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 11 Oct 2019 11:43:11 -0500
Message-Id: <20191011164312.7988-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011164312.7988-1-pierre-louis.bossart@linux.intel.com>
References: <20191011164312.7988-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 3/4] ASoC: SOF: topology: remove always-true
	redundant test
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
---
 sound/soc/sof/topology.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index ab70f37082e8..05eec3c464a9 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2319,10 +2319,9 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
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
