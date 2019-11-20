Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2D41036E3
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 10:39:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5F2C1690;
	Wed, 20 Nov 2019 10:39:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5F2C1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574242798;
	bh=n4bzdVTIaM0wlf4Er8VuzE9Jf6Ua8abdZMPd5mKcZa4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XLNNEnbDDYUMWsfnpO7F/FIKdBw8DNqR+WOnWDwrRVAHElygv1KqG+180YZosMG43
	 XcuFnpgqP/fa0kntExraskgdqE0saUIEoVDjv2z0Wk2+Ha7g5wP7bnFciX8o/11Udt
	 nwFHEJV2J4ljtsUyIRisOszEVKNLBy6uViMcqfHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E36BCF800C1;
	Wed, 20 Nov 2019 10:37:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5BEFF8014B; Wed, 20 Nov 2019 10:37:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB42AF800C1
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 10:37:24 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 805C3A0040;
 Wed, 20 Nov 2019 10:37:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 805C3A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1574242644; bh=u6t4Lw5GiBCY95RUJMV17RQ0mzUboRUoiKkrgc0CyiA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O+eZ2R1GkQYWh9ntz4V+vGKOBK05AmUAfD1xzH905ccS9JP19Q8U1/nu4w5b8WrOz
 mcksfBQqedl0yVXt8t/P0ycov38LPfPoIh+WYB26gPqf6ndXU3a1dHiL6v9hjjAaQ1
 Op/YHBzC2AON9lXnvxvzfipA6ED2997jloApFUiM=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 20 Nov 2019 10:37:20 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Date: Wed, 20 Nov 2019 10:37:12 +0100
Message-Id: <20191120093712.11370-2-perex@perex.cz>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191120093712.11370-1-perex@perex.cz>
References: <20191120093712.11370-1-perex@perex.cz>
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH 2/2] ASoC: DMI long name - avoid to add board
	name if matches with product name
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

Current code:

  LENOVO-20QE000VMC-ThinkPadX1Carbon7th-20QE000VMC

With the patch:

  LENOVO-20QE000VMC-ThinkPadX1Carbon7th

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Cc: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 1d1baf78818c..32c249ccc600 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1835,7 +1835,8 @@ int snd_soc_set_dmi_name(struct snd_soc_card *card, const char *flavour)
 
 	board = dmi_get_system_info(DMI_BOARD_NAME);
 	if (board && is_dmi_valid(board)) {
-		append_dmi_string(card, board);
+		if (!product || strcasecmp(board, product))
+			append_dmi_string(card, board);
 	} else if (!product) {
 		/* fall back to using legacy name */
 		dev_warn(card->dev, "ASoC: no DMI board/product name!\n");
-- 
2.20.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
