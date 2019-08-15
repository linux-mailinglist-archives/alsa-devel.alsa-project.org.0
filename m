Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0C38F229
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:28:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80659845;
	Thu, 15 Aug 2019 19:27:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80659845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565890107;
	bh=7bB7avYFeGT/XDr8V/HNiZO/+Ht37qDMiFEhtMhbSJY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=kyp6WmQycJdMiFFBaC+HoOPb9z+wkKnW45gUxaF7ZR7CdHOza5D42C2Xwe9kKpViZ
	 38U3NCL1VsIWXBB29nH318PkR1yY/6niR1frPDtM+g5wfBEY3/Q1z0gBKRB2C6hbJl
	 PB+AUfewOS+Gd0VMYSFPVoS1P1E98X7VvThdkPU4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B38E3F8074B;
	Thu, 15 Aug 2019 19:15:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B68B5F806F7; Thu, 15 Aug 2019 19:15:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f97.google.com (mail-wm1-f97.google.com
 [209.85.128.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2186EF805F7
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:14:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2186EF805F7
Received: by mail-wm1-f97.google.com with SMTP id v19so1862287wmj.5
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=As7fyYskNE9XkOFuyeFj945AGI82kd3wgq/f8U00wio=;
 b=aOq7YWd0/Kk/cPnAw3liCWGM25j5lLBN/669859Af7aJh2iaCjzjTiiJeSJaPMXc1A
 5RQWddcMmRA1kIJNys4HmORGKBwntk0YWcbFsz63S570s7IEFrgdjJLDfmKyva3mgEKu
 FqCpII3ipJphq1t4ahHpeVzH6TOdpzMwvISYnyqOmbzmVerZvs3ei76sZgcUVoePe7cF
 nv2OHiaQ2WzZPTRVxMLMF5c/hHFZEFk4V4fNiAloYR/oy5EDWgdNrqXuuD0vkjIA9yz1
 xx7GCyKPvlwHSLpI7W19C11HZ//Kxsd30iEmbwibtcbSOowTtIA7mtXlujIfHZ8j2zxl
 yFOA==
X-Gm-Message-State: APjAAAUJW/QSYpCgK0xBRHmbI9026u7Bpn7K/rps8xlG+sVXHdoWKJGE
 qqiIt5aTt2dsA8CgwJHVC+21e3sNWO7RkarSeI7gd5P5SWvm8e1Ajwpng+NWzqKAkA==
X-Google-Smtp-Source: APXvYqxiuode0NVZ8lbFOegqGu5x2c1MU+yVh4YqLCjk8cqO5+rrbzH7/Ve24QG7AcQwAFIN0eiUvUYYgA8l
X-Received: by 2002:a7b:c091:: with SMTP id r17mr3481178wmh.74.1565889266043; 
 Thu, 15 Aug 2019 10:14:26 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id z18sm47249wrt.18.2019.08.15.10.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:14:26 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJKT-00051v-PR; Thu, 15 Aug 2019 17:14:25 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 51A822742BC7; Thu, 15 Aug 2019 18:14:25 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
In-Reply-To: <1564980997-11359-1-git-send-email-jiaxin.yu@mediatek.com>
X-Patchwork-Hint: ignore
Message-Id: <20190815171425.51A822742BC7@ypsilon.sirena.org.uk>
Date: Thu, 15 Aug 2019 18:14:25 +0100 (BST)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, jiaxin.yu@mediatek.com,
 tzungbi@google.com, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com
Subject: [alsa-devel] Applied "ASoC: mediatek: mt6358: add delay after dmic
	clock on" to the asoc tree
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

   ASoC: mediatek: mt6358: add delay after dmic clock on

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From ccb1fa21ef58a2ac15519bb878470762e967e8b3 Mon Sep 17 00:00:00 2001
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
Date: Mon, 5 Aug 2019 12:56:37 +0800
Subject: [PATCH] ASoC: mediatek: mt6358: add delay after dmic clock on

Most dmics produce a high level when they receive clock. The difference
between power-on and memory record time is about 10ms, but the dmic
needs 50ms to output normal data.

This commit add 100ms delay after SoC output clock so that we can cut
off the pop noise at the beginning.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Link: https://lore.kernel.org/r/1564980997-11359-1-git-send-email-jiaxin.yu@mediatek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/mt6358.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
index c17250aab2d0..bb737fd678cc 100644
--- a/sound/soc/codecs/mt6358.c
+++ b/sound/soc/codecs/mt6358.c
@@ -1730,6 +1730,10 @@ static int mt6358_dmic_enable(struct mt6358_priv *priv)
 
 	/* UL turn on */
 	regmap_write(priv->regmap, MT6358_AFE_UL_SRC_CON0_L, 0x0003);
+
+	/* Prevent pop noise form dmic hw */
+	msleep(100);
+
 	return 0;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
