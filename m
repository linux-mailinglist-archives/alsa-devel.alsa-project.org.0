Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 078EE97C9D8
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2024 15:14:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81C3FE82;
	Thu, 19 Sep 2024 15:14:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81C3FE82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726751656;
	bh=xWtunqZUwm+Iv5DfIc9zQa49fXxa5eCLE0PCO9l16Y4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jl//vr5l7r7wE1nfcaLTZZzZNsEDdh+HrjIW/GlSD9gWzmqNlzAr5n991q8OBFGvk
	 myAt0hnV7ksQPatFrdxtjP7yf3yiZvjlw+yUz/hjA/l1qIQONYHWhTfHCc0A9ztBA8
	 W8NWQa1Cj6JqeyTxyXtq/Wbf4GUPylzscEvEx1G8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 007ADF8063D; Thu, 19 Sep 2024 15:13:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2A67F8063D;
	Thu, 19 Sep 2024 15:13:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16C29F80236; Mon, 16 Sep 2024 10:53:40 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5DC47F801C0
	for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2024 10:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DC47F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=0VSdwHGb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726476817; x=1758012817;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xWtunqZUwm+Iv5DfIc9zQa49fXxa5eCLE0PCO9l16Y4=;
  b=0VSdwHGbpg71ryPL9oOZZ5/O0IqEhOUVGmgm2D2YnG75wBBJUwU4QoRd
   1IUm148Olk192iCqEqYjXZu4dIiQJlBwE9gSTqZ+RDFsotMCnFIMjBvi/
   XXifITZnKa8D4qSek1+7piIxBMWfUza2fFpmF9KF9wk5b/qUgZA4UJiJ1
   P1wHX+0CibBPkHXINoaYoMAyMvgSz8mqK8XXOCP/sb8UJFEp3awLx8Oyq
   YYef5xAjyo92k7PHHNyO1fh2MdRUlndojF5bUphE6eR8R6ZnGKB9FCKYo
   kC8J5N4H0G4IDo1ehOdXQLEXi/XVJCmChNYDsHwjyH9cK4E+0HspgEKDt
   A==;
X-CSE-ConnectionGUID: PamDwLmaS1u4auhQg+WCVA==
X-CSE-MsgGUID: Xl7j1+o3Se2UIgOppZ5/Qg==
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600";
   d="scan'208";a="32443040"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Sep 2024 01:53:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 16 Sep 2024 01:53:12 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 16 Sep 2024 01:53:09 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Andrei Simion
	<andrei.simion@microchip.com>
Subject: [PATCH 1/2] ASoC: atmel: atmel_ssc_dai: Add stream names
Date: Mon, 16 Sep 2024 11:52:14 +0300
Message-ID: <20240916085214.11083-2-andrei.simion@microchip.com>
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
Message-ID-Hash: JBSHULDYBMEQYH24YCFTTGN7TAOSOLGG
X-Message-ID-Hash: JBSHULDYBMEQYH24YCFTTGN7TAOSOLGG
X-Mailman-Approved-At: Thu, 19 Sep 2024 13:13:01 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JBSHULDYBMEQYH24YCFTTGN7TAOSOLGG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

Add required stream names for DPCM and future use-cases.

[andrei.simion@microchip.com: Adjust commit title. Reword commit message.]

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
 sound/soc/atmel/atmel_ssc_dai.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
index 3763454436c1..7047f17fe7a8 100644
--- a/sound/soc/atmel/atmel_ssc_dai.c
+++ b/sound/soc/atmel/atmel_ssc_dai.c
@@ -836,6 +836,7 @@ static const struct snd_soc_dai_ops atmel_ssc_dai_ops = {
 
 static struct snd_soc_dai_driver atmel_ssc_dai = {
 		.playback = {
+			.stream_name = "Playback",
 			.channels_min = 1,
 			.channels_max = 2,
 			.rates = SNDRV_PCM_RATE_CONTINUOUS,
@@ -843,6 +844,7 @@ static struct snd_soc_dai_driver atmel_ssc_dai = {
 			.rate_max = 384000,
 			.formats = ATMEL_SSC_FORMATS,},
 		.capture = {
+			.stream_name = "Capture",
 			.channels_min = 1,
 			.channels_max = 2,
 			.rates = SNDRV_PCM_RATE_CONTINUOUS,
-- 
2.34.1

