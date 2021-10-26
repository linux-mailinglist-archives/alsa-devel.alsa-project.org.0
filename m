Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B8F43B541
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 17:14:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34D5F4E;
	Tue, 26 Oct 2021 17:13:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34D5F4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635261240;
	bh=0FK0eH0C+bo+mypu+GhvkPxaYoF3s9xk5YhUDUKjL+Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=az3q1eRLJ5B3GmUARarN8sjlq12JyueKdXqkboMt3cJxyAwhI7h7fd6RMitFWDbrq
	 XBKR4V9rzufIkmGbuEtKZd/fhGpYNbTJ0/I7WgjGO4r2Ry0UR7gKZK72Pf8672f9zm
	 +vUvMaiYF9geAmIgkyG9keZrFeHG+1iIlPBp9eMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEEA8F804E6;
	Tue, 26 Oct 2021 17:11:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C89CF80269; Tue, 26 Oct 2021 17:11:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02BE6F802C8
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 17:11:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02BE6F802C8
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:441:6c1a:bc30:46e])
 by xavier.telenet-ops.be with bizsmtp
 id AfBR260062hfXWm01fBRel; Tue, 26 Oct 2021 17:11:25 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mfO6m-0084pE-SH; Tue, 26 Oct 2021 17:11:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mfO6m-00DLmu-Ep; Tue, 26 Oct 2021 17:11:24 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/3] ASoC: amd: acp: SND_SOC_AMD_{LEGACY_MACH,
 SOF_MACH} should depend on X86 && PCI && I2C
Date: Tue, 26 Oct 2021 17:11:22 +0200
Message-Id: <dfb03bd33117e26f3f04ce227bb28095109b3d80.1635260849.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635260849.git.geert+renesas@glider.be>
References: <cover.1635260849.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
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

If not all of CONFIG_X86, CONFIG_PCI, and CONFIG_I2C are set:

    WARNING: unmet direct dependencies detected for SND_SOC_AMD_MACH_COMMON
      Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && X86 && PCI [=y] && I2C [=y]
      Selected by [y]:
      - SND_SOC_AMD_LEGACY_MACH [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y]
      - SND_SOC_AMD_SOF_MACH [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y]

As SND_SOC_AMD_MACH_COMMON depends on X86 && PCI && I2C, all symbols
selecting it should depend on X86 && PCI && I2C, too.

Fixes: 9d8a7be88b3365e4 ("ASoC: amd: acp: Add legacy sound card support for Chrome audio")
Fixes: 9f84940f5004e1d2 ("ASoC: amd: acp: Add SOF audio support on Chrome board")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 sound/soc/amd/acp/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index ea186cd31ba220ab..006bd2dc5f0444ec 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -43,12 +43,14 @@ config SND_SOC_AMD_MACH_COMMON
 config SND_SOC_AMD_LEGACY_MACH
 	tristate "AMD Legacy Machine Driver Support"
 	select SND_SOC_AMD_MACH_COMMON
+	depends on X86 && PCI && I2C
 	help
 	  This option enables legacy sound card support for ACP audio.
 
 config SND_SOC_AMD_SOF_MACH
 	tristate "AMD SOF Machine Driver Support"
 	select SND_SOC_AMD_MACH_COMMON
+	depends on X86 && PCI && I2C
 	help
 	  This option enables SOF sound card support for ACP audio.
 
-- 
2.25.1

