Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4DB6A1E9F
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Feb 2023 16:35:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10C2574C;
	Fri, 24 Feb 2023 16:34:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10C2574C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677252914;
	bh=tnnkPb7i29LhvGhb9GsNiC1Maajm7+tK+6jwNm2U4/Y=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZZ8qDIJ36JO8ZBLHP7kJqnGk9UoBd/2RfKiMMC6j3fp0+TieGJdeY9em2AsK2x5mN
	 k5Rp0+8W1S0RSq8d/l1IQ3AFpV90fFMIZAST3hI7Vh9wojNbSqn1OFz1gMEWkqY1v2
	 8tMqI+tL1FuBiRoBJkyoxTU5BD/dMh4GxuGSTMl8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42F66F80290;
	Fri, 24 Feb 2023 16:33:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB770F80130; Fri, 24 Feb 2023 16:33:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21F67F800BA
	for <alsa-devel@alsa-project.org>; Fri, 24 Feb 2023 16:33:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21F67F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=cutebit.org header.i=@cutebit.org header.a=rsa-sha256
 header.s=mail header.b=gvMicpRv
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1677252796; bh=YGinMNYfBj9tPJ7INLC5xM+c2L7Uf1eMU3rGvaMeVic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gvMicpRvMrcnvujo94b4P//HAZMsJSPEX6dUJTNPmGGqMUvLcOG0uoWY7QssQm5zC
	 6wMeg0oEXLabG9bZ+kMeiqnh9j0qrnKtUCbbXc7CJIf4oMyewt/MEqHeLXSkZHSzD4
	 0cM9EHBJ/VR3jl6vcqO+oLVgQsO4r5vJDLkTc81U=
To: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/3] ASoC: apple: mca: Improve handling of unavailable DMA
 channels
Date: Fri, 24 Feb 2023 16:33:02 +0100
Message-Id: <20230224153302.45365-3-povik+lin@cutebit.org>
In-Reply-To: <20230224153302.45365-1-povik+lin@cutebit.org>
References: <20230224153302.45365-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: R5A5TBVN32H4PYM6DPCQU4R36DRZLY44
X-Message-ID-Hash: R5A5TBVN32H4PYM6DPCQU4R36DRZLY44
X-MailFrom: povik+lin@cutebit.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: asahi@lists.linux.dev, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R5A5TBVN32H4PYM6DPCQU4R36DRZLY44/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When we fail to obtain a DMA channel, don't return a blanket -EINVAL,
instead return the original error code if there's one. This makes
deferring work as it should. Also don't print an error message for
-EPROBE_DEFER.

Fixes: 4ec8179c212f ("ASoC: apple: mca: Postpone requesting of DMA channels")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/apple/mca.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index aea08c7b2ee8..64750db9b963 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -950,10 +950,17 @@ static int mca_pcm_new(struct snd_soc_component *component,
 		chan = mca_request_dma_channel(cl, i);
 
 		if (IS_ERR_OR_NULL(chan)) {
+			mca_pcm_free(component, rtd->pcm);
+
+			if (chan && PTR_ERR(chan) == -EPROBE_DEFER)
+				return PTR_ERR(chan);
+
 			dev_err(component->dev, "unable to obtain DMA channel (stream %d cluster %d): %pe\n",
 				i, cl->no, chan);
-			mca_pcm_free(component, rtd->pcm);
-			return -EINVAL;
+
+			if (!chan)
+				return -EINVAL;
+			return PTR_ERR(chan);
 		}
 
 		cl->dma_chans[i] = chan;
-- 
2.33.0

