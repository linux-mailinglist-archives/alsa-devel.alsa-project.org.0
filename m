Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC58D39F87B
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:09:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 720DC16F5;
	Tue,  8 Jun 2021 16:08:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 720DC16F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161375;
	bh=G+FCNRnJP+8qEJJ/Vt6JevOMn4Ts++gf02ORk+w6Aq4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EV90tBib8T/lIc3xBiDQGOdJ7F8ZUWvMzvtvzyB3oDc0SILIj1fLfaErRBcYvjUEd
	 3klPvbiF09vcpn0eiC94fexhvMWbgicYByL220nVAZAeXCPIt9N0mPe1bLTfni6MYs
	 mEfJ9u/grHNyALuCG5DZByuLNPJ7Frm/yebZ6oN4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B7A7F80256;
	Tue,  8 Jun 2021 16:06:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB99CF8053B; Tue,  8 Jun 2021 16:06:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBC8AF801EC
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBC8AF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="uDXnM9YW"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="aMh7SlLe"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 7909B1FD33
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wstNOl7sThf1toD1FurcZzIp7jAtWDCzDCqLR3tri74=;
 b=uDXnM9YWf+5M0jo3o5UX+rgOuxR3o7SS7ansktSj8YQqRPlQ9j1zrBBY+rpbs9B+mgbv/C
 CnXK28H3QGNJ8W51SW8pp4PFvjGJe4wqaMchkgBQvO8PftPVNayN0HaYm6LDji38nfWLhN
 GuqYz3Th3p0GQYC3v6acCdwuwE0htwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161142;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wstNOl7sThf1toD1FurcZzIp7jAtWDCzDCqLR3tri74=;
 b=aMh7SlLet45wd16UHe/TrdSrM1xpFLOggPd2xGCtDuj8jY1hrMmSGch4r9Ckn3yEFdRgVN
 v4hrC9kV/cZXX5Cw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 680DAA3B83;
 Tue,  8 Jun 2021 14:05:42 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/66] ALSA: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:04:34 +0200
Message-Id: <20210608140540.17885-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,

here is a largish patch set mostly for cleanup / a slight refactoring
of the coding styles with assignment in if condition, typically such
as:
	if ((err = xxx()) < 0)
		return err;

This was a popular style in the old ages, but nowadays it's seen
rather fairly harmful as it makes harder to read and easily hides
bugs.  Since we've hit quite a few issues (although most of them are
trivial), I decided to fix those lines.

While conversions, I spotted a couple of real bugs.  They are old
driver codes and only in certain error paths, so most likely no one
ever hits it.


Takashi

===

