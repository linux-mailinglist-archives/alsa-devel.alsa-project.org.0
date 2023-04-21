Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0D86EAC83
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 16:12:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBBA1DF;
	Fri, 21 Apr 2023 16:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBBA1DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682086343;
	bh=fcvQ/07HwUvkU0kiv5xO80ZTBl9nkZpbO1Cu86cMipg=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tYh/DNljUb3DIiu+zIfICdFs65BUSeqWJ376OsdvewG62e9ZAHWqxD7AndRGZ1Qte
	 fbPM5zocqUzIUcMIyDx04S50tV0Tv/7j7F21pt/ws9h1BN/ktBg/Ag1+Nvriu4y13z
	 1nwhigiTUTdSn3zPIMl2mxkd2V/lA73UO+Md58gE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47F4FF80558;
	Fri, 21 Apr 2023 16:10:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB32DF80549; Fri, 21 Apr 2023 16:10:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 084E4F8019B
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 16:10:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 084E4F8019B
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 870952409E;
	Fri, 21 Apr 2023 10:10:06 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pprSg-DZP-00; Fri, 21 Apr 2023 16:10:06 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/7] ALSA: emu10k1: remove obsolete card type variable and
 defines
Date: Fri, 21 Apr 2023 16:10:02 +0200
Message-Id: <20230421141006.1005452-3-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230421141006.1005452-1-oswald.buddenhagen@gmx.de>
References: <20230421141006.1005452-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FD6PHIJNSTLVQ5OHXSVZCTHYA2RKJWQ6
X-Message-ID-Hash: FD6PHIJNSTLVQ5OHXSVZCTHYA2RKJWQ6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FD6PHIJNSTLVQ5OHXSVZCTHYA2RKJWQ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The use of the variable was removed in commit 2b637da5a1b ("clean up
card features"). That commit also broke user space (the ioctl
structure), at which point the defines became meaningless, so I don't
think purging them is a problem.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h      | 1 -
 include/uapi/sound/emu10k1.h | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 39787fecc8d9..9a6ede9ac18a 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1691,7 +1691,6 @@ struct snd_emu10k1 {
 	unsigned int revision;			/* chip revision */
 	unsigned int serial;			/* serial number */
 	unsigned short model;			/* subsystem id */
-	unsigned int card_type;			/* EMU10K1_CARD_* */
 	unsigned int ecard_ctrl;		/* ecard control bits */
 	unsigned int address_mode;		/* address mode */
 	unsigned long dma_mask;			/* PCI DMA mask */
diff --git a/include/uapi/sound/emu10k1.h b/include/uapi/sound/emu10k1.h
index 1c1f1dd44611..c2414bd5aecd 100644
--- a/include/uapi/sound/emu10k1.h
+++ b/include/uapi/sound/emu10k1.h
@@ -15,9 +15,6 @@
  * ---- FX8010 ----
  */
 
-#define EMU10K1_CARD_CREATIVE			0x00000000
-#define EMU10K1_CARD_EMUAPS			0x00000001
-
 #define EMU10K1_FX8010_PCM_COUNT		8
 
 /*
-- 
2.40.0.152.g15d061e6df

