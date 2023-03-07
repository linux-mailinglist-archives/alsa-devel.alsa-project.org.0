Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6144C6AEB6E
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 18:44:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB1381509;
	Tue,  7 Mar 2023 18:43:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB1381509
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678211064;
	bh=OvNyHpAAeeiTPusi5F0W7Sq5fJ9njNoI5QzTKir0DAQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r+19bu5+Xp3q8mPBe5EccYbmqQwVz3ErBgqWFOuqBwddK4VduTKElseTdOVGuPs+b
	 5pvqaNIhrLdos9ua/42uWjg/TYRIGqZb6w5aUMB5RgluPiLYtV2L6TtPLhtFXh9yD/
	 4HMYZB6Px0d4HeUzA4f7WSTHbLh1j7i040gePqYQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F978F80236;
	Tue,  7 Mar 2023 18:43:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4A8DF8042F; Tue,  7 Mar 2023 18:43:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5EB2F800DF
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 18:43:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5EB2F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=rHQ4DIC+
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 85CC3614FF;
	Tue,  7 Mar 2023 17:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC19C433EF;
	Tue,  7 Mar 2023 17:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678210992;
	bh=OvNyHpAAeeiTPusi5F0W7Sq5fJ9njNoI5QzTKir0DAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rHQ4DIC+XUApDr5EN0ZM4yvs667pwT0jq3xxjpjZRY0CjmTXuTdj6hn2TMx4kFusH
	 zzhPVFKSa/gsKcy0h6xTL7KT7TkdO0PfXX9y3b64laCyJEhakJIyDInlwrVGpSoORN
	 A6c3RKMVdFaM7QUqYilwoAfbSdcKUyUQKth5r6tw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.2 0718/1001] ASoC: kirkwood: Iterate over array indexes
 instead of using pointer math
Date: Tue,  7 Mar 2023 17:58:10 +0100
Message-Id: <20230307170052.822495610@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307170022.094103862@linuxfoundation.org>
References: <20230307170022.094103862@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XZVD6SD6GUGVAMR3VWUYYBZPSKVUJCI5
X-Message-ID-Hash: XZVD6SD6GUGVAMR3VWUYYBZPSKVUJCI5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XZVD6SD6GUGVAMR3VWUYYBZPSKVUJCI5/>
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
2.39.2



