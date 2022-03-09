Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DC64D34D7
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 17:42:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D85711723;
	Wed,  9 Mar 2022 17:41:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D85711723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646844149;
	bh=z+l5m2i50WjAzAsUvcN0jB1uCjRWT9ig0yZG1ojW2I0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K+r7Ze8tSCjMsKxvppF+4jMAVkkKXx+loJ+hAC4JeqH6WMJhZpBgrX3SEBInY0QVf
	 9t18KYddhXIQUEfeSkK4w8AyWlFG5WdRWCJaZhOkXBoe+X5bwM0E5bCG6Rr+1acrQb
	 tKGVuzhlegAHpPiTLdFk7+GN1orgV0hKva8kzLmM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49D08F80236;
	Wed,  9 Mar 2022 17:41:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A7D0F8016C; Wed,  9 Mar 2022 17:41:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47004F800D2
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 17:41:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47004F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AOBKB7Ne"
Received: by mail-wm1-x333.google.com with SMTP id
 k29-20020a05600c1c9d00b003817fdc0f00so1815200wms.4
 for <alsa-devel@alsa-project.org>; Wed, 09 Mar 2022 08:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7x22hoyeECM1u+upqH/e0Xmtm+AvHSl2XKbJTxi43ww=;
 b=AOBKB7Ne7QnmXlHEDX9CGVGVTWCnx6xbpXaD0cyMfd3Yamuk0lqAm0P6x/Aw8yppEH
 tlmPK+WBtZ7A5zmsDdF4wR1H9yjBGQG4NvjlUcqKJy6evXu2EHjq8zjrgrWu9XWX/Rq9
 Q8slrLLsJyFwcMhlACMHlf9f4b4QzlDxle22HU6yajXU1kx/rAGqo1CzglaoHNGqoM8j
 2cC1plJvM6WNSMwPOhDY4pzKzjkIFoU9B0XS3nNUCLyTBZlqMyhS2X27vgsaHxijpKSP
 3wK0j9AOQenwsagUnv4CXl3CqG2d6cJasM63U5WBhZ9oH1zv3MVXtUASU4HK7QYLI4/B
 bQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7x22hoyeECM1u+upqH/e0Xmtm+AvHSl2XKbJTxi43ww=;
 b=f2Q7KNYaWNQUHdUnH1wFjxaMBkU4DySZe8KC5gY02D4geakAREDLSE4vaoP5FRx9tM
 kfUVlfS/vXTrP6SlPMKPVCwYujaMnXHlWU02dym6W8MMCzBt4gZUhauq48Ab3dGEZ0WI
 pCV+avrvxp0jh2EIyFG3vQ+22FcIBWbP62OKxsoHXEsRI+os4kh/GChRmVdssTr/DfhQ
 7vgJGSOHLzHniOjPzczhbr/uc7sNUcqjn99YZNwtoAtxL2NRmmmHmo/7mWkH8sq5/1sH
 zDo4WpzDIT5T/FWPIWmmdrjwDRxw5G8JD9at/tzxczlKuL/7rQkaLZmOwdH0rVh/aS4I
 nPBQ==
X-Gm-Message-State: AOAM5301+yCmPomghq7hqKjtcT/DbnN2Tk/1cw02R5y6S6axHjd3hzMT
 Qs8N6vBKydLeiYq+FoM6ETg=
X-Google-Smtp-Source: ABdhPJw4ogyQTVUBPnGoIt3hnAAKuZHragQxGmxAjdCC1F8j8j0eFa0s8iX9M1hGhdV0n3tqLHgLaQ==
X-Received: by 2002:a1c:f003:0:b0:381:17f5:21b8 with SMTP id
 a3-20020a1cf003000000b0038117f521b8mr192386wmb.158.1646844078137; 
 Wed, 09 Mar 2022 08:41:18 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 v6-20020a5d5906000000b001f0639f69e6sm2169091wrd.55.2022.03.09.08.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 08:41:17 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH][next] ASoC: atmel: mchp-pdmc: Fix spelling mistake
 "microchopnes" -> "microphones"
Date: Wed,  9 Mar 2022 16:41:16 +0000
Message-Id: <20220309164116.178685-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

There is a spelling mistake in a dev_info message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/atmel/mchp-pdmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index c44636f6207d..871834fb9b77 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -892,7 +892,7 @@ static int mchp_pdmc_dt_init(struct mchp_pdmc *dd)
 
 	dd->mic_no /= 2;
 
-	dev_info(dd->dev, "%d PDM microchopnes declared\n", dd->mic_no);
+	dev_info(dd->dev, "%d PDM microphones declared\n", dd->mic_no);
 
 	/* by default, we consider the order of microphones in mchp,mic-pos to
 	 * be the same with the channel mapping; 1st microphone channel 0, 2nd
-- 
2.35.1

