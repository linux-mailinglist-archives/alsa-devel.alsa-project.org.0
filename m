Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9933278A21D
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 23:53:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 403E1208;
	Sun, 27 Aug 2023 23:53:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 403E1208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693173237;
	bh=6BcomEVXBnyGVNvp37g8chRLmborGpJ522tSsRO/bp4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hCw9Rau8JC7wmCpCJwhW2WlYdwy5J7lO0g42LIJRcLkz88kT+85T8k4sX22fxQL4I
	 w58CBhF/pQ/j8XMmoJDUKcj1zeEbAUJ6I++TcX+uMvGMtNZ/EmXZ8q85RW9ZfoCpZ5
	 hEFq3VSUj4XTxkx/fI8XkCKa+QLhBdL6ieJad00U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53E83F8023B; Sun, 27 Aug 2023 23:53:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6F48F800D1;
	Sun, 27 Aug 2023 23:53:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD13BF80158; Sun, 27 Aug 2023 23:53:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.mutex.one (mail.mutex.one [62.77.152.124])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 867E0F800F5
	for <alsa-devel@alsa-project.org>; Sun, 27 Aug 2023 23:52:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 867E0F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mutex.one header.i=@mutex.one header.a=rsa-sha256
 header.s=default header.b=BfBlv4sp
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mutex.one (Postfix) with ESMTP id F292C16C0048;
	Mon, 28 Aug 2023 00:52:51 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
	by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ceTVD1IBz36t; Mon, 28 Aug 2023 00:52:50 +0300 (EEST)
From: Marian Postevca <posteuca@mutex.one>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
	t=1693173170; bh=6BcomEVXBnyGVNvp37g8chRLmborGpJ522tSsRO/bp4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BfBlv4spIVT/S4AEPl9XyT1IsxwYCVZaf3glumRJUNyjT0p+QAztdNVmYgfCk3BSg
	 dgfLxXHTSfc3DXUmlGbcEdiFOeYtS4awPtDQEz/f953NbrCsu/s26vlvPZ2UMeQdhr
	 LZyqEAs0iwYJuFGk/tX3k9tljvhELE2eT1Z0PhhY=
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] ASoC: es8316: Enable support for MCLK div by 2
In-Reply-To: <ZOfRXjuSTxSV89SC@finisterre.sirena.org.uk>
References: <20230824210135.19303-1-posteuca@mutex.one>
 <20230824210135.19303-3-posteuca@mutex.one>
 <ZOfRXjuSTxSV89SC@finisterre.sirena.org.uk>
Date: Mon, 28 Aug 2023 00:50:45 +0300
Message-ID: <87msyc9mtm.fsf@mutex.one>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: EAR7HDX3HAWPCBLUW3UAHPSTCTYDZJ2M
X-Message-ID-Hash: EAR7HDX3HAWPCBLUW3UAHPSTCTYDZJ2M
X-MailFrom: posteuca@mutex.one
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EAR7HDX3HAWPCBLUW3UAHPSTCTYDZJ2M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Mark Brown <broonie@kernel.org> writes:


> Given that the datasheet quotes a maximum MCLK of 51.2MHz I suspect that
> this is far too high and that performance is degrading well before this
> point, it sounds like it just so happens that you noticed issues on a
> machine with this MCLK rather than that's based on the spec.  I would
> instead suggest applying the MCLK divider in any case where we can do so
> and still generate suitable clocking for the rest of the system, or at
> least hit 256fs (the datasheet quotes 256/384fs on the front page which
> suggests it's targetting 256fs, that'd be a fairly normal number, and
> there's mention of 12/24MHz USB clocks being directly usable).  Doing
> this should either make no odds or result in better performance.

Not 100% sure what checks should be done for a MCLK to determine if it
generates suitable clocking. Would something along this patch make
sense?

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index a8f347f1affb..667648de8105 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -470,19 +470,36 @@ static int es8316_pcm_hw_params(struct snd_pcm_substream *substream,
 	u8 bclk_divider;
 	u16 lrck_divider;
 	int i;
+	unsigned int clk = es8316->sysclk / 2;
+	bool clk_valid = false;
+
+	do {
+		/* Validate supported sample rates that are autodetected from MCLK */
+		for (i = 0; i < NR_SUPPORTED_MCLK_LRCK_RATIOS; i++) {
+			const unsigned int ratio = supported_mclk_lrck_ratios[i];
+
+			if (clk % ratio != 0)
+				continue;
+			if (clk / ratio == params_rate(params))
+				break;
+		}
+		if (i == NR_SUPPORTED_MCLK_LRCK_RATIOS) {
+			if (clk == es8316->sysclk)
+				return -EINVAL;
+			else
+				clk = es8316->sysclk;
+		} else {
+			clk_valid = true;
+		}
+	} while(!clk_valid);
 
-	/* Validate supported sample rates that are autodetected from MCLK */
-	for (i = 0; i < NR_SUPPORTED_MCLK_LRCK_RATIOS; i++) {
-		const unsigned int ratio = supported_mclk_lrck_ratios[i];
-
-		if (es8316->sysclk % ratio != 0)
-			continue;
-		if (es8316->sysclk / ratio == params_rate(params))
-			break;
+	if (clk != es8316->sysclk) {
+		snd_soc_component_update_bits(component, ES8316_CLKMGR_CLKSW,
+					      ES8316_CLKMGR_CLKSW_MCLK_DIV,
+					      ES8316_CLKMGR_CLKSW_MCLK_DIV);
 	}
-	if (i == NR_SUPPORTED_MCLK_LRCK_RATIOS)
-		return -EINVAL;
-	lrck_divider = es8316->sysclk / params_rate(params);
+
+	lrck_divider = clk / params_rate(params);
 	bclk_divider = lrck_divider / 4;
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:

