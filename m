Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F174B6EAC92
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 16:15:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B3CDED4;
	Fri, 21 Apr 2023 16:14:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B3CDED4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682086506;
	bh=rgZhYc5YmGCZRsqOQcmp4jc9WKqqLKfotXoU4BPQBzE=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CRLe2L9cHzGX/6+wSg95PWngMep+58QiY76XxqtGkE9RDptwDVEBP5cdKb/jA3VKf
	 KajE+lqxrLKk6ZQXM+vn8KLsWK9VPf+2cG6AxwW/hq+XniE4UzqM/QTTaxkyup6iNN
	 raACFNsMARewIDgINL5sN7DiKef4EOQvbijYO3Q8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0173F805B4;
	Fri, 21 Apr 2023 16:10:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66EA2F80570; Fri, 21 Apr 2023 16:10:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93BD7F80534
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 16:10:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93BD7F80534
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 07B8224258;
	Fri, 21 Apr 2023 10:10:07 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pprSg-Dac-00; Fri, 21 Apr 2023 16:10:06 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/7] ALSA: emu10k1: properly assert E-MU FPGA access
 constaints
Date: Fri, 21 Apr 2023 16:10:00 +0200
Message-Id: <20230421141006.1005539-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: M6VM75SAC2YEY4R6DSEFOUB5YJVGQK6P
X-Message-ID-Hash: M6VM75SAC2YEY4R6DSEFOUB5YJVGQK6P
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M6VM75SAC2YEY4R6DSEFOUB5YJVGQK6P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Assert the validity of the registers and values, as them being out of
range would indicate an error in the driver. Consequently, don't bother
returning error codes; they were ignored everywhere anyway.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h |  6 +++---
 sound/pci/emu10k1/io.c  | 36 +++++++++++++++++-------------------
 2 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 39787fecc8d9..01e2e22689bd 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1824,9 +1824,9 @@ unsigned int snd_emu10k1_ptr20_read(struct snd_emu10k1 * emu, unsigned int reg,
 void snd_emu10k1_ptr20_write(struct snd_emu10k1 *emu, unsigned int reg, unsigned int chn, unsigned int data);
 int snd_emu10k1_spi_write(struct snd_emu10k1 * emu, unsigned int data);
 int snd_emu10k1_i2c_write(struct snd_emu10k1 *emu, u32 reg, u32 value);
-int snd_emu1010_fpga_write(struct snd_emu10k1 * emu, u32 reg, u32 value);
-int snd_emu1010_fpga_read(struct snd_emu10k1 * emu, u32 reg, u32 *value);
-int snd_emu1010_fpga_link_dst_src_write(struct snd_emu10k1 * emu, u32 dst, u32 src);
+void snd_emu1010_fpga_write(struct snd_emu10k1 *emu, u32 reg, u32 value);
+void snd_emu1010_fpga_read(struct snd_emu10k1 *emu, u32 reg, u32 *value);
+void snd_emu1010_fpga_link_dst_src_write(struct snd_emu10k1 *emu, u32 dst, u32 src);
 unsigned int snd_emu10k1_efx_read(struct snd_emu10k1 *emu, unsigned int pc);
 void snd_emu10k1_intr_enable(struct snd_emu10k1 *emu, unsigned int intrenb);
 void snd_emu10k1_intr_disable(struct snd_emu10k1 *emu, unsigned int intrenb);
diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index e15092ce9848..35bc73d99d04 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -233,56 +233,54 @@ int snd_emu10k1_i2c_write(struct snd_emu10k1 *emu,
 	return err;
 }
 
-int snd_emu1010_fpga_write(struct snd_emu10k1 * emu, u32 reg, u32 value)
+void snd_emu1010_fpga_write(struct snd_emu10k1 *emu, u32 reg, u32 value)
 {
 	unsigned long flags;
 
-	if (reg > 0x3f)
-		return 1;
+	if (snd_BUG_ON(reg > 0x3f))
+		return;
 	reg += 0x40; /* 0x40 upwards are registers. */
-	if (value > 0x3f) /* 0 to 0x3f are values */
-		return 1;
+	if (snd_BUG_ON(value > 0x3f)) /* 0 to 0x3f are values */
+		return;
 	spin_lock_irqsave(&emu->emu_lock, flags);
 	outl(reg, emu->port + A_IOCFG);
 	udelay(10);
 	outl(reg | 0x80, emu->port + A_IOCFG);  /* High bit clocks the value into the fpga. */
 	udelay(10);
 	outl(value, emu->port + A_IOCFG);
 	udelay(10);
 	outl(value | 0x80 , emu->port + A_IOCFG);  /* High bit clocks the value into the fpga. */
 	spin_unlock_irqrestore(&emu->emu_lock, flags);
-
-	return 0;
 }
 
-int snd_emu1010_fpga_read(struct snd_emu10k1 * emu, u32 reg, u32 *value)
+void snd_emu1010_fpga_read(struct snd_emu10k1 *emu, u32 reg, u32 *value)
 {
 	unsigned long flags;
-	if (reg > 0x3f)
-		return 1;
+	if (snd_BUG_ON(reg > 0x3f))
+		return;
 	reg += 0x40; /* 0x40 upwards are registers. */
 	spin_lock_irqsave(&emu->emu_lock, flags);
 	outl(reg, emu->port + A_IOCFG);
 	udelay(10);
 	outl(reg | 0x80, emu->port + A_IOCFG);  /* High bit clocks the value into the fpga. */
 	udelay(10);
 	*value = ((inl(emu->port + A_IOCFG) >> 8) & 0x7f);
 	spin_unlock_irqrestore(&emu->emu_lock, flags);
-
-	return 0;
 }
 
 /* Each Destination has one and only one Source,
  * but one Source can feed any number of Destinations simultaneously.
  */
-int snd_emu1010_fpga_link_dst_src_write(struct snd_emu10k1 * emu, u32 dst, u32 src)
+void snd_emu1010_fpga_link_dst_src_write(struct snd_emu10k1 *emu, u32 dst, u32 src)
 {
-	snd_emu1010_fpga_write(emu, 0x00, ((dst >> 8) & 0x3f) );
-	snd_emu1010_fpga_write(emu, 0x01, (dst & 0x3f) );
-	snd_emu1010_fpga_write(emu, 0x02, ((src >> 8) & 0x3f) );
-	snd_emu1010_fpga_write(emu, 0x03, (src & 0x3f) );
-
-	return 0;
+	if (snd_BUG_ON(dst & ~0x71f))
+		return;
+	if (snd_BUG_ON(src & ~0x71f))
+		return;
+	snd_emu1010_fpga_write(emu, 0x00, dst >> 8);
+	snd_emu1010_fpga_write(emu, 0x01, dst & 0x1f);
+	snd_emu1010_fpga_write(emu, 0x02, src >> 8);
+	snd_emu1010_fpga_write(emu, 0x03, src & 0x1f);
 }
 
 void snd_emu10k1_intr_enable(struct snd_emu10k1 *emu, unsigned int intrenb)
-- 
2.40.0.152.g15d061e6df

