Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC3612F557
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:19:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EBB31700;
	Fri,  3 Jan 2020 09:19:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EBB31700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578039593;
	bh=pExOtetq09Zl+h2ITifLlOHWnSzod+4oEp6372TH9Go=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OP3C3VXaJAvCA99RW2wU7hDCfZUgRm4vseqNFn40AqZrLYLdL8syc2RosFBK+20VB
	 M/qf+fAyJGwg7hiOuF+3IcHGGO6MyBHTRxciNsv5lVri4fD0JAZlPwGYc5Y9q0DFof
	 1jYcWVCG2F4eJHtae7MtzaKcDCp5yQjLjrMwDZNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35197F802BC;
	Fri,  3 Jan 2020 09:17:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A73A8F802FB; Fri,  3 Jan 2020 09:17:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AA89F8015C
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AA89F8015C
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 87FFCACB8
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:19 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:16:16 +0100
Message-Id: <20200103081714.9560-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH 00/58] ALSA: Constifications
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

inspired by the recent fixes for constification, I took a look at the
whole tree and found that there are still a lot of remaining low
hanging fruits.  So here is the result -- const prefix is added where
possible and where necessary.

BTW, I haven't touched ASoC code as they are way too hot to play with
at this time.  They have different code patterns, so most of these
conversions don't apply in anyway, but there must be some other
missing gems, so if anyone wants, just go digging there.


thanks,

Takashi

===

