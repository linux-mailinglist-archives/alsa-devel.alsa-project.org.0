Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 799E250AA1C
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 22:37:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1567316F8;
	Thu, 21 Apr 2022 22:36:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1567316F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650573426;
	bh=MsbOrM7VuASy4hGQDZScuOD3aLjHCY5ZgtKB8JWpYQc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vUtw7ZgPSxLoaaTyjSFhgBhLQqT806e6H4o15QJ9b84H5CEjm1laMZnl6flC+JRQJ
	 J85f+v6x+6rhZjMM+8AenXWx3oJd2ooXloQoGJHuz0qQTWle7zvX2Li2jd58TYvpuW
	 +pTYz70fnlS0+a45plAcWWA3VVgt2UIkGdjrvSI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21020F80571;
	Thu, 21 Apr 2022 22:33:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFD41F8054A; Thu, 21 Apr 2022 22:33:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F287F80527
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 22:32:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F287F80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="G5/OgfUE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650573168; x=1682109168;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MsbOrM7VuASy4hGQDZScuOD3aLjHCY5ZgtKB8JWpYQc=;
 b=G5/OgfUEhIrh7ljQbyve8Nj7IF9f5vJSCNicZzQfLEnXwfHze3N9uq7X
 +Il4TecOAWeSKz4ZLTy5LI+VOrMMxf4CU+QmApzjSVpltZGeZHGSenT1M
 sIN1sDIVhXTNcbgp0kcUdqhU/joSFB4fH/etUaKlhd/50DO9yApGwijOx
 46x7rnUjCJwoaRWHPESa0C/0MJPyDsCMCrnWghzojYHmD+vWVLIMjIYWn
 fBEYn2RITi/a8yGrWPtNEANKKzE6oSTqjVdMqc75tRQhCD5eB2da+CG1b
 /Vv+ybLCOq60S5md7Bk4vooM3mojAQAvV5lnSN0aytuwrWQSv33ApX64P g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="245047639"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="245047639"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:32:18 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="577455806"
Received: from qingsu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.250])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:32:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/14] ASoC: SOF: Intel: hda-dai: improve suspend case
Date: Thu, 21 Apr 2022 15:31:58 -0500
Message-Id: <20220421203201.1550328-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421203201.1550328-1-pierre-louis.bossart@linux.intel.com>
References: <20220421203201.1550328-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Rander Wang <rander.wang@intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

Add comments and re-align with the TRIGGER_SUSPEND case with an
additional call to hda_dai_hw_free_ipc() to free-up resources.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index c1ff7145745bc..dbccd75defe84 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -456,6 +456,7 @@ static int hda_dai_suspend(struct hdac_bus *bus)
 	struct hdac_stream *s;
 	const char *name;
 	int stream_tag;
+	int ret;
 
 	/* set internal flag for BE */
 	list_for_each_entry(s, &bus->stream_list, list) {
@@ -468,20 +469,32 @@ static int hda_dai_suspend(struct hdac_bus *bus)
 		 * explicitly during suspend.
 		 */
 		if (hext_stream->link_substream) {
+			struct snd_soc_dai *cpu_dai;
+			struct snd_soc_dai *codec_dai;
+
 			rtd = asoc_substream_to_rtd(hext_stream->link_substream);
-			name = asoc_rtd_to_codec(rtd, 0)->component->name;
+			cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+			codec_dai = asoc_rtd_to_codec(rtd, 0);
+			name = codec_dai->component->name;
 			link = snd_hdac_ext_bus_get_link(bus, name);
 			if (!link)
 				return -EINVAL;
 
+			/*
+			 * we don't need to call snd_hdac_ext_link_stream_clear(he_stream)
+			 * since we can only reach this case in the pause_push state, and
+			 * the TRIGGER_PAUSE_PUSH already stops the DMA
+			 */
+			if (hdac_stream(hext_stream)->direction == SNDRV_PCM_STREAM_PLAYBACK) {
+				stream_tag = hdac_stream(hext_stream)->stream_tag;
+				snd_hdac_ext_link_clear_stream_id(link, stream_tag);
+			}
 			hext_stream->link_prepared = 0;
 
-			if (hdac_stream(hext_stream)->direction ==
-				SNDRV_PCM_STREAM_CAPTURE)
-				continue;
-
-			stream_tag = hdac_stream(hext_stream)->stream_tag;
-			snd_hdac_ext_link_clear_stream_id(link, stream_tag);
+			/* for consistency with TRIGGER_SUSPEND we free DAI resources */
+			ret = hda_dai_hw_free_ipc(hdac_stream(hext_stream)->direction, cpu_dai);
+			if (ret < 0)
+				return ret;
 		}
 	}
 
-- 
2.30.2

