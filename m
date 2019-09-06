Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 685A7ABD81
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 18:16:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3AA5886;
	Fri,  6 Sep 2019 18:15:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3AA5886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567786577;
	bh=eG1WejwJ3pnQ0a3jxiCoI3C0qQlbOU9PMwoO95vb4QE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d58m5tAf2hvSvSTqIOlbppi8/XKUVLUyQ/7LpcEew5cjz00x8V6AgDPBGezlnfF9u
	 kLXJYYEuP1KtAjdn3wPdGDRn89g3vCM3hwVhPS9NtMYkEKwC33rSgkwbQv2mUGcBI6
	 uTaePeSrTObyPInHuVuCgouYHRfmbBEzykqEgEhE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C13FEF80394;
	Fri,  6 Sep 2019 18:14:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1E18F80394; Fri,  6 Sep 2019 18:14:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D15EF80171
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 18:14:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D15EF80171
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1i6Gs8-0006ps-DW; Fri, 06 Sep 2019 16:14:04 +0000
From: Colin King <colin.king@canonical.com>
To: Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Date: Fri,  6 Sep 2019 17:14:04 +0100
Message-Id: <20190906161404.1440-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: codecs: ad193x: make two arrays static
	const, makes object smaller
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

From: Colin Ian King <colin.king@canonical.com>

Don't populate the arrays on the stack but instead make them
static const. Makes the object code smaller by 37 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  16253	   7200	      0	  23453	   5b9d	sound/soc/codecs/ad193x.o

After:
   text	   data	    bss	    dec	    hex	filename
  16056	   7360	      0	  23416	   5b78	sound/soc/codecs/ad193x.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/ad193x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/ad193x.c b/sound/soc/codecs/ad193x.c
index fb04c9379b71..980e024a5720 100644
--- a/sound/soc/codecs/ad193x.c
+++ b/sound/soc/codecs/ad193x.c
@@ -416,7 +416,7 @@ static struct snd_soc_dai_driver ad193x_no_adc_dai = {
 /* codec register values to set after reset */
 static void ad193x_reg_default_init(struct ad193x_priv *ad193x)
 {
-	const struct reg_sequence reg_init[] = {
+	static const struct reg_sequence reg_init[] = {
 		{  0, 0x99 },	/* PLL_CLK_CTRL0: pll input: mclki/xi 12.288Mhz */
 		{  1, 0x04 },	/* PLL_CLK_CTRL1: no on-chip Vref */
 		{  2, 0x40 },	/* DAC_CTRL0: TDM mode */
@@ -432,7 +432,7 @@ static void ad193x_reg_default_init(struct ad193x_priv *ad193x)
 		{ 12, 0x00 },	/* DAC_L4_VOL: no attenuation */
 		{ 13, 0x00 },	/* DAC_R4_VOL: no attenuation */
 	};
-	const struct reg_sequence reg_adc_init[] = {
+	static const struct reg_sequence reg_adc_init[] = {
 		{ 14, 0x03 },	/* ADC_CTRL0: high-pass filter enable */
 		{ 15, 0x43 },	/* ADC_CTRL1: sata delay=1, adc aux mode */
 		{ 16, 0x00 },	/* ADC_CTRL2: reset */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
