Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78445105A33
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 20:10:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C828179D;
	Thu, 21 Nov 2019 20:09:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C828179D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574363435;
	bh=9e1N6XdpLBbE8LiN3+klGQ0XRs3ZiCIZaDrbAOPhcrI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M8yAt7g0Nw/qkoxKFbd+PMtSA5I3h4kAnGBl7ncnbcpjuXqtmJHzDhrydwWOimipn
	 T7VhbQf2PJKt8GPmJz4uoMETA2hzIh6R6PRnT3ILiYcFEt/SES8zZfi7uGB1xrWpyJ
	 yncSlxtPyNkd1dvU64N18PmCIhrlm5PiLSMMvz8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CF52F80159;
	Thu, 21 Nov 2019 20:07:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10222F8014F; Thu, 21 Nov 2019 20:07:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46C7BF80146
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 20:07:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46C7BF80146
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4A67CAE52;
 Thu, 21 Nov 2019 19:07:11 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Thu, 21 Nov 2019 20:07:08 +0100
Message-Id: <20191121190709.29121-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191121190709.29121-1-tiwai@suse.de>
References: <20191121190709.29121-1-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 1/2] ASoC: pcm: Make ioctl ops optional
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Now PCM core accepts the NULL ioctl ops as default, and passing a proper
ioctl ops is no longer mandatory.  Adjust soc_new_pcm() to allow also
the NULL for component ioctl ops, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/soc-pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 493a2e80e893..4dd13c9249ab 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -3005,7 +3005,6 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 		rtd->ops.hw_free	= dpcm_fe_dai_hw_free;
 		rtd->ops.close		= dpcm_fe_dai_close;
 		rtd->ops.pointer	= soc_pcm_pointer;
-		rtd->ops.ioctl		= snd_soc_pcm_component_ioctl;
 	} else {
 		rtd->ops.open		= soc_pcm_open;
 		rtd->ops.hw_params	= soc_pcm_hw_params;
@@ -3014,12 +3013,13 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 		rtd->ops.hw_free	= soc_pcm_hw_free;
 		rtd->ops.close		= soc_pcm_close;
 		rtd->ops.pointer	= soc_pcm_pointer;
-		rtd->ops.ioctl		= snd_soc_pcm_component_ioctl;
 	}
 
 	for_each_rtd_components(rtd, rtdcom, component) {
 		const struct snd_soc_component_driver *drv = component->driver;
 
+		if (drv->ioctl)
+			rtd->ops.ioctl		= snd_soc_pcm_component_ioctl;
 		if (drv->copy_user)
 			rtd->ops.copy_user	= snd_soc_pcm_component_copy_user;
 		if (drv->page)
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
