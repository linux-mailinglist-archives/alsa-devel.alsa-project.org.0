Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD8A458992
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Nov 2021 08:03:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F2C4169A;
	Mon, 22 Nov 2021 08:03:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F2C4169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637564639;
	bh=+WJq9p/OLtoII51RYDtOsRr+UMSRm2h49gRsaYg7JsM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Aem2F+zki5nNpiQddD7Fbi+GyAxHJVny5Rt9XwOjTLWdc2gWa074Q3gZQ3WflVCK/
	 ihPdCbKdT6LQltGtkIXVXSxvlGh2yN9yZ7ZynMEPTYm7vGtH31+ux7R3KiZavaKv5g
	 fJdlVyiD5x8VwRyfYKoJmVzHq+PyGvz4wEigBcpY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7462F804E7;
	Mon, 22 Nov 2021 08:01:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B17BFF80217; Fri, 19 Nov 2021 16:34:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C793F8010B
 for <alsa-devel@alsa-project.org>; Fri, 19 Nov 2021 16:34:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C793F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=collabora.com header.i=@collabora.com header.b="Pb5qrBGK"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id A9EA01F47557
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637336044; bh=+WJq9p/OLtoII51RYDtOsRr+UMSRm2h49gRsaYg7JsM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Pb5qrBGKnYlPTaj8/1WNQLtWmVOGSRe0E8uRF/0L9bSDi86RKE62N8nlezDZ6KjZm
 8QGaChhOUs/3ViCWVCLMAuMLLd5VmxBQN3eeyKTKn3auz/MFrN7n2jTPCZLakLwYiQ
 IpFAhxk85OJlwcWKrgczYcAxo9+OFpN6qbJZ/ukT2sUHq5EpnunraBlPW+kifS3IxF
 pdXLFIvYDrbit6+9hEGbe4mFbyrMAWoU+iu3altB0Zg/5c9qs8z7sVeM7Jv/t1H8+5
 EWf633L0leIPvqFHsUetfQFCkLZaWafm1Lvje2uBDQMeCH0ent6607df+GR1IUmX7C
 K3jkd4ugUFYng==
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [RFC patch 1/5] ASoC: tlv320aic31xx: Fix typo in BCLK clock name
Date: Fri, 19 Nov 2021 12:32:44 -0300
Message-Id: <20211119153248.419802-2-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211119153248.419802-1-ariel.dalessandro@collabora.com>
References: <20211119153248.419802-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 22 Nov 2021 08:01:48 +0100
Cc: bkylerussell@gmail.com, ariel.dalessandro@collabora.com,
 kuninori.morimoto.gx@renesas.com, Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com,
 tiwai@suse.com, lgirdwood@gmail.com, nicoleotsuka@gmail.com,
 broonie@kernel.org, michael@amarulasolutions.com, festevam@gmail.com
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

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 sound/soc/codecs/tlv320aic31xx.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic31xx.h b/sound/soc/codecs/tlv320aic31xx.h
index 2513922a0292..80d062578fb5 100644
--- a/sound/soc/codecs/tlv320aic31xx.h
+++ b/sound/soc/codecs/tlv320aic31xx.h
@@ -118,7 +118,7 @@ struct aic31xx_pdata {
 #define AIC31XX_PLL_CLKIN_MASK		GENMASK(3, 2)
 #define AIC31XX_PLL_CLKIN_SHIFT		(2)
 #define AIC31XX_PLL_CLKIN_MCLK		0x00
-#define AIC31XX_PLL_CLKIN_BCKL		0x01
+#define AIC31XX_PLL_CLKIN_BCLK		0x01
 #define AIC31XX_PLL_CLKIN_GPIO1		0x02
 #define AIC31XX_PLL_CLKIN_DIN		0x03
 #define AIC31XX_CODEC_CLKIN_MASK	GENMASK(1, 0)
-- 
2.30.2

