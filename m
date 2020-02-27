Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A07170E35
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Feb 2020 03:08:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EA10166C;
	Thu, 27 Feb 2020 03:07:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EA10166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582769320;
	bh=qCw5u5UZfSxyMlz2nE9j8ZIawnB7YE2+cEtvsYHXAPU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Jz7G0Ws5FnqEM2gGV76LUayd3TAKbdaTjmDjSshYF8GpdjqpricWAr6H+KGfg8MdF
	 ffF9SsTP/hNCu9wVEqcxfWPYwFFqnKlc7AO/kEzy5VLMFY+PPUM3qePlPgN0B0UTkf
	 1Xvtz6eaT5IpkBQZniKU4tlZ7agL/0M/dl2TxhKQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77626F8016F;
	Thu, 27 Feb 2020 03:06:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98F51F8014E; Thu, 27 Feb 2020 03:06:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C4BDF800AD
 for <alsa-devel@alsa-project.org>; Thu, 27 Feb 2020 03:06:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C4BDF800AD
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 01R26iBB022786,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTEXMB06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 01R26iBB022786
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2020 10:06:44 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 27 Feb 2020 10:06:44 +0800
Received: from localhost.localdomain (172.22.102.1) by RTEXMB01.realtek.com.tw
 (172.21.6.94) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Thu, 27 Feb
 2020 10:06:44 +0800
From: <jack.yu@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt1015: modify some structure to be static.
Date: Thu, 27 Feb 2020 10:06:37 +0800
Message-ID: <20200227020637.15135-1-jack.yu@realtek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMB05.realtek.com.tw (172.21.6.98) To
 RTEXMB01.realtek.com.tw (172.21.6.94)
Cc: oder_chiou@realtek.com, Jack Yu <jack.yu@realtek.com>,
 alsa-devel@alsa-project.org, lars@metafoo.de, kent_chen@realtek.com,
 kenny_chen@realtek.com, derek.fang@realtek.com, shumingf@realtek.com,
 mingjane_hsieh@realtek.com, flove@realtek.com
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

From: Jack Yu <jack.yu@realtek.com>

Modify rt1015_aif_dai_ops and rt1015_dai[] to be static.

Signed-off-by: Jack Yu <jack.yu@realtek.com>
---
 sound/soc/codecs/rt1015.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index d300b417dd50..c118d030bd2d 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -841,12 +841,12 @@ static void rt1015_remove(struct snd_soc_component *component)
 #define RT1015_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
-struct snd_soc_dai_ops rt1015_aif_dai_ops = {
+static struct snd_soc_dai_ops rt1015_aif_dai_ops = {
 	.hw_params = rt1015_hw_params,
 	.set_fmt = rt1015_set_dai_fmt,
 };
 
-struct snd_soc_dai_driver rt1015_dai[] = {
+static struct snd_soc_dai_driver rt1015_dai[] = {
 	{
 		.name = "rt1015-aif",
 		.id = 0,
-- 
2.25.1

