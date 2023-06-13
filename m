Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B0E72EBCF
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 21:21:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C19FAEB1;
	Tue, 13 Jun 2023 21:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C19FAEB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686684069;
	bh=KCfJIcp7kkIu1+mlYfXFXgunQi3xf4IYR9P4qEL5nHQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gqMURtl7llNzQRYDjxBsGBoqRxeWk6MDrAPu/9Hk16pxur9h7jUoqD7kLCIlTX8bG
	 cdOeckOxOqHnHmpW0uGU5kbCjaR2YgLW556JM7SkZpU1+B9dvVbxhZcCwX0qg8bQit
	 mOK0CrmpZ64Ibql0qf3UB58r4qW3Hu8YaiOOuV4k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A6F5F8052E; Tue, 13 Jun 2023 21:20:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1A89F80132;
	Tue, 13 Jun 2023 21:20:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6014F80149; Tue, 13 Jun 2023 21:20:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 059CDF80130
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 21:20:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 059CDF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=ssUViiJS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=h/MocxZZY8RaZOfp7gLNY7VCpf7RUx7xvYUlaMEvuNs=;
	t=1686684013;x=1686774013;
	b=ssUViiJS6ZL0fxLxSO4fowrmMuss+JPH1q2y+1Cm7C2bmGOahINcMnUxT/FBMVdNjjWfi9JCxg2I1PLzVEKbtuBPZUinoIAWYyoXoSsHOyI14Ttwe7X9fk8Q2vt5vOuUspn/YFzMqv9voqYE02KLr4/D8IvK3FI/4QHE2GZmWnR6REx92Q3EX8iKzu8GNMAQmCY+RSRIHqDCaDc+7A0e83EWzHPh5f4xXWcVLhRLz38aaIUKFDMcm8fPI0lpUzQHMs6MJToVmrLipYBKoSzaxobvf4V1v9ditrFvrj882nCLnKmxK/+ZB+uBEVda4ZAoFY7pzPyWlUOIo0iXJfZGgg==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1q99Yo-0004RB-FR; Tue, 13 Jun 2023 22:20:10 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: alsa-devel@alsa-project.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ASoC: dwc: add DMA handshake control
Date: Tue, 13 Jun 2023 22:19:08 +0300
Message-Id: <20230613191910.725049-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtpng1.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 
 4F1203BC0FB41BD95D99986233CC4DDC1DBB6C3EBD37189F6AA3DE0BD4C4F69B182A05F538085040E0E7776396F042F7254649D147650561F7F22C361045218E56B3565F567D1BB9
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE76574C3D62D66A535EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637160171C9EBC7AFE48638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8345564E8F5B93C7057DFDA784C71EC186F9789CCF6C18C3F8528715B7D10C86859CC434672EE6371117882F4460429724CE54428C33FAD305F5C1EE8F4F765FCF87214F1A954108EA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F446042972877693876707352041BF15D38FB6CB3A618001F51B5FD3F9D2E47CDBA5A96583BA9C0B312567BB231DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B6753C3A5E0A5AB5B7089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 
 0D63561A33F958A59FDFF15DC32349A54F3A3590F1E48026FA34DBAAA459B824F87CCE6106E1FC07E67D4AC08A07B9B0A6C7FFFE744CA7FB9C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A0997E3FB2386030E77
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF9F07DD80A176A3FEC3680CDDE082CCDCCDA9E59ED755A0934DA4EF5A276EBD5BA161E968D9DBB349513AFAF93E604BF59AA2BE663C95F38C3FAE0DD5D9DF71F6464E0F6E1F48538C02C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojMslUgTLgY7GrpO6CGEzBgQ==
X-Mailru-Sender: 
 689FA8AB762F73930F533AC2B33E986B1F95BF9A3CEDE7523E34D31F511E352698CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Message-ID-Hash: 2SK6NYOI722TS532RYB5PB2TXMEU2CZI
