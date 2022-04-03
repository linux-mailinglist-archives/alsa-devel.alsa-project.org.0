Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F24A4F0CC9
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Apr 2022 00:26:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29EB6826;
	Mon,  4 Apr 2022 00:25:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29EB6826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649024807;
	bh=lg5cAyTIdqavZYSj5nWfqlJ6JMNulCSB50pBY6whItU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f6qzGgLJ2I874Zdao9zHoaSexMqzi6+lGoaVExOKun8dyQzub4dA7M7HqiXUt4NS5
	 uMF9fpVH60Z9VnXlaXvgYBqKmq72A2E9sS2by0xhsOHD+zORg3y/DBuhhPmqT1VZnp
	 ByPppvSMHMr9ooyogGile8FRvaGhjw++ExO2UqVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95F5FF8028B;
	Mon,  4 Apr 2022 00:25:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D376CF800E9; Mon,  4 Apr 2022 00:25:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6A8FF800E9
 for <alsa-devel@alsa-project.org>; Mon,  4 Apr 2022 00:25:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6A8FF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="QDdBceEb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=1kpWpbZUvs0YrVwXScvvOONeu400CkOl0OCFSWhU8FM=; b=QDdBceEbGix+UwIyXxI1rVaKmh
 LeQsJr6mpNoJZYJoHXDa+EKudQtUIOG+umhJxScO23sPvHWsNalqEq+urwDhHCkStPIy0gF/NjGIU
 Ru9+rwLAsZOmvz8v+EwHuGrprXtZDhVtPv+CXvIYaaobTrMnhNjUx5RCyiBoXYe8W8SzGJ8uxuAmT
 ilXsWQtl3bvX4Uk9J6TzyDrinzUje1lE8t4G697WMu88lroKiy/RL0TyN/gUn5plsgxPadO668gdF
 4EFOWSL3jRjxnVHoUVUHAO9B79zHXL4oDnRy3mnEHQL8kAt8dVa1jx00iPjRm1wFtao/bMnqqNOmV
 1W7atIIw==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nb8em-00CTzH-MA; Sun, 03 Apr 2022 22:25:12 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] sound/oss/dmasound: fix build when drivers are mixed =y/=m
Date: Sun,  3 Apr 2022 15:25:10 -0700
Message-Id: <20220403222510.12670-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>,
 Takashi Iwai <tiwai@suse.com>, Geert Uytterhoeven <geert@linux-m68k.org>
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

When CONFIG_DMASOUND_ATARI=m and CONFIG_DMASOUND_Q40=y (or vice versa),
dmasound_core.o can be built without dmasound_deinit() being defined,
causing a build error:

ERROR: modpost: "dmasound_deinit" [sound/oss/dmasound/dmasound_atari.ko] undefined!

Modify dmasound_core.c so that dmasound_deinit() is always available.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Link: lore.kernel.org/r/202204032138.EFT9qGEd-lkp@intel.com
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
---
#Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2") # "forever, but backport not important"

 sound/oss/dmasound/dmasound.h      |    4 ----
 sound/oss/dmasound/dmasound_core.c |   10 +++++-----
 2 files changed, 5 insertions(+), 9 deletions(-)

--- linux-next-20220401.orig/sound/oss/dmasound/dmasound_core.c
+++ linux-next-20220401/sound/oss/dmasound/dmasound_core.c
@@ -1424,27 +1424,29 @@ int dmasound_init(void)
 	return 0;
 }
 
-#ifdef MODULE
-
 void dmasound_deinit(void)
 {
+#ifdef MODULE
 	if (irq_installed) {
 		sound_silence();
 		dmasound.mach.irqcleanup();
 		irq_installed = 0;
 	}
+#endif
 
 	write_sq_release_buffers();
 
+#ifdef MODULE
 	if (mixer_unit >= 0)
 		unregister_sound_mixer(mixer_unit);
 	if (state_unit >= 0)
 		unregister_sound_special(state_unit);
 	if (sq_unit >= 0)
 		unregister_sound_dsp(sq_unit);
+#endif
 }
 
-#else /* !MODULE */
+#ifndef MODULE
 
 static int dmasound_setup(char *str)
 {
@@ -1577,9 +1579,7 @@ char dmasound_alaw2dma8[] = {
 
 EXPORT_SYMBOL(dmasound);
 EXPORT_SYMBOL(dmasound_init);
-#ifdef MODULE
 EXPORT_SYMBOL(dmasound_deinit);
-#endif
 EXPORT_SYMBOL(dmasound_write_sq);
 EXPORT_SYMBOL(dmasound_catchRadius);
 #ifdef HAS_8BIT_TABLES
--- linux-next-20220401.orig/sound/oss/dmasound/dmasound.h
+++ linux-next-20220401/sound/oss/dmasound/dmasound.h
@@ -88,11 +88,7 @@ static inline int ioctl_return(int __use
      */
 
 extern int dmasound_init(void);
-#ifdef MODULE
 extern void dmasound_deinit(void);
-#else
-#define dmasound_deinit()	do { } while (0)
-#endif
 
 /* description of the set-up applies to either hard or soft settings */
 
