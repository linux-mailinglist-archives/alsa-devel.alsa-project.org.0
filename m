Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3473CF013C
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 16:24:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA79616E0;
	Tue,  5 Nov 2019 16:23:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA79616E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572967455;
	bh=K3mOWKo6w0PZa2m3nq/a9qhdkO2xytyiN8NUfN7hkak=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q9/rTemhlZjVwK0BmH5kn6d1Uc7wCxD2Vq+JRvLcskX1nj1yXabqWY7xyurwYYVLL
	 mXkkNbKXjWUridiqiHporotY2cLnbzRXblkqEHKc8O8lMZo8LGkQQHHefmLKS3nMVO
	 z7SDgI07rHESPs7hvn9A8sTSn7ruXSAqcJNal2OQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA27BF8065B;
	Tue,  5 Nov 2019 16:19:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19BD0F80635; Tue,  5 Nov 2019 16:19:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9BBFF80446
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 16:18:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9BBFF80446
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D4C43B25C
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 15:18:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 16:18:32 +0100
Message-Id: <20191105151856.10785-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH 00/24] Clean up memalloc callers
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

Hi,

this is a trivial cleanup series corresponding to the recent ALSA
memalloc API enhancement[1].

Most of patches do simple and systematic changes: either convert to
the new way of vmalloc buffer handling, replacing the superfluous
snd_dma_continous_data() macro with NULL, or replacing the
snd_dma_pci_data() with the direct device pointer assignment.  Some
have a slightly more changes but they are straightforward enough.
Also, a few document updates are provided.

There are still a few reminders (noticeably ASoC), and I'll post the
patches for them later.  Once after all conversions done, we can drop
the superfluous API functions and macros.


thanks,

Takashi

[1] https://lore.kernel.org/r/20191105080138.1260-1-tiwai@suse.de

===

