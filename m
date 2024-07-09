Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B2E92BFE0
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 18:27:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ECF7162D;
	Tue,  9 Jul 2024 18:27:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ECF7162D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720542446;
	bh=/RlaPVpxKpTvknnTccGQYQ9FVMZH+4izDFPUaP3gGtI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dkQeTvrCeILrxgFtMRawq2DgqxZ5WpCfx7MTzV4TCqDkGo8qoU1dF8uOMEsCseyTU
	 Jncu4+oywE9d577+dsJPPFk3C7lbrGndsiUnM0Cck+rW6zcXncXx5tTj8B1B95HH3U
	 +VdnUGolIub1M9LRZlNelbJjpYwCPBwchcwY/g64=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E950AF805F2; Tue,  9 Jul 2024 18:25:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8870CF805EB;
	Tue,  9 Jul 2024 18:25:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CF30F805D4; Tue,  9 Jul 2024 18:25:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C004CF805D6
	for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2024 18:25:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C004CF805D6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eAaPyAOd
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 14707CE0B89;
	Tue,  9 Jul 2024 16:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E83C32786;
	Tue,  9 Jul 2024 16:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542330;
	bh=/RlaPVpxKpTvknnTccGQYQ9FVMZH+4izDFPUaP3gGtI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eAaPyAOdKAx8zY3+BIm+dK822M1YjpXB3jDNG0e3iKpvxQ7tQhW5uK5XDOVzOf1v0
	 Lw9RCBidjjw2SVeVpQPly3C0rZAJl8+PxVWRRub29zIOEZd1Yttxu572gzrJdrrCNi
	 q25af7eRT0sdKprCUPDFuHNupTgjDDDmfjKCisathodRccQ6aCDKGWLpn6fLTIYCP+
	 68JjX7ZmfsUQ9h28LgkpeOBgLbBO32z9QprnThrpBoZIbG6fB6jVRLleyiTdB1304E
	 EjGt6OEo0QAIkBu04gfHsHe5NInoWHKnSX3nnQGVsVW9j9m/z/nTJ+0foC1TzFSmaU
	 4g1kUQsHKd1sA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jai Luthra <j-luthra@ti.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 05/17] ASoC: ti: davinci-mcasp: Set min period
 size using FIFO config
Date: Tue,  9 Jul 2024 12:24:49 -0400
Message-ID: <20240709162517.32584-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709162517.32584-1-sashal@kernel.org>
References: <20240709162517.32584-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.162
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IQ62S4B5MBZLXT4UNJJQIDLVHA5ZIYP2
X-Message-ID-Hash: IQ62S4B5MBZLXT4UNJJQIDLVHA5ZIYP2
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IQ62S4B5MBZLXT4UNJJQIDLVHA5ZIYP2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Jai Luthra <j-luthra@ti.com>

[ Upstream commit c5dcf8ab10606e76c1d8a0ec77f27d84a392e874 ]

The minimum period size was enforced to 64 as older devices integrating
McASP with EDMA used an internal FIFO of 64 samples.

With UDMA based platforms this internal McASP FIFO is optional, as the
DMA engine internally does some buffering which is already accounted for
when registering the platform. So we should read the actual FIFO
configuration (txnumevt/rxnumevt) instead of hardcoding frames.min to
64.

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Link: https://lore.kernel.org/r/20240611-asoc_next-v3-2-fcfd84b12164@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/ti/davinci-mcasp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 5b82329f44401..dbd30604816e5 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -1472,10 +1472,11 @@ static int davinci_mcasp_hw_rule_min_periodsize(
 {
 	struct snd_interval *period_size = hw_param_interval(params,
 						SNDRV_PCM_HW_PARAM_PERIOD_SIZE);
+	u8 numevt = *((u8 *)rule->private);
 	struct snd_interval frames;
 
 	snd_interval_any(&frames);
-	frames.min = 64;
+	frames.min = numevt;
 	frames.integer = 1;
 
 	return snd_interval_refine(period_size, &frames);
@@ -1490,6 +1491,7 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
 	u32 max_channels = 0;
 	int i, dir, ret;
 	int tdm_slots = mcasp->tdm_slots;
+	u8 *numevt;
 
 	/* Do not allow more then one stream per direction */
 	if (mcasp->substreams[substream->stream])
@@ -1589,9 +1591,12 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
 			return ret;
 	}
 
+	numevt = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+			 &mcasp->txnumevt :
+			 &mcasp->rxnumevt;
 	snd_pcm_hw_rule_add(substream->runtime, 0,
 			    SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
-			    davinci_mcasp_hw_rule_min_periodsize, NULL,
+			    davinci_mcasp_hw_rule_min_periodsize, numevt,
 			    SNDRV_PCM_HW_PARAM_PERIOD_SIZE, -1);
 
 	return 0;
-- 
2.43.0

