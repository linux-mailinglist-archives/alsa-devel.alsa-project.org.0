Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9B18328C2
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jan 2024 12:28:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DED5084D;
	Fri, 19 Jan 2024 12:28:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DED5084D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705663708;
	bh=PpFYWvpWvaKjfmTGZlQiejgPJGGJTyWgcH0t98eImGc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YYdJs9Y+b5h+L1zCgshrQ8/lhomkRsDMSboh012n+JDpVi+WObsbiIcN2ViImpElX
	 QOtwuO1qFS3jLzN6gkgwcgKX1jsG6zgNhrNtxhCiSGqWY/5MJyvPh1l6KrxSHI8nPL
	 YbEFbBkgkKa5pD8vrjFfe0sUVvUxtVrvTtNBMbnU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6D80F80611; Fri, 19 Jan 2024 12:27:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7787F8060D;
	Fri, 19 Jan 2024 12:27:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0055F805AF; Fri, 19 Jan 2024 12:27:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02683F8028D
	for <alsa-devel@alsa-project.org>; Fri, 19 Jan 2024 12:27:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02683F8028D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LOv3dWTn
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7B2F2CE2227;
	Fri, 19 Jan 2024 11:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF41C433F1;
	Fri, 19 Jan 2024 11:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705663615;
	bh=PpFYWvpWvaKjfmTGZlQiejgPJGGJTyWgcH0t98eImGc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LOv3dWTn/xun4+yxYIoHQJHUvUT9bpLoYo7/MsTt7I5e8n6ZfMVgF6SoiZNeggqpT
	 rIPzMilJGJEVZ7ynlvccEVWcfpY1BUTsl9KGTnT3JvPPqrG5HgX6/7D9yCzMjh0mbP
	 bcrUe0BhnGRqvP6NyuddgUVvnchYROjsi4rIiZKF1jFVijuxkuUmhR6nGWz2qxN9tJ
	 CuEzKSKjMZWPqgTcxqE4uX9mBrfftWaUDURjCIf6K1VGL6kgRx7jlKp+hReKApr+31
	 kxazD5OXJGQHij/bCzSFIHg7qdHehD8ejedFLFX+avr27SYERF0ghtFZIzqmS1ISPp
	 3UVsXfHKTyBbg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rQn1c-0001xP-0G;
	Fri, 19 Jan 2024 12:27:04 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v4 4/4] ASoC: codecs: wcd9335: drop unused gain hack remnant
Date: Fri, 19 Jan 2024 12:24:20 +0100
Message-ID: <20240119112420.7446-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119112420.7446-1-johan+linaro@kernel.org>
References: <20240119112420.7446-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4JLV3YFZYGSZS3RICYSOMGEOQLZETJ6V
X-Message-ID-Hash: 4JLV3YFZYGSZS3RICYSOMGEOQLZETJ6V
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4JLV3YFZYGSZS3RICYSOMGEOQLZETJ6V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The vendor driver appears to be modifying the gain settings behind the
back of user space but these hacks never made it upstream except for
some essentially dead code that adds a constant zero to the current gain
setting on DAPM events.

Note that the volume registers still need to be written after enabling
clocks in order for any prior updates to take effect.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/codecs/wcd9335.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 43c648efd0d9..deb15b95992d 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -3033,7 +3033,6 @@ static int wcd9335_codec_enable_mix_path(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
 	u16 gain_reg;
-	int offset_val = 0;
 	int val = 0;
 
 	switch (w->reg) {
@@ -3073,7 +3072,6 @@ static int wcd9335_codec_enable_mix_path(struct snd_soc_dapm_widget *w,
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
 		val = snd_soc_component_read(comp, gain_reg);
-		val += offset_val;
 		snd_soc_component_write(comp, gain_reg, val);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
@@ -3294,7 +3292,6 @@ static int wcd9335_codec_enable_interpolator(struct snd_soc_dapm_widget *w,
 	u16 gain_reg;
 	u16 reg;
 	int val;
-	int offset_val = 0;
 
 	if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT0 INTERP"))) {
 		reg = WCD9335_CDC_RX0_RX_PATH_CTL;
@@ -3337,7 +3334,6 @@ static int wcd9335_codec_enable_interpolator(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_POST_PMU:
 		wcd9335_config_compander(comp, w->shift, event);
 		val = snd_soc_component_read(comp, gain_reg);
-		val += offset_val;
 		snd_soc_component_write(comp, gain_reg, val);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-- 
2.41.0

