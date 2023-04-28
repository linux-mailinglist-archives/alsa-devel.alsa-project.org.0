Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7E56F14DC
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Apr 2023 12:01:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8432F10F7;
	Fri, 28 Apr 2023 12:00:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8432F10F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682676072;
	bh=zqMya/k3bt3PkjhuitumlXzefPBOtaLfHo39mVsed+0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=veEYsZMl/rhTrcEgSJP7ojgWwesJ7Ez4x+ZEdp6AJnXesUR3SdBmHzcGk6UJHXdY2
	 2Fo3953QUU3GycInUYV/2mpU4NbNKcskn/pf4lIi31HYZfqgoQM+IMHd9hK3w3Gior
	 YD73zmN5BZofp9mbVJBBs6uqOHiTMpuo9Mr1DDUM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E79ACF8052E;
	Fri, 28 Apr 2023 11:59:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E605F80533; Fri, 28 Apr 2023 11:59:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C713F80137
	for <alsa-devel@alsa-project.org>; Fri, 28 Apr 2023 11:59:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C713F80137
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id DB49A24247;
	Fri, 28 Apr 2023 05:59:41 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1psKtB-9tF-00; Fri, 28 Apr 2023 11:59:41 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/6] ALSA: emu10k1: fix locking in
 snd_emu1010_fpga_link_dst_src_write()
Date: Fri, 28 Apr 2023 11:59:39 +0200
Message-Id: <20230428095941.1706278-5-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230428095941.1706278-1-oswald.buddenhagen@gmx.de>
References: <20230428095941.1706278-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RGLENIMBK7UBGWWTHJQMIU2OSF5XYBTB
X-Message-ID-Hash: RGLENIMBK7UBGWWTHJQMIU2OSF5XYBTB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RGLENIMBK7UBGWWTHJQMIU2OSF5XYBTB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is a multi-register operation, which must be locked in its
entirety.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/io.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index cfb96a67aa35..aee84c3f9f37 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -233,23 +233,28 @@ int snd_emu10k1_i2c_write(struct snd_emu10k1 *emu,
 	return err;
 }
 
-void snd_emu1010_fpga_write(struct snd_emu10k1 *emu, u32 reg, u32 value)
+static void snd_emu1010_fpga_write_locked(struct snd_emu10k1 *emu, u32 reg, u32 value)
 {
-	unsigned long flags;
-
 	if (snd_BUG_ON(reg > 0x3f))
 		return;
 	reg += 0x40; /* 0x40 upwards are registers. */
 	if (snd_BUG_ON(value > 0x3f)) /* 0 to 0x3f are values */
 		return;
-	spin_lock_irqsave(&emu->emu_lock, flags);
 	outw(reg, emu->port + A_GPIO);
 	udelay(10);
 	outw(reg | 0x80, emu->port + A_GPIO);  /* High bit clocks the value into the fpga. */
 	udelay(10);
 	outw(value, emu->port + A_GPIO);
 	udelay(10);
 	outw(value | 0x80 , emu->port + A_GPIO);  /* High bit clocks the value into the fpga. */
+}
+
+void snd_emu1010_fpga_write(struct snd_emu10k1 *emu, u32 reg, u32 value)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&emu->emu_lock, flags);
+	snd_emu1010_fpga_write_locked(emu, reg, value);
 	spin_unlock_irqrestore(&emu->emu_lock, flags);
 }
 
@@ -276,14 +281,18 @@ void snd_emu1010_fpga_read(struct snd_emu10k1 *emu, u32 reg, u32 *value)
  */
 void snd_emu1010_fpga_link_dst_src_write(struct snd_emu10k1 *emu, u32 dst, u32 src)
 {
+	unsigned long flags;
+
 	if (snd_BUG_ON(dst & ~0x71f))
 		return;
 	if (snd_BUG_ON(src & ~0x71f))
 		return;
-	snd_emu1010_fpga_write(emu, EMU_HANA_DESTHI, dst >> 8);
-	snd_emu1010_fpga_write(emu, EMU_HANA_DESTLO, dst & 0x1f);
-	snd_emu1010_fpga_write(emu, EMU_HANA_SRCHI, src >> 8);
-	snd_emu1010_fpga_write(emu, EMU_HANA_SRCLO, src & 0x1f);
+	spin_lock_irqsave(&emu->emu_lock, flags);
+	snd_emu1010_fpga_write_locked(emu, EMU_HANA_DESTHI, dst >> 8);
+	snd_emu1010_fpga_write_locked(emu, EMU_HANA_DESTLO, dst & 0x1f);
+	snd_emu1010_fpga_write_locked(emu, EMU_HANA_SRCHI, src >> 8);
+	snd_emu1010_fpga_write_locked(emu, EMU_HANA_SRCLO, src & 0x1f);
+	spin_unlock_irqrestore(&emu->emu_lock, flags);
 }
 
 void snd_emu10k1_intr_enable(struct snd_emu10k1 *emu, unsigned int intrenb)
-- 
2.40.0.152.g15d061e6df

