Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7B48F24C
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:34:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D826A169C;
	Thu, 15 Aug 2019 19:33:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D826A169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565890476;
	bh=yJZj1e5fLBNKoSHc0QD47gma+TuEfwMUvBzoarXNIO4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=vRxOcxVCH7/962TRJH0RFIM3a+ooxPTy6ql1TU9HXNrv5c/8h7t4E+NnpAvtInlsz
	 1gHcUHNdx22uzycIMqM24+wVS+dg7uCxVm9KBP3XlA5VJxssS/SvGJBLIOOO4H/BDx
	 mXgEsE7UNFhJ6oALyGd7VIT9pVW3dB7tpVvGZLe8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A9BEF808F5;
	Thu, 15 Aug 2019 19:16:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55415F805FF; Thu, 15 Aug 2019 19:15:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com
 [209.85.128.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81F27F8060F
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:14:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81F27F8060F
Received: by mail-wm1-f99.google.com with SMTP id 10so1879697wmp.3
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:14:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=CnBCQCl8HgGtRAslD3BhGDm2lZeAd4b8wc+xobzHTtE=;
 b=a9tbfVHRZuZHDHwcAXJTVdiOIZCP7OrQm9vqzlzSMzw2d0PL9PRq6WoUUxyiw6xxFK
 UfBPlnIdZAC9ZeWXbVWBCNrZuSEj5dh2g+soiNv6tXkphDgzoblNfOdoGy85WnY8/ks0
 xhGxxvEjXkyxezqJyRqjeiQog7AuBFIHVkGn7amq5A0Gb0VPXYt/9OFhtvNa/NHWnZy0
 RRYrgwrxWFHEmJ400qz8LUCWE3KuYM9huWzOZgdEl0LchDdpHWHdJYV2hP/Ez5cG/08e
 lpBcZf0BeUWgus/unOlwnEgMx9ynthHJVs8nXP36BF77ZGzwZ/Bhn9dXfv1ABheEbZxy
 1CNA==
X-Gm-Message-State: APjAAAVKiCxdMGcuQWkWfrJA7zhXohhjZ/1eYPk2jFgRIPevKY9yLivt
 M727e/5lqsmAwMKGGLMLnFQNzdTK5uKGTJPJ34E10Bnrbmgafb6dEB9aD19jUe8RCQ==
X-Google-Smtp-Source: APXvYqzF9p1m8pQLSYHcZd54ZXHssvs7mOElBrJ3n7sLNitdfagAUctF4SZiOcG91ZIiZMiKr3Spp9T/hSsU
X-Received: by 2002:a1c:a1c1:: with SMTP id k184mr3836224wme.81.1565889268788; 
 Thu, 15 Aug 2019 10:14:28 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id v11sm7554wmh.27.2019.08.15.10.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:14:28 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJKW-00052e-HJ; Thu, 15 Aug 2019 17:14:28 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 16A862742B9E; Thu, 15 Aug 2019 18:14:28 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Cheng-Yi Chiang <cychiang@chromium.org>
In-Reply-To: <20190813074430.191791-1-cychiang@chromium.org>
X-Patchwork-Hint: ignore
Message-Id: <20190815171428.16A862742B9E@ypsilon.sirena.org.uk>
Date: Thu, 15 Aug 2019 18:14:28 +0100 (BST)
Cc: alsa-devel@alsa-project.org, tzungbi@chromium.org,
 Heiko Stuebner <heiko@sntech.de>, zhengxing@rock-chips.com,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 jeffy.chen@rock-chips.com, cain.cai@rock-chips.com, dianders@chromium.org,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 eddie.cai@rock-chips.com, Takashi Iwai <tiwai@suse.com>,
 enric.balletbo@collabora.com, dgreid@chromium.org,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: rockchip: rockchip_max98090: Set period
	size to 240" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: rockchip: rockchip_max98090: Set period size to 240

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 7188f656cdf762d4ea8ce16b6aaf4c6b06e119ec Mon Sep 17 00:00:00 2001
From: Cheng-Yi Chiang <cychiang@chromium.org>
Date: Tue, 13 Aug 2019 15:44:30 +0800
Subject: [PATCH] ASoC: rockchip: rockchip_max98090: Set period size to 240

From stress testing of arecord, we found that period size
greater than ~900 will bring pl330 to DYING state and
can not recover within 100 iterations.
The result is that arecord will stuck and get I/O error,
and issue can not be recovered until reboot.

This issue does not happen when period size is small.
Set constraint of period size to 240 to prevent such issue.
With the constraint, there will be no issue after 2000 iterations.

We can revert this patch once the root cause is found
in rockchip's pl330 implementation.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
Link: https://lore.kernel.org/r/20190813074430.191791-1-cychiang@chromium.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/rockchip/rockchip_max98090.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index 782e534d4c0d..d54f672d38d8 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -138,8 +138,19 @@ static int rk_aif1_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static int rk_aif1_startup(struct snd_pcm_substream *substream)
+{
+	/*
+	 * Set period size to 240 because pl330 has issue
+	 * dealing with larger period in stress testing.
+	 */
+	return snd_pcm_hw_constraint_minmax(substream->runtime,
+			SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 240, 240);
+}
+
 static const struct snd_soc_ops rk_aif1_ops = {
 	.hw_params = rk_aif1_hw_params,
+	.startup = rk_aif1_startup,
 };
 
 SND_SOC_DAILINK_DEFS(hifi,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
