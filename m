Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EE682EBBA
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jan 2024 10:40:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EEA8857;
	Tue, 16 Jan 2024 10:40:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EEA8857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705398038;
	bh=Bedn57ruaI8vaei65DA95W6x7hJEXXYsGj9Dv4JJWYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M4u1hlwiRrTRtu8VNhC09hzYqxvzxdqlJFHh9jyHZwRuA8uPjQgJQkS1xAJCjTLAO
	 u8z9+AdlFYochuNdwds3VCKw21BTcNMFioMM34GjGANcgQmiderbkYuo7K56D0hCcg
	 Ty3nrGrccMGeDwe5tYP1QR40bcuxBgTKstRJvHAs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6762F805C0; Tue, 16 Jan 2024 10:39:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7E10F805B5;
	Tue, 16 Jan 2024 10:39:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE716F804F1; Tue, 16 Jan 2024 10:39:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7F2DF800F5
	for <alsa-devel@alsa-project.org>; Tue, 16 Jan 2024 10:39:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7F2DF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ajxrKBJf
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 3E4F3B80D7A;
	Tue, 16 Jan 2024 09:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D27C433F1;
	Tue, 16 Jan 2024 09:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705397981;
	bh=Bedn57ruaI8vaei65DA95W6x7hJEXXYsGj9Dv4JJWYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ajxrKBJf6arEbXQ5f+gdeuNkpLXGzIqLvQQdw3sG/5LMMyliy+LcghBsTF1EmTMtB
	 5Z7z/GsF1PxKqo92QXGMQ05T80pQuspKYoSFy3mtMbnt2o/3fEkEvSTvwZ60yXEib7
	 nxbFZd6eZ4h+bK3isUAyFF5Q4FyHOibE7cmAoYm5DxtHSgKqAkieC0L4RK6qbG3AaP
	 ldSM62IlYcOAGnhYSzL3dzYgjgW72qEXrjl2E1+z0Ke5XDzPavveJUnMR6zzUskjId
	 i1nJQL3AwaodK1RWP5qBFz0PLi5X4p/h7AuY0jZFBp+uQnpo0YyLOKZDKU3ILT1tdH
	 nOh4DZwqHYJGA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rPfv6-00053X-1Q;
	Tue, 16 Jan 2024 10:39:44 +0100
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
Subject: [PATCH 4/7] ASoC: codecs: lpass-rx-macro: drop dead mixer-path gain
 hack
Date: Tue, 16 Jan 2024 10:39:00 +0100
Message-ID: <20240116093903.19403-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240116093903.19403-1-johan+linaro@kernel.org>
References: <20240116093903.19403-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IO7CIY6GHLACDBZXV4XIPL6AK4PQIBP4
X-Message-ID-Hash: IO7CIY6GHLACDBZXV4XIPL6AK4PQIBP4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IO7CIY6GHLACDBZXV4XIPL6AK4PQIBP4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The vendor driver modifies the gain settings behind the back of user
space but some of these hacks never made it upstream except for some
essentially dead code that reads out the (cached) gain setting and
writes it back again on DAPM events.

Drop the incomplete and pointless hack when enabling mixer paths.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index f35187d69cac..b1ec41eed851 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1956,10 +1956,9 @@ static int rx_macro_enable_main_path(struct snd_soc_dapm_widget *w,
 					int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	u16 gain_reg, reg;
+	u16 reg;
 
 	reg = CDC_RX_RXn_RX_PATH_CTL(w->shift);
-	gain_reg = CDC_RX_RXn_RX_VOL_CTL(w->shift);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -1969,10 +1968,6 @@ static int rx_macro_enable_main_path(struct snd_soc_dapm_widget *w,
 						      CDC_RX_PATH_CLK_EN_MASK,
 						      CDC_RX_PATH_CLK_ENABLE);
 		break;
-	case SND_SOC_DAPM_POST_PMU:
-		snd_soc_component_write(component, gain_reg,
-			snd_soc_component_read(component, gain_reg));
-		break;
 	case SND_SOC_DAPM_POST_PMD:
 		rx_macro_enable_interp_clk(component, event, w->shift);
 		break;
@@ -3031,16 +3026,13 @@ static const struct snd_soc_dapm_widget rx_macro_dapm_widgets[] = {
 
 	SND_SOC_DAPM_MUX_E("RX INT0_1 INTERP", SND_SOC_NOPM, INTERP_HPHL, 0,
 		&rx_int0_1_interp_mux, rx_macro_enable_main_path,
-		SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-		SND_SOC_DAPM_POST_PMD),
+		SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_MUX_E("RX INT1_1 INTERP", SND_SOC_NOPM, INTERP_HPHR, 0,
 		&rx_int1_1_interp_mux, rx_macro_enable_main_path,
-		SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-		SND_SOC_DAPM_POST_PMD),
+		SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_MUX_E("RX INT2_1 INTERP", SND_SOC_NOPM, INTERP_AUX, 0,
 		&rx_int2_1_interp_mux, rx_macro_enable_main_path,
-		SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-		SND_SOC_DAPM_POST_PMD),
+		SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 
 	SND_SOC_DAPM_MUX("RX INT0_2 INTERP", SND_SOC_NOPM, 0, 0,
 			 &rx_int0_2_interp_mux),
-- 
2.41.0

