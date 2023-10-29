Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAE77DAF35
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Oct 2023 23:57:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 164D1BC0;
	Sun, 29 Oct 2023 23:57:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 164D1BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698620276;
	bh=+bbdb76ajqheViTiDz9DJe1J0LziQ/6Wy3/LI6rVYx8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QSJlIisjhN0Lb/OWnj8nx2cHhRf2nthuwEEz2P6fl1dpuK5zm2Q1+DwVWJo7gHP62
	 2R9V94YEWGBPKo6zhRqlmZAENXxk/8RSvAwvw7HaTrLohzl7Z3wBH6v/uzuYNoC6Zh
	 Z/ZFpriXMsDfd9Uoh/IxrwnMELXmwF7by09w8vyk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEF01F80494; Sun, 29 Oct 2023 23:56:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C537F80425;
	Sun, 29 Oct 2023 23:56:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 964C8F8055B; Sun, 29 Oct 2023 23:55:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE228F80494
	for <alsa-devel@alsa-project.org>; Sun, 29 Oct 2023 23:55:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE228F80494
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DD2ZqOPU
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9B191CE1197;
	Sun, 29 Oct 2023 22:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CEB6C43395;
	Sun, 29 Oct 2023 22:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620139;
	bh=+bbdb76ajqheViTiDz9DJe1J0LziQ/6Wy3/LI6rVYx8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DD2ZqOPUQ4dWNHmQvLW7m9YQkFr3zIxKM79zwtOjvKxD13Oofe/RO0FZhGBkehaXu
	 yP9bpWLfpIBJnGX4LTBQ+PWbd2B74GcSXbmK7N5auXTXYIBgv4eDgoRtGFvZVAL1u0
	 bkRiEBAD+P1LzTBhYvuxte4jAr03dn3juUjtynLCtpJeC/1rnlheuh+FecWFLhsSi6
	 7iCoPUQvhGPrS4AveT2T3GPNzaC00vhVBf4pwtbpeDkpB1CHXvBNYqiKKgCrYB/EzE
	 1R/l5caqEO0cfn2VHU5nYsITDH1q1WxyxdF2yBWhlRB4hSkxKD0x6SoGvOgR80s0Rh
	 1WGEBAYKVVefQ==
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
Subject: [PATCH AUTOSEL 6.5 28/52] ASoC: rt5650: fix the wrong result of key
 button
Date: Sun, 29 Oct 2023 18:53:15 -0400
Message-ID: <20231029225441.789781-28-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029225441.789781-1-sashal@kernel.org>
References: <20231029225441.789781-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.9
Content-Transfer-Encoding: 8bit
Message-ID-Hash: A6SMOPQCD5L4YXXW74DXWWZY5CA7UVGG
X-Message-ID-Hash: A6SMOPQCD5L4YXXW74DXWWZY5CA7UVGG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A6SMOPQCD5L4YXXW74DXWWZY5CA7UVGG/>
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
index a506d940a2ead..fae04e9fae4e7 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3251,6 +3251,8 @@ int rt5645_set_jack_detect(struct snd_soc_component *component,
 				RT5645_GP1_PIN_IRQ, RT5645_GP1_PIN_IRQ);
 		regmap_update_bits(rt5645->regmap, RT5645_GEN_CTRL1,
 				RT5645_DIG_GATE_CTRL, RT5645_DIG_GATE_CTRL);
+		regmap_update_bits(rt5645->regmap, RT5645_DEPOP_M1,
+				RT5645_HP_CB_MASK, RT5645_HP_CB_PU);
 	}
 	rt5645_irq(0, rt5645);
 
-- 
2.42.0

