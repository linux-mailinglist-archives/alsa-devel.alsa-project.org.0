Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD9F70A729
	for <lists+alsa-devel@lfdr.de>; Sat, 20 May 2023 12:23:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB7017F8;
	Sat, 20 May 2023 12:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB7017F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684578187;
	bh=oQZDMNvA4lZ5Gv6IEyUH7TDGJZ8MiUuXy7FKamVi3Ko=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Eoc4Jg8BsHGfIZ/IQe4ss9PS+kmCRCS9XSGeX8pDp2OVDv9WEEkEo6ABdRJ4w7G6h
	 thFKI6e4nFAtJ9Q3UbCR/bUS6lRi87EpaN1wI+h6zO9Klx9x0tk/ey+mPUgIN+88oj
	 wQHXURnv/wD/iiEDbDMJEDTcn4Ve5PT/+rNZ8dhA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC62BF80431; Sat, 20 May 2023 12:22:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E738F8025A;
	Sat, 20 May 2023 12:22:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABB83F80272; Sat, 20 May 2023 12:22:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr
 [80.12.242.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CFFDF8016D
	for <alsa-devel@alsa-project.org>; Sat, 20 May 2023 12:22:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CFFDF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=lIHs/qpR
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id 0Jipqvr6aKkqR0JipqDWcb; Sat, 20 May 2023 12:22:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1684578122;
	bh=ngf/sPwJeij1NeBPQTwg+KDLxc9Kn0BOhnZCL74zemE=;
	h=From:To:Cc:Subject:Date;
	b=lIHs/qpRBklVl9lwMU7hCKGV8eG7apemlX21mk6804HvKXRTSLfkIH8NHCpRE4dQZ
	 DZI/UVBbYqVbNPXtLhELkmaGehZcNdySgPNZ7GjZozm98FyQq8LLIaJ9lvJnv+vTI/
	 znqr+toEQWEimCa8GNS16prIL6n3Mued3XLGtLi8MIfS37W/xz4j7R7Rujd24OiwFF
	 oTKurFEa48uXmUjGzVl6BHQSuqXXRBfok6skHw/ohYqaDF+/x4bNMFZku0cp1o/BHD
	 6q1q2rdZS8A4Dk8tf0GZoFoiZ7O0m6j6TtiiCLuaPifDpQ9CVRKV7U/82awVzN6jqu
	 TC1DhVdN/ybiQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 20 May 2023 12:22:02 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Claudiu Beznea <claudiu.beznea@microchip.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ASoC: atmel: sam9g20_wm8731: Remove the unneeded include
 <linux/i2c.h>
Date: Sat, 20 May 2023 12:21:58 +0200
Message-Id: 
 <9b39a59f5829d200d7d1fac4e993dbf8ce05836d.1684578051.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: T252XRJSV6O7PIQCPB2EK7ONOZK6VMRG
X-Message-ID-Hash: T252XRJSV6O7PIQCPB2EK7ONOZK6VMRG
X-MailFrom: christophe.jaillet@wanadoo.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T252XRJSV6O7PIQCPB2EK7ONOZK6VMRG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver does not use i2c, so there is no point in including
<linux/i2c.h>

Remove it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Based on one of my scripts, this reduce the number of included files from
589 to 498
---
 sound/soc/atmel/sam9g20_wm8731.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/atmel/sam9g20_wm8731.c b/sound/soc/atmel/sam9g20_wm8731.c
index baf38964b491..0405e9e49140 100644
--- a/sound/soc/atmel/sam9g20_wm8731.c
+++ b/sound/soc/atmel/sam9g20_wm8731.c
@@ -23,7 +23,6 @@
 #include <linux/timer.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
-#include <linux/i2c.h>
 #include <linux/of.h>
 
 #include <linux/atmel-ssc.h>
-- 
2.34.1

