Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F62A3201DE
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Feb 2021 00:35:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2731916A6;
	Sat, 20 Feb 2021 00:34:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2731916A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613777733;
	bh=5RDwQGUI/eMrMrFckM8jT6M6eMY9ox9qBW6KDM4MOd0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CP49rZKxsSSWBeET0vVR8Exi5lSLjQPCQhj6RQIakJMiZOXHGNEgPJ1euw0ts92Yt
	 UutlRUaOD8OqlRvUExnQtFp49T+nFWpNcUO5uEDFqSLhR3eFZDYfiBv3ayzvfKvjmO
	 Oq6916tCaRoFXVOphq6FeniI7d87UYUY5jO+lxYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 412E9F804E0;
	Sat, 20 Feb 2021 00:30:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F3B1F8032B; Sat, 20 Feb 2021 00:30:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36EE3F802DB
 for <alsa-devel@alsa-project.org>; Sat, 20 Feb 2021 00:30:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36EE3F802DB
IronPort-SDR: x+D4w+82FqhvvcNJTRfXSBYw0HfTQUtggJMm5nw1ocAJAjI3jSphDCjEJWyg+2ZMRHsozT86kh
 y4Z9RCppRiKA==
X-IronPort-AV: E=McAfee;i="6000,8403,9900"; a="203293785"
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="203293785"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:30:43 -0800
IronPort-SDR: dT45sHu2X3+mJ0Y8yJGnJ4gyUitGJ7bd42wGlG7xUAQ8b7qp6h+D1kkACJk3ZwjIO/QBlT1W9r
 83Gsf+AkKRMw==
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="496662912"
Received: from lkwerake-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.153.34])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:30:42 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 9/9] ASoC: fsl: p1022_ds: remove useless assignment
Date: Fri, 19 Feb 2021 17:29:37 -0600
Message-Id: <20210219232937.6440-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210219232937.6440-1-pierre-louis.bossart@linux.intel.com>
References: <20210219232937.6440-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org
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

cppcheck warning:

sound/soc/fsl/p1022_ds.c:344:6: style: Redundant initialization for
'ret'. The initialized value is overwritten before it is
read. [redundantInitialization]
 ret = fsl_asoc_get_dma_channel(np, "fsl,playback-dma", &mdata->dai[0],
     ^
sound/soc/fsl/p1022_ds.c:203:10: note: ret is initialized
 int ret = -ENODEV;
         ^
sound/soc/fsl/p1022_ds.c:344:6: note: ret is overwritten
 ret = fsl_asoc_get_dma_channel(np, "fsl,playback-dma", &mdata->dai[0],
     ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/fsl/p1022_ds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/p1022_ds.c b/sound/soc/fsl/p1022_ds.c
index ac68d2238045..317c767b0099 100644
--- a/sound/soc/fsl/p1022_ds.c
+++ b/sound/soc/fsl/p1022_ds.c
@@ -200,7 +200,7 @@ static int p1022_ds_probe(struct platform_device *pdev)
 	struct device_node *codec_np = NULL;
 	struct machine_data *mdata;
 	struct snd_soc_dai_link_component *comp;
-	int ret = -ENODEV;
+	int ret;
 	const char *sprop;
 	const u32 *iprop;
 
-- 
2.25.1

