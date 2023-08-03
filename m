Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EF976E351
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 10:40:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF973829;
	Thu,  3 Aug 2023 10:39:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF973829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691052012;
	bh=OZstKgEStnElUffu43UhAEHsGXo2gQE26f8NgDEi92A=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Dmws8Re2PdE+Gf9/mjxK76gYn8EIjaz07a+EZVHaS8ridoWTBEmQkjcw0IqI6pvXB
	 yuoDvXgrqSFJJc2XRuq/4XaMcTeJFhdyJ5+i7XzhA0Oq7xWRjneZ1Pq5Ul3McayVA/
	 tZKi27N6iUcPnuLu67YLGbjYfBMv0wfpizBjrTvc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81844F801D5; Thu,  3 Aug 2023 10:39:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2457AF801D5;
	Thu,  3 Aug 2023 10:39:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A79BF8025A; Thu,  3 Aug 2023 10:39:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from galois.linutronix.de (galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3715AF8015B
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 10:39:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3715AF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linutronix.de header.i=@linutronix.de
 header.a=rsa-sha256 header.s=2020 header.b=CPQx6POE;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=JQNECTpC
Date: Thu, 3 Aug 2023 10:39:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1691051951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=8Lx1zRkSdUANyaQ1Gnq02c/pWcPt7HlFaVxx5Opdo2g=;
	b=CPQx6POElCLI25HF25EWtOndSW+HbPBlw+XjgcofIO7Qa/rD5ISAfXDRNhgENP+5k5n8ng
	4v8/nFN+adBmm5e9xTCKkMpcdALJZOdU2GIJ3qZxJk93AKjfG31WpR1j3B0V1AkYYfSKle
	lJO6GzwyoOnXRhbEM4bA/RluEQlJWaQZjNDjBfQdZWFy2mf4dyLPHMFckXA9zmx3cKreUu
	mctMsMEKFm+IZ5uKVX+Y+VOLA+Fjk5XllqV/MYbyTRPi2A3BXaTjengqZjT64zUnxVRmfg
	bjOEovuOnqVApTBzP8rARUWNtA6XqB7KxYxIOQ1kgsOcVn9ea+PkRRm65JaW4w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1691051951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=8Lx1zRkSdUANyaQ1Gnq02c/pWcPt7HlFaVxx5Opdo2g=;
	b=JQNECTpCykh1SaYk8dxFPh2yoJ2XOfEVbF2oKss4URiMxPsZDnwgJHCDHiAEXMp6w4PWfn
	IGkC8z2x12mXUoBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] ASoC: mediatek: mt8186: Remove unused mutex.
Message-ID: <20230803083908.9DxbPvOK@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Message-ID-Hash: O6ATBN3BQNG6QTTNO5BH7ESEK42PDZ6B
X-Message-ID-Hash: O6ATBN3BQNG6QTTNO5BH7ESEK42PDZ6B
X-MailFrom: bigeasy@linutronix.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O6ATBN3BQNG6QTTNO5BH7ESEK42PDZ6B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The mutex mutex_request_dram has no user.

Remove mutex_request_dram.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 539e3a023bc4e..70ec101890d36 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -13,8 +13,6 @@
 #include "mt8186-afe-clk.h"
 #include "mt8186-audsys-clk.h"
 
-static DEFINE_MUTEX(mutex_request_dram);
-
 static const char *aud_clks[CLK_NUM] = {
 	[CLK_AFE] = "aud_afe_clk",
 	[CLK_DAC] = "aud_dac_clk",
-- 
2.40.1

