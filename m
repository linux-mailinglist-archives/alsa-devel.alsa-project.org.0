Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE062888EB
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Oct 2020 14:37:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F5D215F9;
	Fri,  9 Oct 2020 14:36:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F5D215F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602247057;
	bh=AESnrxLmZbTnhnd7ZMZRicXeBptBo7pSE9m/WI+ocoU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nuNfSf2650Po3+xoUy9Rg19xEcuDn8O188V3sh+1xer/uwYWXHdfi1oyeC6LRl6jL
	 kk1YMYvET4z+ITPI9qdk3uTN7X/NIpj0by/B7Ku2L7L/6192Tim58nuLCeQA8iONUk
	 TTZ0n8LInymRz0EVpE5rUI1paivnPpFCrkoylQzM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5751AF80165;
	Fri,  9 Oct 2020 14:35:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 912B8F8015B; Fri,  9 Oct 2020 14:35:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa4.microchip.iphmx.com (esa4.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51520F80128
 for <alsa-devel@alsa-project.org>; Fri,  9 Oct 2020 14:35:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51520F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="PlRN6g92"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1602246952; x=1633782952;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AESnrxLmZbTnhnd7ZMZRicXeBptBo7pSE9m/WI+ocoU=;
 b=PlRN6g92Gsc8FDbrTnDnESNK0pYSap5rOzEx+N7BTUk8G/DnXaZimc12
 Wn0hURa/fsfdS3r+92T/8HjFHsXBoJ5F6vAYQSnnrmzt5p3P4hl7l2Lgj
 eVFraJxI8V9pMc0ye79MrkU+TH9eBdxfffJBcPMJvrm7yZt17QCsoL/K9
 q20K1Ue/XobBES6NnVYexIOG7u/2hTVe5V2cg0OurruzdtodOAa+sorkX
 0iTS6pCIAAsD4y0EtXEPNKIjxjf+JyrQhbo+tT8b5aMlObvDMHhohcUly
 T3TIngL56oPjGuOFNgt8WsdG3sfHt43MBApkH+CMRJxP7iCygqHLEPkPE Q==;
IronPort-SDR: CNb0lpvZ8TrLUpmO2ImDhgrCrYBTvSGcOL+6Csja67DEwSRm/D9S8DaCVgQGkv1RWjp2pM4vU9
 90uPw06o5llwOZuiS6jxsT3H8NzbfZVPerBtg+y7pxMQK/Z5Vyn5gheX8rsAe7KSFR29WonilI
 hMU1oY6jG8ubrmBRKgDv6FayEs0OV+WDtOJNomQ5ta65cULTjaOXqxGik2m3G3eruCFIWOtkG6
 m3+IUqhiM5dd07il/CYFX33//aKTO0+FNAvGXx0OiuUUOLrTYGHldoq0kcF21rF/VgSbV4VFuX
 XuU=
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="89704623"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Oct 2020 05:35:47 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 9 Oct 2020 05:35:13 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 9 Oct 2020 05:35:02 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: mchp-spdiftx: remove 'TX' from playback stream name
Date: Fri, 9 Oct 2020 15:35:27 +0300
Message-ID: <20201009123527.2770629-1-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alexandre.belloni@bootlin.com, lgirdwood@gmail.com,
 nicolas.ferre@microchip.com, ludovic.desroches@microchip.com,
 broonie@kernel.org, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
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

Do not include the 'TX' in the stream name since it's obvious for
playback.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 sound/soc/atmel/mchp-spdiftx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index 36c23eb3a5ad..82c1eecd2528 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -744,7 +744,7 @@ static struct snd_soc_dai_driver mchp_spdiftx_dai = {
 	.probe	= mchp_spdiftx_dai_probe,
 	.remove	= mchp_spdiftx_dai_remove,
 	.playback = {
-		.stream_name = "S/PDIF TX Playback",
+		.stream_name = "S/PDIF Playback",
 		.channels_min = 1,
 		.channels_max = 2,
 		.rates = MCHP_SPDIFTX_RATES,
-- 
2.25.1

