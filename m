Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3E56A6BE1
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Mar 2023 12:42:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3469F1DA;
	Wed,  1 Mar 2023 12:41:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3469F1DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677670925;
	bh=Y7gJN/0y8MxfRhsCcPrVR7dxAp760NI/rHw1ZXLbncM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I5TEehQewy4xsrHbzUYhAvULbaVfq6/G+PmJ630vjC2OgsRRW9dWRyz0kX11TL3dX
	 jD7DdD8hhPXZgvKTKHS9t/yZnuaz6RmNp3306284ljVCASxXOO2W0X3dTpQ0b9uhOf
	 DJB+s5S/c+BVZAoLkzj2QxM4zYFqgQDvJ+hC4lXE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10AEDF80571;
	Wed,  1 Mar 2023 12:39:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EF18F80568; Wed,  1 Mar 2023 12:39:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49936F80564
	for <alsa-devel@alsa-project.org>; Wed,  1 Mar 2023 12:39:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49936F80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=BAgh9PLU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677670746; x=1709206746;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y7gJN/0y8MxfRhsCcPrVR7dxAp760NI/rHw1ZXLbncM=;
  b=BAgh9PLUDKoa4NsEl2+jhkKBnTMGpWP3Hs8OEGHjjnbZKFtuGClI5fGk
   qy0KafwOQ8dHbiOwUudHVH2zXQF1MFURGGQkzobb1A5M+J7HwSMB4Nmgd
   fntQa07XD6r0jcKQ6FY+OMMB/AcL1Q/QJhy/qoCQt4W/GgxVVYrCCcj0E
   +Sh+5QCaNAKrEOj8G4nzXzHiFNUkxq4Wp8F9QkZkhS3RXsniLSOlucjxK
   5+1prm5UlEk5aHI8QuXwxx9YiqahuzvLSbcC9XeSa5lwZ433Hm/jWdESe
   Gg12CSugTIHKJn6H8CAsbh+Watyo/3dXN3pIPdjo7jNaIcoY6HR+MnIy1
   g==;
X-IronPort-AV: E=Sophos;i="5.98,224,1673938800";
   d="scan'208";a="214196885"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2023 04:39:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Mar 2023 04:39:00 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 1 Mar 2023 04:38:56 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: [PATCH 8/8] MAINTAINERS: update Microchip AT91 sound entries with
 documentation files
Date: Wed, 1 Mar 2023 13:38:07 +0200
Message-ID: <20230301113807.24036-9-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301113807.24036-1-claudiu.beznea@microchip.com>
References: <20230301113807.24036-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Message-ID-Hash: 6NV4YMEJFPE3QT2SVUVQEJ5WDTLGJHZQ
X-Message-ID-Hash: 6NV4YMEJFPE3QT2SVUVQEJ5WDTLGJHZQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6NV4YMEJFPE3QT2SVUVQEJ5WDTLGJHZQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add documentation files to Microchip AT91 sound entries.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 252cc33f0f5c..b5a966f84d89 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13669,6 +13669,10 @@ MICROCHIP AUDIO ASOC DRIVERS
 M:	Claudiu Beznea <claudiu.beznea@microchip.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
+F:	Documentation/devicetree/bindings/sound/atmel*
+F:	Documentation/devicetree/bindings/sound/axentia,tse850-pcm5142.txt
+F:	Documentation/devicetree/bindings/sound/microchip,sama7g5-*
+F:	Documentation/devicetree/bindings/sound/mikroe,mikroe-proto.txt
 F:	sound/soc/atmel
 
 MICROCHIP CSI2DC DRIVER
@@ -13836,6 +13840,7 @@ MICROCHIP SSC DRIVER
 M:	Claudiu Beznea <claudiu.beznea@microchip.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
+F:	Documentation/devicetree/bindings/misc/atmel-ssc.txt
 F:	drivers/misc/atmel-ssc.c
 F:	include/linux/atmel-ssc.h
 
-- 
2.34.1

