Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8E66A6BDE
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Mar 2023 12:41:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B492E82C;
	Wed,  1 Mar 2023 12:40:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B492E82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677670895;
	bh=Xy2RIIqGA7KYL9HehO+5TET6KnrqhumxLiivp/+DeYk=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=voeahjvNEVAKiusULTdujFEIfSC1MipNauksKvWMh3dIu/49JdSaPrrn1U1M//Afy
	 DrppVnTFgIETJCqQKEsYPT4Cg+ImcMs+hCqNsf0/ttrQ64+1BEAS/TeLQ4mUE2memx
	 hndEA0DKTxNqH9PqRNpIZ/z+pQ6+rZwHwFrxuB74=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEB6FF8055B;
	Wed,  1 Mar 2023 12:39:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78F75F80549; Wed,  1 Mar 2023 12:38:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E86CF8053B
	for <alsa-devel@alsa-project.org>; Wed,  1 Mar 2023 12:38:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E86CF8053B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=t9wBuP+x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677670733; x=1709206733;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xy2RIIqGA7KYL9HehO+5TET6KnrqhumxLiivp/+DeYk=;
  b=t9wBuP+xk1M1pfHSlOxn9fS2ndEC9lLIes9Fj393IgbdXlvdszPU2amI
   S7qRR0hmm2l2UlKmbayVffD1TIW92s78+DCEwRCxk/MFCD9YlS3L9kpkW
   Q4MQHepcOmeRx1xYD6GA8DhMQuPcPh8rdd1ygTCGvKGk9vK8WwudrYur2
   f1pFKhJtzdtDcWg5pQ/cBStz6Dd5YvZQ6okL62/PkC5qGCtR0PvKfTPtB
   My6bUnjSOeKhsd75LUOAC9cjyjTi1FpI7naP91olG4A15bPD/IBKNEqP0
   NWRlxgHa8n2cioDwCS6Mnkobmo/RVAQRWqG9SU2F9v5KSanu36HqSyPSn
   A==;
X-IronPort-AV: E=Sophos;i="5.98,224,1673938800";
   d="scan'208";a="139640271"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2023 04:38:50 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Mar 2023 04:38:49 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 1 Mar 2023 04:38:45 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: [PATCH 6/8] ASoC: mchp-pdmc: avoid casting to/from void pointer
Date: Wed, 1 Mar 2023 13:38:05 +0200
Message-ID: <20230301113807.24036-7-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301113807.24036-1-claudiu.beznea@microchip.com>
References: <20230301113807.24036-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Message-ID-Hash: AVKN5USPXDA7JUBBA2ZRHAESVXNAGTTS
X-Message-ID-Hash: AVKN5USPXDA7JUBBA2ZRHAESVXNAGTTS
X-MailFrom: Claudiu.Beznea@microchip.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AVKN5USPXDA7JUBBA2ZRHAESVXNAGTTS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Do not cast to and from void pointer. There is no need for this.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 sound/soc/atmel/mchp-pdmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index 853a7adfd654..81bfa98fd516 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -783,7 +783,7 @@ static struct snd_soc_dai_driver mchp_pdmc_dai = {
 /* PDMC interrupt handler */
 static irqreturn_t mchp_pdmc_interrupt(int irq, void *dev_id)
 {
-	struct mchp_pdmc *dd = (struct mchp_pdmc *)dev_id;
+	struct mchp_pdmc *dd = dev_id;
 	u32 isr, msr, pending;
 	irqreturn_t ret = IRQ_NONE;
 
@@ -1077,7 +1077,7 @@ static int mchp_pdmc_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_request_irq(dev, irq, mchp_pdmc_interrupt, 0,
-			       dev_name(&pdev->dev), (void *)dd);
+			       dev_name(&pdev->dev), dd);
 	if (ret < 0) {
 		dev_err(dev, "can't register ISR for IRQ %u (ret=%i)\n",
 			irq, ret);
-- 
2.34.1

