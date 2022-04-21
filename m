Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E50E50A9DB
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 22:20:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B197716B4;
	Thu, 21 Apr 2022 22:19:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B197716B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650572407;
	bh=gqcvmCsn2kKKUMpSi4Pwb7jVxHVe0dCx6KN6U3ZGOrc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ttcDhscVr24rjLnKCaAVq0FBAmHVIXyzPoehSKfudk06BDSC4uqV+JWbVc73cTWGA
	 zABgNL6jlN/SAgxrUEYc/0szhsiQdBb0CnN/3slOh9Ctw6WIxffheQ391xmd+0KOF+
	 RJ+Js27aHNSpIwJlu4/7BRI/b2JjsbaSuSwkSQEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CE18F8047D;
	Thu, 21 Apr 2022 22:19:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76D4EF800C1; Thu, 21 Apr 2022 22:19:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABC44F800C1
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 22:19:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABC44F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GnXFzcbS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650572341; x=1682108341;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gqcvmCsn2kKKUMpSi4Pwb7jVxHVe0dCx6KN6U3ZGOrc=;
 b=GnXFzcbSUs5nUwjIiKh4MJXo9r32XOWBx3Pk51ic2l7UotDVe/iPWLKS
 HinJ1JbmUly/r3K4eHV1j+vcjWY9Hd0m5EcoORkDrjM4F4WTNYhkb1J5c
 zgIU3vUeQFJ5/QEAvIcbxSITrb7aVt9cT8xCPlp0cTuIgdvEkkiVkF4Bq
 aoJWv7CbZJhePdgK7+2M+ImOMrF9oiIM1IGtzoiHZq4RQNAsIdI1V0IId
 RSO47UdPr11STekLDZ1/5NkRrch/FlsgxgcN7QTGmw+29r7ZaCbV8Jy7a
 CCH5tzvvCZP3Mw1Jf4a2ca1Kbib2nD/aTLxtRXeY6XSDqEdbf66OyLqtn Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="245043578"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="245043578"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:18:56 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="555976732"
Received: from qingsu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.250])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:18:55 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: topology: Check w->sname validity once in
 sof_connect_dai_widget()
Date: Thu, 21 Apr 2022 15:18:47 -0500
Message-Id: <20220421201847.1545686-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 broonie@kernel.org, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

The 'w' (struct snd_soc_dapm_widget) is not changing within the function,
there is no reason to check the w->sname more than once as it is not
going to change.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/topology.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 38e560ccaa570..5e959f8c4cb9d 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1012,15 +1012,18 @@ static int sof_connect_dai_widget(struct snd_soc_component *scomp,
 	struct snd_soc_dai *cpu_dai;
 	int i;
 
+	if (!w->sname) {
+		dev_err(scomp->dev, "Widget %s does not have stream\n", w->name);
+		return -EINVAL;
+	}
+
 	list_for_each_entry(rtd, &card->rtd_list, list) {
 		dev_vdbg(scomp->dev, "tplg: check widget: %s stream: %s dai stream: %s\n",
 			 w->name,  w->sname, rtd->dai_link->stream_name);
 
-		if (!w->sname || !rtd->dai_link->stream_name)
-			continue;
-
 		/* does stream match DAI link ? */
-		if (strcmp(w->sname, rtd->dai_link->stream_name))
+		if (!rtd->dai_link->stream_name ||
+		    strcmp(w->sname, rtd->dai_link->stream_name))
 			continue;
 
 		switch (w->id) {
-- 
2.30.2

