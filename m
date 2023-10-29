Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6857DB013
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Oct 2023 00:02:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12466E7C;
	Mon, 30 Oct 2023 00:01:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12466E7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698620568;
	bh=14qvwJ5OEF695d7aSYKtMjFYvcJIUZMakdn/9PRiAc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P2lVuZdo9JRkPD7+W0TyBhJjlobazdEP2RaZ8DpnygVy4WFhboFxYh4aX3WUg33g8
	 9rBR3O9y0OY0+5foAVfGPJFEagiwvjVoCoeHldBe+vdkb7MvNgWdI8HsHI10gXH/N1
	 BN6Ucsea5JgT0CijLZWrRSrOVZz/+Jg2RY75W7Ao=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D309FF80567; Mon, 30 Oct 2023 00:01:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77BB4F80557;
	Mon, 30 Oct 2023 00:01:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFBB0F8055C; Mon, 30 Oct 2023 00:01:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 490F2F8020D
	for <alsa-devel@alsa-project.org>; Mon, 30 Oct 2023 00:01:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 490F2F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=odZe9lpL
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F64B60F4B;
	Sun, 29 Oct 2023 23:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6CD7C43391;
	Sun, 29 Oct 2023 23:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620507;
	bh=14qvwJ5OEF695d7aSYKtMjFYvcJIUZMakdn/9PRiAc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=odZe9lpL0+qqwUsQIz7NOYzysgkRZeACIJlKV+2YFo9F+l+pXRPtSJPrRFla2Lj33
	 EbneSfcUlhlLEdaXDt9ourzUCZazovkb5ket4pNmuWNrkXrR4OtCRe3bDOGKgfE+ha
	 lr1PTTe1FJC8iUFp5HPbnCAYT7CeVntXeyAiJcs9TCh7xcnkpjaoqhCXW729fHkjjl
	 eUQPBC0x1k6ym+DeD0vA8Nrv6VC2H/hvjpG/aI0SkaMiBuj3BisPMouxGYOofR2yRV
	 RgwwjzORcwVGVCZlvDeYG9ULJSqiJbTRUj5YqCo9kjKh6gxmNYlZZd8pPJx0Sg3Ko9
	 hl46y4BgYnP0A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shuming Fan <shumingf@realtek.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	oder_chiou@realtek.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 4.19 06/12] ASoC: rt5650: fix the wrong result of key
 button
Date: Sun, 29 Oct 2023 19:01:19 -0400
Message-ID: <20231029230135.793281-6-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029230135.793281-1-sashal@kernel.org>
References: <20231029230135.793281-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.297
Content-Transfer-Encoding: 8bit
Message-ID-Hash: INITJMRYLHRRUYWXOD6JENXFADOM65HQ
X-Message-ID-Hash: INITJMRYLHRRUYWXOD6JENXFADOM65HQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/INITJMRYLHRRUYWXOD6JENXFADOM65HQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

[ Upstream commit f88dfbf333b3661faff996bb03af2024d907b76a ]

The RT5650 should enable a power setting for button detection to avoid the wrong result.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Link: https://lore.kernel.org/r/20231013094525.715518-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt5645.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index d34000182f679..a713e9649b56b 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3278,6 +3278,8 @@ int rt5645_set_jack_detect(struct snd_soc_component *component,
 				RT5645_GP1_PIN_IRQ, RT5645_GP1_PIN_IRQ);
 		regmap_update_bits(rt5645->regmap, RT5645_GEN_CTRL1,
 				RT5645_DIG_GATE_CTRL, RT5645_DIG_GATE_CTRL);
+		regmap_update_bits(rt5645->regmap, RT5645_DEPOP_M1,
+				RT5645_HP_CB_MASK, RT5645_HP_CB_PU);
 	}
 	rt5645_irq(0, rt5645);
 
-- 
2.42.0

