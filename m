Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E003ACE51
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 17:09:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01040172C;
	Fri, 18 Jun 2021 17:09:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01040172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624028991;
	bh=WpgZqaJX/+7BSkqSgUw8H/zUIGbOwzMBZkNkKWi6y/E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DzIF+23ZyNK0B8frMvow6cDwzTJNQC/JX1TBstIChrwK1W/LKBlaNV7XxAPALkzhq
	 ts9DraODp53piKmUklK9viGwqoGQKG+QtZrN8R4Hx3CVcb6Hx6begd1CV0iUNgIf0a
	 HO/vhb6BZaD95MTp0anjsjsWQPUN9hCiWnLsREFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EF26F804C2;
	Fri, 18 Jun 2021 17:08:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5584EF8032D; Fri, 18 Jun 2021 17:08:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27C97F80148
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 17:08:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27C97F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="mE4gFzPj"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1624028883; x=1655564883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WpgZqaJX/+7BSkqSgUw8H/zUIGbOwzMBZkNkKWi6y/E=;
 b=mE4gFzPjtGq31J7r3u/LRolBnWOPQxs2j6Nd/b5dKKooF0+Q1Ed39Noh
 Z8PLeg9dKsIKJgOFNyGCOUY7GPMVQ/3e4F2PiBz2mqlg3pwTY1znciAJw
 tXaPzVfrOtBbcRmjcw1A6QGHORGmfvY3b63TLxJMeG7CNtEKlY62Qi4Lr
 LHwgVyI3+3PCb3d8r5+8bdW9HFya0kSIODaWk+cwLHwCl6GG/prvSz5Kz
 Bm7XI0l5RGUwPRsJNUYMVyk8hM3aYFJAQ0QdrjfUf7fb20cyHA+qZsko1
 Db8G0L97l7jZSxeUH7lcorahxpCZV4mLqVlNDEw93YBIK2sGrrrNLP4xD g==;
IronPort-SDR: EtHACUtRraKX5sxLg2ztvjKgVg9okxvvn+O/IQyua40UpAUHhr6wD/VZowF5MRGsWLOLqJb8NC
 viCI6hrwBzifgGBOsVW3nJZTw5gLV0vDZqf42fRuWXq/emYnJjmzJPjk9mbEeC8ttOjDNTGrAP
 YZPuSHcbdLqn/cHQvRPX4oB9kYb4yQ5Y1Tt6U3vGYy418lvyuKD+HqoRUlme6OIG3wgiqPfFm7
 NwT/tI8s+lem258t2CvySj0lrW7P3ZWg014mscOypO+NagjWxf1VKsJRw8M4V7Yycs8g/AL/v+
 jhY=
X-IronPort-AV: E=Sophos;i="5.83,284,1616482800"; d="scan'208";a="125835094"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Jun 2021 08:08:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 08:08:00 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 18 Jun 2021 08:07:57 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] ASoC: atmel-i2s: Fix usage of capture and playback at the
 same time
Date: Fri, 18 Jun 2021 18:07:41 +0300
Message-ID: <20210618150741.401739-2-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210618150741.401739-1-codrin.ciubotariu@microchip.com>
References: <20210618150741.401739-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com, tiwai@suse.com,
 ludovic.desroches@microchip.com, broonie@kernel.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

For both capture and playback streams to work at the same time, only the
needed values from a register need to be updated. Also, clocks should be
enabled only when the first stream is started and stopped when there is no
running stream.

Fixes: b543e467d1a9 ("ASoC: atmel-i2s: add driver for the new Atmel I2S controller")
Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 sound/soc/atmel/atmel-i2s.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index a95002b0cc8e..6b3d9c05eaf2 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -200,6 +200,7 @@ struct atmel_i2s_dev {
 	unsigned int				fmt;
 	const struct atmel_i2s_gck_param	*gck_param;
 	const struct atmel_i2s_caps		*caps;
+	int					clk_use_no;
 };
 
 static irqreturn_t atmel_i2s_interrupt(int irq, void *dev_id)
@@ -321,9 +322,16 @@ static int atmel_i2s_hw_params(struct snd_pcm_substream *substream,
 {
 	struct atmel_i2s_dev *dev = snd_soc_dai_get_drvdata(dai);
 	bool is_playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
-	unsigned int mr = 0;
+	unsigned int mr = 0, mr_mask;
 	int ret;
 
+	mr_mask = ATMEL_I2SC_MR_FORMAT_MASK | ATMEL_I2SC_MR_MODE_MASK |
+		ATMEL_I2SC_MR_DATALENGTH_MASK;
+	if (is_playback)
+		mr_mask |= ATMEL_I2SC_MR_TXMONO;
+	else
+		mr_mask |= ATMEL_I2SC_MR_RXMONO;
+
 	switch (dev->fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
 		mr |= ATMEL_I2SC_MR_FORMAT_I2S;
@@ -402,7 +410,7 @@ static int atmel_i2s_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	return regmap_write(dev->regmap, ATMEL_I2SC_MR, mr);
+	return regmap_update_bits(dev->regmap, ATMEL_I2SC_MR, mr_mask, mr);
 }
 
 static int atmel_i2s_switch_mck_generator(struct atmel_i2s_dev *dev,
@@ -495,18 +503,28 @@ static int atmel_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	is_master = (mr & ATMEL_I2SC_MR_MODE_MASK) == ATMEL_I2SC_MR_MODE_MASTER;
 
 	/* If master starts, enable the audio clock. */
-	if (is_master && mck_enabled)
-		err = atmel_i2s_switch_mck_generator(dev, true);
-	if (err)
-		return err;
+	if (is_master && mck_enabled) {
+		if (!dev->clk_use_no) {
+			err = atmel_i2s_switch_mck_generator(dev, true);
+			if (err)
+				return err;
+		}
+		dev->clk_use_no++;
+	}
 
 	err = regmap_write(dev->regmap, ATMEL_I2SC_CR, cr);
 	if (err)
 		return err;
 
 	/* If master stops, disable the audio clock. */
-	if (is_master && !mck_enabled)
-		err = atmel_i2s_switch_mck_generator(dev, false);
+	if (is_master && !mck_enabled) {
+		if (dev->clk_use_no == 1) {
+			err = atmel_i2s_switch_mck_generator(dev, false);
+			if (err)
+				return err;
+		}
+		dev->clk_use_no--;
+	}
 
 	return err;
 }
-- 
2.30.2

