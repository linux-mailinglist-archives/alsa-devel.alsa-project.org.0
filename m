Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0220329C9E
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 12:32:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C7C21704;
	Tue,  2 Mar 2021 12:31:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C7C21704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614684759;
	bh=iSnUBOASVVoaj2OayZ6/ZzDUwd60DTUnQv130K5zjL8=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bvDSW3p3ar09n/zuAH4FKJS4oU6wBuNY77uGaSOepwtNYtc+HGndoN0x91quJscIS
	 PPu+y7zA+FRj8SxuuOS6MHHUqGgOAm4AdnwpKvg4fdD3VBpPmuDudmPdYVsBFuTssV
	 pfZ0W1kYv21HWYG1RCqyQS8kaRhaPSmUE+QoNAIo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C284F8012D;
	Tue,  2 Mar 2021 12:31:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 635AEF80269; Tue,  2 Mar 2021 12:31:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE10AF80088
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 12:30:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE10AF80088
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 232CA1A0716;
 Tue,  2 Mar 2021 12:30:57 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 494451A06FF;
 Tue,  2 Mar 2021 12:30:50 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 8515F402B4;
 Tue,  2 Mar 2021 12:30:42 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 kstewart@linuxfoundation.org, allison@lohutok.net, shengjiu.wang@nxp.com,
 tglx@linutronix.de, info@metux.net, ckeepax@opensource.wolfsonmicro.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: wm8960: Remove bitclk relax condition
Date: Tue,  2 Mar 2021 19:18:11 +0800
Message-Id: <1614683891-29255-1-git-send-email-shengjiu.wang@nxp.com>
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

From: Daniel Baluta <daniel.baluta@nxp.com>

Using a higher bitclk then expected doesn't always work.
Here is an example:

aplay -Dhw:0,0 -d 5 -r 48000 -f S24_LE -c 2 audio48k24b2c.wav

In this case, the required bitclk is 48000 * 24 * 2 = 2304000
but the closest bitclk that can be derived is 3072000. Since
the clock is faster than expected, it will start to send bytes
from the next channel so the sound will be corrupted.

Fixes: 82bab88910ee ("ASoC: codec: wm8960: Relax bit clock computation when using PLL")
Fixes: 3c01b9ee2ab9 ("ASoC: codec: wm8960: Relax bit clock computation")
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/wm8960.c | 29 +++--------------------------
 1 file changed, 3 insertions(+), 26 deletions(-)

diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
index df351519a3a6..368bec1dfbdb 100644
--- a/sound/soc/codecs/wm8960.c
+++ b/sound/soc/codecs/wm8960.c
@@ -608,10 +608,6 @@ static const int bclk_divs[] = {
  *		- lrclk      = sysclk / dac_divs
  *		- 10 * bclk  = sysclk / bclk_divs
  *
- *	If we cannot find an exact match for (sysclk, lrclk, bclk)
- *	triplet, we relax the bclk such that bclk is chosen as the
- *	closest available frequency greater than expected bclk.
- *
  * @wm8960: codec private data
  * @mclk: MCLK used to derive sysclk
  * @sysclk_idx: sysclk_divs index for found sysclk
@@ -629,7 +625,7 @@ int wm8960_configure_sysclk(struct wm8960_priv *wm8960, int mclk,
 {
 	int sysclk, bclk, lrclk;
 	int i, j, k;
-	int diff, closest = mclk;
+	int diff;
 
 	/* marker for no match */
 	*bclk_idx = -1;
@@ -653,12 +649,6 @@ int wm8960_configure_sysclk(struct wm8960_priv *wm8960, int mclk,
 					*bclk_idx = k;
 					break;
 				}
-				if (diff > 0 && closest > diff) {
-					*sysclk_idx = i;
-					*dac_idx = j;
-					*bclk_idx = k;
-					closest = diff;
-				}
 			}
 			if (k != ARRAY_SIZE(bclk_divs))
 				break;
@@ -676,10 +666,6 @@ int wm8960_configure_sysclk(struct wm8960_priv *wm8960, int mclk,
  *		- freq_out    = sysclk * sysclk_divs
  *		- 10 * sysclk = bclk * bclk_divs
  *
- * 	If we cannot find an exact match for (sysclk, lrclk, bclk)
- * 	triplet, we relax the bclk such that bclk is chosen as the
- * 	closest available frequency greater than expected bclk.
- *
  * @component: component structure
  * @freq_in: input frequency used to derive freq out via PLL
  * @sysclk_idx: sysclk_divs index for found sysclk
@@ -697,14 +683,12 @@ int wm8960_configure_pll(struct snd_soc_component *component, int freq_in,
 {
 	struct wm8960_priv *wm8960 = snd_soc_component_get_drvdata(component);
 	int sysclk, bclk, lrclk, freq_out;
-	int diff, closest, best_freq_out;
+	int diff;
 	int i, j, k;
 
 	bclk = wm8960->bclk;
 	lrclk = wm8960->lrclk;
-	closest = freq_in;
 
-	best_freq_out = -EINVAL;
 	*sysclk_idx = *dac_idx = *bclk_idx = -1;
 
 	for (i = 0; i < ARRAY_SIZE(sysclk_divs); ++i) {
@@ -725,18 +709,11 @@ int wm8960_configure_pll(struct snd_soc_component *component, int freq_in,
 					*bclk_idx = k;
 					return freq_out;
 				}
-				if (diff > 0 && closest > diff) {
-					*sysclk_idx = i;
-					*dac_idx = j;
-					*bclk_idx = k;
-					closest = diff;
-					best_freq_out = freq_out;
-				}
 			}
 		}
 	}
 
-	return best_freq_out;
+	return -EINVAL;
 }
 static int wm8960_configure_clocking(struct snd_soc_component *component)
 {
-- 
2.27.0

