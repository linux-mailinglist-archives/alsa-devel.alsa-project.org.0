Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B9B118038
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 07:13:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 946E810E;
	Tue, 10 Dec 2019 07:12:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 946E810E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575958427;
	bh=VZOQ1/kzCfYmHcrjzSZwigIJOWkT+TO5/1pvaRx2Tps=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tVBHbpuI3OCwi9K/YzBOa5/2lfutFXYXarRvgP/8vT8XLpNxbD9crebR7bfTzSRCT
	 /e1begnYQS5C6SWkWXAiFxhFXUsp42rf2psjETlfyoxEsRzZSE27aVN7TMY+Ol4Oqh
	 1ykU/AvwrFJfNC14EB1Citq+iRTgrFW3ODy/goXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DB6AF80269;
	Tue, 10 Dec 2019 07:12:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 422E9F80271; Tue, 10 Dec 2019 07:11:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95BC4F8020C
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 07:11:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95BC4F8020C
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 76EE8B1AD
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 06:11:51 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 07:11:22 +0100
Message-Id: <20191210061145.24641-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH 00/23] ALSA: Drop superfluous ioctl PCM ops
	(for 5.6)
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

this is another series of patches targeted to 5.6 kernel.
This one is applied on top of the previous series for managed
allocation, and again specific to non-ASoC drivers in sound/*.
For ASoC and other subsystems, another patchset will be submitted
later.

The changes are pretty simple, just removing the snd_pcm_lib_ioctl
entries that became superfluous.


Takashi

===

Takashi Iwai (23):
  ALSA: aoa: Drop superfluous ioctl PCM ops
  ALSA: arm: Drop superfluous ioctl PCM ops
  ALSA: atmel: Drop superfluous ioctl PCM ops
  ALSA: drivers: Drop superfluous ioctl PCM ops
  ALSA: firewire: Drop superfluous ioctl PCM ops
  ALSA: es1688: Drop superfluous ioctl PCM ops
  ALSA: isa: Drop superfluous ioctl PCM ops
  ALSA: mips: Drop superfluous ioctl PCM ops
  ALSA: parisc: Drop superfluous ioctl PCM ops
  ALSA: intel8x0: Drop superfluous ioctl PCM ops
  ALSA: via82xx: Drop superfluous ioctl PCM ops
  ALSA: atiixp: Drop superfluous ioctl PCM ops
  ALSA: asihpi: Drop superfluous ioctl PCM ops
  ALSA: trident: Drop superfluous ioctl PCM ops
  ALSA: pci: Drop superfluous ioctl PCM ops
  ALSA: pcmcia: Drop superfluous ioctl PCM ops
  ALSA: ppc: Drop superfluous ioctl PCM ops
  ALSA: sh: Drop superfluous ioctl PCM ops
  ALSA: sparc: Drop superfluous ioctl PCM ops
  ALSA: spi: Drop superfluous ioctl PCM ops
  ALSA: usb: Drop superfluous ioctl PCM ops
  ALSA: x86: Drop superfluous ioctl PCM ops
  ALSA: xen: Drop superfluous ioctl PCM ops

 sound/aoa/soundbus/i2sbus/pcm.c          |  2 --
 sound/arm/aaci.c                         |  2 --
 sound/arm/pxa2xx-ac97.c                  |  1 -
 sound/atmel/ac97c.c                      |  2 --
 sound/drivers/aloop.c                    |  1 -
 sound/drivers/dummy.c                    |  2 --
 sound/drivers/ml403-ac97cr.c             |  2 --
 sound/drivers/pcsp/pcsp_lib.c            |  1 -
 sound/drivers/vx/vx_pcm.c                |  2 --
 sound/firewire/bebob/bebob_pcm.c         |  2 --
 sound/firewire/dice/dice-pcm.c           |  2 --
 sound/firewire/digi00x/digi00x-pcm.c     |  2 --
 sound/firewire/fireface/ff-pcm.c         |  2 --
 sound/firewire/fireworks/fireworks_pcm.c |  2 --
 sound/firewire/isight.c                  |  1 -
 sound/firewire/motu/motu-pcm.c           |  2 --
 sound/firewire/oxfw/oxfw-pcm.c           |  2 --
 sound/firewire/tascam/tascam-pcm.c       |  2 --
 sound/isa/ad1816a/ad1816a_lib.c          |  2 --
 sound/isa/es1688/es1688_lib.c            |  8 --------
 sound/isa/es18xx.c                       |  2 --
 sound/isa/gus/gus_pcm.c                  |  2 --
 sound/isa/msnd/msnd.c                    |  2 --
 sound/isa/sb/emu8000_pcm.c               |  1 -
 sound/isa/sb/sb16_main.c                 |  2 --
 sound/isa/sb/sb8_main.c                  |  2 --
 sound/isa/wss/wss_lib.c                  |  2 --
 sound/mips/hal2.c                        |  2 --
 sound/mips/sgio2audio.c                  |  3 ---
 sound/parisc/harmony.c                   |  2 --
 sound/pci/ad1889.c                       |  2 --
 sound/pci/ali5451/ali5451.c              |  4 ----
 sound/pci/als300.c                       |  2 --
 sound/pci/als4000.c                      |  2 --
 sound/pci/asihpi/asihpi.c                | 17 -----------------
 sound/pci/atiixp.c                       |  3 ---
 sound/pci/atiixp_modem.c                 |  2 --
 sound/pci/au88x0/au88x0_pcm.c            |  1 -
 sound/pci/aw2/aw2-alsa.c                 |  2 --
 sound/pci/azt3328.c                      |  3 ---
 sound/pci/bt87x.c                        |  1 -
 sound/pci/ca0106/ca0106_main.c           |  8 --------
 sound/pci/cmipci.c                       |  5 -----
 sound/pci/cs4281.c                       |  2 --
 sound/pci/cs46xx/cs46xx_lib.c            | 10 ----------
 sound/pci/cs5535audio/cs5535audio_pcm.c  |  2 --
 sound/pci/ctxfi/ctpcm.c                  |  2 --
 sound/pci/echoaudio/echoaudio.c          |  4 ----
 sound/pci/emu10k1/emu10k1x.c             |  2 --
 sound/pci/emu10k1/emupcm.c               |  6 ------
 sound/pci/emu10k1/p16v.c                 |  2 --
 sound/pci/ens1370.c                      |  3 ---
 sound/pci/es1938.c                       |  2 --
 sound/pci/es1968.c                       |  2 --
 sound/pci/fm801.c                        |  2 --
 sound/pci/hda/hda_controller.c           |  1 -
 sound/pci/ice1712/ice1712.c              |  5 -----
 sound/pci/ice1712/ice1724.c              |  5 -----
 sound/pci/intel8x0.c                     | 12 ------------
 sound/pci/intel8x0m.c                    |  2 --
 sound/pci/lola/lola_pcm.c                |  1 -
 sound/pci/lx6464es/lx6464es.c            |  2 --
 sound/pci/maestro3.c                     |  2 --
 sound/pci/mixart/mixart.c                |  2 --
 sound/pci/nm256/nm256.c                  |  2 --
 sound/pci/oxygen/oxygen_pcm.c            |  6 ------
 sound/pci/pcxhr/pcxhr.c                  |  1 -
 sound/pci/riptide/riptide.c              |  2 --
 sound/pci/rme32.c                        |  8 --------
 sound/pci/rme96.c                        |  4 ----
 sound/pci/sis7019.c                      |  2 --
 sound/pci/sonicvibes.c                   |  2 --
 sound/pci/trident/trident_main.c         | 31 -------------------------------
 sound/pci/via82xx.c                      |  5 -----
 sound/pci/via82xx_modem.c                |  2 --
 sound/pci/ymfpci/ymfpci_main.c           |  5 -----
 sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c   |  1 -
 sound/ppc/pmac.c                         |  2 --
 sound/ppc/snd_ps3.c                      |  1 -
 sound/sh/aica.c                          |  1 -
 sound/sh/sh_dac_audio.c                  |  1 -
 sound/sparc/amd7930.c                    |  2 --
 sound/sparc/cs4231.c                     |  2 --
 sound/sparc/dbri.c                       |  1 -
 sound/spi/at73c213.c                     |  1 -
 sound/usb/6fire/pcm.c                    |  1 -
 sound/usb/caiaq/audio.c                  |  1 -
 sound/usb/hiface/pcm.c                   |  1 -
 sound/usb/line6/capture.c                |  1 -
 sound/usb/line6/playback.c               |  1 -
 sound/usb/misc/ua101.c                   |  2 --
 sound/usb/pcm.c                          |  2 --
 sound/usb/usx2y/usbusx2yaudio.c          |  1 -
 sound/usb/usx2y/usx2yhwdeppcm.c          |  1 -
 sound/x86/intel_hdmi_audio.c             |  1 -
 sound/xen/xen_snd_front_alsa.c           |  2 --
 96 files changed, 281 deletions(-)

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
