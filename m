Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4E9BE4AF
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2019 20:36:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD9001718;
	Wed, 25 Sep 2019 20:35:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD9001718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569436570;
	bh=kUHGSXqZ9xHtuTMnXar7IRscEKwbG/LGkb1HF6BKKRI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A5eaIiEk4iLMs+yI/YGfTydrbccjZfCllX+kyLQOQ1t8T+tQ4Iy2o3CJkRTnXCFi0
	 StMmMJPG8bEOPeWEF1cON/MFCaqL8HAki8ySyeY7cRkPmYi6JnZZMOCzDXo2y0jk0F
	 JicLEFIxDeHYuQXIA2TDiwbEyoywpBg8flML0/Rg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A4BCF8044C;
	Wed, 25 Sep 2019 20:34:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEC4FF8044C; Wed, 25 Sep 2019 20:34:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 268BBF80138
 for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2019 20:34:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 268BBF80138
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 51CFD200090;
 Wed, 25 Sep 2019 20:34:11 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 45014200043;
 Wed, 25 Sep 2019 20:34:11 +0200 (CEST)
Received: from fsr-ub1864-103.ea.freescale.net
 (fsr-ub1864-103.ea.freescale.net [10.171.82.17])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id D458F20634;
 Wed, 25 Sep 2019 20:34:10 +0200 (CEST)
From: Daniel Baluta <daniel.baluta@nxp.com>
To: broonie@kernel.org
Date: Wed, 25 Sep 2019 21:33:58 +0300
Message-Id: <20190925183358.11955-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@intel.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, linux-imx@nxp.com,
 Daniel Baluta <daniel.baluta@nxp.com>, pierre-louis.bossart@intel.com
Subject: [alsa-devel] [PATCH] ASoC: core: Clarify usage of ignore_machine
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

For a sound card ignore_machine means that existing FEs links should be
ignored and existing BEs links should be overridden with some information
from the matching component driver.

Current code make some confusions about this so fix it!

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/soc-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 88978a3036c4..e32a45f6bd88 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1853,7 +1853,7 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
 
 	for_each_component(component) {
 
-		/* does this component override FEs ? */
+		/* does this component override BEs ? */
 		if (!component->driver->ignore_machine)
 			continue;
 
@@ -1874,7 +1874,7 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
 				continue;
 			}
 
-			dev_info(card->dev, "info: override FE DAI link %s\n",
+			dev_info(card->dev, "info: override BE DAI link %s\n",
 				 card->dai_link[i].name);
 
 			/* override platform component */
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