X-Message-ID-Hash: 2SK6NYOI722TS532RYB5PB2TXMEU2CZI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2SK6NYOI722TS532RYB5PB2TXMEU2CZI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DMA mode uses hardware handshake signals. DMACR register is used to enable
the DMA Controller interface operation. So add DMA enable/disable to
i2s_start()/i2s_stop() functions if using DMA mode.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 sound/soc/dwc/dwc-i2s.c | 39 +++++++++++++++++++++++++++++++++++++--
 sound/soc/dwc/local.h   |  6 ++++++
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 9e7065dd854c..02b9894e99a7 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -150,19 +150,51 @@ static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 }
 
+static void i2s_enable_dma(struct dw_i2s_dev *dev, u32 stream)
+{
+	u32 dma_reg = i2s_read_reg(dev->i2s_base, I2S_DMACR);
+
+	/* Enable DMA handshake for stream */
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+		dma_reg |= I2S_DMAEN_TXBLOCK;
+	else
+		dma_reg |= I2S_DMAEN_RXBLOCK;
+
+	i2s_write_reg(dev->i2s_base, I2S_DMACR, dma_reg);
+}
+
+static void i2s_disable_dma(struct dw_i2s_dev *dev, u32 stream)
+{
+	u32 dma_reg = i2s_read_reg(dev->i2s_base, I2S_DMACR);
+
+	/* Disable DMA handshake for stream */
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		dma_reg &= ~I2S_DMAEN_TXBLOCK;
+		i2s_write_reg(dev->i2s_base, I2S_RTXDMA, 1);
+	} else {
+		dma_reg &= ~I2S_DMAEN_RXBLOCK;
+		i2s_write_reg(dev->i2s_base, I2S_RRXDMA, 1);
+	}
+	i2s_write_reg(dev->i2s_base, I2S_DMACR, dma_reg);
+}
+
 static void i2s_start(struct dw_i2s_dev *dev,
 		      struct snd_pcm_substream *substream)
 {
 	struct i2s_clk_config_data *config = &dev->config;
 
 	i2s_write_reg(dev->i2s_base, IER, 1);
-	i2s_enable_irqs(dev, substream->stream, config->chan_nr);
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		i2s_write_reg(dev->i2s_base, ITER, 1);
 	else
 		i2s_write_reg(dev->i2s_base, IRER, 1);
 
+	if (dev->use_pio)
+		i2s_enable_irqs(dev, substream->stream, config->chan_nr);
+	else
+		i2s_enable_dma(dev, substream->stream);
+
 	i2s_write_reg(dev->i2s_base, CER, 1);
 }
 
@@ -176,7 +208,10 @@ static void i2s_stop(struct dw_i2s_dev *dev,
 	else
 		i2s_write_reg(dev->i2s_base, IRER, 0);
 
-	i2s_disable_irqs(dev, substream->stream, 8);
+	if (dev->use_pio)
+		i2s_disable_irqs(dev, substream->stream, 8);
+	else
+		i2s_disable_dma(dev, substream->stream);
 
 	if (!dev->active) {
 		i2s_write_reg(dev->i2s_base, CER, 0);
diff --git a/sound/soc/dwc/local.h b/sound/soc/dwc/local.h
index d64bd4f8fd34..ba4e397099be 100644
--- a/sound/soc/dwc/local.h
+++ b/sound/soc/dwc/local.h
@@ -53,6 +53,12 @@
 #define I2S_COMP_VERSION	0x01F8
 #define I2S_COMP_TYPE		0x01FC
 
+#define I2S_RRXDMA		0x01C4
+#define I2S_RTXDMA		0x01CC
+#define I2S_DMACR		0x0200
+#define I2S_DMAEN_RXBLOCK	(1 << 16)
+#define I2S_DMAEN_TXBLOCK	(1 << 17)
+
 /*
  * Component parameter register fields - define the I2S block's
  * configuration.
-- 
2.40.1

