Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6CD72EBC6
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 21:17:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39904EA6;
	Tue, 13 Jun 2023 21:16:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39904EA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686683857;
	bh=slJQ2YmidWzhmOdM9NHe7zDLehV28BDKPla9Z5kf0wk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=U4ttzpzQvyxn45wHJfHLYrAIb93uM6OG4sR4JNcMePJGNvWxmkddjA0Z06VYshgDm
	 hDWKjTkdz/U0vs6B6WlZz9GF3YbqRf3UfLbV/tY7Aoj5C/+24+TmkC46Zfe7aV1U9S
	 jIKJCUv4nbpK6/5b1vhKbQtqow3xUaksMSs2YDA0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5514F80149; Tue, 13 Jun 2023 21:16:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B45FDF80132;
	Tue, 13 Jun 2023 21:16:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E82AFF80149; Tue, 13 Jun 2023 21:16:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88E55F800ED
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 21:16:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88E55F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=KcxF5edR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=SIM2hbaxLCBXe7+2v+UqnK6GbLgEd0qwt7rjoZz/WUg=;
	t=1686683765;x=1686773765;
	b=KcxF5edRG8u3OUVF74ZXxRLqSJE9U9w2z/55Jdki15shcqOj2Lj/aZKsYX4Qk2IyYHSdztUko7PGNcd26XlS3XGC5h+a2IQu3D6B/v34SLwlwHQtAr8vXaC6iaaQGE0QTS9q+bOz1Q+wsurShAkth4hnRad0EdlfLKpT3TwKPwDkTe870ARBasAuWO7qpQc5PtCTaMnRoJ/JMbDwgpwPg9iUyLAGFErPI9NHs0Zlxfa9TkkRJgrqpza5k6kqZDTU+hX98hFbOLbGxxSm08qSt/azQuqqE9xTWhflQDEnG6Jr2O1EP2qk0rHmrAKGpu8GGLOLO22U3+cq/q94r6fWHA==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1q99Uo-0007az-1Q; Tue, 13 Jun 2023 22:16:02 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: alsa-devel@alsa-project.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ASoC: dwc: don't assign addr_width for dt configs
Date: Tue, 13 Jun 2023 22:15:51 +0300
Message-Id: <20230613191552.724748-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtpng3.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 
 4F1203BC0FB41BD95D99986233CC4DDC5FE2F5E6723F70B2B5A8ACCF658560FC182A05F5380850407E655930523C17D639AC45AB5C083FA82E722F5874E99C1218C1D4EF41E31883
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE75BC5C25D5957B3DFEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637E16D8B060A9A23898638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8ACEC9A8843F0FAD4A99510ACC6A0F2E56F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE74601F13E4625331C9FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751FBDFBBEFFF4125B51D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BB6FC2C91A742FF12A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CB1724D34C644744043847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 
 0D63561A33F958A541016C4333575D4AAACFAB04AB5EB0D4E1025A028F061139F87CCE6106E1FC07E67D4AC08A07B9B062B3BD3CC35DA5889C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A0997E3FB2386030E77
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFC99611A8606EF2C48E62A0A3BFF44D77B65792F25642EA84D5BF5B4F3AC730E9FA89AC6828CC4048513AFAF93E604BF56E725539BC0402C96C986110FC862FBD464E0F6E1F48538C02C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojMslUgTLgY7EBG8KyzHMuiA==
X-Mailru-Sender: 
 689FA8AB762F73930F533AC2B33E986B46CEA984123307E973B46CD0F74303F398CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Message-ID-Hash: NOU6UOAK4ED7IYMG3WYVX4CBCP3UTELN
X-Message-ID-Hash: NOU6UOAK4ED7IYMG3WYVX4CBCP3UTELN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NOU6UOAK4ED7IYMG3WYVX4CBCP3UTELN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For proper DMA operation addr_width must corresponds with audio format
(S16, S24, S32, etc). Proper bus width calculations is performed by
snd_hwparams_to_dma_slave_config(). So drop wrong addr_width asignment
for dt configs and let snd_hwparams_to_dma_slave_config() do the job.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 sound/soc/dwc/dwc-i2s.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 9e7065dd854c..21398ee924e4 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -558,13 +558,9 @@ static int dw_configure_dai_by_dt(struct dw_i2s_dev *dev,
 	u32 comp1 = i2s_read_reg(dev->i2s_base, I2S_COMP_PARAM_1);
 	u32 comp2 = i2s_read_reg(dev->i2s_base, I2S_COMP_PARAM_2);
 	u32 fifo_depth = 1 << (1 + COMP1_FIFO_DEPTH_GLOBAL(comp1));
-	u32 idx = COMP1_APB_DATA_WIDTH(comp1);
 	u32 idx2;
 	int ret;
 
-	if (WARN_ON(idx >= ARRAY_SIZE(bus_widths)))
-		return -EINVAL;
-
 	ret = dw_configure_dai(dev, dw_i2s_dai, SNDRV_PCM_RATE_8000_192000);
 	if (ret < 0)
 		return ret;
@@ -574,7 +570,6 @@ static int dw_configure_dai_by_dt(struct dw_i2s_dev *dev,
 
 		dev->capability |= DWC_I2S_PLAY;
 		dev->play_dma_data.dt.addr = res->start + I2S_TXDMA;
-		dev->play_dma_data.dt.addr_width = bus_widths[idx];
 		dev->play_dma_data.dt.fifo_size = fifo_depth *
 			(fifo_width[idx2]) >> 8;
 		dev->play_dma_data.dt.maxburst = 16;
@@ -584,7 +579,6 @@ static int dw_configure_dai_by_dt(struct dw_i2s_dev *dev,
 
 		dev->capability |= DWC_I2S_RECORD;
 		dev->capture_dma_data.dt.addr = res->start + I2S_RXDMA;
-		dev->capture_dma_data.dt.addr_width = bus_widths[idx];
 		dev->capture_dma_data.dt.fifo_size = fifo_depth *
 			(fifo_width[idx2] >> 8);
 		dev->capture_dma_data.dt.maxburst = 16;
-- 
2.40.1

