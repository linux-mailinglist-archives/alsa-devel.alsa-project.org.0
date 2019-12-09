Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C74116A2D
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 10:52:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B884166C;
	Mon,  9 Dec 2019 10:51:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B884166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575885144;
	bh=PHeQQWaEzCDObcgPDXkTwPDOhuVW0Jr1dZNU9506cj8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HKE+GsvuYhP/KT6h8waq/LmTETbpd2+4FyXj7v++gqJumpl+ZK6Dk/XLxN9uvc3Fz
	 sCKl2+VrYM6GLa7U2h1l7oLB7KKBVyHZj0FkaDDDyxxFuvZtZ+aEIbNi78QjStNxZN
	 NuR17i6wq0fqFT40Gv5mcLujXJdcHKai/avkBcAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6D33F802EC;
	Mon,  9 Dec 2019 10:50:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF652F8029B; Mon,  9 Dec 2019 10:49:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57FB6F801F4
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57FB6F801F4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4F0D7B282
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:46 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:48:32 +0100
Message-Id: <20191209094943.14984-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH 5.6 00/71] ALSA: Use managed buffer allocation
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

we already got a PCM core extension in 5.5-rc1 for allocating /
releasing the PCM buffers implicitly, so called managed buffer
allocation mode.  This patch set is to apply this new mode for the
actual (non-ASoC) drivers.  The patches for ASoC and the other
subsystems will follow in later patch sets.  Also, other PCM API
changes will follow later, too.

This won't change anything from the functional POV, but merely
cleanups.


Takashi

===

