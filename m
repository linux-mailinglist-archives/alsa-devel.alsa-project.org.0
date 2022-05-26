Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2F5535026
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 15:44:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D14316BE;
	Thu, 26 May 2022 15:43:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D14316BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653572654;
	bh=zED2qHEjuHZ0K+j/TYWFXzmk1LRvenwFgNIdTXAHTcE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B4im7EwPo3YXFcoCkAR9qE30RW+QcbepXC5DZVM25m6pztm4PbO1QiPTal8V7auzt
	 BmtuUpUO+5QugcbBQk8StOECp6VAuhpCLBZtRsrOq7Ha8AsCdVLXMbmdzP6oiNKDJo
	 VyAppzJIMSTI/dK/ghDyO8Ytk7XXKlVdGdbhXoKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C49A3F80171;
	Thu, 26 May 2022 15:43:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67B73F8014B; Thu, 26 May 2022 15:43:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 696E3F80100
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 15:43:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 696E3F80100
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nuDlU-0006dn-La; Thu, 26 May 2022 15:43:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nuDlV-004gY4-2P; Thu, 26 May 2022 15:42:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nuDlS-00CG3V-WF; Thu, 26 May 2022 15:42:59 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: ak4642: Drop no-op remove function
Date: Thu, 26 May 2022 15:42:39 +0200
Message-Id: <20220526134239.1593877-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=965; h=from:subject;
 bh=zED2qHEjuHZ0K+j/TYWFXzmk1LRvenwFgNIdTXAHTcE=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBij4PL7qcEFAvKEAW8IT1wwxUDiARd3Rtu1qh8iqKt
 1KxaxxyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYo+DywAKCRDB/BR4rcrsCZgbCA
 CV5BZ3Evn/8E91wB/KT1jglCODL/iNZL1VfQ3bOEmCmCTuZGXWnX20tCo6pzHvEx6Kousckpiybc3o
 8CJ8z8L9G/c/GnTLy54sn9M412u/2nh4ZcJ+gdkzxvkHRvXGkLmQZANTrI2VCoCP1uezu/vJ3Jdlqp
 SvQA8kLtU1Q0vywZGw3XY4Nmaz6Ffs+PRvQj8w7mPXwz3W5sDNNWArZaVe+QokDNLEQkvtBqtiKKFu
 WWzsCeFXmzViwuCsVIuY0hK9XkhuxqRD7ZNZvs1QoeR29FOJe9cDPVamrXuiKNdetybcNt/2Pt5yDt
 /CL7kcmyJ9nS9SIztgh+KCoMdpBPd8
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 kernel@pengutronix.de
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

A remove callback that just returns 0 is equivalent to no callback at all
as can be seen in i2c_device_remove(). So simplify accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/codecs/ak4613.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index 034195c83bd7..20a85a81b2ad 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -684,18 +684,12 @@ static int ak4613_i2c_probe(struct i2c_client *i2c,
 				      &ak4613_dai, 1);
 }
 
-static int ak4613_i2c_remove(struct i2c_client *client)
-{
-	return 0;
-}
-
 static struct i2c_driver ak4613_i2c_driver = {
 	.driver = {
 		.name = "ak4613-codec",
 		.of_match_table = ak4613_of_match,
 	},
 	.probe		= ak4613_i2c_probe,
-	.remove		= ak4613_i2c_remove,
 	.id_table	= ak4613_i2c_id,
 };
 

base-commit: 4b0986a3613c92f4ec1bdc7f60ec66fea135991f
-- 
2.36.1

