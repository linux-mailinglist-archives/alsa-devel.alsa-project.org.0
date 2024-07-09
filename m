Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEA392BFB8
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 18:24:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A35D31518;
	Tue,  9 Jul 2024 18:24:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A35D31518
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720542271;
	bh=0wuAbCv33awmJ0jI0ZgnUadRLfQ9tt0N9lUO6P/CRcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bqvoq6xNR34AUdgM0NudqCvl4IWQVZa4rfakyRLNq/UOwMDyog25Rd5/yVCRxZFza
	 Y77frYzr8slkbCMiuRj3R359t3SViByVM6/kpj+yVSRKEw9W9EGjKje4EeQDfuTCr1
	 X1anExzm5/ctSF4fv84WQPUn6TTR3G+8cqzxKmSU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2726F80603; Tue,  9 Jul 2024 18:23:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9825EF80606;
	Tue,  9 Jul 2024 18:23:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD727F804FC; Tue,  9 Jul 2024 18:21:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19EC1F801F5
	for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2024 18:20:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19EC1F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pB3JQgcs
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EA9DFCE129E;
	Tue,  9 Jul 2024 16:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA255C32782;
	Tue,  9 Jul 2024 16:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542040;
	bh=0wuAbCv33awmJ0jI0ZgnUadRLfQ9tt0N9lUO6P/CRcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pB3JQgcs0Cy9Zb/LTJ/EwE9bKTKSuUFkoEizVLyWZ92LrCgC9zM+UF+zRz4cH8emS
	 bpfqmMQN5/H9xwxT8/Z7KHaPAbsKAMZNryo6BPv5eg+/oq4OO+E2/fPvW+XX0OZ7Mp
	 jxI6SaxIAh9GsY0FCbEm4sE8MCwILzDyryRoSVGtbfJpklx7uBlsIr36fjXxhSKDqd
	 GbB46+0hD7Ia2TQfE7IWoBg5vj/u9i2DiwgSTjCioKEShOcU5ILxMF+TAqXS32wmXT
	 SspMMza2LMbKw/H6NaC2MyJKXpnFHSusDWHpn9waDWFeDAJjq/2nfFwgbtuDE1tLEf
	 EeWs9fRnCmslQ==
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
Subject: [PATCH AUTOSEL 6.9 13/40] ASoC: ti: davinci-mcasp: Set min period
 size using FIFO config
Date: Tue,  9 Jul 2024 12:18:53 -0400
Message-ID: <20240709162007.30160-13-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709162007.30160-1-sashal@kernel.org>
References: <20240709162007.30160-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: M67G27PUH7YYWORUZKZRRI4N5V6URVNU
X-Message-ID-Hash: M67G27PUH7YYWORUZKZRRI4N5V6URVNU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M67G27PUH7YYWORUZKZRRI4N5V6URVNU/>
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
index 1e760c3155213..2b1ed91a736c9 100644
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

