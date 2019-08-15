Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 764998F220
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:25:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D7DB167B;
	Thu, 15 Aug 2019 19:25:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D7DB167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565889952;
	bh=OBfi9we0e1PVqGAZ42sq2xMe/ZcJ1EzBrgZc2r6yevA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=aeP/qlejqEBwhbMDtq8+LM5ckhNy2mjXdMwTqoTn77QKYtyzyj1aoNkkbBqZt3WJ6
	 FKEZcUvjugaLZka6nz1T1sj8j9Ol7nc+N5qHEXWmAPbHH2X92yFRy849KXqKDwsdRa
	 Jfz59swdqBZabEy6j0x8dDpibpwq8z3jz1RKxyZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BAD5F80715;
	Thu, 15 Aug 2019 19:15:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8312F806E5; Thu, 15 Aug 2019 19:15:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f97.google.com (mail-wm1-f97.google.com
 [209.85.128.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D00CF805E2
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D00CF805E2
Received: by mail-wm1-f97.google.com with SMTP id l2so1867418wmg.0
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=+DSWXy6YR+0x+jeOKrcGm/4VoyxLyzX52Rt+viI5/nM=;
 b=Hg4KaJNJ7BW7a6t6vzmYTSXXMra0GQbRZnM8xjODrY2lNkoHyLAiMJM0u/abj0vg04
 Z5t0HAPXU+CtVS/UpHuIjn27Bao53bBVlasxyATZWJDHh7edvQi1DV8OXbTn893Tbbyq
 ib95CEKSIDVcAHQq45Vood/sEH4aifV5dj9l/+kQg6c31cRPX1qR0XVywRi8R9k9G4Jt
 kmfUfVqud4oLrO69IEcIx3NcMQF0WdTF9/PhbI1SuVj/60LyQ9+jvivqPli8CoF1AQnX
 Vly56UxQCtz2h9E3J0YBU6BFWK+Jx7s7XvUp8sSVPRlNXd3vY9wMbSLWZbkU4FF196PL
 3Fhw==
X-Gm-Message-State: APjAAAVvkQZrnrNDcM+3fWRIIgDbQOkMNfdn8pW6Q4jushOfurs/3nF8
 R1fXhn8y0Mv/CjGB0tb/pIBIDFmZfGiP8gg3EEAjt42XK39F8//GBASXm5/bFo6uXQ==
X-Google-Smtp-Source: APXvYqw5tWIFYqhmPqKGUvwB4qSgZ40SOEwR1C7fyoTaB7QXcLgKdLeL+Z1f2Ziu2Ohfx2U9p12FNyPyFVFr
X-Received: by 2002:a1c:f101:: with SMTP id p1mr3664335wmh.62.1565889265208;
 Thu, 15 Aug 2019 10:14:25 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id o6sm50502wrm.17.2019.08.15.10.14.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:14:25 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJKS-00051e-Nn; Thu, 15 Aug 2019 17:14:24 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 409CF2742B9E; Thu, 15 Aug 2019 18:14:24 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190815090404.72752-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190815171424.409CF2742B9E@ypsilon.sirena.org.uk>
Date: Thu, 15 Aug 2019 18:14:24 +0100 (BST)
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>,
 Mark Brown <broonie@kernel.org>, info@metux.net
Subject: [alsa-devel] Applied "ASoC: max98371: remove unused variable
	'max98371_noload_gain_tlv'" to the asoc tree
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

   ASoC: max98371: remove unused variable 'max98371_noload_gain_tlv'

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

From 9d22142c9b1ec8612b880121dd0bc27311cbb2b5 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 15 Aug 2019 17:04:04 +0800
Subject: [PATCH] ASoC: max98371: remove unused variable
 'max98371_noload_gain_tlv'

sound/soc/codecs/max98371.c:157:35: warning:
 max98371_noload_gain_tlv defined but not used [-Wunused-const-variable=]

It is never used, so can be removed.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190815090404.72752-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max98371.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/codecs/max98371.c b/sound/soc/codecs/max98371.c
index ce801489a86d..dfee05f985bd 100644
--- a/sound/soc/codecs/max98371.c
+++ b/sound/soc/codecs/max98371.c
@@ -154,10 +154,6 @@ static const DECLARE_TLV_DB_RANGE(max98371_gain_tlv,
 	8, 10, TLV_DB_SCALE_ITEM(400, 100, 0)
 );
 
-static const DECLARE_TLV_DB_RANGE(max98371_noload_gain_tlv,
-	0, 11, TLV_DB_SCALE_ITEM(950, 100, 0),
-);
-
 static const DECLARE_TLV_DB_SCALE(digital_tlv, -6300, 50, 1);
 
 static const struct snd_kcontrol_new max98371_snd_controls[] = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
