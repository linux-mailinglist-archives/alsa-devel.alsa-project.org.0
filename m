Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CE7E32B8
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 14:48:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA5EF16DB;
	Thu, 24 Oct 2019 14:47:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA5EF16DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571921289;
	bh=xu+4fd7vq1EJBxovz90VY7xCCSvqBrDnjV/T8npsF/0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kxiSRKTeJsXRqXUxFgjJUOnzZRulXIMffaLzUJAvoAzjelmZVIjM4LkMdeChmSPgE
	 JOOsOAJ2gVnDYo1RmDQI7mfme9bXuKJE6rd/fmd7rD/QEcM5isHNM3kANgu/d60iWw
	 DEBJvqxVuJoM4F1Gi1n+PCVbJreVskZxY+4eMQHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA171F80367;
	Thu, 24 Oct 2019 14:46:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A3A5F8036B; Thu, 24 Oct 2019 14:46:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E32DAF80274
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 14:46:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E32DAF80274
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iNcVG-00080W-U9; Thu, 24 Oct 2019 12:46:11 +0000
From: Colin King <colin.king@canonical.com>
To: Bard Liao <bardliao@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Ben Zhang <benzh@chromium.org>, alsa-devel@alsa-project.org
Date: Thu, 24 Oct 2019 13:46:10 +0100
Message-Id: <20191024124610.18182-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH][next] ASoC: rt5677: Add missing null check for
	failed allocation of rt5677_dsp
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

The allocation of rt5677_dsp can potentially fail and return null, so add
a null check and return -ENOMEM on a memory allocation failure.

Addresses-Coverity: ("Dereference null return")
Fixes: a0e0d135427c ("ASoC: rt5677: Add a PCM device for streaming hotword via SPI")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/rt5677-spi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 36c02d200cfc..3a17643fcd9f 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -376,6 +376,8 @@ static int rt5677_spi_pcm_probe(struct snd_soc_component *component)
 
 	rt5677_dsp = devm_kzalloc(component->dev, sizeof(*rt5677_dsp),
 			GFP_KERNEL);
+	if (!rt5677_dsp)
+		return -ENOMEM;
 	rt5677_dsp->dev = &g_spi->dev;
 	mutex_init(&rt5677_dsp->dma_lock);
 	INIT_DELAYED_WORK(&rt5677_dsp->copy_work, rt5677_spi_copy_work);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
