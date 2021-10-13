Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 984AF42C378
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 16:36:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D5DA1696;
	Wed, 13 Oct 2021 16:35:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D5DA1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634135786;
	bh=Ehrk0bBYm4Iz5S9LBwiZe4a4bl2imtt9Hj1dWRTuzfU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=msU6FAJcOBrcMQXrcsIxMqaOUOKEJxs84vBxRhY0uPbRzRIA/1XrDnP8VzWNSsucV
	 O2CXd1qME5ErM007JacrNNa+blF33MeJsiL1RrPew3gri2d479gzDRuwlIZsZxMxZK
	 MFGrDD1I48BEy4lP9S50ac2NUb0z+ZyrnUdb+3WU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49229F80542;
	Wed, 13 Oct 2021 16:31:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DE91F804F2; Wed, 13 Oct 2021 16:31:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFB71F804F2
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 16:31:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFB71F804F2
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="313639572"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="313639572"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 07:31:23 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="524649580"
Received: from ssafavib-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.164.198])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 07:31:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH v3 09/13] ASoC: sh: rcar: protect for_each_dpcm_be() loops
Date: Wed, 13 Oct 2021 09:30:46 -0500
Message-Id: <20211013143050.244444-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013143050.244444-1-pierre-louis.bossart@linux.intel.com>
References: <20211013143050.244444-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, vkoul@kernel.org, broonie@kernel.org,
 Mikhail Durnev <mikhail_durnev@mentor.com>, Joe Perches <joe@perches.com>,
 Gyeongtaek Lee <gt82.lee@samsung.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

Follow the locking model used within soc-pcm.c

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sh/rcar/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 978bd0406729..ccd5c2d1cdc6 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1511,6 +1511,7 @@ static int rsnd_hw_params(struct snd_soc_component *component,
 		struct snd_soc_dpcm *dpcm;
 		int stream = substream->stream;
 
+		snd_soc_dpcm_fe_lock_irq(fe, stream);
 		for_each_dpcm_be(fe, stream, dpcm) {
 			struct snd_pcm_hw_params *be_params = &dpcm->hw_params;
 
@@ -1519,6 +1520,7 @@ static int rsnd_hw_params(struct snd_soc_component *component,
 			if (params_rate(hw_params) != params_rate(be_params))
 				io->converted_rate = params_rate(be_params);
 		}
+		snd_soc_dpcm_fe_unlock_irq(fe, stream);
 		if (io->converted_chan)
 			dev_dbg(dev, "convert channels = %d\n", io->converted_chan);
 		if (io->converted_rate) {
-- 
2.25.1

