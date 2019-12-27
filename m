Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F50012B796
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Dec 2019 18:50:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF1AC1749;
	Fri, 27 Dec 2019 18:50:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF1AC1749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577469053;
	bh=Y8Gr9nHYhFS1yeafDQWOMasyuspJdD8yIj3eSZg6ib0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l7mfQn3svjFslQFXuB2U58Z+HqyeF2FK8+yyeV6Zk5K0O8JACZrayAehNhSYBEWOk
	 hNJ6MDre/Q64cWzzOJDGsaihB5LU2sK8Z+PQ3uM5jFfwqGW4CMH6L07mvf1pkzyM27
	 8WyK+pDD8eL7k3pYZ4CpKL6zOhbWRuqcNmZguGiY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B5CBF802E1;
	Fri, 27 Dec 2019 18:44:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DE0BF80273; Fri, 27 Dec 2019 18:44:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4508FF80269
 for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2019 18:43:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4508FF80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="zy1yK41v"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ACA462464E;
 Fri, 27 Dec 2019 17:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577468637;
 bh=Emq/9B2AkW4YhJSNYylruI7SPFCFSURyWY2lX/sSuec=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zy1yK41vXYWF4K5X93xG1fkaP1iJA1UHm46ixboqebgLOpW2/Wvk9kve5J6Ky4+JW
 zcCQLZUd/bGnxygplHny/SB63EMB7wTONYF67yRf+7QRsY2MGDSvdcXCnBlZNGGj/1
 1hyv0Jm/tVPThmJX9prAH6iX8PsE4RSXfGIi8hZs=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 27 Dec 2019 12:42:32 -0500
Message-Id: <20191227174352.6264-4-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191227174352.6264-1-sashal@kernel.org>
References: <20191227174352.6264-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Tzung-Bi Shih <tzungbi@google.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH AUTOSEL 4.19 04/84] ASoC: max98090: fix
	possible race conditions
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Tzung-Bi Shih <tzungbi@google.com>

[ Upstream commit 45dfbf56975994822cce00b7475732a49f8aefed ]

max98090_interrupt() and max98090_pll_work() run in 2 different threads.
There are 2 possible races:

Note: M98090_REG_DEVICE_STATUS = 0x01.
Note: ULK == 0, PLL is locked; ULK == 1, PLL is unlocked.

max98090_interrupt      max98090_pll_work
----------------------------------------------
schedule max98090_pll_work
                        restart max98090 codec
receive ULK INT
                        assert ULK == 0
schedule max98090_pll_work (1).

In the case (1), the PLL is locked but max98090_interrupt unnecessarily
schedules another max98090_pll_work.

max98090_interrupt      max98090_pll_work      max98090 codec
----------------------------------------------------------------------
                                               ULK = 1
receive ULK INT
read 0x01
                                               ULK = 0 (clear on read)
schedule max98090_pll_work
                        restart max98090 codec
                                               ULK = 1
receive ULK INT
read 0x01
                                               ULK = 0 (clear on read)
                        read 0x01
                        assert ULK == 0 (2).

In the case (2), both max98090_interrupt and max98090_pll_work read
the same clear-on-read register.  max98090_pll_work would falsely
thought PLL is locked.
Note: the case (2) race is introduced by the previous commit ("ASoC:
max98090: exit workaround earlier if PLL is locked") to check the status
and exit the loop earlier in max98090_pll_work.

There are 2 possible solution options:
A. turn off ULK interrupt before scheduling max98090_pll_work; and turn
on again before exiting max98090_pll_work.
B. remove the second thread of execution.

Option A cannot fix the case (2) race because it still has 2 threads
access the same clear-on-read register simultaneously.  Although we
could suppose the register is volatile and read the status via I2C could
be much slower than the hardware raises the bits.

Option B introduces a maximum 10~12 msec penalty delay in the interrupt
handler.  However, it could only punish the jack detection by extra
10~12 msec.

Adopts option B which is the better solution overall.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20191122073114.219945-4-tzungbi@google.com
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/max98090.c | 8 ++------
 sound/soc/codecs/max98090.h | 1 -
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 172a48d42479..f8cbed6cd0bf 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2121,10 +2121,8 @@ static void max98090_pll_det_disable_work(struct work_struct *work)
 			    M98090_IULK_MASK, 0);
 }
 
-static void max98090_pll_work(struct work_struct *work)
+static void max98090_pll_work(struct max98090_priv *max98090)
 {
-	struct max98090_priv *max98090 =
-		container_of(work, struct max98090_priv, pll_work);
 	struct snd_soc_component *component = max98090->component;
 	unsigned int pll;
 	int i;
@@ -2293,7 +2291,7 @@ static irqreturn_t max98090_interrupt(int irq, void *data)
 
 	if (active & M98090_ULK_MASK) {
 		dev_dbg(component->dev, "M98090_ULK_MASK\n");
-		schedule_work(&max98090->pll_work);
+		max98090_pll_work(max98090);
 	}
 
 	if (active & M98090_JDET_MASK) {
@@ -2456,7 +2454,6 @@ static int max98090_probe(struct snd_soc_component *component)
 			  max98090_pll_det_enable_work);
 	INIT_WORK(&max98090->pll_det_disable_work,
 		  max98090_pll_det_disable_work);
-	INIT_WORK(&max98090->pll_work, max98090_pll_work);
 
 	/* Enable jack detection */
 	snd_soc_component_write(component, M98090_REG_JACK_DETECT,
@@ -2509,7 +2506,6 @@ static void max98090_remove(struct snd_soc_component *component)
 	cancel_delayed_work_sync(&max98090->jack_work);
 	cancel_delayed_work_sync(&max98090->pll_det_enable_work);
 	cancel_work_sync(&max98090->pll_det_disable_work);
-	cancel_work_sync(&max98090->pll_work);
 	max98090->component = NULL;
 }
 
diff --git a/sound/soc/codecs/max98090.h b/sound/soc/codecs/max98090.h
index b1572a2d19da..388d2f74674b 100644
--- a/sound/soc/codecs/max98090.h
+++ b/sound/soc/codecs/max98090.h
@@ -1533,7 +1533,6 @@ struct max98090_priv {
 	struct delayed_work jack_work;
 	struct delayed_work pll_det_enable_work;
 	struct work_struct pll_det_disable_work;
-	struct work_struct pll_work;
 	struct snd_soc_jack *jack;
 	unsigned int dai_fmt;
 	int tdm_slots;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
