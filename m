Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E44396DB7
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 09:03:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F58816B9;
	Tue,  1 Jun 2021 09:03:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F58816B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622531032;
	bh=+SXjb1uEvpaY+9BNpC3SPl9oKZI3XiPyfDKRli+rntM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h4+83mnV3TPTNNTmNnxSPv72mVTidLh/E39zjFJGzP15noPKvbPgpg2ANlJn0jmXn
	 nZ14/btvY0FZasAXZce/1zVFJk0pz3k0iswpUZAKN2dAQN2BD47Hla2/78RFmpnChA
	 aqQo45BUnnLqVl2VdhlHO0a6vdJBzeU7hpD5qsjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78C75F804BD;
	Tue,  1 Jun 2021 09:01:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FF2EF80253; Mon, 31 May 2021 07:12:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=FORGED_SPF_HELO,
 KHOP_HELO_FCRDNS, SPF_HELO_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mo-csw.securemx.jp (mo-csw1516.securemx.jp [210.130.202.155])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 516C9F80096
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 07:12:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 516C9F80096
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 14V5CNfp012497;
 Mon, 31 May 2021 14:12:23 +0900
X-Iguazu-Qid: 34tKJKyADe5GNT5trE
X-Iguazu-QSIG: v=2; s=0; t=1622437943; q=34tKJKyADe5GNT5trE;
 m=2lw/G/MlYKmz8Fq4yFf0SvbqNLZ2UQr61H/jynzRH28=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
 by relay.securemx.jp (mx-mr1513) id 14V5CKBE005985
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 31 May 2021 14:12:21 +0900
Received: from enc01.toshiba.co.jp (enc01.toshiba.co.jp [106.186.93.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by imx2-a.toshiba.co.jp (Postfix) with ESMTPS id 6EFB01000B6;
 Mon, 31 May 2021 14:12:20 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
 by enc01.toshiba.co.jp  with ESMTP id 14V5CJkV024472;
 Mon, 31 May 2021 14:12:19 +0900
From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Argus Lin <argus.lin@mediatek.com>
Subject: [PATCH] ASoC: mediatek: mt6359: convert to use module_platform_driver
Date: Mon, 31 May 2021 14:12:03 +0900
X-TSB-HOP: ON
Message-Id: <20210531051203.228567-1-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 01 Jun 2021 09:01:32 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Colin Ian King <colin.king@canonical.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-arm-kernel@lists.infradead.org
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

Simplify the code by using module_platform_driver macro for
mt6359-accdet.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 sound/soc/codecs/mt6359-accdet.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index 4222aed013f106..b2354a613b1587 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -1057,22 +1057,7 @@ static struct platform_driver mt6359_accdet_driver = {
 	.probe = mt6359_accdet_probe,
 };
 
-static int __init mt6359_accdet_driver_init(void)
-{
-	int ret = 0;
-
-	ret = platform_driver_register(&mt6359_accdet_driver);
-	if (ret)
-		return -ENODEV;
-	return 0;
-}
-
-static void __exit mt6359_accdet_driver_exit(void)
-{
-	platform_driver_unregister(&mt6359_accdet_driver);
-}
-module_init(mt6359_accdet_driver_init);
-module_exit(mt6359_accdet_driver_exit);
+module_platform_driver(mt6359_accdet_driver)
 
 /* Module information */
 MODULE_DESCRIPTION("MT6359 ALSA SoC codec jack driver");
-- 
2.30.0

