Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4426A952A60
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 10:25:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3AEF2973;
	Thu, 15 Aug 2024 10:25:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3AEF2973
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723710325;
	bh=b66dVZykwsuCkGN9NyBLLDhHTrDpJMPU+qf5oDqlRXo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sx6zAd8LcNWBbCXg8ELkGj5u+JzchhmHgVTyeKlQucd2PvPZvyNV+2HeBy9+LfKvN
	 lyfgOTKMN/T8w/NowbJkTZP2gyOmE/skuKhqokwvouFAmXC7jVHyhTgq+DfCvTj2at
	 cl3DPh0MRToIMmnKMz+uu7Q6qQz0rfDnCjgMviRQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A836F80674; Thu, 15 Aug 2024 10:23:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE2D1F80687;
	Thu, 15 Aug 2024 10:23:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB6A4F800BF; Wed,  7 Aug 2024 04:54:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp134-90.sina.com.cn (smtp134-90.sina.com.cn
 [180.149.134.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53097F802DB
	for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2024 04:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53097F802DB
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.131])
	by sina.net (10.185.250.31) with ESMTP
	id 66B2E1C800005724; Wed, 7 Aug 2024 10:54:05 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 54E9821BF84642488F2BAB2C178D9550
X-SMAIL-UIID: 54E9821BF84642488F2BAB2C178D9550-20240807-105405
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH 2/2] ASoC: codecs: ES8326: input issue after init
Date: Wed,  7 Aug 2024 10:53:56 +0800
Message-Id: <20240807025356.24904-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240807025356.24904-1-zhangyi@everest-semi.com>
References: <20240807025356.24904-1-zhangyi@everest-semi.com>
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JAA7NKQOL2OP62MKZGYHE23POAG57ILC
X-Message-ID-Hash: JAA7NKQOL2OP62MKZGYHE23POAG57ILC
X-Mailman-Approved-At: Thu, 15 Aug 2024 08:21:43 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JAA7NKQOL2OP62MKZGYHE23POAG57ILC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We found an input issue after initiation.So we added the default
input source at initiation.

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 519bcd2ed00e..d5362b3be484 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -1070,6 +1070,8 @@ static void es8326_init(struct snd_soc_component *component)
 
 	regmap_write(es8326->regmap, ES8326_ADC_MUTE, 0x0f);
 	regmap_write(es8326->regmap, ES8326_CLK_DIV_LRCK, 0xff);
+	regmap_write(es8326->regmap, ES8326_ADC1_SRC, 0x44);
+	regmap_write(es8326->regmap, ES8326_ADC2_SRC, 0x66);
 	es8326_disable_micbias(es8326->component);
 
 	msleep(200);
-- 
2.17.1

