Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCC573A2ED
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 16:21:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 355FE836;
	Thu, 22 Jun 2023 16:21:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 355FE836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687443711;
	bh=ABfG5U8ZlUomFQ4p4/cGhciUNokqawnjxmeNaqAGb8s=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cJmSYAmtjIhD1E6nfFK54wisEm4tKOc/xAr/M1dUm9WfnonJ5FP7+MNu5kXYBW1dL
	 RXFs0rXInGoAorcvcC1BkXYR8B0tiGRjcI62ymN4jhR650KdBqwHIzCmCh7rlMxy/Z
	 L1kiY+PAnDm19b6On8kuHNhmEyRXQou6UNOKMtz4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95011F80169; Thu, 22 Jun 2023 16:21:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24F37F8003A;
	Thu, 22 Jun 2023 16:21:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F9C7F80141; Thu, 22 Jun 2023 16:20:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 00EA9F80124
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 16:20:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00EA9F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=pKPDLiR6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=x9jYgCRMi57sMlp/kB+Z2lOcPRP8HeMts15Z4yjHim8=;
	t=1687443650;x=1687533650;
	b=pKPDLiR668PGck68niq/sxD1n24ZSs511MA+zQC7U2Hr9SDJrcaHwBk11QUttaC12ZK1W6jnZ67UfSoKHuXiiw1++sfoV1SnyLTbz5jT2WuZe2fmLFyB3smNDfUiHBerXuOY5jc4+DyYEZQTO0GbRY2BhnKR/gn6ThpivqVlIw1HUSNFaIjdwag31b0b4kUU+ozqQLX44Rfk7cc0ZCX4CugwYsNroCLc/wY6mlG0IA6qR4TfzYr0hAeLA4IgD6UB61tm+mXeObJzzMq+Glfk9ue5OTCGZRR2PScD/5gt/BIsMcMByBK4mleEHkguEi+jIaR33W6YRTvF1P5JCPjtKA==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1qCLAw-00018Q-U7; Thu, 22 Jun 2023 17:20:43 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: alsa-devel@alsa-project.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Adrien Grassein <adrien.grassein@gmail.com>,
	Corey Minyard <cminyard@mvista.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] ASoC: codecs: max98090: Allow dsp_a mode
Date: Thu, 22 Jun 2023 17:20:36 +0300
Message-Id: <20230622142038.63388-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtpng3.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 
 4F1203BC0FB41BD95D99986233CC4DDCD825FF3AA070ECA3C2EE242F31DB0C21182A05F5380850409D11DA200681840409169157765583AA882108EBFC9D92DE66978FD4C1A5F380
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7DDEA16837FFA1F5BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637B997C8222C70C3D98638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D82C2156C0792FF9FF18C9E3BF1AD945A76F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7E4CD18687D5AE3809FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD182CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BA2FFE18CF0BA0C38A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7C468D16C903838CAB43847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 
 0D63561A33F958A5A05A01E30885E4704943CCE607FFAE936630BF085634F1F8F87CCE6106E1FC07E67D4AC08A07B9B0DB8A315C1FF4794DC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF3635E571D741F77234B4549C98B23E80F9A469AB21EF4B7625238343F307D42A0F85117B495E935BB05B57073EAFDF975B435DD2C715B9927B6D907F5F618D3BCAEB4C537E5BB5194C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojB41c+mu8Ac8puJIFnxTT5A==
X-Mailru-Sender: 
 689FA8AB762F73930F533AC2B33E986B625EC5945CDA9335CC069F1CE329CBBE98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Message-ID-Hash: K3B3Q5D7VV6EHLMC55A5W7PGG7UHEFT3
X-Message-ID-Hash: K3B3Q5D7VV6EHLMC55A5W7PGG7UHEFT3
X-MailFrom: fido_max@inbox.ru
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K3B3Q5D7VV6EHLMC55A5W7PGG7UHEFT3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

TDM mode for max98090 is dsp_a compatible with such limitations:
1) Up to four timeslots supported.
2) Only 16 bits timeslots supported.
3) Only 2 active timeslots (L/R) supported.

