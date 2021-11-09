Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EE844B6BE
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Nov 2021 23:27:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79BD815F2;
	Tue,  9 Nov 2021 23:26:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79BD815F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636496822;
	bh=YqdcfG9rMUg1aPmE15BG3JxqWSif0cagwCUxwHc/YEU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g5p/KBF5o0wGpUu3uvZGLm1hqPrt5w+RUWk2pXiRZf3i0d+b+36lIbzyBNM4NY12n
	 4Nsborh5d8lnGZkGt6qfpZ9clRiYC/NefVlPE0FoA16WAKkUHqwVMdSAOV//ru7xuj
	 ge8x4bLZ7JWy4w52I1jeEmOrKMSeWrh3tepMxuo4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCCF9F8057C;
	Tue,  9 Nov 2021 23:20:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02895F8057B; Tue,  9 Nov 2021 23:20:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CECEAF80511
 for <alsa-devel@alsa-project.org>; Tue,  9 Nov 2021 23:20:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CECEAF80511
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dLFReVA1"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D9BB61350;
 Tue,  9 Nov 2021 22:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636496433;
 bh=YqdcfG9rMUg1aPmE15BG3JxqWSif0cagwCUxwHc/YEU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dLFReVA1jNBzLqzwh+452RGEbfvRVp72UGpH9QlKEbUWpNmubDQQqPdeXgEHCI5Zr
 eVehXluJZfdEG+qJ5EQH5naX/Nd6XBRxXm0QYCAqfqXZ50v1TXnSS5HNYAniQzQrrA
 bmwrRpMeH6/D7iUYbcGoJLExdILLXVzju29619+sJZeNYYD4uwPuZKYRT7wBYuUqvP
 4XAHXyjENpt/V5mPjHYCAdFe5+grl140ygBZRhHdGFJG4NHrDjWJ9WufHwaPhuIVvo
 L0ljVGoDHAhq8EqRlkDjugrZcMllM4X5ZjEdpTljUmu9AYWSBpQAuGrs1B2H79jkik
 C0H3XY1ER63MA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 54/75] ALSA: ISA: not for M68K
Date: Tue,  9 Nov 2021 17:18:44 -0500
Message-Id: <20211109221905.1234094-54-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211109221905.1234094-1-sashal@kernel.org>
References: <20211109221905.1234094-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, Randy Dunlap <rdunlap@infradead.org>,
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

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 3c05f1477e62ea5a0a8797ba6a545b1dc751fb31 ]

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
Link: https://lore.kernel.org/r/20211016062602.3588-1-rdunlap@infradead.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/core/Makefile | 2 ++
 sound/isa/Kconfig   | 2 +-
 sound/pci/Kconfig   | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/core/Makefile b/sound/core/Makefile
index d774792850f31..79e1407cd0de7 100644
--- a/sound/core/Makefile
+++ b/sound/core/Makefile
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
diff --git a/sound/isa/Kconfig b/sound/isa/Kconfig
index 6ffa48dd59830..570b88e0b2018 100644
--- a/sound/isa/Kconfig
+++ b/sound/isa/Kconfig
@@ -22,7 +22,7 @@ config SND_SB16_DSP
 menuconfig SND_ISA
 	bool "ISA sound devices"
 	depends on ISA || COMPILE_TEST
-	depends on ISA_DMA_API
+	depends on ISA_DMA_API && !M68K
 	default y
 	help
 	  Support for sound devices connected via the ISA bus.
diff --git a/sound/pci/Kconfig b/sound/pci/Kconfig
index 93bc9bef7641f..41ce125971777 100644
--- a/sound/pci/Kconfig
+++ b/sound/pci/Kconfig
@@ -279,6 +279,7 @@ config SND_CS46XX_NEW_DSP
 config SND_CS5530
 	tristate "CS5530 Audio"
 	depends on ISA_DMA_API && (X86_32 || COMPILE_TEST)
+	depends on !M68K
 	select SND_SB16_DSP
 	help
 	  Say Y here to include support for audio on Cyrix/NatSemi CS5530 chips.
-- 
2.33.0

