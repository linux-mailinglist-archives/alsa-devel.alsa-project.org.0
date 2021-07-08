Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC90D3C177A
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 18:54:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66EF03E;
	Thu,  8 Jul 2021 18:53:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66EF03E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625763285;
	bh=4GIPPhBrdHdJUL9/5+uiezV1qgePy68L1K+jZdMKyGs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Aykgy6JFHReBWM4EHFs+rkEMf3aSjNs+/S6FTcF/laBUwOXEkDPcbCDCVOozW+te5
	 3jPGSok4tJjT2B3upvECX+YCeCR63vGdM1CPIVMDRQ73gszexJEK9QTueIE5dZxhb9
	 iXxdbkCyZFOhoI1AplXfPlKKoiclxOjlQxC+CsAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E80C8F80246;
	Thu,  8 Jul 2021 18:53:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B08E5F8012A; Thu,  8 Jul 2021 18:53:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B914F8012F
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 18:53:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B914F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="4PCAkNjq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=/p9/nO2z+HayInnxDJI+dz72S16cGA63N9tpKubBVKA=; b=4PCAkNjqMjk8p1OJecPKtFqN/D
 g5FWsQSxTQbjvX57X8avZFNQWn5c5nfGpFclUeO9j30xiR+rLU5dxzt5VpZJUOvipA7VR2C4TJXtX
 da2kcOi8WP7/V5vWtdE7+LA/KjQRnh8rjSqBuhwG/f4tPwx/ESWkdAZ5ys+4gp3FaaKO5by1AyArI
 qfQqBEeu+Fo9IxSEcIkYEZcKBhg69PG3wi6P/gys8fdxCGdb7IW6ooNeV+TFyXbnDmLXir7rp+sIC
 icbmTHnlbSG/4aO7TUatWKm1bC/dSHgfj88B5h4zvdBS4+lVxZkileHlpB12cCPsUXWeKvbphQ+IT
 VpHa702Q==;
Received: from [2601:1c0:6280:3f0::aefb] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1XGs-00HXIB-AB; Thu, 08 Jul 2021 16:53:07 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4] ASoC: atmel: ATMEL drivers don't need HAS_DMA
Date: Thu,  8 Jul 2021 09:53:05 -0700
Message-Id: <20210708165305.25461-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Mark Brown <broonie@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
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

On a config (such as arch/sh/) which does not set HAS_DMA when MMU
is not set, several ATMEL ASoC drivers select symbols that cause
kconfig warnings. There is one "depends on HAS_DMA" which is no longer
needed. Dropping it eliminates the kconfig warnings and still builds
with no problems reported.

Fix the following kconfig warnings:

WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_PDC
  Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && HAS_DMA [=n]
  Selected by [m]:
  - SND_ATMEL_SOC_SSC [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m]
  - SND_ATMEL_SOC_SSC_PDC [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m]

WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC_PDC
  Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m] && HAS_DMA [=n]
  Selected by [m]:
  - SND_AT91_SOC_SAM9G20_WM8731 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && SND_SOC_I2C_AND_SPI [=m]

WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC
  Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && HAS_DMA [=n]
  Selected by [m]:
  - SND_ATMEL_SOC_SSC_DMA [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m]

WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC_DMA
  Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m] && HAS_DMA [=n]
  Selected by [m]:
  - SND_ATMEL_SOC_WM8904 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && I2C [=m]
  - SND_AT91_SOC_SAM9X5_WM8731 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && SND_SOC_I2C_AND_SPI [=m]

Fixes: eb17726b00b3 ("m32r: add simple dma")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: alsa-devel@alsa-project.org
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Reviewed-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
v2: rebase & resend;
    drop Cc: to Bo Shen <voice.shen@atmel.com> # bounced
v3: drop "depends on HAS_DMA" (as suggested by Codrin; Thanks)
v4: update Fixes: tag as suggested by Codrin (Thanks)

---
 sound/soc/atmel/Kconfig |    1 -
 1 file changed, 1 deletion(-)

--- linux-next-20210707.orig/sound/soc/atmel/Kconfig
+++ linux-next-20210707/sound/soc/atmel/Kconfig
@@ -11,7 +11,6 @@ if SND_ATMEL_SOC
 
 config SND_ATMEL_SOC_PDC
 	bool
-	depends on HAS_DMA
 
 config SND_ATMEL_SOC_DMA
 	bool
