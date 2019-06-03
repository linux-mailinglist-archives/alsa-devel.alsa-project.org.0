Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48377334DB
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 18:24:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C12509F6;
	Mon,  3 Jun 2019 18:23:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C12509F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559579052;
	bh=T0YcJ3hTkBiWA+wYciAMQ8nIK6+OO7Ph33yYHVLhcrI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GdtaT/9VfEL47qS+G1rAm1JItw+SvcA9bP0C16epZqZxYBgDOoe/9GdW5+/0ClweS
	 0UO0IKsZnKKCbYXm4S1s54U2eyq8yHAMNZDo8wCqpTttLBoYd8nvoK0zQz383aGwtm
	 gxj1u/b1EwJygQHV2VNgnvkIdExr0hBsjMz3Tp8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15AA5F89744;
	Mon,  3 Jun 2019 18:18:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56E9FF896DE; Mon,  3 Jun 2019 18:18:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61DEDF80CC4
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 18:18:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61DEDF80CC4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 09:18:33 -0700
X-ExtLoop1: 1
Received: from chiannaa-mobl6.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.97.98])
 by orsmga008.jf.intel.com with ESMTP; 03 Jun 2019 09:18:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  3 Jun 2019 11:18:21 -0500
Message-Id: <20190603161821.7486-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190603161821.7486-1-pierre-louis.bossart@linux.intel.com>
References: <20190603161821.7486-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Jaska Uimonen <jaska.uimonen@intel.com>, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 9/9] ASoC: SOF: topology: add support for
	mux/demux component
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

From: Jaska Uimonen <jaska.uimonen@intel.com>

Add enumerations to support mux/demux processing component.

Signed-off-by: Jaska Uimonen <jaska.uimonen@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/topology.h | 3 +++
 sound/soc/sof/topology.c     | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/include/sound/sof/topology.h b/include/sound/sof/topology.h
index 4afed7f1c6b2..41dcabf89899 100644
--- a/include/sound/sof/topology.h
+++ b/include/sound/sof/topology.h
@@ -35,6 +35,7 @@ enum sof_comp_type {
 	SOF_COMP_KEYWORD_DETECT,
 	SOF_COMP_KPB,			/* A key phrase buffer component */
 	SOF_COMP_SELECTOR,		/**< channel selector component */
+	SOF_COMP_DEMUX,
 	/* keep FILEREAD/FILEWRITE as the last ones */
 	SOF_COMP_FILEREAD = 10000,	/**< host test based file IO */
 	SOF_COMP_FILEWRITE = 10001,	/**< host test based file IO */
@@ -175,6 +176,8 @@ enum sof_ipc_process_type {
 	SOF_PROCESS_KEYWORD_DETECT,	/**< Keyword Detection */
 	SOF_PROCESS_KPB,		/**< KeyPhrase Buffer Manager */
 	SOF_PROCESS_CHAN_SELECTOR,	/**< Channel Selector */
+	SOF_PROCESS_MUX,
+	SOF_PROCESS_DEMUX,
 };
 
 /* generic "effect", "codec" or proprietary processing component */
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 745cb875863c..b969686f954f 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -394,6 +394,8 @@ static const struct sof_process_types sof_process[] = {
 	{"KEYWORD_DETECT", SOF_PROCESS_KEYWORD_DETECT, SOF_COMP_KEYWORD_DETECT},
 	{"KPB", SOF_PROCESS_KPB, SOF_COMP_KPB},
 	{"CHAN_SELECTOR", SOF_PROCESS_CHAN_SELECTOR, SOF_COMP_SELECTOR},
+	{"MUX", SOF_PROCESS_MUX, SOF_COMP_MUX},
+	{"DEMUX", SOF_PROCESS_DEMUX, SOF_COMP_DEMUX},
 };
 
 static enum sof_ipc_process_type find_process(const char *name)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
