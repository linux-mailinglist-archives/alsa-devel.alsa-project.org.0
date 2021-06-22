Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DF63AFA77
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 03:11:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92BB31676;
	Tue, 22 Jun 2021 03:10:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92BB31676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624324296;
	bh=ToOPGYlQ0GZsbyRYxUuvUB74LqJm3lcpKvVXOpJO8Hs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q2mIkDQcDpgQLLzrfAyRnMvz1/Ln3lJFoIxBO8jJyRLC86GakwOnoFjScbftGpK+W
	 siDmNK2pWLmhcH2tdR3kd6TzCIITf/gIvlHJAH15473rzwrDPXd4ej0WBAe46rfiPD
	 BtRzzedFltxP8EK5/yslvuN/fq/pytB4D5sr1btc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE093F8016D;
	Tue, 22 Jun 2021 03:10:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FF5DF80111; Tue, 22 Jun 2021 03:10:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E94AF80111
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 03:09:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E94AF80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OhVVnWeQ"
Received: by mail-qk1-x72a.google.com with SMTP id q64so29006089qke.7
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 18:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qRoGfxnTf4QYWlkf1RS5v8uZNsLwTRg1lMFZAH7oXjc=;
 b=OhVVnWeQVmv6DG+EPUcfZoNE4vA+gvd9PVcWJA6oSoceUcm1pGDS7EKkcwlOR670uL
 oL8FuMq9OXyDAuc8CxChthCURO0QtZzvhb4pNwiekJPL0lOfFJyqXsGreQXUMoyp8IA/
 VR3hvYwBVzciCPdzrbwbDPSsovnqOt+M66+X5XAcnleAEHPYJVAmX1Fm3yJ8tZ/wIBJ2
 1CESLSqmFjJ3OuWspVW9IDlB+XcevrmkRQ7ZlFmFprrbqR5uXyoBUQ0//XwIuBdkuYas
 BWNW/QJk/7WmCCHKVDovjYyTfb1wNa6ALvx9GsbCHmEsvS2xgHKvov9Ab/Q9p1bREmqn
 BLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qRoGfxnTf4QYWlkf1RS5v8uZNsLwTRg1lMFZAH7oXjc=;
 b=L+hWFSUIeWU3RsU49IOYJb07wD3ezbHyOdlWo8GxfhRtYNjYdcnJiPGHwSpIpZswWV
 AiPiShyC4vcNw4+TH3EsIas35zzQwNifNrHF2vGrFvugqkIIV3FJStR+tRPB/QLZ6D8y
 Hq1k1qnVK2yR5VCZt+5tGSL0ifGHiRMtKvnM+CHmlzhdTmrwDO3pSYW/Ik/cQPbPp1FP
 Hj1j8q69crrR4Ha4UE5GNajIm/WamHRH0j9VOkPWbnSNqyh8b1FYAqftRV3JaxJiPrUr
 nYxFiIa+tuS/ilmB9SD4zgVpW8C4iR/AO/PEJ/WxgX/+Rzz0y6+zdHO1Ry3y033XTphm
 HXyA==
X-Gm-Message-State: AOAM532+ZW4BwKmjAm6eI111IFwsspYhJGuv8FI4wXrTSNa1s2AEnmO2
 V/Ro2/WPsnoPs5qJhsJIFGM=
X-Google-Smtp-Source: ABdhPJxH/UptUYzs2iJgUGZ57paL2nJR7IiXfkmEmueyMO2WcgpaBfwKiPK7rciUZ0LC1bviO7dUpA==
X-Received: by 2002:a37:b6c5:: with SMTP id g188mr1604512qkf.92.1624324195158; 
 Mon, 21 Jun 2021 18:09:55 -0700 (PDT)
Received: from poirot.file.core.windows.net
 (cpe-74-138-104-174.kya.res.rr.com. [74.138.104.174])
 by smtp.gmail.com with ESMTPSA id x80sm11564093qkb.3.2021.06.21.18.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 18:09:54 -0700 (PDT)
From: Kyle Russell <bkylerussell@gmail.com>
To: broonie@kernel.org
Subject: [PATCH] ASoC: tlv320aic31xx: fix reversed bclk/wclk master bits
Date: Mon, 21 Jun 2021 21:09:41 -0400
Message-Id: <20210622010941.241386-1-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kyle Russell <bkylerussell@gmail.com>, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, tiwai@suse.com, grandmaster@al2klimov.de
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

These are backwards from Table 7-71 of the TLV320AIC3100 spec [1].

This was broken in 12eb4d66ba2e when BCLK_MASTER and WCLK_MASTER
were converted from 0x08 and 0x04 to BIT(2) and BIT(3), respectively.

-#define AIC31XX_BCLK_MASTER		0x08
-#define AIC31XX_WCLK_MASTER		0x04
+#define AIC31XX_BCLK_MASTER		BIT(2)
+#define AIC31XX_WCLK_MASTER		BIT(3)

Probably just a typo since the defines were not listed in bit order.

[1] https://www.ti.com/lit/gpn/tlv320aic3100

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 sound/soc/codecs/tlv320aic31xx.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic31xx.h b/sound/soc/codecs/tlv320aic31xx.h
index 81952984613d..2513922a0292 100644
--- a/sound/soc/codecs/tlv320aic31xx.h
+++ b/sound/soc/codecs/tlv320aic31xx.h
@@ -151,8 +151,8 @@ struct aic31xx_pdata {
 #define AIC31XX_WORD_LEN_24BITS		0x02
 #define AIC31XX_WORD_LEN_32BITS		0x03
 #define AIC31XX_IFACE1_MASTER_MASK	GENMASK(3, 2)
-#define AIC31XX_BCLK_MASTER		BIT(2)
-#define AIC31XX_WCLK_MASTER		BIT(3)
+#define AIC31XX_BCLK_MASTER		BIT(3)
+#define AIC31XX_WCLK_MASTER		BIT(2)
 
 /* AIC31XX_DATA_OFFSET */
 #define AIC31XX_DATA_OFFSET_MASK	GENMASK(7, 0)
-- 
2.25.1

