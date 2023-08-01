Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 382AC76FD7F
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 11:38:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8B2D1E2;
	Fri,  4 Aug 2023 11:37:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8B2D1E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691141907;
	bh=APvmFx+ixVZPNNg9SQLgbVZGoledUVf4eez0op5aHUo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tNig7QnOSSK9ObpzzQpEDohEdXlXLgBk7YJeI3d8c6Tj79KhscKJr8JQ9d/r2ESog
	 fYkitoaiUERHAQ4tBXj3hsazk+dMSwaCZN5FSi1OudLLpR1Jqmo68vzbMogaVts2xs
	 8R7mvcSwYQyuU7BcvUjrFmPuYo/l3WwV7muwZnP4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB659F8015B; Fri,  4 Aug 2023 11:37:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 982C5F801D5;
	Fri,  4 Aug 2023 11:37:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8F7AF801D5; Tue,  1 Aug 2023 18:06:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HELO_DYNAMIC_IPADDR,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RDNS_DYNAMIC,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com
 [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05E63F80087
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 18:05:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05E63F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256
 header.s=s201512 header.b=v/etJO1I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1690905931;
	bh=OMeXsTEoSV37i5q3b+jlJxSVQJjMWTEe0h/gT1sAYts=;
	h=From:To:Cc:Subject:Date;
	b=v/etJO1I/XGgjVtV8dSMgQo6NExGr6Mj4/9tGODLapml58371/LsVKjsvfxvUmICU
	 X+riAjxSNERN7vidUO7Rt2koXHfGcnRiLILH2xA3onspNA2typQgjGE8LSPsNJ7P1P
	 Lh61wCIwkKXw4/4C+c/ZWwnZnCKOTwl/cC1IpklE=
Received: from KernelDevBox.byted.org ([180.184.51.134])
	by newxmesmtplogicsvrsza10-0.qq.com (NewEsmtp) with SMTP
	id ECCB1097; Tue, 01 Aug 2023 23:59:12 +0800
X-QQ-mid: xmsmtpt1690905552tyfhwer0f
Message-ID: <tencent_A560D01E3E0A00A85A12F137E4B5205B3508@qq.com>
X-QQ-XMAILINFO: NGS5xw3DVfAMV/jfbZlCf9owjwKZJdc3ehD5Gs0w53jsUCSTCupG6mehI+9XiQ
	 uXUUz5H8aBY/XIKy9L6NsIq/3YoujfAQN2JwExL7Kl2PVe1wmxQtqGeXQjWXMd+lxX7p6tm1mXix
	 MkMo4Mmm4aFi/v4OD2ANDG5xylKl9J6H6HNvY/WmuudbwgVRDSswAJi5svJFF6dOFWkIEAz7IVjZ
	 74yYk9MkQli4YXGENrXXJXfONnFxdxoiPO988ZMSaZS0l7GiLStQIy/lY9dZoiedHvts0gczYPZY
	 BWPgLq3mlLYK6iAxiH4xAlY2KkPGNA8Xv9LObpMyRqqwSLrsblrxrvLhxL53U/96utkUSD6iMIeo
	 nsVcfQwXKOQlP/B9wGjaxVtc0N6y7FYmB/5flfRfQW6KANAsH7jv7CwTjIadrDnYCsvHpjUro5rR
	 0IlZ8+yXg3KG44KrXMPFWdxYHvibSXIw85NkJ+/xYQ5anwyuGAe0scJO8uYgrjOTaN5MvyRD1dST
	 Rr7TjrHTHF2su1kXAPnnyq04g83Ozp9iyLqmBpBp3oPvIYPhI5BimwcZUodKMnIk3WAnohowjV7Z
	 zOcMK/hepZQVDukqM7kMOU9osC0fXBrk9hdehVk7qHSsTjEx1UHESFUEWubSuvggn9qGdHIFY7tA
	 RY3ireifn37EbPmjUdUIgpxv+6n0y7Rq1Xeg+ZLIlQqNeuW6Es49rv4JS8dcs+kWe1OwE6FI3uCa
	 S+BSS8vSydaExCqfqIrBmBNAqdg4mdd9AJf32mYXm4uSEnEIEo7jZT0OnfhHkzhGJ/LzaoLroXc7
	 xZcupIy4mk0KJPSb/Zpect3SvgzKAdPNEbA3H+p5puq3ajD33g63C67af2PuJjWpWe/3myNAWn0W
	 oknMsFGurP/K0TrKyzq46RFZRL8H2qIND38vVntWugtZqbWUPXF0NZMLL1oD48afO5HwBBSVAO/x
	 cyyty2ptUVyMYqLeSeucMT/SYpTdHUe97ZWEOUpCUGt9Rqj4/dHqjkRlICiedJhSEiMAwKyg6kH6
	 gNZ5kf+Q==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: broonie@kernel.org,
	oder_chiou@realtek.com
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Zhang Shurong <zhang_shurong@foxmail.com>
Subject: [PATCH v2] ASoC: rt5665: add missed regulator_bulk_disable
Date: Tue,  1 Aug 2023 23:59:11 +0800
X-OQ-MSGID: <20230801155911.372244-1-zhang_shurong@foxmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: zhang_shurong@foxmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HKSJSGJ5FIA7U7VA3MJZU6YJWMQRCO7U
X-Message-ID-Hash: HKSJSGJ5FIA7U7VA3MJZU6YJWMQRCO7U
X-Mailman-Approved-At: Fri, 04 Aug 2023 09:37:28 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HKSJSGJ5FIA7U7VA3MJZU6YJWMQRCO7U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver forgets to call regulator_bulk_disable()

Add the missed call to fix it.

Fixes: 33ada14a26c8 ("ASoC: add rt5665 codec driver")
Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
---
Changes in v2:
 - move regulator_bulk_disable() in rt5665_remove() 

 sound/soc/codecs/rt5665.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 83c367af91da..525713c33d71 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -4472,6 +4472,8 @@ static void rt5665_remove(struct snd_soc_component *component)
 	struct rt5665_priv *rt5665 = snd_soc_component_get_drvdata(component);
 
 	regmap_write(rt5665->regmap, RT5665_RESET, 0);
+
+	regulator_bulk_disable(ARRAY_SIZE(rt5665->supplies), rt5665->supplies);
 }
 
 #ifdef CONFIG_PM
-- 
2.30.2

