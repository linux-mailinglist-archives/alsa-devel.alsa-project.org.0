Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E14907DAFFF
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Oct 2023 00:01:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 978AFDF0;
	Mon, 30 Oct 2023 00:00:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 978AFDF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698620508;
	bh=TI437Uz5doT3OcNnkFPQnloGOW4OkSIhicfYxan8jO0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A89dmWqPQAPjfX+vtDmIleUtxubsLjlskkDCMof4tWgkjfYtG34MpM5oySKKBlQmy
	 eBRnd8pYtz1FxhhwWD9JCLFB8QVrAWrN6dXZvJiCoKHLqE0HVAyt2kpjen2hf9tnZK
	 NLAGJqSfgdf5yIFzUJ8aHd4TutiKmUx5l5MUShLo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B476F8055B; Mon, 30 Oct 2023 00:00:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 115E0F80431;
	Mon, 30 Oct 2023 00:00:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2208F80431; Mon, 30 Oct 2023 00:00:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 305AEF80152
	for <alsa-devel@alsa-project.org>; Mon, 30 Oct 2023 00:00:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 305AEF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jJE3mS5o
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 67DB860F38;
	Sun, 29 Oct 2023 23:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B666FC4AF72;
	Sun, 29 Oct 2023 23:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620428;
	bh=TI437Uz5doT3OcNnkFPQnloGOW4OkSIhicfYxan8jO0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jJE3mS5oUX/M1ccZw6kDUQAwets+SGrBBnu9zhVq0xdUYysG4cfHspL7Mc25luZ0E
	 trcqiGOPbp7UAL7kh0QRVU8qDw5p3zn4LZ7Nq2JpcaWDK21w+rWZ9p3QJBW6viio/1
	 lFQIR7rCc35lwhiO5oB7+xlZDpU+w0aLTFmuAwxiBmyPnyjqvfF9jRmxHhJvynnXue
	 0AwXxu5PkMdms+KVfKALXLGrHw9FI1dHhvil31lED5h6iUrf/JHFoCdhlButMDhN1h
	 LQ5Qm8EoHkJD79G9/eS6gnIU9TXWAGoONUgZT842YaBe3wGqA279z2bvqKQzhtuJkY
	 UO6Ah8Nqo8eCA==
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
Subject: [PATCH AUTOSEL 5.10 08/16] ASoC: rt5650: fix the wrong result of key
 button
Date: Sun, 29 Oct 2023 18:59:54 -0400
Message-ID: <20231029230014.792490-8-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029230014.792490-1-sashal@kernel.org>
References: <20231029230014.792490-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.199
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 22RVC2GVLCRGYZZ7IIAFU3VKHP4HLUFO
X-Message-ID-Hash: 22RVC2GVLCRGYZZ7IIAFU3VKHP4HLUFO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/22RVC2GVLCRGYZZ7IIAFU3VKHP4HLUFO/>
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
index d1533e95a74f6..99d91bfb88122 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3241,6 +3241,8 @@ int rt5645_set_jack_detect(struct snd_soc_component *component,
 				RT5645_GP1_PIN_IRQ, RT5645_GP1_PIN_IRQ);
 		regmap_update_bits(rt5645->regmap, RT5645_GEN_CTRL1,
 				RT5645_DIG_GATE_CTRL, RT5645_DIG_GATE_CTRL);
+		regmap_update_bits(rt5645->regmap, RT5645_DEPOP_M1,
+				RT5645_HP_CB_MASK, RT5645_HP_CB_PU);
 	}
 	rt5645_irq(0, rt5645);
 
-- 
2.42.0

