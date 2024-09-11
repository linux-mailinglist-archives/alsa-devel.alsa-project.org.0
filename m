Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A33F977E56
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:15:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB9E4827;
	Fri, 13 Sep 2024 13:15:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB9E4827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726226159;
	bh=TxWkOdseiNx1bafVcVq7iqdfmlO4X8zdBrM+WKyic7w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i1rp5dluIxTn6MX4O0QzaNjo1h5ldOjs4qIIr47bDlBPgNqLhLRDDhIU3+cTGD9ab
	 lkYNaFX+fl7itEJsl04+Zdl+WJe5U9iHXszB6zahHqwD9A3YHfehc2TN0uJgIO4e6j
	 LsY6dHB/AORbRJ1n8pgLVLJ3j/OT17pjtZDq9Qh0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 861ADF80787; Fri, 13 Sep 2024 13:12:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EC9FF805ED;
	Fri, 13 Sep 2024 13:12:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06F71F801F5; Wed, 11 Sep 2024 14:30:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4473F80027
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 14:30:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4473F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=mbgKjV4o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726057815; x=1757593815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TxWkOdseiNx1bafVcVq7iqdfmlO4X8zdBrM+WKyic7w=;
  b=mbgKjV4oPeSoz+RXI8WvDJJBhBpLHwvhi0fA0hqsnu7Cnc3zJI+pmzwI
   8VEIXTBv8AN6Cs9SzFgGP7Vec+Jk3RdBUVsctobzWjlI9Lf3crjknlh5O
   e1kczXEmygYpz+cPqNnvm4icuHjXXxMefTKioHWkfrvxOJ26aMRhNps7X
   FPzSH3Bn7P5/1SXBNwr+IureYSnWyYzxkwxFyruv2dYUGHq2UiDlDLds3
   7d8hhNGYTEoUIi9KfDX827fnsilE/KIiIGTULRD8urcbdP8SMBol9ACOc
   gaZ3Mluhh/bQrHpewKeZlzIxG9zriGaY8Oe6RcHfVYe1etZOtuChX12je
   w==;
X-CSE-ConnectionGUID: TYXepcQqR+aekZWbFABIig==
X-CSE-MsgGUID: h6+wpwAeSbmE8OyH4DEEtQ==
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600";
   d="scan'208";a="31538368"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Sep 2024 05:30:13 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 11 Sep 2024 05:29:20 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 11 Sep 2024 05:29:17 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Andrei Simion
	<andrei.simion@microchip.com>
Subject: [PATCH 2/3] ASoC: atmel: mchp-pdmc: Add snd_soc_dai_driver name
Date: Wed, 11 Sep 2024 15:29:08 +0300
Message-ID: <20240911122909.133399-3-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240911122909.133399-1-andrei.simion@microchip.com>
References: <20240911122909.133399-1-andrei.simion@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MailFrom: prvs=977ab1c01=Andrei.Simion@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NCBP7PZ4MPFN6LKRJASYZRFDLBQKFXJZ
X-Message-ID-Hash: NCBP7PZ4MPFN6LKRJASYZRFDLBQKFXJZ
X-Mailman-Approved-At: Fri, 13 Sep 2024 11:12:48 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NCBP7PZ4MPFN6LKRJASYZRFDLBQKFXJZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

Set snd_soc_dai_driver name to improve controller's display of the DAI
name.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
 sound/soc/atmel/mchp-pdmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index 7a5585839c1d..d97d153ee375 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -777,6 +777,7 @@ static const struct snd_soc_dai_ops mchp_pdmc_dai_ops = {
 };
 
 static struct snd_soc_dai_driver mchp_pdmc_dai = {
+	.name	= "mchp-pdmc",
 	.capture = {
 		.stream_name	= "Capture",
 		.channels_min	= 1,
-- 
2.34.1

