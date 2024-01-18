Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9A8831E09
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jan 2024 17:59:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4089201;
	Thu, 18 Jan 2024 17:59:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4089201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705597187;
	bh=Khc6okNYonivQKkrXDtCP9RflkoszTHGolHQDW410oI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JB5XSHGo0bUC9QW/SdfXP9ZUR++lK0ehRn1sAba5z8/oEanDgfCICxyRNR8yV6E6u
	 9k57MgSwVHJgZRd0OJG+HqFy5Env3N5z6brgVJrNIxkz5iZ7HrkkcJUDXa/e1Cg/pd
	 69WeYkz87MENruie+4beivR47YGFZmojDvRYUOLo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAD37F80606; Thu, 18 Jan 2024 17:58:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43060F805F3;
	Thu, 18 Jan 2024 17:58:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BB26F805A0; Thu, 18 Jan 2024 17:58:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6447AF80564
	for <alsa-devel@alsa-project.org>; Thu, 18 Jan 2024 17:58:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6447AF80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iwI2G4Ac
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 63132CE1FED;
	Thu, 18 Jan 2024 16:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A1BEC433F1;
	Thu, 18 Jan 2024 16:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705597105;
	bh=Khc6okNYonivQKkrXDtCP9RflkoszTHGolHQDW410oI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iwI2G4Ac0q+adLKeZDRND0ELSZSYkr4695P1BsUaED08JEU/WUFI/hIAv0RlqRE+4
	 RIEV9YWns7dy2v8f2DARuK1sfC/jM7wY/94WdIkuuMp6XWfsBLiewShKii0bc+I2k+
	 fgQ6puoW1ZxdHvK2sRWURd3XCAWE6v7/RnB1Mlop8rVj+704L6NwJiz1tP857vPtgj
	 UgFFNJ34WP4ASZL50RjMY2j8/fbSLG8Om6Z85hfhLvFuSGjiP4UQL2mupu3hAhMzP1
	 LrbsjZ+cbFRW0Acx/xqq+8By/4oO0pidYVS5oR3Hp1Y9VIzU1gzZ5humi8rixjHK5a
	 XhhVmkfYz6/zg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rQVir-0003Z0-29;
	Thu, 18 Jan 2024 17:58:33 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/5] ASoC: codecs: wsa883x: lower default PA gain
Date: Thu, 18 Jan 2024 17:58:08 +0100
Message-ID: <20240118165811.13672-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240118165811.13672-1-johan+linaro@kernel.org>
References: <20240118165811.13672-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HPKAKVN6R5ANIKEBDCGVWYORNM7FKRIQ
X-Message-ID-Hash: HPKAKVN6R5ANIKEBDCGVWYORNM7FKRIQ
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HPKAKVN6R5ANIKEBDCGVWYORNM7FKRIQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The default PA gain is set to a pretty high level of 15 dB. Initialise
the register to the minimum -3 dB level instead.

This is specifically needed to allow machine drivers to use the lowest
level as a volume limit.

Cc: stable@vger.kernel.org      # 6.5
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/codecs/wsa883x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 32983ca9afba..8942c88dee09 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -722,7 +722,7 @@ static struct reg_default wsa883x_defaults[] = {
 	{ WSA883X_WAVG_PER_6_7, 0x88 },
 	{ WSA883X_WAVG_STA, 0x00 },
 	{ WSA883X_DRE_CTL_0, 0x70 },
-	{ WSA883X_DRE_CTL_1, 0x08 },
+	{ WSA883X_DRE_CTL_1, 0x1e },
 	{ WSA883X_DRE_IDLE_DET_CTL, 0x1F },
 	{ WSA883X_CLSH_CTL_0, 0x37 },
 	{ WSA883X_CLSH_CTL_1, 0x81 },
-- 
2.41.0

