Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1349344B73B
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Nov 2021 23:30:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A441916A8;
	Tue,  9 Nov 2021 23:29:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A441916A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636497041;
	bh=bZYwmws7ttw+7pmQhuTuxLgNOJ+/Q2vHTKQPCg9K4Ws=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oaKux+gNXlniyP0YX3O6HLVN/uOJtzWKSC8jorSGVeYhMsAOAltCaSsPdjW3LpaJ+
	 hq9kVDynJW02zl8XHyXCylbYnbSNDoIxbNJCFzBXJBZSIibq40uIXLKSWZndZsIcG/
	 ++5u/MVp7fEP2rAEJ/rqmbX8WHuuOFUuNP6tD/LU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34C7BF805B0;
	Tue,  9 Nov 2021 23:23:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3614F80507; Tue,  9 Nov 2021 23:23:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B05BF805AE
 for <alsa-devel@alsa-project.org>; Tue,  9 Nov 2021 23:23:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B05BF805AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EBuYlWXn"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 359A161506;
 Tue,  9 Nov 2021 22:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636496579;
 bh=bZYwmws7ttw+7pmQhuTuxLgNOJ+/Q2vHTKQPCg9K4Ws=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EBuYlWXn4q4BT5Hu1wFVx6xX+6+6IYrOyqQuZNVkpCt3itIw1cM/qmuIr8ati2kdg
 Gg/rTQIOLwKQW/JWrVjrc+EiVAmwPB93zYPstTs8AoSWQ2TquUXuXOWU5FI8JGWeKF
 2HQXooX6gb8g94i2EDBWpSvoXqn6OxmJbU1zSjGGD8rxkRjUk5bgkzqx8dDeW4NnqU
 8fXw1lFX0HVDYjjJq+1fNWr6rRq6UB+o9iubWDGQeBGgCKrDNKiopzyiChg8LeXYZW
 4yk3TVxH1K6OxG9u41SwB9iK25Qhqix14ZmrHPUHPXZbxAI1LSYDZFC52H6nOvlIhT
 0SuOaHKkmqY5A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 22/30] ALSA: ISA: not for M68K
Date: Tue,  9 Nov 2021 17:22:16 -0500
Message-Id: <20211109222224.1235388-22-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211109222224.1235388-1-sashal@kernel.org>
References: <20211109222224.1235388-1-sashal@kernel.org>
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
index ee4a4a6b99ba7..d123587c0fd8f 100644
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
index b690ed937cbe8..df2e45c8814e9 100644
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
index 7630f808d087c..6edde2f145025 100644
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

