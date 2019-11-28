Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 512D710C965
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2019 14:22:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B9F016EE;
	Thu, 28 Nov 2019 14:21:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B9F016EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574947369;
	bh=uV6o6U4sugx5WBoA1Oq6FdRkp0BtP6jt6Uq92LJhWfQ=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=MrCOCK1QA6PbQwU+YZRyehr3qEG3xM742U8cbbPK0TmFrsCxzkY2G7kFWL1SfYy4N
	 JKWeb6E4kghNqTPWnJLGXy+CapPynBd3DiByIufTJKPjlbhjC0RDMvytbRKXhlxVw0
	 Q32Dc4qPxUG78QtCWwjleWdD1QpusQa9068N9ch0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3732F80233;
	Thu, 28 Nov 2019 14:18:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACBA9F80229; Thu, 28 Nov 2019 14:18:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id BAA3DF80217
 for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2019 14:18:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAA3DF80217
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F34201042;
 Thu, 28 Nov 2019 05:18:32 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72BCC3F52E;
 Thu, 28 Nov 2019 05:18:32 -0800 (PST)
Date: Thu, 28 Nov 2019 13:18:30 +0000
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20191127082145.6100-1-yuehaibing@huawei.com>
Message-Id: <applied-20191127082145.6100-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, benzh@chromium.org,
 tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>, Mark Brown <broonie@kernel.org>,
 bardliao@realtek.com, cujomalainey@chromium.org
Subject: [alsa-devel] Applied "ASoC: rt5677: Fix build error without
	CONFIG_SPI" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: rt5677: Fix build error without CONFIG_SPI

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From fb3194413d1ef79732931a40f54da21a16505a76 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 27 Nov 2019 16:21:45 +0800
Subject: [PATCH] ASoC: rt5677: Fix build error without CONFIG_SPI

If CONFIG_SPI is n, SND_SOC_RT5677_SPI also is n, building fails:

sound/soc/codecs/rt5677.o: In function `rt5677_irq':
rt5677.c:(.text+0x2dbf): undefined reference to `rt5677_spi_hotword_detected'
sound/soc/codecs/rt5677.o: In function `rt5677_dsp_work':
rt5677.c:(.text+0x3709): undefined reference to `rt5677_spi_write'

This adds stub helpers to fix this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 461c623270e4 ("ASoC: rt5677: Load firmware via SPI using delayed work")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20191127082145.6100-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5677-spi.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/codecs/rt5677-spi.h b/sound/soc/codecs/rt5677-spi.h
index 3af36ec928e9..088b77931727 100644
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
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
