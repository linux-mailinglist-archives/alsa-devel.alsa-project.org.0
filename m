Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3B56E048B
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 04:39:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C435F93;
	Thu, 13 Apr 2023 04:38:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C435F93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681353588;
	bh=P1RJ20QJirQyRF3HhoWwKz3CHgv5xWwc6aSBD4SJCo4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b0s7aj7thZrTBa+SlXssrO4Dvq7e6oeNxcJaxb0U0/+axRAbidtT40VU75mmdQZTu
	 Ehzf/3d9ePbsy3lkMQPt1QNq3JWEvNGp9rO29vxhi4fjj+qHWftdOwOeMYNEdMujal
	 2DVzB57ybeCOD0B/HjGvxMmuTz5HvajuEutuaGi4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1190CF8057C;
	Thu, 13 Apr 2023 04:37:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBCFEF8056F; Thu, 13 Apr 2023 04:36:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61C98F80563
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 04:36:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61C98F80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SwcQyGyR
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DCA2863A64;
	Thu, 13 Apr 2023 02:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D578AC4339C;
	Thu, 13 Apr 2023 02:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681353415;
	bh=P1RJ20QJirQyRF3HhoWwKz3CHgv5xWwc6aSBD4SJCo4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SwcQyGyRSZZrimKUkQzBwbeBYipfzG4G5sKM1V3TKyUV3qptQguQUj5lTMbt6CKlm
	 36vbC7oygyuu3IMGZrcZeWhseFOwuo0OIseaQs9bMhcGQDGZlFEfnbcjKvfM0Ogfao
	 /YA5dIRmeYJEMe2Efexf0L3COrxUuaivIsX8zZgeXCk1iy8TK/yaosO7VYGCHhAoBf
	 rcQPyLcYLnUMU5wkjDeRtohqqiUEu5E7tIueGh7N84Q0hC9Wa4J9VckIOwjWIBtm34
	 E/reX9rRALNiIsESVqNUpH2w+Pljc9Hi6A/vOmz/gHndzUbK1Qaq7m9FRAs+Misyhv
	 9MyZc+yJgoSHg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 03/17] ASoC: soc-pcm: fix hw->formats cleared by
 soc_pcm_hw_init() for dpcm
Date: Wed, 12 Apr 2023 22:36:31 -0400
Message-Id: <20230413023647.74661-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230413023647.74661-1-sashal@kernel.org>
References: <20230413023647.74661-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: R4752FOX6RJ2YK5RNVBY3ACBCU5ZUAAM
X-Message-ID-Hash: R4752FOX6RJ2YK5RNVBY3ACBCU5ZUAAM
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Shengjiu Wang <shengjiu.wang@nxp.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, lgirdwood@gmail.com, tiwai@suse.com,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R4752FOX6RJ2YK5RNVBY3ACBCU5ZUAAM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shengjiu Wang <shengjiu.wang@nxp.com>

[ Upstream commit 083a25b18d6ad9f1f540e629909aa3eaaaf01823 ]

The hw->formats may be set by snd_dmaengine_pcm_refine_runtime_hwparams()
in component's startup()/open(), but soc_pcm_hw_init() will init
hw->formats in dpcm_runtime_setup_fe() after component's startup()/open(),
which causes the valuable hw->formats to be cleared.

So need to store the hw->formats before initialization, then restore
it after initialization.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Link: https://lore.kernel.org/r/1678346017-3660-1-git-send-email-shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/soc-pcm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 35a16c3f9591b..7a486ca9633c1 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1649,10 +1649,14 @@ static void dpcm_runtime_setup_fe(struct snd_pcm_substream *substream)
 	struct snd_pcm_hardware *hw = &runtime->hw;
 	struct snd_soc_dai *dai;
 	int stream = substream->stream;
+	u64 formats = hw->formats;
 	int i;
 
 	soc_pcm_hw_init(hw);
 
+	if (formats)
+		hw->formats &= formats;
+
 	for_each_rtd_cpu_dais(fe, i, dai) {
 		struct snd_soc_pcm_stream *cpu_stream;
 
-- 
2.39.2

