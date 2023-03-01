Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8076A6BDC
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Mar 2023 12:41:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1658FDF;
	Wed,  1 Mar 2023 12:40:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1658FDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677670868;
	bh=XHLvCT8Nt8YmIKi30XtbTBcw6kinTTqUBJYbD4/6SFc=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J3VlZoibDAXOiIBa+dl5fY1Ao4pS/YYvJvcGZPzdY0zjOUScvs5PBEV1h25uWtSLB
	 CqeAj4DPOYWSDi1pYjQIrIo+ADTEFch42SB4L9doiG8NqoVK6voaKZChD9HWQvVSmz
	 3mXCqHrG5iLsTfzNEkLoQlcyV5J7CaLFb4igLLb4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 729CEF80548;
	Wed,  1 Mar 2023 12:38:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26DA2F8052E; Wed,  1 Mar 2023 12:38:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 099C0F8052D
	for <alsa-devel@alsa-project.org>; Wed,  1 Mar 2023 12:38:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 099C0F8052D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=UkbUi7MR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677670728; x=1709206728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XHLvCT8Nt8YmIKi30XtbTBcw6kinTTqUBJYbD4/6SFc=;
  b=UkbUi7MRXzqZfSBfd6PxuFQ7Z7dT5OSU0d1EIoxDuqwxfRWDAecS4EB8
   9NI5c0hXNTnlR4nZ/cYC3vk0gcLr4QXkVkkuNe7Fas2CjnnCrshj7z7CZ
   oDQpQwOpen8pFqXSXRaq3AyW0kupCEKg1Mfn2KXjpRQYOXliq+WUc95dk
   WBs3+Ip5Uz5yl3LjWX4cAbYRKfsNQyG53htsfBQyR50vWEGG/K37Sw2ER
   44DCcIyPx1PNa35SmA9iNZ3gIEQVc5bdI0gC0PSkjfmpghZwXZr7RhgWL
   kGtlAvmJr5TqGhmms6fidGLEkglTYLGmybHtE04TsBnUqqHT127q+jDzn
   w==;
X-IronPort-AV: E=Sophos;i="5.98,224,1673938800";
   d="scan'208";a="202995026"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2023 04:38:45 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Mar 2023 04:38:45 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 1 Mar 2023 04:38:42 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: [PATCH 5/8] ASoC: mchp-pdmc: return directly ret
Date: Wed, 1 Mar 2023 13:38:04 +0200
Message-ID: <20230301113807.24036-6-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301113807.24036-1-claudiu.beznea@microchip.com>
References: <20230301113807.24036-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Message-ID-Hash: S5DWWLI6ALFAIOXRU5QEVZKGLGZS4YSW
X-Message-ID-Hash: S5DWWLI6ALFAIOXRU5QEVZKGLGZS4YSW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S5DWWLI6ALFAIOXRU5QEVZKGLGZS4YSW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Return directly ret instead of having different branches for error and
OK paths.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 sound/soc/atmel/mchp-pdmc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index 6ec5324fd65e..853a7adfd654 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -759,12 +759,10 @@ static int mchp_pdmc_pcm_new(struct snd_soc_pcm_runtime *rtd,
 	int ret;
 
 	ret = mchp_pdmc_add_chmap_ctls(rtd->pcm, dd);
-	if (ret < 0) {
+	if (ret < 0)
 		dev_err(dd->dev, "failed to add channel map controls: %d\n", ret);
-		return ret;
-	}
 
-	return 0;
+	return ret;
 }
 
 static struct snd_soc_dai_driver mchp_pdmc_dai = {
-- 
2.34.1

