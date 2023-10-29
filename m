Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC947DAF2E
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Oct 2023 23:57:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED905A4C;
	Sun, 29 Oct 2023 23:56:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED905A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698620247;
	bh=3WqHVuQmYqKjH49ZdI3DyMGWGcEBUXr7RFhzrjTJFhY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YYg3pTnQS2eXoLzxerQssX3n6IeazxtRn4vkYyZMvJFHA8FTcLINSMiKzc+iEtEx8
	 Efqsf83TqLUINTLylXPbmNNhoSyNbIyAaQvqzxFYV75FgzZ/+E1+xSxaW/xZvUmROG
	 u3OechnhzOk6hV9p2PpcWv+yaL3S9gccqZwZytuk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E6D9F8055B; Sun, 29 Oct 2023 23:55:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3E70F80494;
	Sun, 29 Oct 2023 23:55:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01B8CF80563; Sun, 29 Oct 2023 23:55:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7F03F80431
	for <alsa-devel@alsa-project.org>; Sun, 29 Oct 2023 23:55:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7F03F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TD5CqIn0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3B2CA60E83;
	Sun, 29 Oct 2023 22:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99EE3C433C9;
	Sun, 29 Oct 2023 22:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620140;
	bh=3WqHVuQmYqKjH49ZdI3DyMGWGcEBUXr7RFhzrjTJFhY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TD5CqIn0imcIWVLJ/3i+5GeO4pHgAQq3nAC1hyMiQNNefLP/PSB21A7t334zLICbS
	 D/7JXhphfMqfa+GlogfibeIUMQnts6QdGffKgs2WDtSJVX8LYkNdtO6b8F2XwCLZc1
	 I1uvRIO/dsKse+KZpU09OWUvqJb3/pul+qqi3yMKb8ciCWyPxB16p8/lZt+ozvQEIM
	 ztgMVC5wkyVtgMWodzPs+Esszyp2sbvefqef09Cv/u0kVnPhTooYU/0kTLOAq1GNCj
	 7Uvgf9i9F0v/yuChg724ctBO7+DWT66IIItTZv6LGaqFb4cl2vEskCjWDWkN9SZkqt
	 Fjb7aKd6L/Nzg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Roy Chateau <roy.chateau@mep-info.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.5 29/52] ASoC: codecs: tas2780: Fix log of failed
 reset via I2C.
Date: Sun, 29 Oct 2023 18:53:16 -0400
Message-ID: <20231029225441.789781-29-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029225441.789781-1-sashal@kernel.org>
References: <20231029225441.789781-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.9
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WGAMA446JIHPH4CFIQBZ7AFTSCK5TD4B
X-Message-ID-Hash: WGAMA446JIHPH4CFIQBZ7AFTSCK5TD4B
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WGAMA446JIHPH4CFIQBZ7AFTSCK5TD4B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Roy Chateau <roy.chateau@mep-info.com>

[ Upstream commit 4e9a429ae80657bdc502d3f5078e2073656ec5fd ]

Correctly log failures of reset via I2C.

Signed-off-by: Roy Chateau <roy.chateau@mep-info.com>
Link: https://lore.kernel.org/r/20231013110239.473123-1-roy.chateau@mep-info.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/tas2780.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2780.c b/sound/soc/codecs/tas2780.c
index 86bd6c18a9440..41076be238542 100644
--- a/sound/soc/codecs/tas2780.c
+++ b/sound/soc/codecs/tas2780.c
@@ -39,7 +39,7 @@ static void tas2780_reset(struct tas2780_priv *tas2780)
 		usleep_range(2000, 2050);
 	}
 
-	snd_soc_component_write(tas2780->component, TAS2780_SW_RST,
+	ret = snd_soc_component_write(tas2780->component, TAS2780_SW_RST,
 				TAS2780_RST);
 	if (ret)
 		dev_err(tas2780->dev, "%s:errCode:0x%x Reset error!\n",
-- 
2.42.0

