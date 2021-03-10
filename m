Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07456333302
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 03:15:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4ECE1798;
	Wed, 10 Mar 2021 03:15:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4ECE1798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615342553;
	bh=a2INZZ8bCKy04pUAhQccv7UL+IpImbAFMAlLKQFVY24=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l4YnzLvtx24luS09DQ58cNAM3E6fIAtOEzvXFwnfDzEKmxm5J39vewtveW8bcqH6R
	 +vCT2H7ICjaiTFI/NKhE+fKyqu7acZAbwT5DjXGOVnra02gvattgjt3UylZvdmMrFC
	 uqpq4XQ78UbPZYnJOQmKUo3TT4x0Jhgbsr/5/hr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2653F8012F;
	Wed, 10 Mar 2021 03:14:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8F82F801D8; Wed, 10 Mar 2021 03:14:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 025D4F8010D
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 03:14:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 025D4F8010D
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id AECC51A07AD;
 Wed, 10 Mar 2021 03:14:03 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 164151A056F;
 Wed, 10 Mar 2021 03:13:57 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 44464402A7;
 Wed, 10 Mar 2021 03:13:48 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 shengjiu.wang@nxp.com, ckeepax@opensource.cirrus.com,
 kuninori.morimoto.gx@renesas.com, gustavoars@kernel.org,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2] ASoC: wm8960: Remove bitclk relax condition in
 wm8960_configure_sysclk
Date: Wed, 10 Mar 2021 10:00:42 +0800
Message-Id: <1615341642-3797-1-git-send-email-shengjiu.wang@nxp.com>
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

The call sequence in wm8960_configure_clocking is

   ret = wm8960_configure_sysclk();
   if (ret >= 0)
        goto configure_clock;

   ....

   ret = wm8960_configure_pll();

configure_clock:
   ...

wm8960_configure_sysclk is called before wm8960_configure_pll, as
there is bitclk relax on both functions, so wm8960_configure_sysclk
always return success, then wm8960_configure_pll() never be called.

With this case:
aplay -Dhw:0,0 -d 5 -r 48000 -f S24_LE -c 2 audio48k24b2c.wav
the required bitclk is 48000 * 24 * 2 = 2304000, bitclk got from
wm8960_configure_sysclk is 3072000, but if go to wm8960_configure_pll.
it can get correct bitclk 2304000.

So bitclk relax condition should be removed in wm8960_configure_sysclk,
then wm8960_configure_pll can be called, and there is also bitclk relax
function in wm8960_configure_pll.

Fixes: 3c01b9ee2ab9 ("ASoC: codec: wm8960: Relax bit clock computation")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
changes in resend v2
- Add acked-by Charles

changes in v2:
- Find the real reason for the case, just patially remove bitclk relax

 sound/soc/codecs/wm8960.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
index df351519a3a6..847ca16b9841 100644
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
-- 
2.27.0

