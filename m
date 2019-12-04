Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D693E1136E5
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Dec 2019 22:07:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3046167B;
	Wed,  4 Dec 2019 22:07:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3046167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575493673;
	bh=AxFZ8RFXeya9dZiasscywBjk6fkf+eQlAG5m7+tW7C0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bcMavXJuS3gr+M/cYwTNjVGm/NSE3JT43dM7ayBoHxLuotPG4lEsACcQVShbbhgyX
	 /hApbNDUxlCJunGIjxkYJsvOnvWqQARdc1CNYB+B0qzrug6ytYfmhZYM780hQ1ZHPG
	 gjQfAUWDHkPAzyi4dDyw+eSVR70B2RWsTnQj1Hgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 588C0F80233;
	Wed,  4 Dec 2019 22:05:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 878D2F80216; Wed,  4 Dec 2019 22:05:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F331CF801D9
 for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2019 22:05:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F331CF801D9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Dec 2019 13:05:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,278,1571727600"; d="scan'208";a="208958085"
Received: from rgolani-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.153.236])
 by fmsmga007.fm.intel.com with ESMTP; 04 Dec 2019 13:05:04 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  4 Dec 2019 15:04:47 -0600
Message-Id: <20191204210447.11701-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191204210447.11701-1-pierre-louis.bossart@linux.intel.com>
References: <20191204210447.11701-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
Subject: [alsa-devel] [PATCH 3/3] ASoC: topology: Prevent use-after-free in
	snd_soc_get_pcm_runtime()
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

remove_link() is currently calling snd_soc_remove_dai_link() after
it has already freed the memory for the link name. But this is later
read from snd_soc_get_pcm_runtime() causing a KASAN use-after-free
warning. Reorder the cleanups to fix this issue.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Dragos Tarcatu <dragos_tarcatu@mentor.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/soc-topology.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 81d2af000a5c..248530d028a6 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -548,12 +548,12 @@ static void remove_link(struct snd_soc_component *comp,
 	if (dobj->ops && dobj->ops->link_unload)
 		dobj->ops->link_unload(comp, dobj);
 
+	list_del(&dobj->list);
+	snd_soc_remove_dai_link(comp->card, link);
+
 	kfree(link->name);
 	kfree(link->stream_name);
 	kfree(link->cpus->dai_name);
-
-	list_del(&dobj->list);
-	snd_soc_remove_dai_link(comp->card, link);
 	kfree(link);
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
