Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0946BCF9B
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 13:37:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0E5F1119;
	Thu, 16 Mar 2023 13:36:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0E5F1119
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678970235;
	bh=LEMmm+P/YsBKRZwyeHpOAEERU5kliRkrHncf65a34AI=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bSTq05Q072zvUdkKyI9SFxytrfy3ftAuV0tHWPYp1gYy9Dru14rn3Gs3tBQPlx9jc
	 5jlCR5rxGR+2hwbibzuxYUoMzPmjdGjgi5Nzc0H+TeuEWBBU9nxWzaIrSA4kpRtPTs
	 6k7MnX0aZPcmcq4pYFOuU1ZLxwu0NkA69vXN5lIQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B18AF8016C;
	Thu, 16 Mar 2023 13:36:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 672A7F80425; Thu, 16 Mar 2023 13:36:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6FCA6F800C9
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 13:36:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FCA6F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256
 header.s=key1 header.b=n+ABVS1N;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com
 header.a=rsa-sha256 header.s=key1 header.b=KFvm+kL7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678970178; x=1710506178;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=srkpdC+yB+EdyLTj0WhGzLGs6EFRQ5wKwgJvE5nC0hQ=;
  b=n+ABVS1NYLql5DOHIEtGyNPCOZienMt3MFbJG16NY+88G+RlXHP7hXTC
   D7ULoLGNjZpM5lhMQWJwd5LUeDbgspwH8q/EsKaQ8ZVYnDj2EOX8y9pAw
   b03UHRfHs44IkTwrwNUwWMBLilyF1SlTVceoT0hMZAuwNLyVaGCq+Ve0i
   FzKq1P5WfOLE1zX8YyoML2lTOOaP7kmu+bYzi+Tv9HtPgvQi+P/2LFOCK
   Eeimuj1/zfN5roIJOiUynyDwYafuURb7t2w8NzyCHew3MNiJ0cMaS6vL+
   fcBsTlL57VLbM6VDTDx9PJbI5JnofHDeE4wpn5jUYbumZJ7/wodph5PKh
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673910000";
   d="scan'208";a="29738028"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Mar 2023 13:36:16 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 16 Mar 2023 13:36:16 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Thu, 16 Mar 2023 13:36:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678970176; x=1710506176;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=srkpdC+yB+EdyLTj0WhGzLGs6EFRQ5wKwgJvE5nC0hQ=;
  b=KFvm+kL7CHuuM5/eAedvnG/nJcC2LiZLSDpCSK88WRZsbyOx7zzCGCW5
   BAQ4la6/E2QWkMSkXLgttnUCGcEL489cIHHw4Rm7a2ZOWumY+HVC5xlM5
   MRBWc1QyHNCJioC0e8O675RiD5IKWZD0B3PxLo3sKzab2gnZtzvoouRz/
   cnUa2y7sR1LcMBeokficFCpBoDqRN48YRXPJcPAPZtxewbSeRR0IevjFh
   YPnwFZMwaVvzXjqPPOTuriMF8Qb7STRzd/KAlJ8MvkYvLb0uxnumhU7DM
   ap2Iuwnv3UbBfNA5sPCrnFa+frhtfRGx5O7hMKMrBaAZ4FGfEonNbB0ly
   g==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673910000";
   d="scan'208";a="29738026"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Mar 2023 13:36:16 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 50D81280056;
	Thu, 16 Mar 2023 13:36:16 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/2] ASoC: fsl: define a common DRIVER_NAME
Date: Thu, 16 Mar 2023 13:36:10 +0100
Message-Id: <20230316123611.3495597-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UY5CQ7L3N3ZILGXEHN4QXRZALJ4HOSAM
X-Message-ID-Hash: UY5CQ7L3N3ZILGXEHN4QXRZALJ4HOSAM
X-MailFrom: alexander.stein@ew.tq-group.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Alexander Stein <alexander.stein@ew.tq-group.com>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UY5CQ7L3N3ZILGXEHN4QXRZALJ4HOSAM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of copying the driver name manually, use a common define.
No functional change.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index cdfca9fd1eb0..e956abfd50f8 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -28,6 +28,8 @@
 #include "../codecs/wm8994.h"
 #include "../codecs/tlv320aic31xx.h"
 
+#define DRIVER_NAME "fsl-asoc-card"
+
 #define CS427x_SYSCLK_MCLK 0
 
 #define RX 0
@@ -915,7 +917,7 @@ MODULE_DEVICE_TABLE(of, fsl_asoc_card_dt_ids);
 static struct platform_driver fsl_asoc_card_driver = {
 	.probe = fsl_asoc_card_probe,
 	.driver = {
-		.name = "fsl-asoc-card",
+		.name = DRIVER_NAME,
 		.pm = &snd_soc_pm_ops,
 		.of_match_table = fsl_asoc_card_dt_ids,
 	},
@@ -924,5 +926,5 @@ module_platform_driver(fsl_asoc_card_driver);
 
 MODULE_DESCRIPTION("Freescale Generic ASoC Sound Card driver with ASRC");
 MODULE_AUTHOR("Nicolin Chen <nicoleotsuka@gmail.com>");
-MODULE_ALIAS("platform:fsl-asoc-card");
+MODULE_ALIAS("platform:" DRIVER_NAME);
 MODULE_LICENSE("GPL");
-- 
2.34.1

