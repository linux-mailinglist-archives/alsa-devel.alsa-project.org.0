Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFEB680D24
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 13:10:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FB16E78;
	Mon, 30 Jan 2023 13:09:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FB16E78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675080607;
	bh=/R4wdD0tMsQRvAushbS1DLuKP51g2Gci5WtqH3y3808=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MrF+7hHx/O/WIBVCyPS8NzVaWDbatz/B1/DKnRUDUJSasmLa6KsCIOdI1PjWe+tB4
	 voWUvyYyniC3rKy8atfsXrNVsIYTP1nSVD/lTvQ6u3mwAivQ/j7u9vYqP3WHikwwmf
	 5qHjgtehFC7iqrjOlnZC6KDjwNEpXGFw9pul7t3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1CD3F80571;
	Mon, 30 Jan 2023 13:08:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD28BF8056F; Mon, 30 Jan 2023 13:07:56 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 66632F8055A
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 13:07:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66632F8055A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=1HsxSq5U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1675080475; x=1706616475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/R4wdD0tMsQRvAushbS1DLuKP51g2Gci5WtqH3y3808=;
 b=1HsxSq5ULMfs4pcO5Q8pQyIx1AKlWEm2YS2P++M/05UDn2iBp4yh94u2
 0ifPOE6OniI2vNs3FzWIAY50N2R6+STzavGMNhnGhBlgRJQJoAbersg8b
 mgWB0w6G0abUkkU+XqPehEqxh9cZESPelqjWjhB3em5w0Acz9Er5phHho
 gLsUY8kxxBiIk7mi+0Y09Faz7fmxNkUt7s/hPZJIBY34QW+zQ5cMMzK+9
 h7iIUNf9p5Elpn19PqvThnZxjNMBOaia8HW72pJ9t30rNckg8HnUpuazx
 CYgTsIo0AYRG0OsvN1sbMfogjSlqJfJ0r8j6536aGKFQwoM0CqrW6zvIf g==;
X-IronPort-AV: E=Sophos;i="5.97,257,1669100400"; d="scan'208";a="134605326"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Jan 2023 05:07:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 05:07:41 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Mon, 30 Jan 2023 05:07:37 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>
Subject: [PATCH 5/8] ASoC: mchp-spdifrx: use unsigned long to store
 clk_get_rate() value
Date: Mon, 30 Jan 2023 14:06:44 +0200
Message-ID: <20230130120647.638049-6-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130120647.638049-1-claudiu.beznea@microchip.com>
References: <20230130120647.638049-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

clk_get_rate() returns an unsigned long. Use a variable of type
unsigned long to store it.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 sound/soc/atmel/mchp-spdifrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index b81fc77728df..90b2fb3a9844 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -764,8 +764,8 @@ static int mchp_spdifrx_rate_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
 	struct mchp_spdifrx_dev *dev = snd_soc_dai_get_drvdata(dai);
+	unsigned long rate;
 	u32 val;
-	int rate;
 
 	mutex_lock(&dev->mlock);
 
-- 
2.34.1

