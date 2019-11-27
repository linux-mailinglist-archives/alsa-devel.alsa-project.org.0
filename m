Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA9110ABA8
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 09:24:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35BC61711;
	Wed, 27 Nov 2019 09:23:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35BC61711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574843041;
	bh=duiF79h2Fmf6wJaDPqRY7Uuv1UOzqdbv9pMKvstJh3o=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q0KSGOYwDWregp6dWHtfp1wmccMzsunG0TNvnZnOQtBQy8qVUcUwv70I63fhPlPHq
	 xDwnzs3j8XiNlrnlSFvHniCcyoi+OKC+ZgOhPvKjBI3k9kKpZhYzDjNW/N0Dx3mL0H
	 WQ7lTN7xFjybexVg1Z605eIw5DdBCm4vEfGUgjJU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB6DDF8016F;
	Wed, 27 Nov 2019 09:22:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81FD1F8014D; Wed, 27 Nov 2019 09:22:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B188F80109
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 09:22:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B188F80109
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D27E9A28826B1B02A339;
 Wed, 27 Nov 2019 16:22:06 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Wed, 27 Nov 2019
 16:21:57 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <bardliao@realtek.com>, <oder_chiou@realtek.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <benzh@chromium.org>, <cujomalainey@chromium.org>
Date: Wed, 27 Nov 2019 16:21:45 +0800
Message-ID: <20191127082145.6100-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH -next] ASoC: rt5677: Fix build error without
	CONFIG_SPI
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

If CONFIG_SPI is n, SND_SOC_RT5677_SPI also is n, building fails:

sound/soc/codecs/rt5677.o: In function `rt5677_irq':
rt5677.c:(.text+0x2dbf): undefined reference to `rt5677_spi_hotword_detected'
sound/soc/codecs/rt5677.o: In function `rt5677_dsp_work':
rt5677.c:(.text+0x3709): undefined reference to `rt5677_spi_write'

This adds stub helpers to fix this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 461c623270e4 ("ASoC: rt5677: Load firmware via SPI using delayed work")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/codecs/rt5677-spi.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/codecs/rt5677-spi.h b/sound/soc/codecs/rt5677-spi.h
index 3af36ec..088b779 100644
--- a/sound/soc/codecs/rt5677-spi.h
+++ b/sound/soc/codecs/rt5677-spi.h
@@ -9,9 +9,25 @@
 #ifndef __RT5677_SPI_H__
 #define __RT5677_SPI_H__
 
+#if IS_ENABLED(CONFIG_SND_SOC_RT5677_SPI)
 int rt5677_spi_read(u32 addr, void *rxbuf, size_t len);
 int rt5677_spi_write(u32 addr, const void *txbuf, size_t len);
 int rt5677_spi_write_firmware(u32 addr, const struct firmware *fw);
 void rt5677_spi_hotword_detected(void);
+#else
+static inline int rt5677_spi_read(u32 addr, void *rxbuf, size_t len)
+{
+	return -EINVAL;
+}
+static inline int rt5677_spi_write(u32 addr, const void *txbuf, size_t len)
+{
+	return -EINVAL;
+}
+static inline int rt5677_spi_write_firmware(u32 addr, const struct firmware *fw)
+{
+	return -EINVAL;
+}
+static inline void rt5677_spi_hotword_detected(void){}
+#endif
 
 #endif /* __RT5677_SPI_H__ */
-- 
2.7.4


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