Takashi Iwai (58):
  ALSA: pci: Constify snd_pcm_hardware definitions
  ALSA: usb: Constify snd_pcm_hardware definitions
  ALSA: core: Treat snd_device_ops as const
  ALSA: core: Constify snd_device_ops definitions
  ALSA: drivers: Constify snd_device_ops definitions
  ALSA: i2c: Constify snd_device_ops definitions
  ALSA: isa: Constify snd_device_ops definitions
  ALSA: hda: Constify snd_device_ops definitions
  ALSA: pci: Constify snd_device_ops definitions
  ALSA: usb: Constify snd_device_ops definitions
  ALSA: aoa: Constify snd_device_ops definitions
  ALSA: mips: Constify snd_device_ops definitions
  ALSA: parisc: Constify snd_device_ops definitions
  ALSA: pcmcia: Constify snd_device_ops definitions
  ALSA: ppc: Constify snd_device_ops definitions
  ALSA: sparc: Constify snd_device_ops definitions
  ALSA: sh: Constify snd_device_ops definitions
  ALSA: spi: Constify snd_device_ops definitions
  ALSA: docs: Constify snd_device_ops definitions
  ALSA: timer: Constify snd_timer_hardware definitions
  ALSA: Constify snd_timer_hardware definitions
  ALSA: ac97: Treat snd_ac97_bus_ops as const
  ALSA: ac97: Constify snd_ac97_bus_ops definitions
  ALSA: arm: Constify snd_ac97_bus_ops definitions
  ALSA: atmel: Constify snd_ac97_bus_ops definitions
  ALSA: drivers: Constify snd_ac97_bus_ops definitions
  ALSA: pci: Constify snd_ac97_bus_ops definitions
  ALSA: info: Make snd_info_entry_ops as const
  ALSA: seq: Constify struct snd_midi_op
  ALSA: vx: Constify snd_vx_hardware and snd_vx_ops definitions
  ALSA: mixer: oss: Constify snd_mixer_oss_assign_table definition
  ALSA: aoa: Constify snd_kcontrol_new items
  ALSA: drivers: Constify snd_kcontrol_new items
  ALSA: i2c: Constify snd_kcontrol_new items
  ALSA: isa: Constify snd_kcontrol_new items
  ALSA: hda: Constify snd_kcontrol_new items
  ALSA: pci: Constify snd_kcontrol_new items
  ALSA: ppc: Constify snd_kcontrol_new items
  ALSA: sparc: Constify snd_kcontrol_new items
  ALSA: spi: Constify snd_kcontrol_new items
  ALSA: usb: Constify snd_kcontrol_new items
  ALSA: parisc: Constify snd_kcontrol_new items
  ALSA: dummy: Constify snd_pcm_ops definitions
  ALSA: opl3: Constify snd_opl3_drum_voice definitions
  ALSA: ac97: Constify snd_ac97_res_table definition
  ALSA: ca0106: Constify snd_ca0106_category_str items
  ALSA: ca0106: Constify snd_ca0106_details
  ALSA: ice17xx: Constify snd_ice1712_card_info
  ALSA: ice1712: Constify wm-specific tables
  ALSA: line6: Constify snd_ratden definitions
  ALSA: usx2y: Constify struct snd_usb_audio_quirk entries
  ALSA: seq: oss: Constify snd_seq_oss_callback definitions
  ALSA: bt87x: Constify snd_bt87x_boards
  ALSA: emu10k1: Constify snd_emu_chip_details
  ALSA: es1968: Constify snd_es1968_tea575x_gpios
  ALSA: fm801: Constify snd_fm801_tea575x_gpios
  ALSA: hda: Constify snd_pci_quirk tables
  ALSA: pci: Constify snd_pci_quirk tables

 .../sound/kernel-api/writing-an-alsa-driver.rst    |  8 ++--
 include/sound/ac97_codec.h                         |  5 ++-
 include/sound/core.h                               |  4 +-
 include/sound/info.h                               |  2 +-
 include/sound/seq_midi_emul.h                      |  3 +-
 include/sound/vx_core.h                            |  9 ++--
 sound/ac97/snd_ac97_compat.c                       |  2 +-
 sound/ac97_bus.c                                   |  2 +-
 sound/aoa/aoa.h                                    |  2 +-
 sound/aoa/codecs/onyx.c                            |  4 +-
 sound/aoa/codecs/tas.c                             |  4 +-
 sound/aoa/codecs/toonie.c                          |  2 +-
 sound/aoa/core/alsa.c                              |  2 +-
 sound/aoa/fabrics/layout.c                         |  2 +-
 sound/arm/aaci.c                                   |  2 +-
 sound/arm/pxa2xx-ac97.c                            |  2 +-
 sound/atmel/ac97c.c                                |  2 +-
 sound/core/compress_offload.c                      |  2 +-
 sound/core/control.c                               |  2 +-
 sound/core/device.c                                |  2 +-
 sound/core/hwdep.c                                 |  2 +-
 sound/core/jack.c                                  |  2 +-
 sound/core/oss/mixer_oss.c                         | 14 +++---
 sound/core/pcm.c                                   |  4 +-
 sound/core/pcm_timer.c                             |  2 +-
 sound/core/rawmidi.c                               |  2 +-
 sound/core/seq/seq_midi_emul.c                     | 37 +++++++++-------
 sound/core/seq_device.c                            |  2 +-
 sound/core/timer.c                                 |  4 +-
 sound/drivers/aloop.c                              |  2 +-
 sound/drivers/dummy.c                              |  8 ++--
 sound/drivers/ml403-ac97cr.c                       |  4 +-
 sound/drivers/mts64.c                              | 14 +++---
 sound/drivers/opl3/opl3_drums.c                    | 26 +++++------
 sound/drivers/opl3/opl3_lib.c                      |  6 +--
 sound/drivers/opl3/opl3_oss.c                      |  2 +-
 sound/drivers/opl3/opl3_seq.c                      |  2 +-
 sound/drivers/opl3/opl3_voice.h                    |  2 +-
 sound/drivers/opl4/opl4_lib.c                      |  2 +-
 sound/drivers/opl4/opl4_mixer.c                    |  2 +-
 sound/drivers/opl4/opl4_proc.c                     |  2 +-
 sound/drivers/opl4/opl4_seq.c                      |  2 +-
 sound/drivers/pcsp/pcsp.c                          |  2 +-
 sound/drivers/pcsp/pcsp_mixer.c                    |  6 +--
 sound/drivers/serial-u16550.c                      |  2 +-
 sound/drivers/vx/vx_core.c                         |  5 ++-
 sound/i2c/cs8427.c                                 |  2 +-
 sound/i2c/i2c.c                                    |  2 +-
 sound/i2c/other/ak4113.c                           |  4 +-
 sound/i2c/other/ak4114.c                           |  4 +-
 sound/i2c/other/ak4117.c                           |  4 +-
 sound/i2c/tea6330t.c                               |  4 +-
 sound/isa/ad1816a/ad1816a_lib.c                    |  4 +-
 sound/isa/cmi8330.c                                |  2 +-
 sound/isa/cs423x/cs4236_lib.c                      | 14 +++---
 sound/isa/es1688/es1688_lib.c                      |  4 +-
 sound/isa/es18xx.c                                 | 28 ++++++------
 sound/isa/gus/gus_main.c                           |  2 +-
 sound/isa/gus/gus_mem_proc.c                       |  2 +-
 sound/isa/gus/gus_mixer.c                          |  4 +-
 sound/isa/gus/gus_timer.c                          |  4 +-
 sound/isa/msnd/msnd_pinnacle.c                     |  2 +-
 sound/isa/msnd/msnd_pinnacle_mixer.c               |  2 +-
 sound/isa/opl3sa2.c                                |  4 +-
 sound/isa/opti9xx/miro.c                           | 14 +++---
 sound/isa/opti9xx/opti92x-ad1848.c                 |  2 +-
 sound/isa/sb/emu8000.c                             | 16 +++----
 sound/isa/sb/sb_common.c                           |  2 +-
 sound/isa/sb/sb_mixer.c                            |  2 +-
 sound/isa/wss/wss_lib.c                            |  6 +--
 sound/mips/hal2.c                                  |  2 +-
 sound/mips/sgio2audio.c                            |  2 +-
 sound/parisc/harmony.c                             |  4 +-
 sound/pci/ac97/ac97_codec.c                        |  7 +--
 sound/pci/ac97/ac97_patch.c                        |  2 +-
 sound/pci/ad1889.c                                 |  4 +-
 sound/pci/ak4531_codec.c                           |  4 +-
 sound/pci/ali5451/ali5451.c                        | 14 +++---
 sound/pci/als300.c                                 |  4 +-
 sound/pci/atiixp.c                                 |  6 +--
 sound/pci/atiixp_modem.c                           |  4 +-
 sound/pci/au88x0/au88x0.c                          |  2 +-
 sound/pci/au88x0/au88x0_mixer.c                    |  2 +-
 sound/pci/au88x0/au88x0_pcm.c                      |  2 +-
 sound/pci/aw2/aw2-alsa.c                           |  2 +-
 sound/pci/azt3328.c                                |  6 +--
 sound/pci/bt87x.c                                  |  4 +-
 sound/pci/ca0106/ca0106.h                          |  2 +-
 sound/pci/ca0106/ca0106_main.c                     | 10 ++---
 sound/pci/ca0106/ca0106_mixer.c                    |  6 +--
 sound/pci/ca0106/ca0106_proc.c                     |  2 +-
 sound/pci/cmipci.c                                 | 18 ++++----
 sound/pci/cs4281.c                                 |  8 ++--
 sound/pci/cs46xx/cs46xx_lib.c                      | 10 ++---
 sound/pci/cs5530.c                                 |  2 +-
 sound/pci/cs5535audio/cs5535audio.c                |  4 +-
 sound/pci/cs5535audio/cs5535audio_olpc.c           |  2 +-
 sound/pci/ctxfi/ctatc.c                            |  6 +--
 sound/pci/echoaudio/darla20.c                      |  2 +-
 sound/pci/echoaudio/darla24.c                      |  2 +-
 sound/pci/echoaudio/echo3g.c                       |  2 +-
 sound/pci/echoaudio/echoaudio.c                    |  2 +-
 sound/pci/echoaudio/gina20.c                       |  2 +-
 sound/pci/echoaudio/gina24.c                       |  2 +-
 sound/pci/echoaudio/indigo.c                       |  2 +-
 sound/pci/echoaudio/indigodj.c                     |  2 +-
 sound/pci/echoaudio/indigodjx.c                    |  2 +-
 sound/pci/echoaudio/indigoio.c                     |  2 +-
 sound/pci/echoaudio/indigoiox.c                    |  2 +-
 sound/pci/echoaudio/layla20.c                      |  2 +-
 sound/pci/echoaudio/layla24.c                      |  2 +-
 sound/pci/echoaudio/mia.c                          |  2 +-
 sound/pci/echoaudio/mona.c                         |  2 +-
 sound/pci/emu10k1/emu10k1_main.c                   |  4 +-
 sound/pci/emu10k1/emu10k1x.c                       |  4 +-
 sound/pci/emu10k1/emumixer.c                       | 16 +++----
 sound/pci/emu10k1/emuproc.c                        |  2 +-
 sound/pci/emu10k1/p16v.c                           |  2 +-
 sound/pci/emu10k1/timer.c                          |  2 +-
 sound/pci/ens1370.c                                | 16 +++----
 sound/pci/es1938.c                                 |  4 +-
 sound/pci/es1968.c                                 |  6 +--
 sound/pci/fm801.c                                  | 10 ++---
 sound/pci/hda/hda_beep.c                           |  2 +-
 sound/pci/hda/hda_codec.c                          | 10 ++---
 sound/pci/hda/hda_intel.c                          | 10 ++---
 sound/pci/hda/hda_tegra.c                          |  2 +-
 sound/pci/hda/patch_sigmatel.c                     |  6 +--
 sound/pci/ice1712/aureon.c                         | 10 ++---
 sound/pci/ice1712/delta.c                          | 10 ++---
 sound/pci/ice1712/ews.c                            |  6 +--
 sound/pci/ice1712/ice1712.c                        | 14 +++---
 sound/pci/ice1712/ice1712.h                        |  2 +-
 sound/pci/ice1712/ice1724.c                        | 16 +++----
 sound/pci/ice1712/juli.c                           |  2 +-
 sound/pci/ice1712/maya44.c                         |  2 +-
 sound/pci/ice1712/phase.c                          |  4 +-
 sound/pci/ice1712/pontis.c                         |  2 +-
 sound/pci/ice1712/prodigy192.c                     |  4 +-
 sound/pci/ice1712/prodigy_hifi.c                   |  4 +-
 sound/pci/ice1712/quartet.c                        |  2 +-
 sound/pci/ice1712/wm8766.c                         |  2 +-
 sound/pci/ice1712/wm8776.c                         |  2 +-
 sound/pci/ice1712/wtm.c                            |  2 +-
 sound/pci/intel8x0.c                               | 14 +++---
 sound/pci/intel8x0m.c                              |  4 +-
 sound/pci/korg1212/korg1212.c                      |  4 +-
 sound/pci/lola/lola.c                              |  2 +-
 sound/pci/lx6464es/lx6464es.c                      |  2 +-
 sound/pci/maestro3.c                               | 12 +++---
 sound/pci/mixart/mixart.c                          |  6 +--
 sound/pci/nm256/nm256.c                            | 12 +++---
 sound/pci/pcxhr/pcxhr.c                            |  2 +-
 sound/pci/riptide/riptide.c                        |  4 +-
 sound/pci/rme32.c                                  |  2 +-
 sound/pci/rme96.c                                  |  2 +-
 sound/pci/rme9652/hdsp.c                           |  8 ++--
 sound/pci/rme9652/hdspm.c                          | 18 ++++----
 sound/pci/rme9652/rme9652.c                        |  6 +--
 sound/pci/sis7019.c                                |  4 +-
 sound/pci/sonicvibes.c                             |  8 ++--
 sound/pci/trident/trident_main.c                   |  4 +-
 sound/pci/via82xx.c                                |  6 +--
 sound/pci/via82xx_modem.c                          |  4 +-
 sound/pci/vx222/vx222.c                            | 14 +++---
 sound/pci/vx222/vx222.h                            |  4 +-
 sound/pci/vx222/vx222_ops.c                        |  4 +-
 sound/pci/ymfpci/ymfpci_main.c                     |  8 ++--
 sound/pcmcia/pdaudiocf/pdaudiocf.c                 |  2 +-
 sound/pcmcia/vx/vxp_ops.c                          |  2 +-
 sound/pcmcia/vx/vxpocket.c                         |  6 +--
 sound/pcmcia/vx/vxpocket.h                         |  2 +-
 sound/ppc/awacs.c                                  | 50 +++++++++++-----------
 sound/ppc/burgundy.c                               | 20 ++++-----
 sound/ppc/daca.c                                   |  2 +-
 sound/ppc/pmac.c                                   |  4 +-
 sound/ppc/snd_ps3.c                                |  2 +-
 sound/ppc/tumbler.c                                |  4 +-
 sound/sh/sh_dac_audio.c                            |  2 +-
 sound/sparc/amd7930.c                              |  4 +-
 sound/sparc/cs4231.c                               |  8 ++--
 sound/sparc/dbri.c                                 |  2 +-
 sound/spi/at73c213.c                               |  4 +-
 sound/synth/emux/emux_oss.c                        |  2 +-
 sound/synth/emux/emux_seq.c                        |  2 +-
 sound/usb/6fire/control.c                          |  8 ++--
 sound/usb/caiaq/audio.c                            |  2 +-
 sound/usb/line6/pod.c                              |  2 +-
 sound/usb/line6/podhd.c                            |  2 +-
 sound/usb/line6/toneport.c                         |  2 +-
 sound/usb/mixer.c                                  |  8 ++--
 sound/usb/mixer.h                                  |  2 +-
 sound/usb/mixer_quirks.c                           | 16 +++----
 sound/usb/mixer_us16x08.c                          | 38 ++++++++--------
 sound/usb/mixer_us16x08.h                          |  2 +-
 sound/usb/usx2y/us122l.c                           |  8 ++--
 sound/usb/usx2y/usX2Yhwdep.c                       | 10 ++---
 sound/usb/usx2y/usbusx2yaudio.c                    |  2 +-
 sound/usb/usx2y/usx2yhwdeppcm.c                    |  2 +-
 199 files changed, 548 insertions(+), 534 deletions(-)

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
