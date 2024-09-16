Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EA297C9DC
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2024 15:14:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F23CD868;
	Thu, 19 Sep 2024 15:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F23CD868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726751676;
	bh=wLNyCCa3uGukd/YUJXnpdJORp6fFs7Bh0HkU+aXmQck=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fL5hKAgl9vIlkAST1OOPnSy/oH2sQzT9NR+rVKeNoAiROFIU6wMKb3vvh3Y3AhGYQ
	 LvEbJ5CU6YU52is2Gut8hzfhesJnXStuxI1OVYcblY7scy3i8t4Fj5Y99/y/PRG+TC
	 EzAazPRJxG7rnZ/x8zgmD4CNLJaazFwUNmz59QI0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C64BF805AE; Thu, 19 Sep 2024 15:13:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D02BF80672;
	Thu, 19 Sep 2024 15:13:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8408CF80269; Mon, 16 Sep 2024 10:53:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37E42F80107
	for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2024 10:53:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37E42F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=nep3c73G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726476819; x=1758012819;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wLNyCCa3uGukd/YUJXnpdJORp6fFs7Bh0HkU+aXmQck=;
  b=nep3c73G4EEVZk5aJZ5LBP5efC3Yfpblh3+OslShLHu03L4mGYz37W2o
   P03aWXATFcPsuzVIGC0CdDZnVmSvRy8/Kb2lbhRo3F2opjjZ3WWY3q3BO
   uzP2sGWRcUC3GvIqUdv3DCGgiS0ftBq1cmVcoaHB7zYtotQ86y3LqI1KG
   nd8iR72NZRPLIc3gjMkpfSBO177SawkjcjV4ugpS3YJBpHbQEPNvY2ytU
   aJIdgIQbEIkSqH4bwHTXhkS4v2gnwVt9Igy6kTU2vktw9mQgd1ru9EsT8
   S7PUb8jQ8Tx3AV1C8p4ykZldZTFMqkeCrXLoF+5PG5WkEjbzQjoN3Zvyc
   Q==;
X-CSE-ConnectionGUID: PamDwLmaS1u4auhQg+WCVA==
X-CSE-MsgGUID: PUDmAxjDRdG9WOIsrMHnQA==
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600";
   d="scan'208";a="32443041"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Sep 2024 01:53:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 16 Sep 2024 01:53:15 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 16 Sep 2024 01:53:12 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Andrei Simion
	<andrei.simion@microchip.com>
Subject: [PATCH 2/2] ASoC: atmel: atmel_ssc_dai: Drop S24_LE support due to
 single channel limitation
Date: Mon, 16 Sep 2024 11:52:15 +0300
Message-ID: <20240916085214.11083-3-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240916085214.11083-1-andrei.simion@microchip.com>
References: <20240916085214.11083-1-andrei.simion@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MailFrom: prvs=98237714c=Andrei.Simion@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: EVW4WP4XVOINICT4NELBCOVMPHRSBHUQ
X-Message-ID-Hash: EVW4WP4XVOINICT4NELBCOVMPHRSBHUQ
X-Mailman-Approved-At: Thu, 19 Sep 2024 13:13:01 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EVW4WP4XVOINICT4NELBCOVMPHRSBHUQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

Drop S24_LE format because it is not supported if more than 2 channels
(of TDM slots) are used. This limitation makes it impractical for use cases
requiring more than 2 TDM slots, leading to potential issues in
multi-channel configurations.

[andrei.simion@microchip.com: Reword the commit title and the commit
message.]

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
 sound/soc/atmel/atmel_ssc_dai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
index 7047f17fe7a8..475e7579c64c 100644
--- a/sound/soc/atmel/atmel_ssc_dai.c
+++ b/sound/soc/atmel/atmel_ssc_dai.c
@@ -822,7 +822,7 @@ static int atmel_ssc_resume(struct snd_soc_component *component)
 }
 
 #define ATMEL_SSC_FORMATS (SNDRV_PCM_FMTBIT_S8     | SNDRV_PCM_FMTBIT_S16_LE |\
-			  SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
+			   SNDRV_PCM_FMTBIT_S32_LE)
 
 static const struct snd_soc_dai_ops atmel_ssc_dai_ops = {
 	.startup	= atmel_ssc_startup,
-- 
2.34.1

