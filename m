Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1667A6A6BDF
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Mar 2023 12:41:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9868D1D7;
	Wed,  1 Mar 2023 12:41:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9868D1D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677670910;
	bh=0sZyrt4VnnZxnHrao1ck3NRJLPAVFkEpYF9Axnjts2Y=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tyhEasrPd3gistUJhIviUn8r1oa79g47IGkyzXxNvj/anHn9rvN1QX0YjbZGXK3QR
	 9uKmByYlVPdSx6Pt9B8PppjVNvfef1iysecIp2aLDBf0K175ckcQgANJSpOjIIIj8L
	 oM9cYfv3B+wEz/3qZ2dNz4pKK04PKJO3nVRMQKL4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77E2AF80567;
	Wed,  1 Mar 2023 12:39:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A8DCF8056F; Wed,  1 Mar 2023 12:39:07 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FBF6F8055C
	for <alsa-devel@alsa-project.org>; Wed,  1 Mar 2023 12:39:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FBF6F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=zB/H3/SO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677670745; x=1709206745;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0sZyrt4VnnZxnHrao1ck3NRJLPAVFkEpYF9Axnjts2Y=;
  b=zB/H3/SOJMNixm6uC70eTjmix5bq8vx+43nDqmhSaBgJjyRWfpx/1gk5
   mpTvWtQveEQvEFG4mDcwxH1rQPwCCBsZEJ3AsXU8B1fpPxMSkaw5VksPV
   3T3aZwU/3mHE7u9E0fmh9SAeWT2WDxk7xWRJXrb6UJmBkn8K7TJHz0JQe
   DG+0rf7ZeXHp2Ehfbd3fTkDDMDekpvcqgVZMPXdVdxLxVt1CfhVTmt7Xh
   iwrO0Up8Qnn9liC5JFTPHtCJ5TYZqMmESDhdEfVaRWjPSDfp9pOPx/0wN
   1Vy1V8QxhH011QjkwFRdR2RzzY75VCd9yhGOXxOWd0LTsF+11KBfKxFkG
   w==;
X-IronPort-AV: E=Sophos;i="5.98,224,1673938800";
   d="scan'208";a="199325323"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2023 04:39:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Mar 2023 04:38:56 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 1 Mar 2023 04:38:50 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: [PATCH 7/8] MAINTAINERS: add myself as maintainer for Microchip AT91
 sound drivers
Date: Wed, 1 Mar 2023 13:38:06 +0200
Message-ID: <20230301113807.24036-8-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301113807.24036-1-claudiu.beznea@microchip.com>
References: <20230301113807.24036-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Message-ID-Hash: 4PVMEBLWS2MWWRORPIWMXDU6MFGV246P
X-Message-ID-Hash: 4PVMEBLWS2MWWRORPIWMXDU6MFGV246P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4PVMEBLWS2MWWRORPIWMXDU6MFGV246P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Codrin is not with Microchip anymore. As I worked lately with Microchip
AT91 sound drivers add myself as maintainer for these.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e246c16aff6..252cc33f0f5c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13666,7 +13666,7 @@ F:	Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
 F:	drivers/spi/spi-at91-usart.c
 
 MICROCHIP AUDIO ASOC DRIVERS
-M:	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
+M:	Claudiu Beznea <claudiu.beznea@microchip.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
 F:	sound/soc/atmel
@@ -13833,7 +13833,7 @@ S:	Supported
 F:	drivers/spi/spi-atmel.*
 
 MICROCHIP SSC DRIVER
-M:	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
+M:	Claudiu Beznea <claudiu.beznea@microchip.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 F:	drivers/misc/atmel-ssc.c
-- 
2.34.1

