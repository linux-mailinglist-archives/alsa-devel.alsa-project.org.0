Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C10AC3714
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 16:23:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CC141674;
	Tue,  1 Oct 2019 16:22:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CC141674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569939814;
	bh=y4JrSc4V9v/rRxRTB28kiDJlp3UfHOcp/7UuyHAHcxM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hnvuShy4mSY8Da2Jzak3KKRV7iEL1rQpAONtfp41cOJ8yaVaUcn9W58zpGSyixHK8
	 3AhhJqx56yVgxUbjeXaLeqhRg0I6ePS0r4KrPPycJFJQhqMU6RPpU/Es2HXJaStbbL
	 IUAVTbCoV7xCquJWWUipO2aqMtR/PmSfwOsFGZ/4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B32EF805F9;
	Tue,  1 Oct 2019 16:21:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FD6CF805E1; Tue,  1 Oct 2019 16:21:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0F27F800DE
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 16:21:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0F27F800DE
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MfHIb-1hdFVk2Qsl-00gpsk; Tue, 01 Oct 2019 16:21:19 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Mark Brown <broonie@kernel.org>
Date: Tue,  1 Oct 2019 16:20:55 +0200
Message-Id: <20191001142116.1172290-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:+NFFLFJ3uAstZ1v7XE2zMOHO+xPwR8CCKuSDvkVLAs/dyvEYV3F
 aaVJU2YkvLHOqLAuS7f9B4FjeRy1ETJZw1B302gdLNKywdIJI+RHoRz829Uot1Xqu5n044o
 QDcIQIsRro/+0s1ix2XUe/LSCIcgkeSVbGW7ySGKqzSalU5mdCbZOP7CNNnpJVyM5u+p3wZ
 otEMA5Wodj9hFYD6bq/gA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nYhBuPR5Iho=:ywwtGfzj2glibkVf1yv+gi
 4DmdK8oqUXYdcCXJg3dN4ao1auIJ7AoklVMPqXSk/ASTz2mL0PLYizTJwV7BjfkihoLUh6Rmv
 gRaA29X3chqm9b2h2HCkJAtzoqkI+MdFw+DFakAUqJHjwVKtaD1B5iK4vcwDQSGF3sKKK48Vn
 nBmhc5OwHOrYWL5qaHUF7W4h8K0BGDRQOtzWx0CVAkKdg/I5Xrbd814iywOfdzKxspYPuZ6zw
 41RjVQdSMCKa7rz/A0bVPGfA6Hb9ksfWfqMJK5Gmzlh8xzisujMCBPGjxkfmWxHgnjDFelVlS
 AHzS0a2B7ClTvXIlZ8Z6h9evppl4mCSjpioDFzzo9tk8yL6peEDWUbTwBABFbZ9vcO4toPwql
 4JLP5+nRC5qaeDPJhGs2ndvbNJsnRJYdQ/vN0yXQR+BFHcPvN/mg8DFevnbOJLLXDIi1o/nwK
 L6c9geQnbF9WBynAIo26Vzx9XbYDxAhLCwrSMcOfK0eFxxjaT7Igur2ZIsKKzcKGYz03lAz+h
 Drp2B/kIsjfgxR8oVoY7R3rhOKGGTaag7KkeiHTGe6Klv3B2883391qk/m6l8lfnn9YrYSfVD
 ySiKlqfnENrqraZsrxcryA4IpXnirQfUIqZPTUvookUNafdlET8LIFvPhDcGqjr+19Cb1G8Yv
 oOMefwPdLKX6oo8FyfrrobfB25WEL2laYKjxwbmjBmBOP82IZssbaHWSDFUvpH4cuaqhF2Dn+
 UZNAUt0yKZaP4fmpNMt879HOaqhwi3vk63z1kWPYXWueVrqayPKcAbKN7xl2dX2TBXiX5OxON
 xb2I1BdJnYNtZsLCKWtYjIyHK1k6DE5IutltpsdfFQecZkMafzDOFmuBQmD5PURSV2aXgh12e
 V4PLmfYOqg71TeZg6aeQ==
Cc: alsa-devel@alsa-project.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Takashi Iwai <tiwai@suse.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH] ASoC: atmel: fix atmel_ssc_set_audio link
	failure
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The ssc audio driver can call into both pdc and dma backends.  With the
latest rework, the logic to do this in a safe way avoiding link errors
was removed, bringing back link errors that were fixed long ago in commit
061981ff8cc8 ("ASoC: atmel: properly select dma driver state") such as

sound/soc/atmel/atmel_ssc_dai.o: In function `atmel_ssc_set_audio':
atmel_ssc_dai.c:(.text+0xac): undefined reference to `atmel_pcm_pdc_platform_register'

Fix it this time using Makefile hacks and a comment to prevent this
from accidentally getting removed again rather than Kconfig hacks.

Fixes: 18291410557f ("ASoC: atmel: enable SOC_SSC_PDC and SOC_SSC_DMA in Kconfig")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/atmel/Kconfig  |  4 ++--
 sound/soc/atmel/Makefile | 10 ++++++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/soc/atmel/Kconfig b/sound/soc/atmel/Kconfig
index f118c229ed82..25c31bf64936 100644
--- a/sound/soc/atmel/Kconfig
+++ b/sound/soc/atmel/Kconfig
@@ -10,11 +10,11 @@ config SND_ATMEL_SOC
 if SND_ATMEL_SOC
 
 config SND_ATMEL_SOC_PDC
-	tristate
+	bool
 	depends on HAS_DMA
 
 config SND_ATMEL_SOC_DMA
-	tristate
+	bool
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 
 config SND_ATMEL_SOC_SSC
diff --git a/sound/soc/atmel/Makefile b/sound/soc/atmel/Makefile
index 1f6890ed3738..c7d2989791be 100644
--- a/sound/soc/atmel/Makefile
+++ b/sound/soc/atmel/Makefile
@@ -6,8 +6,14 @@ snd-soc-atmel_ssc_dai-objs := atmel_ssc_dai.o
 snd-soc-atmel-i2s-objs := atmel-i2s.o
 snd-soc-mchp-i2s-mcc-objs := mchp-i2s-mcc.o
 
-obj-$(CONFIG_SND_ATMEL_SOC_PDC) += snd-soc-atmel-pcm-pdc.o
-obj-$(CONFIG_SND_ATMEL_SOC_DMA) += snd-soc-atmel-pcm-dma.o
+# pdc and dma need to both be built-in if any user of
+# ssc is built-in.
+ifdef CONFIG_SND_ATMEL_SOC_PDC
+obj-$(CONFIG_SND_ATMEL_SOC_SSC) += snd-soc-atmel-pcm-pdc.o
+endif
+ifdef CONFIG_SND_ATMEL_SOC_DMA
+obj-$(CONFIG_SND_ATMEL_SOC_SSC) += snd-soc-atmel-pcm-dma.o
+endif
 obj-$(CONFIG_SND_ATMEL_SOC_SSC) += snd-soc-atmel_ssc_dai.o
 obj-$(CONFIG_SND_ATMEL_SOC_I2S) += snd-soc-atmel-i2s.o
 obj-$(CONFIG_SND_MCHP_SOC_I2S_MCC) += snd-soc-mchp-i2s-mcc.o
-- 
2.20.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
