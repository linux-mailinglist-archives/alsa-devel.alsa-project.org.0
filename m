Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E783C7DAFE3
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Oct 2023 00:00:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B343E75;
	Sun, 29 Oct 2023 23:59:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B343E75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698620444;
	bh=Xk3/KL1/p/7aPW6+tG0rfglenLkveedb3INbBGFMFs4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Il5RvVYDNU+fTRrGu4ZxUuzLSPxkV/ZyTDbpO7oLIPlI9cV3rlCk1s2EznIliJpeb
	 NBU30rz78DL0T/zW8/ZTvJwv+RcohuNXUpuSN2vlAvEQfOHm9caq6eD1LzVgM/vifn
	 EUZ1xhMvwHIjx2Q1pj22jqLyJl+IuV4suPYv0SV0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63646F8014B; Sun, 29 Oct 2023 23:59:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1351CF80571;
	Sun, 29 Oct 2023 23:59:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFB79F80537; Sun, 29 Oct 2023 23:59:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EFC3BF80425
	for <alsa-devel@alsa-project.org>; Sun, 29 Oct 2023 23:59:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFC3BF80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SIQDVKCA
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B1355CE125B;
	Sun, 29 Oct 2023 22:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03E8C4163C;
	Sun, 29 Oct 2023 22:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620374;
	bh=Xk3/KL1/p/7aPW6+tG0rfglenLkveedb3INbBGFMFs4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SIQDVKCAUsmWG7V4E7dhkZ8TQaTcNSFKLD/BtBgfSK6lMk82IdyQy7quAP6KjyCXa
	 y6O9P+wfTo236GiJ3RsLinuEXbED0ZqBz3aI5M0Evsw3nrH0qn7+sIVHlq5ZJXmJcQ
	 raqGguXiEPxeZH6++v+AKRckAOWNPwW3TrE8yRiEBhfKwJaWrx3EgDrek4xBlGnchp
	 RMzuw60voiDkGmm50pxZtFEaefg8jXacphSub6xrJmAH6Csfur4vuLXSxUH+tZswla
	 /9izNVJNViie9YaDYBA9eDXpCOrmYARU7nigGPpfljNKXbkPOIbmkz1PPLLtnSc+Nw
	 gX17ipzr8+Uyg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 5.15 13/28] ASoC: codecs: wsa-macro: handle component
 name prefix
Date: Sun, 29 Oct 2023 18:58:48 -0400
Message-ID: <20231029225916.791798-13-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029225916.791798-1-sashal@kernel.org>
References: <20231029225916.791798-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.137
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7ATTMYMMIYHANQYJX3HBZVP32LD7T4R4
X-Message-ID-Hash: 7ATTMYMMIYHANQYJX3HBZVP32LD7T4R4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7ATTMYMMIYHANQYJX3HBZVP32LD7T4R4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

[ Upstream commit c29e5263d32a6d0ec094d425ae7fef3fa8d4da1c ]

When comparing widget names in wsa_macro_spk_boost_event(), consider
also the component's name prefix.  Otherwise the WSA codec won't have
proper mixer setup resulting in no sound playback through speakers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://lore.kernel.org/r/20231003155710.821315-3-krzysztof.kozlowski@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index dd1a8b7bc794c..643ddf7dd6c5d 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1668,12 +1668,12 @@ static int wsa_macro_spk_boost_event(struct snd_soc_dapm_widget *w,
 	u16 boost_path_ctl, boost_path_cfg1;
 	u16 reg, reg_mix;
 
-	if (!strcmp(w->name, "WSA_RX INT0 CHAIN")) {
+	if (!snd_soc_dapm_widget_name_cmp(w, "WSA_RX INT0 CHAIN")) {
 		boost_path_ctl = CDC_WSA_BOOST0_BOOST_PATH_CTL;
 		boost_path_cfg1 = CDC_WSA_RX0_RX_PATH_CFG1;
 		reg = CDC_WSA_RX0_RX_PATH_CTL;
 		reg_mix = CDC_WSA_RX0_RX_PATH_MIX_CTL;
-	} else if (!strcmp(w->name, "WSA_RX INT1 CHAIN")) {
+	} else if (!snd_soc_dapm_widget_name_cmp(w, "WSA_RX INT1 CHAIN")) {
 		boost_path_ctl = CDC_WSA_BOOST1_BOOST_PATH_CTL;
 		boost_path_cfg1 = CDC_WSA_RX1_RX_PATH_CFG1;
 		reg = CDC_WSA_RX1_RX_PATH_CTL;
-- 
2.42.0

