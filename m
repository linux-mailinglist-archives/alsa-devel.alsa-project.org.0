Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D4712489
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 00:22:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D60ED17C5;
	Fri,  3 May 2019 00:22:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D60ED17C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556835770;
	bh=F7GadoKiPo7TT0faP205MMDJV0SlmJFP0NNQiRpuxcc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PH9tMWnIuNujlwzJYvpGf9m79d9+CNk5s0fG+40sZJgb5FOck1f1vmfAVfJNHjkGh
	 vdFlidpeqGL1LAjwLvFnpgmtQcT+LGwxTkbn06Gkbg9Z9S7skiyNukV97z7ap2/MaK
	 rNWckYkCNVObndyAu6H6kobX8j9MK0jS6n2BxBhQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AE4FF896EA;
	Fri,  3 May 2019 00:21:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75B0DF896C7; Fri,  3 May 2019 00:21:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79565F8075A
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 00:20:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79565F8075A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Wp3VXQ0G"
Received: by mail-pg1-x542.google.com with SMTP id e6so1700294pgc.4
 for <alsa-devel@alsa-project.org>; Thu, 02 May 2019 15:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ujMmQOHNoMMqaCrmvanfaNK2EtEa/6xfnruEeiFZFuU=;
 b=Wp3VXQ0G+ZVevLh9/IJGMfVaa/UOSSF0cWtxBg2hAWbJaGrkIP6qLAhlmHbwmYdGnj
 NDJM147Tpo9xoRgfNa7QBS5255b9hzCLfLW+rB8SENgY8LXaMGnotQbLKNtC/QnS5bPz
 G8VDnOTlNLVE7wxKakeLVNjtloOowkBFUDxTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ujMmQOHNoMMqaCrmvanfaNK2EtEa/6xfnruEeiFZFuU=;
 b=Txk8BrdiHIT5J0j2VxATVn4AKpXuHjZmJsaXrSGaCTffHkIRbTTvDP2UzHJVFdgqIT
 /ljfAxi56k2NfjStpSzhfGGtfqMhsb0WGJSMKnzg1kqWxHy8X5kxQk9rG/lGf2ueLF8/
 Qyo9ZTbZzzZ3jWoZCjLRM9OIJefaCf3Sf/6nA41OQsNLU3Tb0H9KgE9wMKPlROxYyurg
 xQ7EsNjxHGeyfdKDVutQ/r/bRvszjVDV3zoqu+f9FA/pKxEuoOo6/QLoz+jLPzAKYqFB
 +jOldmjxBYKZC8dXOM8fvh116zWouVJ5HiC+djxfLG0kH4rkr6KFXH141gNKBOYJJUPb
 R7IQ==
X-Gm-Message-State: APjAAAWecVranHOgJ9uYpDD1jqv1ym6ZmAQXNUDpxHQcD5nv4IcUJLR9
 XnCxbYbCDunYoX6QuEc/thX0fH+pWL5+
X-Google-Smtp-Source: APXvYqxwhm9X7Yn3YF3RhXtDpVHCNm0DrOo5Bfs8USyL/MuCIrWYwFIRpCa1IP6KEXGNrTA2cNRFgg==
X-Received: by 2002:aa7:8a8d:: with SMTP id a13mr7003460pfc.2.1556835656243;
 Thu, 02 May 2019 15:20:56 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id g6sm288967pgi.70.2019.05.02.15.20.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 15:20:55 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Thu,  2 May 2019 15:20:16 -0700
Message-Id: <20190502222016.241729-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH] ASoC: RT5677-SPI: Disable 16Bit SPI Transfers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The current algorithm allows 3 types of transfers, 16bit, 32bit and
burst. According to Realtek, 16bit transfers have a special restriction
in that it is restricted to the memory region of
0x18020000 ~ 0x18021000. This region is the memory location of the I2C
registers. The current algorithm does not uphold this restriction and
therefore fails to complete writes.

Since this has been broken for some time it likely no one is using it.
Better to simply disable the 16 bit writes. This will allow users to
properly load firmware over SPI without data corruption.

