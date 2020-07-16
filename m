Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB3B221BCB
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 07:12:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A2661672;
	Thu, 16 Jul 2020 07:11:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A2661672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594876368;
	bh=miTwL5vlMq/k8gjQkLs2QIyu8cBEcLy1dvOm+z3scUg=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sfmbVt3ImEsQ+AL4rw7WfZgdDTyfzh8Y6Rny5HnGwYHQRAefbO71AwiGzY4bkVCFx
	 GLc5FhhZLB1zbIOKgz7IMYzJQALBjUBjOi2xTJ7VrzJrGBS5R779A3+bi15sSUBPto
	 PattpLGwcvMzxW2GjJdxum3N6YIPczmbtyssRaIA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 626B1F8016F;
	Thu, 16 Jul 2020 07:11:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09C71F801EC; Thu, 16 Jul 2020 07:11:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6096F8014E
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 07:10:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6096F8014E
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4886A1A0522;
 Thu, 16 Jul 2020 07:10:58 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id DE3FA1A04F1;
 Thu, 16 Jul 2020 07:10:53 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 3E86E402BF;
 Thu, 16 Jul 2020 13:10:48 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 kuninori.morimoto.gx@renesas.com, ranjani.sridharan@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: soc-component: Add missed return for calling
 soc_component_ret
Date: Thu, 16 Jul 2020 13:07:08 +0800
Message-Id: <1594876028-1845-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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

Add missed return for calling soc_component_ret, otherwise the return
value is wrong.

Fixes: e2329eeba45f ("ASoC: soc-component: add soc_component_err()")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2
- add missed return in snd_soc_pcm_component_sync_stop and
- snd_soc_pcm_component_new

 sound/soc/soc-component.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index af9909c5492f..9565a0dd7cb6 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -647,7 +647,7 @@ int snd_soc_pcm_component_sync_stop(struct snd_pcm_substream *substream)
 			ret = component->driver->sync_stop(component,
 							   substream);
 			if (ret < 0)
-				soc_component_ret(component, ret);
+				return soc_component_ret(component, ret);
 		}
 	}
 
@@ -705,7 +705,7 @@ int snd_soc_pcm_component_mmap(struct snd_pcm_substream *substream,
 	/* FIXME. it returns 1st mmap now */
 	for_each_rtd_components(rtd, i, component)
 		if (component->driver->mmap)
-			soc_component_ret(
+			return soc_component_ret(
 				component,
 				component->driver->mmap(component,
 							substream, vma));
@@ -723,7 +723,7 @@ int snd_soc_pcm_component_new(struct snd_soc_pcm_runtime *rtd)
 		if (component->driver->pcm_construct) {
 			ret = component->driver->pcm_construct(component, rtd);
 			if (ret < 0)
-				soc_component_ret(component, ret);
+				return soc_component_ret(component, ret);
 		}
 	}
 
-- 
2.27.0