Takashi Iwai (24):
  ALSA: drivers: Remove superfluous snd_dma_continuous_data()
  ALSA: mips: Remove superfluous snd_dma_continuous_data()
  ALSA: rme32: Remove superfluous snd_dma_continuous_data()
  ALSA: sh: Remove superfluous snd_dma_continuous_data()
  ALSA: sparc: Remove superfluous snd_dma_continuous_data()
  ALSA: usb: Remove superfluous snd_dma_continuous_data()
  ALSA: 6fire: Drop the dead code
  ALSA: usb-audio: Convert to the common vmalloc memalloc
  ALSA: aloop: Convert to the common vmalloc memalloc
  ALSA: firewire: Convert to the common vmalloc memalloc
  ALSA: 6fire: Convert to the common vmalloc memalloc
  ALSA: caiaq: Convert to the common vmalloc memalloc
  ALSA: hiface: Convert to the common vmalloc memalloc
  ALSA: ua101: Convert to the common vmalloc memalloc
  ALSA: vx: Convert to the common vmalloc memalloc
  ALSA: pdaudiocf: Convert to the common vmalloc memalloc
  ALSA: mips: Convert to the common vmalloc memalloc
  ALSA: pci: Drop superfluous snd_pcm_sgbuf_ops_page
  ALSA: aoa: Avoid non-standard macro usage
  ALSA: echoaudio: Avoid non-standard macro usage
  ALSA: es1968: Avoid non-standard macro usage
  ALSA: rme: Avoid non-standard macro usage
  ALSA: pci: Avoid non-standard macro usage
  ALSA: docs: Remove snd_dma_pci_data() usage in documentation

 .../sound/kernel-api/writing-an-alsa-driver.rst    |  8 ++--
 sound/aoa/soundbus/i2sbus/pcm.c                    |  2 +-
 sound/drivers/aloop.c                              |  8 ++--
 sound/drivers/dummy.c                              |  2 +-
 sound/drivers/ml403-ac97cr.c                       |  2 +-
 sound/drivers/pcsp/pcsp_lib.c                      |  4 +-
 sound/drivers/vx/vx_pcm.c                          | 10 ++---
 sound/firewire/bebob/bebob_pcm.c                   |  9 ++--
 sound/firewire/dice/dice-pcm.c                     | 11 ++---
 sound/firewire/digi00x/digi00x-pcm.c               |  9 ++--
 sound/firewire/fireface/ff-pcm.c                   |  9 ++--
 sound/firewire/fireworks/fireworks_pcm.c           |  9 ++--
 sound/firewire/isight.c                            |  8 ++--
 sound/firewire/motu/motu-pcm.c                     |  9 ++--
 sound/firewire/oxfw/oxfw-pcm.c                     | 14 +++---
 sound/firewire/tascam/tascam-pcm.c                 |  9 ++--
 sound/mips/hal2.c                                  |  3 +-
 sound/mips/sgio2audio.c                            | 12 +++---
 sound/pci/ad1889.c                                 |  6 +--
 sound/pci/ali5451/ali5451.c                        |  2 +-
 sound/pci/als300.c                                 |  3 +-
 sound/pci/als4000.c                                |  3 +-
 sound/pci/asihpi/asihpi.c                          |  4 +-
 sound/pci/atiixp.c                                 |  6 +--
 sound/pci/atiixp_modem.c                           |  4 +-
 sound/pci/au88x0/au88x0_pcm.c                      |  3 +-
 sound/pci/aw2/aw2-alsa.c                           |  6 +--
 sound/pci/azt3328.c                                |  8 ++--
 sound/pci/bt87x.c                                  |  5 +--
 sound/pci/ca0106/ca0106_main.c                     |  6 +--
 sound/pci/cmipci.c                                 |  6 +--
 sound/pci/cs4281.c                                 |  3 +-
 sound/pci/cs46xx/cs46xx_lib.c                      | 16 ++++---
 sound/pci/cs5535audio/cs5535audio_pcm.c            |  6 +--
 sound/pci/ctxfi/ctpcm.c                            |  5 +--
 sound/pci/ctxfi/ctvmem.c                           |  2 +-
 sound/pci/echoaudio/echoaudio.c                    | 24 +++--------
 sound/pci/emu10k1/emu10k1.c                        |  5 ++-
 sound/pci/emu10k1/emu10k1x.c                       |  6 +--
 sound/pci/emu10k1/emufx.c                          |  2 +-
 sound/pci/emu10k1/emupcm.c                         | 12 +++---
 sound/pci/emu10k1/memory.c                         |  4 +-
 sound/pci/emu10k1/p16v.c                           |  4 +-
 sound/pci/ens1370.c                                |  8 ++--
 sound/pci/es1938.c                                 |  3 +-
 sound/pci/es1968.c                                 |  4 +-
 sound/pci/fm801.c                                  |  2 +-
 sound/pci/hda/hda_controller.c                     |  1 -
 sound/pci/ice1712/ice1712.c                        |  9 ++--
 sound/pci/ice1712/ice1724.c                        |  6 +--
 sound/pci/intel8x0.c                               |  4 +-
 sound/pci/intel8x0m.c                              |  4 +-
 sound/pci/korg1212/korg1212.c                      |  8 ++--
 sound/pci/lola/lola.c                              |  2 +-
 sound/pci/lola/lola_pcm.c                          |  5 +--
 sound/pci/lx6464es/lx6464es.c                      |  2 +-
 sound/pci/maestro3.c                               |  3 +-
 sound/pci/mixart/mixart.c                          |  7 +--
 sound/pci/oxygen/oxygen_pcm.c                      | 10 ++---
 sound/pci/pcxhr/pcxhr.c                            |  4 +-
 sound/pci/riptide/riptide.c                        |  6 +--
 sound/pci/rme32.c                                  |  4 +-
 sound/pci/rme9652/hdsp.c                           |  7 +--
 sound/pci/rme9652/hdspm.c                          |  3 +-
 sound/pci/rme9652/rme9652.c                        |  7 +--
 sound/pci/sis7019.c                                |  3 +-
 sound/pci/sonicvibes.c                             |  3 +-
 sound/pci/trident/trident_main.c                   | 24 ++++++-----
 sound/pci/via82xx.c                                | 17 +++-----
 sound/pci/via82xx_modem.c                          |  6 +--
 sound/pci/ymfpci/ymfpci_main.c                     | 16 ++++---
 sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c             |  9 ++--
 sound/sh/aica.c                                    |  2 +-
 sound/sh/sh_dac_audio.c                            |  2 +-
 sound/sparc/amd7930.c                              |  2 +-
 sound/sparc/dbri.c                                 |  2 +-
 sound/usb/6fire/pcm.c                              | 16 +++----
 sound/usb/caiaq/audio.c                            |  8 ++--
 sound/usb/hiface/pcm.c                             |  9 ++--
 sound/usb/line6/pcm.c                              |  4 +-
 sound/usb/misc/ua101.c                             | 14 +++---
 sound/usb/pcm.c                                    | 50 ++++------------------
 sound/usb/usx2y/usbusx2yaudio.c                    |  4 +-
 sound/usb/usx2y/usx2yhwdeppcm.c                    |  4 +-
 84 files changed, 266 insertions(+), 327 deletions(-)

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