CC: Ben Zhang <benzh@chromium.org>
CC: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677-spi.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 167a02773a0b..b296e62fdbb4 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -58,13 +58,15 @@ static DEFINE_MUTEX(spi_mutex);
  * RT5677_SPI_READ/WRITE_32:	Transfer 4 bytes
  * RT5677_SPI_READ/WRITE_BURST:	Transfer any multiples of 8 bytes
  *
- * For example, reading 260 bytes at 0x60030002 uses the following commands:
- * 0x60030002 RT5677_SPI_READ_16	2 bytes
+ * Note:
+ * 16 Bit writes and reads are restricted to the address range
+ * 0x18020000 ~ 0x18021000
+ *
+ * For example, reading 256 bytes at 0x60030004 uses the following commands:
  * 0x60030004 RT5677_SPI_READ_32	4 bytes
  * 0x60030008 RT5677_SPI_READ_BURST	240 bytes
  * 0x600300F8 RT5677_SPI_READ_BURST	8 bytes
  * 0x60030100 RT5677_SPI_READ_32	4 bytes
- * 0x60030104 RT5677_SPI_READ_16	2 bytes
  *
  * Input:
  * @read: true for read commands; false for write commands
@@ -79,15 +81,13 @@ static u8 rt5677_spi_select_cmd(bool read, u32 align, u32 remain, u32 *len)
 {
 	u8 cmd;
 
-	if (align == 2 || align == 6 || remain == 2) {
-		cmd = RT5677_SPI_READ_16;
-		*len = 2;
-	} else if (align == 4 || remain <= 6) {
+	if (align == 4 || remain <= 4) {
 		cmd = RT5677_SPI_READ_32;
 		*len = 4;
 	} else {
 		cmd = RT5677_SPI_READ_BURST;
-		*len = min_t(u32, remain & ~7, RT5677_SPI_BURST_LEN);
+		*len = (((remain - 1) >> 3) + 1) << 3;
+		*len = min_t(u32, *len, RT5677_SPI_BURST_LEN);
 	}
 	return read ? cmd : cmd + 1;
 }
@@ -108,7 +108,7 @@ static void rt5677_spi_reverse(u8 *dst, u32 dstlen, const u8 *src, u32 srclen)
 	}
 }
 
-/* Read DSP address space using SPI. addr and len have to be 2-byte aligned. */
+/* Read DSP address space using SPI. addr and len have to be 4-byte aligned. */
 int rt5677_spi_read(u32 addr, void *rxbuf, size_t len)
 {
 	u32 offset;
@@ -124,7 +124,7 @@ int rt5677_spi_read(u32 addr, void *rxbuf, size_t len)
 	if (!g_spi)
 		return -ENODEV;
 
-	if ((addr & 1) || (len & 1)) {
+	if ((addr & 3) || (len & 3)) {
 		dev_err(&g_spi->dev, "Bad read align 0x%x(%zu)\n", addr, len);
 		return -EACCES;
 	}
@@ -159,8 +159,8 @@ int rt5677_spi_read(u32 addr, void *rxbuf, size_t len)
 }
 EXPORT_SYMBOL_GPL(rt5677_spi_read);
 
-/* Write DSP address space using SPI. addr has to be 2-byte aligned.
- * If len is not 2-byte aligned, an extra byte of zero is written at the end
+/* Write DSP address space using SPI. addr has to be 4-byte aligned.
+ * If len is not 4-byte aligned, then extra zeros are written at the end
  * as padding.
  */
 int rt5677_spi_write(u32 addr, const void *txbuf, size_t len)
@@ -178,7 +178,7 @@ int rt5677_spi_write(u32 addr, const void *txbuf, size_t len)
 	if (!g_spi)
 		return -ENODEV;
 
-	if (addr & 1) {
+	if (addr & 3) {
 		dev_err(&g_spi->dev, "Bad write align 0x%x(%zu)\n", addr, len);
 		return -EACCES;
 	}
-- 
2.21.0.593.g511ec345e18-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
