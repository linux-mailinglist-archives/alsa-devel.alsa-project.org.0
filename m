Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD901340B
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 21:34:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 323631808;
	Fri,  3 May 2019 21:33:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 323631808
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556912068;
	bh=qiYqklvRDXRBj9+5tIb9UoXh5ts3NqQi7Ag68Y6hMTY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=shhaewqed2VxgcMophmfPlfs8SOtxxfXLtdDF10QyhfYX+pLRI5l7VgtyBZTUQjyE
	 3RPpCcQhP3xsWTI7RKt4FMWnX5oHsL8dIx4+I+IGi7NidQMDK1aqfrzRw8rgnXkLjk
	 fTAQZnjLk8ZwklHanEC4b4+0XS91JO4Ur5jeDvhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1A50F896B9;
	Fri,  3 May 2019 21:32:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23341F896B7; Fri,  3 May 2019 21:32:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91ED2F80720
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 21:32:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91ED2F80720
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="m3H4CJfL"
Received: by mail-pg1-x542.google.com with SMTP id f6so3169231pgs.8
 for <alsa-devel@alsa-project.org>; Fri, 03 May 2019 12:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mMl0UANDmvqhumXnXr9Ue6Ht/Zr812dNiEmxcg8VOLA=;
 b=m3H4CJfLVEJAAvyVqpo3qBZoVsDpqRrii803dltFx5lKNwnhijB8UUP9JQtnOUJWgo
 oKJJbVfkgEluwImflD7nOZl5GExy3Eyxcy52v9YtnTOiJpWGceDenT6dWBvYJ08fslW5
 WwZ8v5TWJOts4TDExpFkvF5TWZSVr0PBJMZQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mMl0UANDmvqhumXnXr9Ue6Ht/Zr812dNiEmxcg8VOLA=;
 b=g+h86s6wDY6pCTW7SEJA4wjGsZ1fZG9QqGkwUPJ2TUFzI+NoApK4nw5GFwtH8PgF2h
 ledOVkg9eL+AUYQ+HTwsZSxHkCBbvlv2p/wzjpHiLDRgnicJiIeU7rQfX/y/wbL2GW1V
 Ydz/monNJYCiLJQRXqmz0XpEtv4MrZNKffcmK8cGHu4Z0OWGFcmF1W1yiK4Sxw2U1Zj0
 qFRYzKDbaT2hJCNe9FoVz+/iC0mOPtPho7KMSlnrCQ/ZryHZy9JutaomCojZQin6s7+d
 jpnvGYN9VcbIOX/hzBfjk1wqGTs4uQadsdTc/d8xTwZqvYefixJYx6eLy+B4kNjjgdZF
 U3Bw==
X-Gm-Message-State: APjAAAVIHs3vi5UkursgjA2gzT7OXlr5Z74jVDJSecUe8wdWLX+ooY6p
 wnG8veSdmjLUtLc95YnvjJgcdb2ueg==
X-Google-Smtp-Source: APXvYqzVj4VJFcE4Ptupg9f+Mhr8MHcMsEbLA/v68z7DGBfndd4euUWF4l77r+w9Q6s4ZJ54brqhZQ==
X-Received: by 2002:a62:62c3:: with SMTP id w186mr13129359pfb.73.1556911954360; 
 Fri, 03 May 2019 12:32:34 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id k14sm9595683pfj.171.2019.05.03.12.32.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 12:32:33 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri,  3 May 2019 12:32:14 -0700
Message-Id: <20190503193213.227189-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH v2] ASoC: RT5677-SPI: Disable 16Bit SPI
	Transfers
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
 sound/soc/codecs/rt5677-spi.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 167a02773a0b..84b6bd8b50e1 100644
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
@@ -159,13 +159,13 @@ int rt5677_spi_read(u32 addr, void *rxbuf, size_t len)
 }
 EXPORT_SYMBOL_GPL(rt5677_spi_read);
 
-/* Write DSP address space using SPI. addr has to be 2-byte aligned.
- * If len is not 2-byte aligned, an extra byte of zero is written at the end
+/* Write DSP address space using SPI. addr has to be 4-byte aligned.
+ * If len is not 4-byte aligned, then extra zeros are written at the end
  * as padding.
  */
 int rt5677_spi_write(u32 addr, const void *txbuf, size_t len)
 {
-	u32 offset, len_with_pad = len;
+	u32 offset;
 	int status = 0;
 	struct spi_transfer t;
 	struct spi_message m;
@@ -178,22 +178,19 @@ int rt5677_spi_write(u32 addr, const void *txbuf, size_t len)
 	if (!g_spi)
 		return -ENODEV;
 
-	if (addr & 1) {
+	if (addr & 3) {
 		dev_err(&g_spi->dev, "Bad write align 0x%x(%zu)\n", addr, len);
 		return -EACCES;
 	}
 
-	if (len & 1)
-		len_with_pad = len + 1;
-
 	memset(&t, 0, sizeof(t));
 	t.tx_buf = buf;
 	t.speed_hz = RT5677_SPI_FREQ;
 	spi_message_init_with_transfers(&m, &t, 1);
 
-	for (offset = 0; offset < len_with_pad;) {
+	for (offset = 0; offset < len;) {
 		spi_cmd = rt5677_spi_select_cmd(false, (addr + offset) & 7,
-				len_with_pad - offset, &t.len);
+				len - offset, &t.len);
 
 		/* Construct SPI message header */
 		buf[0] = spi_cmd;
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
