Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E57B1A28F1
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Apr 2020 20:58:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA3681665;
	Wed,  8 Apr 2020 20:57:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA3681665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586372300;
	bh=P/49YBnGxBw/oIdpTVWv5Bf9swSwNgByam97fPxrXKg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uchEJJ5idG+EulerN1CdS8OzdodnM91lfPRTD3dYkc7GyPL1sqbkD1qEjWfnosc1k
	 7oykVpZPmOuyqfodmYSwmwGy0F+UAeYXr/8qf/+u0Jgm5uMnNuNSqubVZ2d2ddb8hT
	 3CBqQaMApg2H/Q4Z65izN9IJ3NHbeXcFB9XFivp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D3FBF8011B;
	Wed,  8 Apr 2020 20:56:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D85D0F8019B; Wed,  8 Apr 2020 20:56:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75A8BF8011B
 for <alsa-devel@alsa-project.org>; Wed,  8 Apr 2020 20:56:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75A8BF8011B
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MmlfM-1iuNB72mjG-00jo1r; Wed, 08 Apr 2020 20:56:11 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: brcm: fix dma_addr_t cast to pointer
Date: Wed,  8 Apr 2020 20:55:51 +0200
Message-Id: <20200408185609.332999-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:eqXjrTR0pH8tvM3YvyxdWJ7p7tY9GX5onuK1UkDKdf2MzUDRbiz
 epzr0xGSysLzCOxlE5VU0aEdCbkvkEO8Awx5xgNCOip2k4eZD1UaVdLaEOmaMSybFOsEXVk
 RViu3Rhl6uCrecckiU+LAHV96tMrXY8o2zphNQ7s8HWV89T1zaHXdVgexKqwKMLJOHBD44/
 p5uNTReKbixxKkUU3CqrQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:saTkIRKQg4o=:LN1fq396PcgVuX7m3vbfBg
 aDfALxrHeoscEQHOKC6NXAXbhEj1fgdMXKYZdKX2z8hEZEIdxSm2xt41heOkgrWwhsojCTqvT
 bYkiyD8aAeAtlIMwpwYA4r5cqXIgOPioY8koW92UYAPyyMlbXMmYhb6zB1jYqU1C8TXNj0y0O
 ZQaiH0IeFSDiLXzMu0i+op4118Mw0wovZ1q1W10kNc9wTrAmLjx+7FySwaEVdcX/dEZorjwYd
 9N+wi/6jgWYUTgqvIWRk6EjxB4vYT1LrnfI44gnROCj2gGKSAVLQukFBGWk2lMmh9aoMjtf1X
 zcGE5No2kx25MimmQrHN6bQNn6T4bCwub/VK+EJhWUM9MaR6C6ioYwfz85QDRAI7fVOyTFH9U
 GQzsUXSIqqMWC4yoPjG0sEfr7M5tg2lj6hoXLle3rAp7gbobPtRcS1rcI8NyOoq7VBvMOjO3K
 O6eihDKGCLnswjyztnM9nqXIoqMb4eUYI+afyZQTGeDlYkNinFOfCwRZvMgUYkS/QG3HZLxLR
 hTmQF48jvx7i+0Pf+0rleBCBwGiAUq57SH4s4MCcP3RK1Ma18iGbmn+m5zGIz97B43qXNpNIO
 erxwU/p0AAJGKZbF0yHgScVtAu3si5tca5wQtxP4t8hjrG6D8kTkknAoaBw2IzMUAuET/ubzX
 mkXb/gsDcMCFJkW9LaFXPfVdqfr5TMBn7xwncQ8vj6dUwTJTofaIl6/gw/zh1V7W14YbDnxvN
 apiP1XsPBKk+/gMCHeNh9qO0nab8DSY8q8FGu4+UoylYOC+KlKa3O/+cej0eK2KNwJg1Mi1Cn
 DiIs4ZDTy4/kN+FO6Sz3P473BE/j8Oo+NZcvATWsVRKyytN7oE=
Cc: alsa-devel@alsa-project.org, Florian Fainelli <f.fainelli@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Li <kevin-ke.li@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org
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

A dma_addr_t is not a pointer and a cast causes a warning when
the sizes are different:

sound/soc/bcm/bcm63xx-pcm-whistler.c: In function 'bcm63xx_pcm_pointer':
sound/soc/bcm/bcm63xx-pcm-whistler.c:184:6: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
  184 |  if ((void *)prtd->dma_addr_next == NULL)

Change the comparison to NULL to an equivalent if() check that
does not warn.

Fixes: 88eb404ccc3e ("ASoC: brcm: Add DSL/PON SoC audio driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/bcm/bcm63xx-pcm-whistler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/bcm/bcm63xx-pcm-whistler.c b/sound/soc/bcm/bcm63xx-pcm-whistler.c
index e46c390683e7..b7a1efc7406e 100644
--- a/sound/soc/bcm/bcm63xx-pcm-whistler.c
+++ b/sound/soc/bcm/bcm63xx-pcm-whistler.c
@@ -181,7 +181,7 @@ bcm63xx_pcm_pointer(struct snd_soc_component *component,
 	snd_pcm_uframes_t x;
 	struct bcm63xx_runtime_data *prtd = substream->runtime->private_data;
 
-	if ((void *)prtd->dma_addr_next == NULL)
+	if (!prtd->dma_addr_next)
 		prtd->dma_addr_next = substream->runtime->dma_addr;
 
 	x = bytes_to_frames(substream->runtime,
-- 
2.26.0