We want to setup TDM mode only when dsp_a mode is selected. So move
M98090_REG_TDM_FORMAT/M98090_REG_TDM_CONTROL registers setup from
max98090_set_tdm_slot() to the max98090_dai_set_fmt(). Also extend
max98090_set_tdm_slot() with all TDM limitations check.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 sound/soc/codecs/max98090.c | 53 ++++++++++++++++++++-----------------
 sound/soc/codecs/max98090.h |  3 ++-
 2 files changed, 30 insertions(+), 26 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 7bc463910d4f..2adf744c6526 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -1581,7 +1581,7 @@ static int max98090_dai_set_fmt(struct snd_soc_dai *codec_dai,
 	struct snd_soc_component *component = codec_dai->component;
 	struct max98090_priv *max98090 = snd_soc_component_get_drvdata(component);
 	struct max98090_cdata *cdata;
-	u8 regval;
+	u8 regval, tdm_regval;
 
 	max98090->dai_fmt = fmt;
 	cdata = &max98090->dai[0];
@@ -1590,6 +1590,7 @@ static int max98090_dai_set_fmt(struct snd_soc_dai *codec_dai,
 		cdata->fmt = fmt;
 
 		regval = 0;
+		tdm_regval = 0;
 		switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
 		case SND_SOC_DAIFMT_CBC_CFC:
 			/* Set to consumer mode PLL - MAS mode off */
@@ -1635,7 +1636,8 @@ static int max98090_dai_set_fmt(struct snd_soc_dai *codec_dai,
 			regval |= M98090_RJ_MASK;
 			break;
 		case SND_SOC_DAIFMT_DSP_A:
-			/* Not supported mode */
+			tdm_regval |= M98090_TDM_MASK;
+			break;
 		default:
 			dev_err(component->dev, "DAI format unsupported");
 			return -EINVAL;
@@ -1664,11 +1666,20 @@ static int max98090_dai_set_fmt(struct snd_soc_dai *codec_dai,
 		 * seen for the case of TDM mode. The remaining cases have
 		 * normal logic.
 		 */
-		if (max98090->tdm_slots > 1)
+		if (tdm_regval)
 			regval ^= M98090_BCI_MASK;
 
 		snd_soc_component_write(component,
 			M98090_REG_INTERFACE_FORMAT, regval);
+
+		regval = 0;
+		if (tdm_regval)
+			regval = max98090->tdm_lslot << M98090_TDM_SLOTL_SHIFT |
+				 max98090->tdm_rslot << M98090_TDM_SLOTR_SHIFT |
+				 0 << M98090_TDM_SLOTDLY_SHIFT;
+
+		snd_soc_component_write(component, M98090_REG_TDM_FORMAT, regval);
+		snd_soc_component_write(component, M98090_REG_TDM_CONTROL, tdm_regval);
 	}
 
 	return 0;
@@ -1679,33 +1690,22 @@ static int max98090_set_tdm_slot(struct snd_soc_dai *codec_dai,
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct max98090_priv *max98090 = snd_soc_component_get_drvdata(component);
-	struct max98090_cdata *cdata;
-	cdata = &max98090->dai[0];
 
 	if (slots < 0 || slots > 4)
 		return -EINVAL;
 
-	max98090->tdm_slots = slots;
-	max98090->tdm_width = slot_width;
-
-	if (max98090->tdm_slots > 1) {
-		/* SLOTL SLOTR SLOTDLY */
-		snd_soc_component_write(component, M98090_REG_TDM_FORMAT,
-			0 << M98090_TDM_SLOTL_SHIFT |
-			1 << M98090_TDM_SLOTR_SHIFT |
-			0 << M98090_TDM_SLOTDLY_SHIFT);
-
-		/* FSW TDM */
-		snd_soc_component_update_bits(component, M98090_REG_TDM_CONTROL,
-			M98090_TDM_MASK,
-			M98090_TDM_MASK);
-	}
+	if (slot_width != 16)
+		return -EINVAL;
 
-	/*
-	 * Normally advisable to set TDM first, but this permits either order
-	 */
-	cdata->fmt = 0;
-	max98090_dai_set_fmt(codec_dai, max98090->dai_fmt);
+	if (rx_mask != tx_mask)
+		return -EINVAL;
+
+	if (!rx_mask)
+		return -EINVAL;
+
+	max98090->tdm_slots = slots;
+	max98090->tdm_lslot = ffs(rx_mask) - 1;
+	max98090->tdm_rslot = fls(rx_mask) - 1;
 
 	return 0;
 }
@@ -2408,6 +2408,9 @@ static int max98090_probe(struct snd_soc_component *component)
 	max98090->pa1en = 0;
 	max98090->pa2en = 0;
 
+	max98090->tdm_lslot = 0;
+	max98090->tdm_rslot = 1;
+
 	ret = snd_soc_component_read(component, M98090_REG_REVISION_ID);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to read device revision: %d\n",
diff --git a/sound/soc/codecs/max98090.h b/sound/soc/codecs/max98090.h
index a197114b0dad..6ce8dd176e48 100644
--- a/sound/soc/codecs/max98090.h
+++ b/sound/soc/codecs/max98090.h
@@ -1533,7 +1533,8 @@ struct max98090_priv {
 	struct snd_soc_jack *jack;
 	unsigned int dai_fmt;
 	int tdm_slots;
-	int tdm_width;
+	int tdm_lslot;
+	int tdm_rslot;
 	u8 lin_state;
 	unsigned int pa1en;
 	unsigned int pa2en;
-- 
2.40.1

