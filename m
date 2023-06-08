Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BAE727A6C
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 10:50:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1B3E850;
	Thu,  8 Jun 2023 10:49:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1B3E850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686214212;
	bh=/eSnfxogbScGlNOOjeGiLsCkqg34znU4OI0UheFc0FI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UGPyOeN7aZ1VxOBYyAHd+95np4DR6ykshHgF/CCiAXVnJz+q1+WBoZenO7+5sd0pS
	 65Z1hLJFeWLeNUolwuqVmuL98J+dkvcRhoENPmvYNKQ8UJ5iC4SBo9pzHQm2neMM7l
	 +vIuCn7IOZj5Jxm77lNmOKnot+VFA9yR6EDDdcxc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58E0AF805A9; Thu,  8 Jun 2023 10:48:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DE07F8057F;
	Thu,  8 Jun 2023 10:48:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DC07F80570; Thu,  8 Jun 2023 10:48:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3050EF80130
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 10:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3050EF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=JZVCfEXa
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5548A66058B2;
	Thu,  8 Jun 2023 09:47:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686214056;
	bh=/eSnfxogbScGlNOOjeGiLsCkqg34znU4OI0UheFc0FI=;
	h=From:To:Cc:Subject:Date:From;
	b=JZVCfEXagXlNeJVB5syTmC2EN4+t98xcDijANVzj/YBw8siGAZ1IY9sHCDYfqBQLQ
	 onm1CV/QH2vC8VYFasLlfK9UUGYCkDLw7gTsKUNEVP2pa51/q4mTa+1Dajk7UvLU6+
	 s2TSj6I6LbY8POa1PKywP57ol/mWO3T+YDtypzdjGhMg7ytJmWV5jQfW1yOWYK9ZSf
	 ABp4ym3RTVWSzre1o8uNiQVxX6rJQ7ctE606ISvTSRvp2BAP+GrFoMmSE87o17qQgS
	 zUnhtW2umIK1+2ZK7sZa/OEFeUnwcxwgx9414TPXOBoFwkcgXdTWPnQQmUAchmlwuM
	 JyxuANLoP+Tlg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	trevor.wu@mediatek.com,
	amergnat@baylibre.com,
	dan.carpenter@linaro.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 0/5] ASoC: mt8188-mt6359: Cleanups
Date: Thu,  8 Jun 2023 10:47:22 +0200
Message-Id: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5Y4ZLBTFQVJOSYQ6IZYYNARYYZBR7HWK
X-Message-ID-Hash: 5Y4ZLBTFQVJOSYQ6IZYYNARYYZBR7HWK
X-MailFrom: angelogioacchino.delregno@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5Y4ZLBTFQVJOSYQ6IZYYNARYYZBR7HWK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series performs some cleanups to the mt8188-mt6359 driver,
including usage of bitfield macros, adding definitions of register
fields and some others for readability and consistency.

AngeloGioacchino Del Regno (4):
  ASoC: mediatek: mt8188-mt6359: Compress of_device_id entries
  ASoC: mediatek: mt8188-mt6359: Cleanup return 0 disguised as return
    ret
  ASoC: mediatek: mt8188-mt6359: Clean up log levels
  ASoC: mediatek: mt8188-mt6359: Use bitfield macros for registers

Dan Carpenter (1):
  ASoC: mediatek: mt8188-mt6359: clean up a return in codec_init

 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 87 ++++++++++++-----------
 1 file changed, 45 insertions(+), 42 deletions(-)

-- 
2.40.1

