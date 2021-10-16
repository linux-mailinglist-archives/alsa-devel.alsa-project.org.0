Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53815430088
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Oct 2021 08:27:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4C801848;
	Sat, 16 Oct 2021 08:26:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4C801848
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634365662;
	bh=XWdBSrhbYfGOfljl6ePZhJDLMoPJZGahIA1BnE+JEL4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=txt4HWwsbuM6dFJkLQ3cUPz1QaWHo7Z3qeClPBHu6kiFePFSJJSaAv7REjxIO3K7i
	 fZ65IXuvNvXtHBhGGSqe/rKCDAe+agMEci3QDt4DBfJxrB3uga0t1TlpFd41SvuVoo
	 Zw8SjkgmUqSHHVGrsiVDFVxzhXhCe7DXiMYm6PHQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D80CF80245;
	Sat, 16 Oct 2021 08:26:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46E9EF80212; Sat, 16 Oct 2021 08:26:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6401CF800E5
 for <alsa-devel@alsa-project.org>; Sat, 16 Oct 2021 08:26:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6401CF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="R2HFpAoV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=BhYE3boCAjVmx4aSjOWGjKR2hEoYtcDr4JkhxOOfVO4=; b=R2HFpAoV+B6ur9uK6VrlG7o4YP
 8CLC12444uKYaZfD39HJ+vH2CJkVAHjzrGf9ndDZOSAUcUQZUWrLNYH2YBfQkV0ii+1b67V6SERaN
 Vqm7L04x1XmobTN+e3pRbtPiFD2G1G7V5WTAu0CgK/331lp5ctq70Dv+6qFdr8pGTEBDMG+IfzEuN
 i0mXGomZ9a3B99wO84iJyCgUXqbOR1mcktsZzcksQufAqwzFd3sCHCjv+K0OKTLybmQHAZ4RKZgv7
 VFUMc4UWIhHPI+RfOIyTkGqA34qIJvj6DhS/ZeyLmdaa41JOo6tWDrK6fixNr4LYxv2x9kwB1eOMf
 C2KcMxlg==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbd8u-009wZI-6h; Sat, 16 Oct 2021 06:26:04 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH] sound: ISA: not for M68K
Date: Fri, 15 Oct 2021 23:26:02 -0700
Message-Id: <20211016062602.3588-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Randy Dunlap <rdunlap@infradead.org>,
 Takashi Iwai <tiwai@suse.com>, linux-m68k@lists.linux-m68k.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
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

On m68k, compiling drivers under SND_ISA causes build errors:

../sound/core/isadma.c: In function 'snd_dma_program':
../sound/core/isadma.c:33:17: error: implicit declaration of function 'claim_dma_lock' [-Werror=implicit-function-declaration]
   33 |         flags = claim_dma_lock();
      |                 ^~~~~~~~~~~~~~
../sound/core/isadma.c:41:9: error: implicit declaration of function 'release_dma_lock' [-Werror=implicit-function-declaration]
   41 |         release_dma_lock(flags);
      |         ^~~~~~~~~~~~~~~~

../sound/isa/sb/sb16_main.c: In function 'snd_sb16_playback_prepare':
../sound/isa/sb/sb16_main.c:253:72: error: 'DMA_AUTOINIT' undeclared (first use in this function)
  253 |         snd_dma_program(dma, runtime->dma_addr, size, DMA_MODE_WRITE | DMA_AUTOINIT);
      |                                                                        ^~~~~~~~~~~~
../sound/isa/sb/sb16_main.c:253:72: note: each undeclared identifier is reported only once for each function it appears in
../sound/isa/sb/sb16_main.c: In function 'snd_sb16_capture_prepare':
../sound/isa/sb/sb16_main.c:322:71: error: 'DMA_AUTOINIT' undeclared (first use in this function)
  322 |         snd_dma_program(dma, runtime->dma_addr, size, DMA_MODE_READ | DMA_AUTOINIT);
      |                                                                       ^~~~~~~~~~~~

and more...

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
---
 sound/core/Makefile |    2 ++
 sound/isa/Kconfig   |    2 +-
 sound/pci/Kconfig   |    1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

--- linux-next-20211015.orig/sound/isa/Kconfig
+++ linux-next-20211015/sound/isa/Kconfig
@@ -22,7 +22,7 @@ config SND_SB16_DSP
 menuconfig SND_ISA
 	bool "ISA sound devices"
 	depends on ISA || COMPILE_TEST
-	depends on ISA_DMA_API
+	depends on ISA_DMA_API && !M68K
 	default y
 	help
 	  Support for sound devices connected via the ISA bus.
--- linux-next-20211015.orig/sound/pci/Kconfig
+++ linux-next-20211015/sound/pci/Kconfig
@@ -279,6 +279,7 @@ config SND_CS46XX_NEW_DSP
 config SND_CS5530
 	tristate "CS5530 Audio"
 	depends on ISA_DMA_API && (X86_32 || COMPILE_TEST)
+	depends on !M68K
 	select SND_SB16_DSP
 	help
 	  Say Y here to include support for audio on Cyrix/NatSemi CS5530 chips.
--- linux-next-20211015.orig/sound/core/Makefile
+++ linux-next-20211015/sound/core/Makefile
@@ -9,7 +9,9 @@ ifneq ($(CONFIG_SND_PROC_FS),)
 snd-y += info.o
 snd-$(CONFIG_SND_OSSEMUL) += info_oss.o
 endif
+ifneq ($(CONFIG_M68K),y)
 snd-$(CONFIG_ISA_DMA_API) += isadma.o
+endif
 snd-$(CONFIG_SND_OSSEMUL) += sound_oss.o
 snd-$(CONFIG_SND_VMASTER) += vmaster.o
 snd-$(CONFIG_SND_JACK)	  += ctljack.o jack.o
