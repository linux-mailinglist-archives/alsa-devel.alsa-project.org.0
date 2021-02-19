Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2393201AE
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Feb 2021 00:20:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B53DE168C;
	Sat, 20 Feb 2021 00:19:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B53DE168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613776811;
	bh=ZxZziS8QtHC2lv3ncWuYz3t/8s5Bd88ti8xl9wnBLbQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=blgduWqTFTlAt4ibbUBhGGdvT6H3fIR0dgAI3ppVFTgIsj9pT4cpX8OsKijYnRArw
	 xED03yxSMmyqBzQU+LQ1Jj8VBFOoTvll/BBBjNqayKNp4DgQjv225cytg334IWckaE
	 aYS5mSQhHT64iCMqZTzR36yXauv9VaEmuGe2g28s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46486F802E3;
	Sat, 20 Feb 2021 00:17:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41B0FF802DB; Sat, 20 Feb 2021 00:17:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9996EF8028B
 for <alsa-devel@alsa-project.org>; Sat, 20 Feb 2021 00:16:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9996EF8028B
IronPort-SDR: SqqYqXoB3r/d1JmHU5QgWqlPX0m8ft023oKze0Axyit2RIMatgay9dmIQF1ttOdLp5BUOgxwIA
 PHXUHwfLchXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9900"; a="181436680"
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="181436680"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:16:49 -0800
IronPort-SDR: ked4nAhb2iZbFcp31ISCC7y/TrdxZpZ0sSUqXKm7m/aSp4jUFV9I6P2WfMzhx0AMbpUgMb3agq
 b3IaH9aGFgqQ==
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="420329800"
Received: from lkwerake-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.153.34])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:16:48 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 7/8] ASoC: sh: siu_pcm: remove useless assignment
Date: Fri, 19 Feb 2021 17:16:34 -0600
Message-Id: <20210219231635.5749-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210219231635.5749-1-pierre-louis.bossart@linux.intel.com>
References: <20210219231635.5749-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

sound/soc/sh/siu_pcm.c:375:5: style: Redundant initialization for
'rt'. The initialized value is overwritten before it is
read. [redundantInitialization]

 rt = siu_stream->substream->runtime;
    ^
sound/soc/sh/siu_pcm.c:366:30: note: rt is initialized
 struct snd_pcm_runtime  *rt = ss->runtime;
                             ^
sound/soc/sh/siu_pcm.c:375:5: note: rt is overwritten
 rt = siu_stream->substream->runtime;
    ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sh/siu_pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sh/siu_pcm.c b/sound/soc/sh/siu_pcm.c
index 4785886df4f0..6496300f73a9 100644
--- a/sound/soc/sh/siu_pcm.c
+++ b/sound/soc/sh/siu_pcm.c
@@ -363,7 +363,7 @@ static int siu_pcm_prepare(struct snd_soc_component *component,
 	struct siu_info *info = siu_i2s_data;
 	struct siu_port *port_info = siu_port_info(ss);
 	struct device *dev = ss->pcm->card->dev;
-	struct snd_pcm_runtime 	*rt = ss->runtime;
+	struct snd_pcm_runtime *rt;
 	struct siu_stream *siu_stream;
 	snd_pcm_sframes_t xfer_cnt;
 
-- 
2.25.1

