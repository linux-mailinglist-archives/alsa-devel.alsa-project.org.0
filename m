Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFD72EF299
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jan 2021 13:37:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A89016E7;
	Fri,  8 Jan 2021 13:36:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A89016E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610109462;
	bh=9zp2ADrd9uQojjnES8jcrLLoZwFrKTn7Yf3A019WhTI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b/MUnHsRonW1BYr5pdtkHLvLcExaWuEt5ppJ4vQQTRgOkXYUGGzODMb8RGqIu2p0L
	 phCePpJoq8B+o/C0KtsWFXbYiJSW0IV4b69M5fvMlX7PwnHzjSW+7XbDf9G+09HOtV
	 thJ1nsvawZXmpwvG3ZiWJ+B2rz9/D906+V9zsZ7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12502F80165;
	Fri,  8 Jan 2021 13:36:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C4DBF80166; Fri,  8 Jan 2021 13:36:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9893F800FD
 for <alsa-devel@alsa-project.org>; Fri,  8 Jan 2021 13:35:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9893F800FD
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1kxqza-0005Ut-MN; Fri, 08 Jan 2021 12:35:46 +0000
From: Colin King <colin.king@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?q?=E6=9C=B1=E7=81=BF=E7=81=BF?= <zhucancan@vivo.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH][next] ASoC: soc-pcm: Fix uninitialised return value in
 variable ret
Date: Fri,  8 Jan 2021 12:35:46 +0000
Message-Id: <20210108123546.19601-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

Currently when attempting to start the BE fails because the
FE is not started the error return variable ret is not initialized
and garbage is returned.  Fix this by setting it to 0 so the
caller does not report the error "ASoC: failed to shutdown some BEs"
and because this failure path has already reported the reason for
the early return.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: 2c1382840c19 ("ASoC: soc-pcm: disconnect BEs if the FE is not ready")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/soc-pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 481a4a25acb0..b787ce4ceb5a 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2443,6 +2443,7 @@ static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
 		fe->dpcm[stream].state == SND_SOC_DPCM_STATE_CLOSE) {
 		dev_err(fe->dev, "ASoC: FE %s is not ready %d\n",
 			fe->dai_link->name, fe->dpcm[stream].state);
+		ret = 0;
 		goto disconnect;
 	}
 
-- 
2.29.2