Takashi Iwai (71):
  ALSA: aoa: Use managed buffer allocation
  ALSA: aaci: Use managed buffer allocation
  ALSA: atmel: Use managed buffer allocation
  ALSA: aloop: Use managed buffer allocation
  ALSA: dummy: Use managed buffer allocation
  ALSA: ml403: Use managed buffer allocation
  ALSA: pcsp: Use managed buffer allocation
  ALSA: vx: Use managed buffer allocation
  ALSA: firewire: Use managed buffer allocation
  ALSA: ad1816a: Use managed buffer allocation
  ALSA: cmi8330: Use managed buffer allocation
  ALSA: es1688: Use managed buffer allocation
  ALSA: es18xx: Use managed buffer allocation
  ALSA: sb: Use managed buffer allocation
  ALSA: gus: Use managed buffer allocation
  ALSA: wss: Use managed buffer allocation
  ALSA: mips: Use managed buffer allocation
  ALSA: parisc: Use managed buffer allocation
  ALSA: ad1889: Use managed buffer allocation
  ALSA: ali5451: Use managed buffer allocation
  ALSA: als300: Use managed buffer allocation
  ALSA: als4000: Use managed buffer allocation
  ALSA: asihpi: Use managed buffer allocation
  ALSA: atiixp: Use managed buffer allocation
  ALSA: au88x0: Use managed buffer allocation
  ALSA: aw2: Use managed buffer allocation
  ALSA: azt3328: Use managed buffer allocation
  ALSA: bt87x: Use managed buffer allocation
  ALSA: ca0106: Use managed buffer allocation
  ALSA: cmipci: Use managed buffer allocation
  ALSA: cs4281: Use managed buffer allocation
  ALSA: cs5535: Use managed buffer allocation
  ALSA: ctxfi: Use managed buffer allocation
  ALSA: echoaudio: Use managed buffer allocation
  ALSA: emu10k1x: Use managed buffer allocation
  ALSA: emu10k1: Use managed buffer allocation
  ALSA: ens137x: Use managed buffer allocation
  ALSA: es1938: Use managed buffer allocation
  ALSA: fm801: Use managed buffer allocation
  ALSA: hda: Use managed buffer allocation
  ALSA: ice1712: Use managed buffer allocation
  ALSA: ice1724: Use managed buffer allocation
  ALSA: intel8x0: Use managed buffer allocation
  ALSA: lola: Use managed buffer allocation
  ALSA: lx6464es: Use managed buffer allocation
  ALSA: maestro3: Use managed buffer allocation
  ALSA: mixart: Use managed buffer allocation
  ALSA: oxygen: Use managed buffer allocation
  ALSA: pcxhr: Use managed buffer allocation
  ALSA: riptide: Use managed buffer allocation
  ALSA: rme32: Use managed buffer allocation
  ALSA: sis7019: Use managed buffer allocation
  ALSA: sonicvibes: Use managed buffer allocation
  ALSA: trident: Use managed buffer allocation
  ALSA: via82xx: Use managed buffer allocation
  ALSA: ymfpci: Use managed buffer allocation
  ALSA: pdaudiocf: Use managed buffer allocation
  ALSA: pmac: Use managed buffer allocation
  ALSA: ps3: Use managed buffer allocation
  ALSA: aica: Use managed buffer allocation
  ALSA: sh: Use managed buffer allocation
  ALSA: sparc: Use managed buffer allocation
  ALSA: spi: Use managed buffer allocation
  ALSA: 6fire: Use managed buffer allocation
  ALSA: caiaq: Use managed buffer allocation
  ALSA: hiface: Use managed buffer allocation
  ALSA: line6: Use managed buffer allocation
  ALSA: ua101: Use managed buffer allocation
  ALSA: usx2y: Use managed buffer allocation
  ALSA: usb-audio: Use managed buffer allocation
  ALSA: hdml-lpe-audio: Use managed buffer allocation

 sound/aoa/soundbus/i2sbus/pcm.c          | 11 +------
 sound/arm/aaci.c                         | 40 +++++++++--------------
 sound/atmel/ac97c.c                      | 20 ++----------
 sound/drivers/aloop.c                    | 12 ++-----
 sound/drivers/dummy.c                    | 14 ++------
 sound/drivers/ml403-ac97cr.c             | 29 +++--------------
 sound/drivers/pcsp/pcsp_lib.c            | 17 ++++------
 sound/drivers/vx/vx_pcm.c                | 27 ++-------------
 sound/firewire/bebob/bebob_pcm.c         | 11 ++-----
 sound/firewire/dice/dice-pcm.c           | 13 +++-----
 sound/firewire/digi00x/digi00x-pcm.c     | 11 ++-----
 sound/firewire/fireface/ff-pcm.c         |  9 ++---
 sound/firewire/fireworks/fireworks_pcm.c | 11 ++-----
 sound/firewire/isight.c                  | 10 ++----
 sound/firewire/motu/motu-pcm.c           | 11 ++-----
 sound/firewire/oxfw/oxfw-pcm.c           | 17 +++-------
 sound/firewire/tascam/tascam-pcm.c       | 11 ++-----
 sound/isa/ad1816a/ad1816a_lib.c          | 20 ++----------
 sound/isa/cmi8330.c                      |  5 ++-
 sound/isa/es1688/es1688_lib.c            | 20 ++----------
 sound/isa/es18xx.c                       | 24 +++-----------
 sound/isa/gus/gus_pcm.c                  | 28 +++++-----------
 sound/isa/sb/sb16_main.c                 | 21 ++----------
 sound/isa/sb/sb8_main.c                  | 21 ++----------
 sound/isa/wss/wss_lib.c                  | 23 ++-----------
 sound/mips/hal2.c                        | 25 ++------------
 sound/mips/sgio2audio.c                  | 20 ++----------
 sound/parisc/harmony.c                   | 18 +++-------
 sound/pci/ad1889.c                       | 24 ++------------
 sound/pci/ali5451/ali5451.c              | 30 ++---------------
 sound/pci/als300.c                       | 23 ++-----------
 sound/pci/als4000.c                      | 23 ++-----------
 sound/pci/asihpi/asihpi.c                | 10 ++----
 sound/pci/atiixp.c                       | 14 +++-----
 sound/pci/atiixp_modem.c                 |  9 ++---
 sound/pci/au88x0/au88x0_pcm.c            | 15 ++-------
 sound/pci/aw2/aw2-alsa.c                 | 45 +++++++------------------
 sound/pci/azt3328.c                      | 30 +++--------------
 sound/pci/bt87x.c                        | 14 +++-----
 sound/pci/ca0106/ca0106_main.c           | 56 ++++----------------------------
 sound/pci/cmipci.c                       | 36 ++++++--------------
 sound/pci/cs4281.c                       | 20 ++----------
 sound/pci/cs5535audio/cs5535audio_pcm.c  | 12 +++----
 sound/pci/ctxfi/ctpcm.c                  | 15 +++------
 sound/pci/echoaudio/echoaudio.c          | 19 +++--------
 sound/pci/emu10k1/emu10k1x.c             | 15 ++++-----
 sound/pci/emu10k1/emupcm.c               | 41 ++++-------------------
 sound/pci/emu10k1/p16v.c                 | 48 ++++-----------------------
 sound/pci/ens1370.c                      | 27 +++------------
 sound/pci/es1938.c                       | 28 ++--------------
 sound/pci/fm801.c                        | 20 ++----------
 sound/pci/hda/hda_controller.c           | 13 +++-----
 sound/pci/ice1712/ice1712.c              | 42 +++++-------------------
 sound/pci/ice1712/ice1724.c              | 25 +++++---------
 sound/pci/intel8x0.c                     | 11 +++----
 sound/pci/intel8x0m.c                    | 23 +++----------
 sound/pci/lola/lola_pcm.c                | 11 +++----
 sound/pci/lx6464es/lx6464es.c            | 14 ++------
 sound/pci/maestro3.c                     |  9 ++---
 sound/pci/mixart/mixart.c                | 14 +++-----
 sound/pci/oxygen/oxygen_pcm.c            | 52 +++++++++++++----------------
 sound/pci/pcxhr/pcxhr.c                  | 31 ++++--------------
 sound/pci/riptide/riptide.c              | 10 +++---
 sound/pci/rme32.c                        | 35 ++++----------------
 sound/pci/sis7019.c                      | 25 ++------------
 sound/pci/sonicvibes.c                   | 20 ++----------
 sound/pci/trident/trident_main.c         | 49 +++++++++++-----------------
 sound/pci/via82xx.c                      | 45 ++++++++++---------------
 sound/pci/via82xx_modem.c                |  9 ++---
 sound/pci/ymfpci/ymfpci_main.c           | 33 +++++--------------
 sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c   | 25 ++------------
 sound/ppc/pmac.c                         | 28 ++--------------
 sound/ppc/snd_ps3.c                      | 28 +++-------------
 sound/sh/aica.c                          | 29 +++--------------
 sound/sh/sh_dac_audio.c                  | 20 ++----------
 sound/sparc/amd7930.c                    | 20 ++----------
 sound/sparc/cs4231.c                     | 17 ++--------
 sound/sparc/dbri.c                       | 13 ++------
 sound/spi/at73c213.c                     | 11 ++-----
 sound/usb/6fire/pcm.c                    | 17 +---------
 sound/usb/caiaq/audio.c                  | 13 ++------
 sound/usb/hiface/pcm.c                   | 18 ++--------
 sound/usb/line6/pcm.c                    | 13 ++------
 sound/usb/misc/ua101.c                   | 23 +++----------
 sound/usb/pcm.c                          | 15 +++------
 sound/usb/usx2y/usbusx2yaudio.c          | 26 +++++----------
 sound/usb/usx2y/usx2yhwdeppcm.c          | 18 +++++-----
 sound/x86/intel_hdmi_audio.c             | 16 ++++-----
 88 files changed, 402 insertions(+), 1492 deletions(-)

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
