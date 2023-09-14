Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C533A7A0C33
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 20:06:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68C57E11;
	Thu, 14 Sep 2023 20:05:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68C57E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694714768;
	bh=2pwLyN1NOgOqSCUS+CULuZP/nEB8lwRfQHA2NkLKfYs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U5m0LJIsW45Ap/Ue/Z3rhJ38z5yu3QvwQzbeuPjz8+zASwz53jbkQJqxRWJFesDtE
	 Bm4xFP6lnQ5TW+SpWbJSc722Z+FWnw8Jn698ydcimAYwTGBTt+R2On6SR0jz3aSZe0
	 J3BvzrAVMiptp5ENRFXZk10FaAO6PUIRIa4Z9ydc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0621F805B3; Thu, 14 Sep 2023 20:03:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 698BDF805B6;
	Thu, 14 Sep 2023 20:03:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6725EF80425; Thu, 14 Sep 2023 03:01:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp3.hiworks.co.kr (smtp3.hiworks.co.kr [121.254.168.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A2A7F80212
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 03:01:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A2A7F80212
Received: (qmail 153611 invoked from network); 14 Sep 2023 10:01:11 +0900
Received: from unknown (HELO hiworks.co.kr) (192.168.10.162)
	by 0 (qmail 1.03 + ejcp v14) with SMTP;
	14 Sep 2023 10:01:11 +0900
Received: (qmail 103483 invoked from network); 14 Sep 2023 10:01:11 +0900
Received: from unknown (HELO saram-MINIPC-PN53..)
 (mwkim@gaonchips.com@220.88.49.178)
	by 0 (qmail 1.03 + ejcp v14) with SMTP;
	14 Sep 2023 10:01:11 +0900
X-Authinfo: HIWORKS SMTP authenticated
 <mwkim@gaonchips.com|220.88.49.178|mwkim@gaonchips.com|230914100111_5864103031>
X-MailFrom-INFO: Info <country_code:KR|rbl_level:0>
From: Myunguk Kim <mwkim@gaonchips.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	fido_max@inbox.ru,
	kuninori.morimoto.gx@renesas.com,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	mwkim@gaonchips.com,
	perex@perex.cz,
	tiwai@suse.com,
	u.kleine-koenig@pengutronix.de,
	xingyu.wu@starfivetech.com
Subject: Re: [PATCH] [v2] ASoC: dwc: fix typo in comment
Date: Thu, 14 Sep 2023 09:56:34 +0900
Message-Id: <20230914005633.2423696-1-mwkim@gaonchips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <64683b6c-1e31-4037-a47d-b8a19ea77c72@sirena.org.uk>
References: <64683b6c-1e31-4037-a47d-b8a19ea77c72@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: mwkim@gaonchips.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KYHCMOHEL3AHSODLYIF4PDEGTYKH5P6B
X-Message-ID-Hash: KYHCMOHEL3AHSODLYIF4PDEGTYKH5P6B
X-Mailman-Approved-At: Thu, 14 Sep 2023 18:03:24 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KYHCMOHEL3AHSODLYIF4PDEGTYKH5P6B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> The patch is obviously corrupted, the { there should be on the prior
> line and even fixing that by hand there appear to be some other issues.

The patch file should have been attached as shown below. 
Is there a problem with my git send-email?

---
 sound/soc/dwc/dwc-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 22c004179214..c71c17ef961d 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -138,7 +138,7 @@ static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
 			irq_valid = true;
 		}
 
-		/* Error Handling: TX */
+		/* Error Handling: RX */
 		if (isr[i] & ISR_RXFO) 
{ 			dev_err_ratelimited(dev->dev, "RX overrun (ch_id=%d)\n", i);
 			irq_valid = true;
-- 

Thanks,
myunguk

