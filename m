Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 035246A37C6
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Feb 2023 03:11:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9334583B;
	Mon, 27 Feb 2023 03:10:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9334583B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677463885;
	bh=l+h1m6l15Q0H3wMw3p063iUD+9lEE8RxFhgso/B/Gys=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UpqOdikWPV8nzvYb4U0YFJkBp/s6Q5sTl19fCNctY5O0fcAG6xqpSk4CyENt4sETH
	 f1ZkkX5ISIm2QQ3aUUeQihHg5/eyNpe1XPw0yKyyagy2psOb/kS3gbFPvgNY0ap3FY
	 toKRHuCdp1pTabAVdl228mirXv7CVYDwCk+EOfnA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A330FF8051B;
	Mon, 27 Feb 2023 03:09:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D1DBF8049C; Mon, 27 Feb 2023 03:09:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59431F800BA
	for <alsa-devel@alsa-project.org>; Mon, 27 Feb 2023 03:09:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59431F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RSSeyKwQ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A08C260D14;
	Mon, 27 Feb 2023 02:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94DA8C433EF;
	Mon, 27 Feb 2023 02:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677463779;
	bh=l+h1m6l15Q0H3wMw3p063iUD+9lEE8RxFhgso/B/Gys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RSSeyKwQl40Pefnp4y1Zm1GVxNAkI8kIthBZZ2DfCYxGtLe6tqfXsbQC6wQKl8K+V
	 UAh5m9p2eH7qsRZgjZl5VIqdiqon/WJPQIcQXyUWiLqJqV4wIEFgc0b2xxs5eT1VSS
	 oGh4k79mQJE/C4sNGQbixkiKuhOrela2e19x760k1gLA2oqhSw0v7V4/pvxj9v8xgo
	 rRK+CZ+nOJn9Jcv/Vl6xmTnGmrZw9dM08eQmQMog42/iiTkbP5ZlAYplVTOovFvRE4
	 tjX0WWHYMTaYFqPdWpkQe8fN/0VUrzAJ4n+qaKCbn5ywky/0ABneNC00FaQBgPSWzt
	 X7Mt0kZdC/m/g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 14/25] ASoC: kirkwood: Iterate over array indexes
 instead of using pointer math
Date: Sun, 26 Feb 2023 21:08:37 -0500
Message-Id: <20230227020855.1051605-14-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020855.1051605-1-sashal@kernel.org>
References: <20230227020855.1051605-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DYEL3KW2UMAY3AQQKUU65M3C5MM4RR3O
X-Message-ID-Hash: DYEL3KW2UMAY3AQQKUU65M3C5MM4RR3O
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Kees Cook <keescook@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, Sasha Levin <sashal@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DYEL3KW2UMAY3AQQKUU65M3C5MM4RR3O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kees Cook <keescook@chromium.org>

[ Upstream commit b3bcedc0402fcdc5c8624c433562d9d1882749d8 ]

Walking the dram->cs array was seen as accesses beyond the first array
item by the compiler. Instead, use the array index directly. This allows
for run-time bounds checking under CONFIG_UBSAN_BOUNDS as well. Seen
with GCC 13 with -fstrict-flex-arrays:

../sound/soc/kirkwood/kirkwood-dma.c: In function
'kirkwood_dma_conf_mbus_windows.constprop':
../sound/soc/kirkwood/kirkwood-dma.c:90:24: warning: array subscript 0 is outside array bounds of 'const struct mbus_dram_window[0]' [-Warray-bounds=]
   90 |                 if ((cs->base & 0xffff0000) < (dma & 0xffff0000)) {
      |                      ~~^~~~~~

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Kees Cook <keescook@chromium.org>
Link: https://lore.kernel.org/r/20230127224128.never.410-kees@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/kirkwood/kirkwood-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/kirkwood/kirkwood-dma.c b/sound/soc/kirkwood/kirkwood-dma.c
index 700a18561a940..640cebd2983e2 100644
--- a/sound/soc/kirkwood/kirkwood-dma.c
+++ b/sound/soc/kirkwood/kirkwood-dma.c
@@ -86,7 +86,7 @@ kirkwood_dma_conf_mbus_windows(void __iomem *base, int win,
 
 	/* try to find matching cs for current dma address */
 	for (i = 0; i < dram->num_cs; i++) {
-		const struct mbus_dram_window *cs = dram->cs + i;
+		const struct mbus_dram_window *cs = &dram->cs[i];
 		if ((cs->base & 0xffff0000) < (dma & 0xffff0000)) {
 			writel(cs->base & 0xffff0000,
 				base + KIRKWOOD_AUDIO_WIN_BASE_REG(win));
-- 
2.39.0

