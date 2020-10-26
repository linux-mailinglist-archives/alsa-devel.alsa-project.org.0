Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E802989F4
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 11:03:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21D1F16ED;
	Mon, 26 Oct 2020 11:02:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21D1F16ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603706614;
	bh=Bcst6BgFzTENRyPOm2Ti6SKDIWbTcbSWvJd1imHUmsA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TIPNpzLAwUqah74o2ILGbODVPWn/smCIX5g4RbYGwP4+3XDlV8LPcuWjFuz3lmJbl
	 mBi+dqG16eJzOPKNnT66Mwef2UMGwaeBbctrejPkqgGe5AHQZx95DjEwiceFGBc9EK
	 6e8wRs3TVdj+yWlAIxkx+xzni+932Pk2nriUnRyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 697E5F80212;
	Mon, 26 Oct 2020 11:02:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15BBFF80212; Mon, 26 Oct 2020 11:01:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B638F800CC
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 11:01:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B638F800CC
IronPort-SDR: Azf+B9j6h+schnUWoZnl9VKAsD84XL6JealgzbGsPkA+CDUM1y5LxWaQwvnJoLZD7lsPCFcWeZ
 TvbA/C0NMKpA==
X-IronPort-AV: E=McAfee;i="6000,8403,9785"; a="147187456"
X-IronPort-AV: E=Sophos;i="5.77,417,1596524400"; d="scan'208";a="147187456"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 03:01:50 -0700
IronPort-SDR: gfrty6Xu6zgJeCYhoUd6MSFy5+JRhrTRCq5cxuVp8JEYSceM3hLhM6LjUFpAHWRT2ww/Enq69Z
 re2oK8UqciTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,417,1596524400"; d="scan'208";a="360324959"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Oct 2020 03:01:48 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: pcm: DRAIN support reactivation
Date: Mon, 26 Oct 2020 11:01:29 +0100
Message-Id: <20201026100129.8216-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, ranjani.sridharan@intel.com,
 lgirdwood@gmail.com, tiwai@suse.com, broonie@kernel.org
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

soc-pcm's dpcm_fe_dai_do_trigger() supported DRAIN commnad up to kernel
v5.4 where explicit switch(cmd) has been introduced which takes into
account all SNDRV_PCM_TRIGGER_xxx but SNDRV_PCM_TRIGGER_DRAIN. Update
switch statement to reactive support for it.

As DRAIN is somewhat unique by lacking negative/stop counterpart, bring
behaviour of dpcm_fe_dai_do_trigger() for said command back to its
pre-v5.4 state by adding it to START/RESUME/PAUSE_RELEASE group.

Fixes: acbf27746ecf ("ASoC: pcm: update FE/BE trigger order based on the command")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/soc-pcm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index dcab9527ba3d..91bf33958159 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2231,6 +2231,7 @@ static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream, int cmd)
 		case SNDRV_PCM_TRIGGER_START:
 		case SNDRV_PCM_TRIGGER_RESUME:
 		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		case SNDRV_PCM_TRIGGER_DRAIN:
 			ret = dpcm_dai_trigger_fe_be(substream, cmd, true);
 			break;
 		case SNDRV_PCM_TRIGGER_STOP:
@@ -2248,6 +2249,7 @@ static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream, int cmd)
 		case SNDRV_PCM_TRIGGER_START:
 		case SNDRV_PCM_TRIGGER_RESUME:
 		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		case SNDRV_PCM_TRIGGER_DRAIN:
 			ret = dpcm_dai_trigger_fe_be(substream, cmd, false);
 			break;
 		case SNDRV_PCM_TRIGGER_STOP:
-- 
2.17.1

