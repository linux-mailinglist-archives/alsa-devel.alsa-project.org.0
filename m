Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 505D640263E
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Sep 2021 11:35:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5E401723;
	Tue,  7 Sep 2021 11:34:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5E401723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631007326;
	bh=ufIngamheoFn5TNkjbAtJNHj2ytlL6n8vYWfJJhTPe0=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O/HS/AyMSeddSsrr+laJwZsD4zv1gdgySlIgtvTpQeS8kq4rrYpX6FbDk+SySnbNO
	 QCSI4WPutmmRTkYVUO13w/110P6VQjeG6hZ8sf8KsbhzDAMfMdQ1IR/JXqSeBjYwiq
	 U1x0FrJIewujbaiWDH0NwkUPM0i2aHxSzPZMZxIw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31B8AF80217;
	Tue,  7 Sep 2021 11:34:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3A8AF80253; Tue,  7 Sep 2021 11:34:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A919CF80217
 for <alsa-devel@alsa-project.org>; Tue,  7 Sep 2021 11:34:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A919CF80217
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B22D81A2AFA;
 Tue,  7 Sep 2021 11:34:00 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7A88E1A165D;
 Tue,  7 Sep 2021 11:34:00 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 1DE30183AC4C;
 Tue,  7 Sep 2021 17:33:59 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: wm8960: Fix clock configuration on slave mode
Date: Tue,  7 Sep 2021 17:11:09 +0800
Message-Id: <1631005869-7308-1-git-send-email-shengjiu.wang@nxp.com>
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

There is a noise issue for 8kHz sample rate on slave mode.
Compared with master mode, the difference is the DACDIV
setting, after correcting the DACDIV, the noise is gone.

There is no noise issue for 48kHz sample rate, because
the default value of DACDIV is correct for 48kHz.

So wm8960_configure_clocking() should be functional for
ADC and DAC function even if it is slave mode.

In order to be compatible for old use case, just add
condition for checking that sysclk is zero with
slave mode.

Fixes: 0e50b51aa22f ("ASoC: wm8960: Let wm8960 driver configure its bit clock and frame clock")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/wm8960.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
index 9e621a254392..9c6af76a60fd 100644
--- a/sound/soc/codecs/wm8960.c
+++ b/sound/soc/codecs/wm8960.c
@@ -742,7 +742,7 @@ static int wm8960_configure_clocking(struct snd_soc_component *component)
 	int i, j, k;
 	int ret;
 
-	if (!(iface1 & (1<<6))) {
+	if (!(iface1 & (1 << 6)) && !wm8960->sysclk) {
 		dev_dbg(component->dev,
 			"Codec is slave mode, no need to configure clock\n");
 		return 0;
-- 
2.17.1