Takashi Iwai (66):
  ALSA: sb: Fix assignment in if condition
  ALSA: sb: Minor coding style fixes
  ALSA: sb: Fix potential double-free of CSP mixer elements
  ALSA: gus: Fix assignment in if condition
  ALSA: ad1816a: Fix assignment in if condition
  ALSA: wavefront: Fix assignment in if condition
  ALSA: cs423x:  Fix assignment in if condition
  ALSA: opti9xx: Fix assignment in if condition
  ALSA: opl3sa2: Fix assignment in if condition
  ALSA: es18xx: Fix assignment in if condition
  ALSA: cmi8330: Fix assignment in if condition
  ALSA: als100: Fix assignment in if condition
  ALSA: azt2320: Fix assignment in if condition
  ALSA: isa: Fix assignment in if condition
  ALSA: ad1889: Fix assignment in if condition
  ALSA: ak4531: Fix assignment in if condition
  ALSA: als300: Fix assignment in if condition
  ALSA: als4000: Fix assignment in if condition
  ALSA: atiixp: Fix assignment in if condition
  ALSA: azt3328: Fix assignment in if condition
  ALSA: bt87x: Fix assignment in if condition
  ALSA: cmipci: Fix assignment in if condition
  ALSA: cs4281: Fix assignment in if condition
  ALSA: ens137x: Fix assignment in if condition
  ALSA: es1938: Fix assignment in if condition
  ALSA: es1968: Fix assignment in if condition
  ALSA: fm801: Fix assignment in if condition
  ALSA: intel8x0: Fix assignment in if condition
  ALSA: maestro3: Fix assignment in if condition
  ALSA: rme32: Fix assignment in if condition
  ALSA: rme96: Fix assignment in if condition
  ALSA: sonicvibes: Fix assignment in if condition
  ALSA: via82xx: Fix assignment in if condition
  ALSA: ac97: Fix assignment in if condition
  ALSA: au88x0: Fix assignment in if condition
  ALSA: ca0106: Fix assignment in if condition
  ALSA: cs46xx: Fix assignment in if condition
  ALSA: cs5535audio: Fix assignment in if condition
  ALSA: echoaudio: Fix assignment in if condition
  ALSA: emu10k1: Fix assignment in if condition
  ALSA: emu10k1x: Fix assignment in if condition
  ALSA: ice1712: Fix assignment in if condition
  ALSA: korg1212: Fix assignment in if condition
  ALSA: mixart: Fix assignment in if condition
  ALSA: nm256: Fix assignment in if condition
  ALSA: pcxhr: Fix assignment in if condition
  ALSA: riptide: Fix assignment in if condition
  ALSA: hdsp: Fix assignment in if condition
  ALSA: rme9652: Fix assignment in if condition
  ALSA: trident: Fix assignment in if condition
  ALSA: vx222: Fix assignment in if condition
  ALSA: ymfpci: Fix assignment in if condition
  ALSA: core: Fix assignment in if condition
  ALSA: pcm: Fix assignment in if condition
  ALSA: oss: Fix assignment in if condition
  ALSA: seq: Fix assignment in if condition
  ALSA: pcmcia: Fix assignment in if condition
  ALSA: sparc: Fix assignment in if condition
  ALSA: mpu401: Fix assignment in if condition
  ALSA: vx: Fix assignment in if condition
  ALSA: opl3: Fix assignment in if condition
  ALSA: serial: Fix assignment in if condition
  ALSA: synth: Fix assignment in if condition
  ALSA: poewrmac: Fix assignment in if condition
  ALSA: i2c: Fix assignment in if condition
  ALSA: parisc: Fix assignment in if condition

 sound/core/hwdep.c                      |   6 +-
 sound/core/info_oss.c                   |   3 +-
 sound/core/init.c                       |  12 +-
 sound/core/oss/mixer_oss.c              |  45 +++--
 sound/core/oss/pcm_oss.c                |  70 +++++---
 sound/core/oss/pcm_plugin.c             |  26 +--
 sound/core/pcm_compat.c                 |   6 +-
 sound/core/pcm_misc.c                   |  12 +-
 sound/core/pcm_native.c                 |   6 +-
 sound/core/seq/oss/seq_oss.c            |  26 +--
 sound/core/seq/oss/seq_oss_init.c       |   9 +-
 sound/core/seq/oss/seq_oss_midi.c       |  33 ++--
 sound/core/seq/oss/seq_oss_rw.c         |   3 +-
 sound/core/seq/oss/seq_oss_synth.c      |   9 +-
 sound/core/seq/oss/seq_oss_writeq.c     |   3 +-
 sound/core/seq/seq_clientmgr.c          |  51 ++++--
 sound/core/seq/seq_dummy.c              |   3 +-
 sound/core/seq/seq_fifo.c               |   3 +-
 sound/core/seq/seq_memory.c             |   6 +-
 sound/core/seq/seq_midi.c               |  27 +--
 sound/core/seq/seq_queue.c              |  21 ++-
 sound/core/seq/seq_virmidi.c            |   9 +-
 sound/core/sound.c                      |   3 +-
 sound/core/sound_oss.c                  |   3 +-
 sound/drivers/mpu401/mpu401.c           |   9 +-
 sound/drivers/mpu401/mpu401_uart.c      |  19 +-
 sound/drivers/mtpav.c                   |  15 +-
 sound/drivers/mts64.c                   |  15 +-
 sound/drivers/opl3/opl3_lib.c           |  42 +++--
 sound/drivers/opl3/opl3_oss.c           |   6 +-
 sound/drivers/opl3/opl3_seq.c           |   9 +-
 sound/drivers/portman2x4.c              |  15 +-
 sound/drivers/serial-u16550.c           |  27 +--
 sound/drivers/vx/vx_core.c              |  60 ++++---
 sound/drivers/vx/vx_hwdep.c             |  12 +-
 sound/drivers/vx/vx_mixer.c             |  39 +++--
 sound/drivers/vx/vx_pcm.c               |  32 ++--
 sound/i2c/cs8427.c                      |  24 ++-
 sound/i2c/other/ak4114.c                |   3 +-
 sound/i2c/other/ak4117.c                |   3 +-
 sound/i2c/tea6330t.c                    |  24 ++-
 sound/isa/ad1816a/ad1816a.c             |  23 ++-
 sound/isa/ad1816a/ad1816a_lib.c         |  27 ++-
 sound/isa/als100.c                      |  18 +-
 sound/isa/azt2320.c                     |  21 ++-
 sound/isa/cmi8330.c                     |  37 ++--
 sound/isa/cs423x/cs4236.c               |  21 ++-
 sound/isa/cs423x/cs4236_lib.c           |  12 +-
 sound/isa/es1688/es1688_lib.c           |   3 +-
 sound/isa/es18xx.c                      |  51 ++++--
 sound/isa/gus/gus_main.c                |  18 +-
 sound/isa/gus/gus_mem.c                 |   3 +-
 sound/isa/gus/gus_mixer.c               |   6 +-
 sound/isa/gus/gus_pcm.c                 |  23 ++-
 sound/isa/gus/gus_uart.c                |   3 +-
 sound/isa/gus/gusclassic.c              |   6 +-
 sound/isa/gus/gusextreme.c              |   6 +-
 sound/isa/gus/gusmax.c                  |  36 ++--
 sound/isa/gus/interwave.c               |  90 ++++++----
 sound/isa/opl3sa2.c                     |  68 +++++---
 sound/isa/opti9xx/miro.c                |  27 ++-
 sound/isa/opti9xx/opti92x-ad1848.c      |  27 ++-
 sound/isa/sb/emu8000.c                  |  21 ++-
 sound/isa/sb/emu8000_patch.c            |   3 +-
 sound/isa/sb/emu8000_pcm.c              |   6 +-
 sound/isa/sb/sb16.c                     |  65 ++++---
 sound/isa/sb/sb16_csp.c                 |  29 ++--
 sound/isa/sb/sb16_main.c                |   6 +-
 sound/isa/sb/sb8.c                      |  38 ++--
 sound/isa/sb/sb8_main.c                 |   3 +-
 sound/isa/sb/sb8_midi.c                 |   3 +-
 sound/isa/sb/sb_common.c                |   9 +-
 sound/isa/sb/sb_mixer.c                 |  55 +++---
 sound/isa/wavefront/wavefront.c         |   6 +-
 sound/isa/wavefront/wavefront_midi.c    |  20 ++-
 sound/isa/wavefront/wavefront_synth.c   |  56 +++---
 sound/isa/wss/wss_lib.c                 |   9 +-
 sound/parisc/harmony.c                  |   7 +-
 sound/pci/ac97/ac97_codec.c             | 205 ++++++++++++++--------
 sound/pci/ac97/ac97_patch.c             | 137 ++++++++++-----
 sound/pci/ad1889.c                      |  15 +-
 sound/pci/ak4531_codec.c                |   9 +-
 sound/pci/als300.c                      |  22 ++-
 sound/pci/als4000.c                     |  55 +++---
 sound/pci/atiixp.c                      |  33 ++--
 sound/pci/atiixp_modem.c                |  40 +++--
 sound/pci/au88x0/au88x0.c               |  77 +++++----
 sound/pci/au88x0/au88x0_a3d.c           |  28 +--
 sound/pci/au88x0/au88x0_core.c          |  47 ++---
 sound/pci/au88x0/au88x0_eq.c            |  20 ++-
 sound/pci/au88x0/au88x0_mixer.c         |   3 +-
 sound/pci/au88x0/au88x0_mpu401.c        |  14 +-
 sound/pci/au88x0/au88x0_pcm.c           |  15 +-
 sound/pci/azt3328.c                     |   3 +-
 sound/pci/bt87x.c                       |   3 +-
 sound/pci/ca0106/ca0106_main.c          |  18 +-
 sound/pci/ca0106/ca_midi.c              |   3 +-
 sound/pci/cmipci.c                      |  83 ++++++---
 sound/pci/cs4281.c                      |  54 ++++--
 sound/pci/cs46xx/cs46xx.c               |  31 ++--
 sound/pci/cs46xx/cs46xx_lib.c           |  51 ++++--
 sound/pci/cs46xx/dsp_spos.c             |   3 +-
 sound/pci/cs5535audio/cs5535audio.c     |  28 +--
 sound/pci/cs5535audio/cs5535audio_pcm.c |  10 +-
 sound/pci/echoaudio/darla20_dsp.c       |   6 +-
 sound/pci/echoaudio/darla24_dsp.c       |   6 +-
 sound/pci/echoaudio/echo3g_dsp.c        |   3 +-
 sound/pci/echoaudio/echoaudio.c         | 220 ++++++++++++++----------
 sound/pci/echoaudio/echoaudio_dsp.c     |  12 +-
 sound/pci/echoaudio/echoaudio_gml.c     |   3 +-
 sound/pci/echoaudio/gina20_dsp.c        |   6 +-
 sound/pci/echoaudio/gina24_dsp.c        |   6 +-
 sound/pci/echoaudio/indigo_dsp.c        |   6 +-
 sound/pci/echoaudio/indigodj_dsp.c      |   6 +-
 sound/pci/echoaudio/indigoio_dsp.c      |   6 +-
 sound/pci/echoaudio/layla20_dsp.c       |   6 +-
 sound/pci/echoaudio/layla24_dsp.c       |   9 +-
 sound/pci/echoaudio/mia_dsp.c           |   6 +-
 sound/pci/echoaudio/midi.c              |   4 +-
 sound/pci/echoaudio/mona_dsp.c          |   6 +-
 sound/pci/emu10k1/emu10k1.c             |  42 +++--
 sound/pci/emu10k1/emu10k1_callback.c    |   3 +-
 sound/pci/emu10k1/emu10k1x.c            |  85 +++++----
 sound/pci/emu10k1/emufx.c               |  13 +-
 sound/pci/emu10k1/emumixer.c            |  78 ++++++---
 sound/pci/emu10k1/emumpu401.c           |  12 +-
 sound/pci/emu10k1/emupcm.c              |  24 ++-
 sound/pci/emu10k1/memory.c              |  21 ++-
 sound/pci/emu10k1/p16v.c                |  13 +-
 sound/pci/emu10k1/timer.c               |   3 +-
 sound/pci/ens1370.c                     |  45 +++--
 sound/pci/es1938.c                      |  42 +++--
 sound/pci/es1968.c                      |  75 ++++----
 sound/pci/fm801.c                       |  63 ++++---
 sound/pci/ice1712/delta.c               |   6 +-
 sound/pci/ice1712/ews.c                 |  24 ++-
 sound/pci/intel8x0.c                    |  46 +++--
 sound/pci/intel8x0m.c                   |  36 ++--
 sound/pci/korg1212/korg1212.c           |  24 ++-
 sound/pci/maestro3.c                    |  21 ++-
 sound/pci/mixart/mixart.c               |  29 ++--
 sound/pci/mixart/mixart_hwdep.c         |  17 +-
 sound/pci/mixart/mixart_mixer.c         |  33 ++--
 sound/pci/nm256/nm256.c                 |  27 ++-
 sound/pci/pcxhr/pcxhr.c                 |  22 ++-
 sound/pci/pcxhr/pcxhr_hwdep.c           |   9 +-
 sound/pci/riptide/riptide.c             |  88 ++++++----
 sound/pci/rme32.c                       |  76 +++++---
 sound/pci/rme96.c                       | 148 +++++++++-------
 sound/pci/rme9652/hdsp.c                | 121 ++++++++-----
 sound/pci/rme9652/rme9652.c             |  98 ++++++-----
 sound/pci/sonicvibes.c                  |  67 +++++---
 sound/pci/trident/trident.c             |  41 +++--
 sound/pci/trident/trident_main.c        |  84 ++++++---
 sound/pci/via82xx.c                     |  78 ++++++---
 sound/pci/via82xx_modem.c               |  52 ++++--
 sound/pci/vx222/vx222.c                 |  18 +-
 sound/pci/vx222/vx222_ops.c             |  12 +-
 sound/pci/ymfpci/ymfpci.c               |  71 ++++----
 sound/pci/ymfpci/ymfpci_main.c          |  72 +++++---
 sound/pcmcia/pdaudiocf/pdaudiocf.c      |   3 +-
 sound/pcmcia/vx/vxp_mixer.c             |   6 +-
 sound/pcmcia/vx/vxp_ops.c               |   6 +-
 sound/pcmcia/vx/vxpocket.c              |   3 +-
 sound/ppc/beep.c                        |   5 +-
 sound/ppc/daca.c                        |  24 ++-
 sound/ppc/keywest.c                     |   6 +-
 sound/ppc/pmac.c                        |   6 +-
 sound/ppc/powermac.c                    |  21 ++-
 sound/ppc/tumbler.c                     |  72 +++++---
 sound/sparc/amd7930.c                   |  14 +-
 sound/sparc/cs4231.c                    |  10 +-
 sound/sparc/dbri.c                      |  11 +-
 sound/synth/emux/emux.c                 |   3 +-
 sound/synth/emux/emux_effect.c          |  13 +-
 sound/synth/emux/emux_hwdep.c           |   6 +-
 sound/synth/emux/soundfont.c            |  40 +++--
 177 files changed, 3186 insertions(+), 1831 deletions(-)

-- 
2.26.2

