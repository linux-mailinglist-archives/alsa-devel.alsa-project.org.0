Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E416B4123
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 14:49:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C22F9180F;
	Fri, 10 Mar 2023 14:49:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C22F9180F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678456191;
	bh=tdpcl+jO1L8fobt/yCx27cx/Z728pRP5iMga+kBX+lI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GkmhwsEpxAPoOiV2KAEfYFUK9vxDBnPjFRy/h4gdYWkTfpUDYFUD6y+obchrGyxQv
	 gb6RRri8lTSnE7i4plZ/OcB4EAz4CfUgdBNflLrflRjBb4Qb0pFINA6axJGlHEZuax
	 syNTyXOPW9VwEsBDs21yeOPz03NmfaggcBls+inU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39019F80236;
	Fri, 10 Mar 2023 14:49:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3A0DF8042F; Fri, 10 Mar 2023 14:48:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92710F800DF
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 14:48:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92710F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=ywUCVSWQ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 522F8B822AD;
	Fri, 10 Mar 2023 13:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3C2C4339E;
	Fri, 10 Mar 2023 13:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678456133;
	bh=tdpcl+jO1L8fobt/yCx27cx/Z728pRP5iMga+kBX+lI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ywUCVSWQa/AumaBYmrreNZMSi48vTRqAl7B90vn7gYTXUe82nX+0TECWEubUKCrXc
	 MjDKS+aQhmgFMLYzIVDZDqo22hU1h5C+L/5/jDVnd6fNHeWX/0MN8/QyiJsXnbREOD
	 cSYf+GaIYyW3cElQBngYWcM0cQlnwOQXGAIlFsxo=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 4.14 091/193] ASoC: kirkwood: Iterate over array indexes
 instead of using pointer math
Date: Fri, 10 Mar 2023 14:37:53 +0100
Message-Id: <20230310133714.219145643@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310133710.926811681@linuxfoundation.org>
References: <20230310133710.926811681@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2AXWVYE2PL4BKLDNCQP64HMQX3TJFNPX
X-Message-ID-Hash: 2AXWVYE2PL4BKLDNCQP64HMQX3TJFNPX
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 Kees Cook <keescook@chromium.org>, Sasha Levin <sashal@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2AXWVYE2PL4BKLDNCQP64HMQX3TJFNPX/>
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
index 35ca8e8bb5e52..9736fb36082fb 100644
--- a/sound/soc/kirkwood/kirkwood-dma.c
+++ b/sound/soc/kirkwood/kirkwood-dma.c
@@ -90,7 +90,7 @@ kirkwood_dma_conf_mbus_windows(void __iomem *base, int win,
 
 	/* try to find matching cs for current dma address */
 	for (i = 0; i < dram->num_cs; i++) {
-		const struct mbus_dram_window *cs = dram->cs + i;
+		const struct mbus_dram_window *cs = &dram->cs[i];
 		if ((cs->base & 0xffff0000) < (dma & 0xffff0000)) {
 			writel(cs->base & 0xffff0000,
 				base + KIRKWOOD_AUDIO_WIN_BASE_REG(win));
-- 
2.39.2



