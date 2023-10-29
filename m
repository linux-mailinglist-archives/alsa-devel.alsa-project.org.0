Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A067D7DAF6E
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Oct 2023 23:59:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C375886F;
	Sun, 29 Oct 2023 23:58:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C375886F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698620373;
	bh=C3ZU2uUqdrpUAQLN1sb0qpJBJLtv2qSDQJEXHSPaBp4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FyupYDTQptbn5tJNp2AVv+ZZ1s8z36hFJNveETrPrRc6S989HrTe/dTZF2eQJS0M8
	 OXIxfHiiPKw0dA8rXw+eD/LBEc06bq2CxcjQNZA2fG8TtbCNxbbCkuFNynMm7s7c3F
	 0EzUw2obFNWlELmwuxvaqcFD8PYEV820Ord3cyzk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93F66F80425; Sun, 29 Oct 2023 23:58:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5161DF80431;
	Sun, 29 Oct 2023 23:58:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CFF6F80494; Sun, 29 Oct 2023 23:58:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6314BF8014B
	for <alsa-devel@alsa-project.org>; Sun, 29 Oct 2023 23:58:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6314BF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dio2YRdP
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E934CB80256;
	Sun, 29 Oct 2023 22:58:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4A1C4166B;
	Sun, 29 Oct 2023 22:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620289;
	bh=C3ZU2uUqdrpUAQLN1sb0qpJBJLtv2qSDQJEXHSPaBp4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dio2YRdPyc1v7gMR6+0Ww+T3jTzX61yAa/KiILXP/fw6WLCS8WhYZrZM2l3bRNFae
	 Mv/L715OpBrLQRHVR9o5Jp7MwrbE/nU5xWTIU1ycaIY2LM+X/Fs/Jy8bjRRxjY3Cdz
	 zojFh2wT3os7L0sOLiO1+04a2YxDEEGbuQDDy8MOVPeHZgD4zWkrgTIrqlbBtX5ym5
	 keC/PapeC/ohRbQSzJDuUpNvbqrJUYylJL2Wl88FXXv99D+4wLPzwtFtWrnsAg/neq
	 f+ijHrJMfGGisSwwdY5mrLChFUKCSY42hAzVu6GovOpY6Ht7sMUUNbgbgRbdYtNZqg
	 m+QdRfqo+vV8Q==
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
Subject: [PATCH AUTOSEL 6.1 20/39] ASoC: rt5650: fix the wrong result of key
 button
Date: Sun, 29 Oct 2023 18:56:52 -0400
Message-ID: <20231029225740.790936-20-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029225740.790936-1-sashal@kernel.org>
References: <20231029225740.790936-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.60
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EZNWFKGQDBWRQ4Z2XQFQBOXJMFVXANMG
X-Message-ID-Hash: EZNWFKGQDBWRQ4Z2XQFQBOXJMFVXANMG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EZNWFKGQDBWRQ4Z2XQFQBOXJMFVXANMG/>
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
index 620ecbfa4a7a8..f86fc7cd104d4 100644
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

