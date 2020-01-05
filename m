Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 503DF13086F
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 15:51:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5D94171E;
	Sun,  5 Jan 2020 15:50:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5D94171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578235871;
	bh=ojYi14+LcQkJuJ6wU4zi3JvYnCS96GEQdFi5HRei4GA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fRxsk6IeEUkdAmixukg0Q69VVYcjPuKyBdPMtJaqVLE8vMPVEPjXmaBIOuauXTPS1
	 dUIrZmVVlrMYbogIkzHv/SXqQCJ97qvvDBBUuzoBLnJER7BT8JXHDY8NiY+n86Txs3
	 btLsuHEQD9F0PTlvzUsVeIaABgvVuPm0by/TofX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D930F802D2;
	Sun,  5 Jan 2020 15:48:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C131F8028C; Sun,  5 Jan 2020 15:48:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA88AF80140
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA88AF80140
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9ABAEAD5F
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:31 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:15 +0100
Message-Id: <20200105144823.29547-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH 00/68] ALSA: Constifications, take #2
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

this is the next series of patches for adding more const prefix
allover the places.  They do just nothing but adding cost.


Takashi

===

Takashi Iwai (68):
  ALSA: Allow const arrays for legacy resource management helpers
  ALSA: aoa: More constifications
  ALSA: hda/realtek - More constifications
  ALSA: dummy: More constifications
  ALSA: pcm: More constifications
  ALSA: seq: More constifications
  ALSA: vx: More constifications
  ALSA: intel8x0: More constifications
  ALSA: hda: More constifications
  ALSA: ac97: More constifications
  ALSA: usb-audio: More constifications
  ALSA: caiaq: More constifications
  ALSA: au88x0: More constifications
  ALSA: emu10k1: More constifications
  ALSA: riptide: More constifications
  ALSA: ice1712: More constifications
  ALSA: ppc: More constifications
  ALSA: hdsp: More constifications
  ALSA: hdspm: More constifications
  ALSA: rme9652: More constifications
  ALSA: emux: More constifications
  ALSA: usx2y: More constifications
  ALSA: pcxhr: More constifications
  ALSA: mixart: More constifications
  ALSA: ymfpci: More constifications
  ALSA: bcd2000: More constifications
  ALSA: nm256: More constifications
  ALSA: korg1212: More constifications
  ALSA: cs46xx: More constifications
  ALSA: ca0106: More constifications
  ALSA: ctxfi: More constifications
  ALSA: asihpi: More constifications
  ALSA: atiixp: More constifications
  ALSA: es1938: More constifications
  ALSA: es1968: More constifications
  ALSA: cmipci: More constifications
  ALSA: sparc: More constifications
  ALSA: info: More constifications
  ALSA: jack: More constification
  ALSA: oss: More constifications
  ALSA: rawmidi: More constification
  ALSA: opl3: More constifications
  ALSA: cmi8328: More constifications
  ALSA: cs423x: More constification
  ALSA: sb: More constifications
  ALSA: cmi8330: More constifications
  ALSA: es1688: More constifications
  ALSA: es18xx: More constifications
  ALSA: gus: More constifications
  ALSA: opti9xx: More constifications
  ALSA: wss: More constifications
  ALSA: sc6000: More constification
  ALSA: mts64: More constifications
  ALSA: aw2: More constifications
  ALSA: lx6464es: More constifications
  ALSA: arm: More constification
  ALSA: opl4: More constification
  ALSA: serial-u16550: More constification
  ALSA: ak4531: More constification
  ALSA: azt3328: More constification
  ALSA: cs4281: More constification
  ALSA: echoaudio: More constification
  ALSA: ens137x: More constification
  ALSA: fm801: More constification
  ALSA: via82xx: More constification
  ALSA: pdaudiocf: More constification
  ALSA: spi: More constification
  ALSA: sh: Fix compile warning wrt const

 include/sound/initval.h                 |   6 +-
 sound/aoa/codecs/onyx.c                 |   4 +-
 sound/aoa/codecs/tas-basstreble.h       |   4 +-
 sound/aoa/codecs/tas-gain-table.h       |   2 +-
 sound/aoa/soundbus/i2sbus/core.c        |   2 +-
 sound/arm/aaci.c                        |   2 +-
 sound/core/info.c                       |   4 +-
 sound/core/jack.c                       |   2 +-
 sound/core/oss/mixer_oss.c              |   2 +-
 sound/core/oss/pcm_plugin.c             |   2 +-
 sound/core/pcm.c                        |  12 ++--
 sound/core/pcm_lib.c                    |   2 +-
 sound/core/pcm_misc.c                   |   5 +-
 sound/core/rawmidi.c                    |   2 +-
 sound/core/seq/oss/seq_oss_init.c       |   4 +-
 sound/core/seq/seq_midi_emul.c          |   6 +-
 sound/core/seq/seq_midi_event.c         |   6 +-
 sound/drivers/dummy.c                   |  24 +++----
 sound/drivers/mts64.c                   |   4 +-
 sound/drivers/opl3/opl3_drums.c         |   2 +-
 sound/drivers/opl3/opl3_midi.c          |   6 +-
 sound/drivers/opl4/opl4_synth.c         |   2 +-
 sound/drivers/serial-u16550.c           |   2 +-
 sound/drivers/vx/vx_cmd.c               |   2 +-
 sound/drivers/vx/vx_core.c              |  12 ++--
 sound/drivers/vx/vx_hwdep.c             |   2 +-
 sound/drivers/vx/vx_mixer.c             |   2 +-
 sound/hda/hdac_device.c                 |   4 +-
 sound/hda/hdmi_chmap.c                  |   2 +-
 sound/hda/intel-nhlt.c                  |   2 +-
 sound/isa/cmi8328.c                     |  24 +++----
 sound/isa/cmi8330.c                     |   8 +--
 sound/isa/cs423x/cs4236_lib.c           |   2 +-
 sound/isa/es1688/es1688.c               |   6 +-
 sound/isa/es1688/es1688_lib.c           |   4 +-
 sound/isa/es18xx.c                      |  10 +--
 sound/isa/gus/gus_io.c                  |   2 +-
 sound/isa/gus/gus_main.c                |   4 +-
 sound/isa/gus/gus_volume.c              |   9 +--
 sound/isa/gus/gusclassic.c              |   6 +-
 sound/isa/gus/gusextreme.c              |  10 +--
 sound/isa/gus/gusmax.c                  |   6 +-
 sound/isa/gus/interwave.c               |  10 +--
 sound/isa/opti9xx/miro.c                |  18 ++---
 sound/isa/opti9xx/opti92x-ad1848.c      |  18 ++---
 sound/isa/sb/emu8000.c                  |  16 ++---
 sound/isa/sb/jazz16.c                   |  10 +--
 sound/isa/sb/sb16.c                     |   8 +--
 sound/isa/sb/sb8.c                      |   2 +-
 sound/isa/sb/sb_mixer.c                 |  38 +++++-----
 sound/isa/sc6000.c                      |   4 +-
 sound/isa/wss/wss_lib.c                 |   6 +-
 sound/pci/ac97/ac97_codec.c             |  10 +--
 sound/pci/ac97/ac97_patch.c             |  26 +++----
 sound/pci/ac97/ac97_pcm.c               |   4 +-
 sound/pci/ak4531_codec.c                |   2 +-
 sound/pci/asihpi/asihpi.c               |   4 +-
 sound/pci/asihpi/hpimsgx.c              |   2 +-
 sound/pci/atiixp.c                      |   2 +-
 sound/pci/atiixp_modem.c                |   2 +-
 sound/pci/au88x0/au88x0_core.c          |   2 +-
 sound/pci/au88x0/au88x0_eq.c            |  22 +++---
 sound/pci/au88x0/au88x0_eqdata.c        |  18 ++---
 sound/pci/au88x0/au88x0_pcm.c           |   4 +-
 sound/pci/aw2/aw2-tsl.c                 |   4 +-
 sound/pci/azt3328.c                     |   2 +-
 sound/pci/ca0106/ca0106_main.c          |   4 +-
 sound/pci/ca0106/ca0106_mixer.c         |  14 ++--
 sound/pci/cmipci.c                      |   8 +--
 sound/pci/cs4281.c                      |   2 +-
 sound/pci/cs46xx/cs46xx_lib.c           |   2 +-
 sound/pci/cs46xx/dsp_spos.c             |   4 +-
 sound/pci/cs46xx/dsp_spos_scb_lib.c     |   6 +-
 sound/pci/ctxfi/ctdaio.c                |   4 +-
 sound/pci/ctxfi/ctresource.c            |   2 +-
 sound/pci/echoaudio/echoaudio.c         |   2 +-
 sound/pci/emu10k1/emu10k1_main.c        |  12 ++--
 sound/pci/emu10k1/emufx.c               |  14 ++--
 sound/pci/emu10k1/emumixer.c            |  28 ++++----
 sound/pci/emu10k1/emuproc.c             |  16 ++---
 sound/pci/emu10k1/io.c                  |   4 +-
 sound/pci/ens1370.c                     |   2 +-
 sound/pci/es1938.c                      |   8 ++-
 sound/pci/es1968.c                      |   4 +-
 sound/pci/fm801.c                       |   2 +-
 sound/pci/hda/hda_codec.c               |   6 +-
 sound/pci/hda/hda_eld.c                 |   6 +-
 sound/pci/hda/hda_intel.c               |   8 +--
 sound/pci/hda/hda_proc.c                |   2 +-
 sound/pci/hda/hda_sysfs.c               |   2 +-
 sound/pci/hda/patch_analog.c            |   2 +-
 sound/pci/hda/patch_ca0132.c            |  18 ++---
 sound/pci/hda/patch_realtek.c           | 118 ++++++++++++++++----------------
 sound/pci/ice1712/aureon.c              |   8 +--
 sound/pci/ice1712/juli.c                |   6 +-
 sound/pci/ice1712/maya44.c              |  10 +--
 sound/pci/ice1712/phase.c               |   4 +-
 sound/pci/ice1712/pontis.c              |   2 +-
 sound/pci/ice1712/prodigy192.c          |   2 +-
 sound/pci/ice1712/prodigy_hifi.c        |  16 ++---
 sound/pci/ice1712/psc724.c              |   2 +-
 sound/pci/ice1712/quartet.c             |   8 +--
 sound/pci/ice1712/se.c                  |   8 +--
 sound/pci/ice1712/vt1720_mobo.c         |   4 +-
 sound/pci/ice1712/wtm.c                 |   6 +-
 sound/pci/intel8x0.c                    |  28 ++++----
 sound/pci/intel8x0m.c                   |  12 ++--
 sound/pci/korg1212/korg1212.c           |   8 +--
 sound/pci/lx6464es/lx_core.c            |   4 +-
 sound/pci/mixart/mixart_hwdep.c         |   2 +-
 sound/pci/mixart/mixart_mixer.c         |   4 +-
 sound/pci/nm256/nm256.c                 |   4 +-
 sound/pci/nm256/nm256_coef.c            |   4 +-
 sound/pci/pcxhr/pcxhr.c                 |   2 +-
 sound/pci/pcxhr/pcxhr_core.c            |   6 +-
 sound/pci/pcxhr/pcxhr_hwdep.c           |   2 +-
 sound/pci/riptide/riptide.c             |  60 ++++++++--------
 sound/pci/rme9652/hdsp.c                |  14 ++--
 sound/pci/rme9652/hdspm.c               |  66 +++++++++---------
 sound/pci/rme9652/rme9652.c             |  10 +--
 sound/pci/via82xx.c                     |   2 +-
 sound/pci/vx222/vx222_ops.c             |   4 +-
 sound/pci/ymfpci/ymfpci_main.c          |   8 +--
 sound/pcmcia/pdaudiocf/pdaudiocf_core.c |   2 +-
 sound/pcmcia/vx/vxp_ops.c               |   2 +-
 sound/ppc/beep.c                        |   2 +-
 sound/ppc/pmac.c                        |   8 +--
 sound/ppc/pmac.h                        |   2 +-
 sound/ppc/tumbler.c                     |  20 +++---
 sound/ppc/tumbler_volume.h              |  12 ++--
 sound/sh/aica.c                         |   4 +-
 sound/sparc/cs4231.c                    |   4 +-
 sound/sparc/dbri.c                      |   2 +-
 sound/spi/at73c213.c                    |   2 +-
 sound/synth/emux/emux_nrpn.c            |   4 +-
 sound/synth/emux/emux_synth.c           |  10 +--
 sound/synth/emux/soundfont.c            |   8 +--
 sound/usb/bcd2000/bcd2000.c             |   4 +-
 sound/usb/caiaq/audio.c                 |   2 +-
 sound/usb/caiaq/control.c               |  20 +++---
 sound/usb/caiaq/input.c                 |  10 +--
 sound/usb/mixer.c                       |  60 ++++++++--------
 sound/usb/mixer_maps.c                  |  56 +++++++--------
 sound/usb/mixer_quirks.c                |   6 +-
 sound/usb/mixer_scarlett.c              |  14 ++--
 sound/usb/proc.c                        |   2 +-
 sound/usb/stream.c                      |   4 +-
 sound/usb/usx2y/usX2Yhwdep.c            |   2 +-
 sound/usb/usx2y/usbusx2yaudio.c         |   6 +-
 sound/usb/validate.c                    |   4 +-
 150 files changed, 677 insertions(+), 669 deletions(-)

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
