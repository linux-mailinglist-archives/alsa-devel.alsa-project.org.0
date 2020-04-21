Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EB41B253B
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 13:39:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EC5A168C;
	Tue, 21 Apr 2020 13:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EC5A168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587469151;
	bh=yLlAzl/8V8U4PxCXDY2CvpVSAEylhgRRcMzRRXQN/UE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A5gXnsyNDLCi3MnbnmIaFVOqnhXlfqv2gXBp9/Zw4G6IKZFZjD8eZA5JyI1a7lHHe
	 L+ual0seReSthT+UvuscT/iXmxMmKezfhfyHH3KG4V+tjG5WLWOgaE5ajjionxj2ki
	 BDljWpnE5UOc7qcyueDdgD7a+WMhhRSc5lM+eUSI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2805AF801ED;
	Tue, 21 Apr 2020 13:37:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13436F801EC; Tue, 21 Apr 2020 13:37:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E04DF800E7
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 13:37:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E04DF800E7
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8D59020044D;
 Tue, 21 Apr 2020 13:37:18 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 48960200C61;
 Tue, 21 Apr 2020 13:37:13 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 9BD60402A8;
 Tue, 21 Apr 2020 19:37:06 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 kstewart@linuxfoundation.org, allison@lohutok.net, shengjiu.wang@nxp.com,
 tglx@linutronix.de, info@metux.net, ckeepax@opensource.wolfsonmicro.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: wm8960: Fix wrong clock after suspend & resume
Date: Tue, 21 Apr 2020 19:28:45 +0800
Message-Id: <1587468525-27514-1-git-send-email-shengjiu.wang@nxp.com>
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

After suspend & resume, wm8960_hw_params may be called when
bias_level is not SND_SOC_BIAS_ON, then wm8960_configure_clocking
is not called. But if sample rate is changed at that time, then
the output clock rate will be not correct.

So judgement of bias_level is SND_SOC_BIAS_ON in wm8960_hw_params
is not necessary and it causes above issue.

Fixes: 3176bf2d7ccd ("ASoC: wm8960: update pll and clock setting function")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/wm8960.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
index 55112c1bba5e..6cf0f6612bda 100644
--- a/sound/soc/codecs/wm8960.c
+++ b/sound/soc/codecs/wm8960.c
@@ -860,8 +860,7 @@ static int wm8960_hw_params(struct snd_pcm_substream *substream,
 
 	wm8960->is_stream_in_use[tx] = true;
 
-	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_ON &&
-	    !wm8960->is_stream_in_use[!tx])
+	if (!wm8960->is_stream_in_use[!tx])
 		return wm8960_configure_clocking(component);
 
 	return 0;
-- 
2.21.0

