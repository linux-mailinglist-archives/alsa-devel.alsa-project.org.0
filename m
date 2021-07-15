Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C48073C9A09
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:01:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BDCC16A5;
	Thu, 15 Jul 2021 10:00:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BDCC16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626336108;
	bh=KdMDA04i58xqH9+nMb/+i7+whRtocBKnq8xJEr5lqXw=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jvtHYovGyIB5JYYdYK0yFq0UMpR55ZsmAIaUw8J4K81vpiAVXBpbPx7pYPlTn3E6g
	 UTIGKXIG7pwJj6gVnF8Ttb6zYq5us6WLmcsE0DFSeLexmXHdGcn+VNbdLyaRCOoUiE
	 D1mq7nSZiXmCBUl6uzvV4YRjl0zmVfx3qmccgS5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34907F80511;
	Thu, 15 Jul 2021 10:00:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5693CF804E7; Thu, 15 Jul 2021 10:00:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 619F1F80095
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 09:59:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 619F1F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="ewGqFlTt"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="MX2NpELC"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id AFAA61FDE5
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 07:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626335989; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0qO6XZVW0xYj6ZNWftNm0/gqq1yfnbCj0FVjMzXGjjM=;
 b=ewGqFlTtAJFcZmLRBLvFRELSFvb0Je1JYgNapQRqQ8MU1lwrQ7Pv/CV7cyby4GREfPmJT3
 HxDMn6Kbxv0Xqw8zIVPIvWhlDOTAh4D7VmdrM1lyrEvHKBIQDyWJnQX6sYaWpahk5Oa9qp
 90aYHUkD6KgGnUxWOqKu8uLTxUEUDFo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626335989;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0qO6XZVW0xYj6ZNWftNm0/gqq1yfnbCj0FVjMzXGjjM=;
 b=MX2NpELCFucGc5dgWQwp1BKSH1zKv2sbtBapOS96lXoTIXCWdgfgVtCLouz3JaE6xC8/ie
 AW2a6LYVjIbHXtCg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 9D0C5A3B9A;
 Thu, 15 Jul 2021 07:59:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 00/79] ALSA: More devres usages
Date: Thu, 15 Jul 2021 09:58:22 +0200
Message-Id: <20210715075941.23332-1-tiwai@suse.de>
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

this is a v2 patch series for adapting more devres usages in ALSA
drivers, a resurrect of my early RFC patch with the fix and applying
to more drivers.  The main purpose is merely the code cleanup over the
tree by replacing the resource allocations with devres helpers as much
as possible.

The only major change is the addition of devres-supported card object
handling snd_devm_card_new() and the page allocation helper
snd_devm_alloc_pages().  Those allow us to get rid of the remove
callback completely in many drivers.  In the end, the series resulted
in a significant amount of code reduction.

Now ISA drivers and a few other drivers have been covered as
well as a couple of missing PCI drivers and fixes.


Takashi

===

v1->v2:
* Rearrange patch order
* Use size_t in snd_devm_card_new()
* Move card->releasing check into devres release
* Most of ISA drivers are included
* A few platform drivers included
* Fixed missing initializations, etc in a few drivers.

Takashi Iwai (79):
  ALSA: core: Add device-managed page allocator helper
  ALSA: core: Add managed card creation
  ALSA: core: Add device-managed request_dma()
  ALSA: doc: Add device-managed resource section
  ALSA: intel8x0: Allocate resources with device-managed APIs
  ALSA: atiixp: Allocate resources with device-managed APIs
  ALSA: hda: Allocate resources with device-managed APIs
  ALSA: ad1889: Allocate resources with device-managed APIs
  ALSA: als300: Allocate resources with device-managed APIs
  ALSA: als4000: Allocate resources with device-managed APIs
  ALSA: azt3328: Allocate resources with device-managed APIs
  ALSA: bt87x: Allocate resources with device-managed APIs
  ALSA: cmipci: Allocate resources with device-managed APIs
  ALSA: cs4281: Allocate resources with device-managed APIs
  ALSA: cs5530: Allocate resources with device-managed APIs
  ALSA: ens137x: Allocate resources with device-managed APIs
  ALSA: es1938: Allocate resources with device-managed APIs
  ALSA: es1968: Allocate resources with device-managed APIs
  ALSA: fm801: Allocate resources with device-managed APIs
  ALSA: maestro3: Allocate resources with device-managed APIs
  ALSA: rme32: Allocate resources with device-managed APIs
  ALSA: rme96: Allocate resources with device-managed APIs
  ALSA: sis7019: Allocate resources with device-managed APIs
  ALSA: sonicvibes: Allocate resources with device-managed APIs
  ALSA: via82xx: Allocate resources with device-managed APIs
  ALSA: ali5451: Allocate resources with device-managed APIs
  ALSA: au88x0: Allocate resources with device-managed APIs
  ALSA: aw2: Allocate resources with device-managed APIs
  ALSA: ca0106: Allocate resources with device-managed APIs
  ALSA: cs46xx: Allocate resources with device-managed APIs
  ALSA: cs5535audio: Allocate resources with device-managed APIs
  ALSA: echoaudio: Allocate resources with device-managed APIs
  ALSA: emu10k1: Allocate resources with device-managed APIs
  ALSA: emu10k1x: Allocate resources with device-managed APIs
  ALSA: ice1712: Allocate resources with device-managed APIs
  ALSA: ice1724: Allocate resources with device-managed APIs
  ALSA: ali5451: Allocate resources with device-managed APIs
  ALSA: ice1724: Allocate resources with device-managed APIs
  ALSA: korg1212: Allocate resources with device-managed APIs
  ALSA: lola: Allocate resources with device-managed APIs
  ALSA: lx6464es: Allocate resources with device-managed APIs
  ALSA: nm256: Allocate resources with device-managed APIs
  ALSA: oxygen: Allocate resources with device-managed APIs
  ALSA: riptide: Allocate resources with device-managed APIs
  ALSA: hdsp: Allocate resources with device-managed APIs
  ALSA: hdspm: Allocate resources with device-managed APIs
  ALSA: rme9652: Allocate resources with device-managed APIs
  ALSA: trident: Allocate resources with device-managed APIs
  ALSA: vx: Manage vx_core object with devres
  ALSA: vx222: Allocate resources with device-managed APIs
  ALSA: ymfpci: Allocate resources with device-managed APIs
  ALSA: ad1816a: Allocate resources with device-managed APIs
  ALSA: wss: Allocate resources with device-managed APIs
  ALSA: sb: Allocate resources with device-managed APIs
  ALSA: ad1848: Allocate resources with device-managed APIs
  ALSA: adlib: Allocate resources with device-managed APIs
  ALSA: als100: Allocate resources with device-managed APIs
  ALSA: azt2320: Allocate resources with device-managed APIs
  ALSA: cmi8328: Allocate resources with device-managed APIs
  ALSA: cmi8330: Allocate resources with device-managed APIs
  ALSA: cs423x: Allocate resources with device-managed APIs
  ALSA: es1688: Allocate resources with device-managed APIs
  ALSA: es18xx: Allocate resources with device-managed APIs
  ALSA: galaxy: Allocate resources with device-managed APIs
  ALSA: gus: Allocate resources with device-managed APIs
  ALSA: msnd: Allocate resources with device-managed APIs
  ALSA: opti9xx: Allocate resources with device-managed APIs
  ALSA: opl3sa2: Allocate resources with device-managed APIs
  ALSA: sc6000: Allocate resources with device-managed APIs
  ALSA: sscape: Allocate resources with device-managed APIs
  ALSA: wavefront: Allocate resources with device-managed APIs
  ALSA: x86: Allocate resources with device-managed APIs
  ALSA: virmidi: Allocate resources with device-managed APIs
  ALSA: mtpav: Allocate resources with device-managed APIs
  ALSA: serial-u16550: Allocate resources with device-managed APIs
  ALSA: mpu401: Allocate resources with device-managed APIs
  ALSA: aloop: Allocate resources with device-managed APIs
  ALSA: dummy: Allocate resources with device-managed APIs
  ALSA: pcsp: Allocate resources with device-managed APIs

 .../kernel-api/writing-an-alsa-driver.rst     |  33 +++
 include/sound/core.h                          |   6 +
 include/sound/emu10k1.h                       |   6 +-
 include/sound/emu8000.h                       |   3 -
 include/sound/es1688.h                        |   1 -
 include/sound/memalloc.h                      |   4 +
 sound/core/init.c                             |  99 +++++++-
 sound/core/isadma.c                           |  38 ++++
 sound/core/memalloc.c                         |  46 ++++
 sound/drivers/aloop.c                         |  26 +--
 sound/drivers/dummy.c                         |  24 +-
 sound/drivers/mpu401/mpu401.c                 |  34 +--
 sound/drivers/mtpav.c                         |  30 +--
 sound/drivers/pcsp/pcsp.c                     |  49 ++--
 sound/drivers/pcsp/pcsp_input.c               |  14 +-
 sound/drivers/pcsp/pcsp_input.h               |   1 -
 sound/drivers/serial-u16550.c                 |  57 +----
 sound/drivers/virmidi.c                       |  21 +-
 sound/drivers/vx/vx_core.c                    |  12 +-
 sound/isa/ad1816a/ad1816a.c                   |  41 +---
 sound/isa/ad1816a/ad1816a_lib.c               |  49 +---
 sound/isa/ad1848/ad1848.c                     |  19 +-
 sound/isa/adlib.c                             |  28 +--
 sound/isa/als100.c                            |  41 +---
 sound/isa/azt2320.c                           |  49 +---
 sound/isa/cmi8328.c                           |  31 +--
 sound/isa/cmi8330.c                           |  27 +--
 sound/isa/cs423x/cs4231.c                     |  21 +-
 sound/isa/cs423x/cs4236.c                     |  52 +----
 sound/isa/cs423x/cs4236_lib.c                 |   2 -
 sound/isa/es1688/es1688.c                     |  33 +--
 sound/isa/es1688/es1688_lib.c                 |  29 +--
 sound/isa/es18xx.c                            | 112 ++--------
 sound/isa/galaxy/galaxy.c                     |  82 +++----
 sound/isa/gus/gus_main.c                      |  44 ++--
 sound/isa/gus/gusclassic.c                    |  28 +--
 sound/isa/gus/gusextreme.c                    |  39 ++--
 sound/isa/gus/gusmax.c                        |  65 ++----
 sound/isa/gus/interwave.c                     |  53 +----
 sound/isa/msnd/msnd_pinnacle.c                | 119 +++-------
 sound/isa/opl3sa2.c                           |  60 +----
 sound/isa/opti9xx/miro.c                      |  76 ++-----
 sound/isa/opti9xx/opti92x-ad1848.c            |  80 ++-----
 sound/isa/sb/emu8000.c                        |  48 +---
 sound/isa/sb/jazz16.c                         |  39 +---
 sound/isa/sb/sb16.c                           |  42 +---
 sound/isa/sb/sb8.c                            |  48 ++--
 sound/isa/sb/sb_common.c                      |  64 ++----
 sound/isa/sc6000.c                            |  73 +++---
 sound/isa/sscape.c                            |  92 ++------
 sound/isa/wavefront/wavefront.c               |  46 +---
 sound/isa/wss/wss_lib.c                       |  67 +-----
 sound/pci/ad1889.c                            | 144 +++---------
 sound/pci/ali5451/ali5451.c                   |  90 ++------
 sound/pci/als300.c                            |  79 ++-----
 sound/pci/als4000.c                           |  59 ++---
 sound/pci/atiixp.c                            |  92 ++------
 sound/pci/atiixp_modem.c                      |  92 ++------
 sound/pci/au88x0/au88x0.c                     | 134 +++--------
 sound/pci/aw2/aw2-alsa.c                      | 102 ++-------
 sound/pci/azt3328.c                           | 124 +++-------
 sound/pci/bt87x.c                             |  98 +++-----
 sound/pci/ca0106/ca0106.h                     |   3 +-
 sound/pci/ca0106/ca0106_main.c                | 114 +++-------
 sound/pci/cmipci.c                            | 104 +++------
 sound/pci/cs4281.c                            | 112 ++--------
 sound/pci/cs46xx/cs46xx.c                     |  51 ++---
 sound/pci/cs46xx/cs46xx.h                     |   4 +-
 sound/pci/cs46xx/cs46xx_lib.c                 | 111 ++-------
 sound/pci/cs5530.c                            |  86 ++-----
 sound/pci/cs5535audio/cs5535audio.c           |  94 ++------
 sound/pci/cs5535audio/cs5535audio_olpc.c      |   7 +-
 sound/pci/echoaudio/echoaudio.c               | 168 ++++----------
 sound/pci/echoaudio/echoaudio.h               |   2 +-
 sound/pci/emu10k1/emu10k1.c                   |  53 ++---
 sound/pci/emu10k1/emu10k1_main.c              | 102 +++------
 sound/pci/emu10k1/emu10k1x.c                  | 128 +++--------
 sound/pci/emu10k1/p16v.c                      |  22 +-
 sound/pci/ens1370.c                           | 115 +++-------
 sound/pci/es1938.c                            |  97 ++------
 sound/pci/es1968.c                            | 112 ++--------
 sound/pci/fm801.c                             | 103 ++-------
 sound/pci/hda/hda_controller.h                |   1 -
 sound/pci/hda/hda_intel.c                     |  26 +--
 sound/pci/ice1712/ice1712.c                   | 133 +++--------
 sound/pci/ice1712/ice1724.c                   | 129 +++--------
 sound/pci/intel8x0.c                          | 140 ++++--------
 sound/pci/intel8x0m.c                         | 139 ++++--------
 sound/pci/korg1212/korg1212.c                 | 211 +++++-------------
 sound/pci/lola/lola.c                         | 127 +++--------
 sound/pci/lola/lola.h                         |   5 +-
 sound/pci/lola/lola_pcm.c                     |  20 +-
 sound/pci/lx6464es/lx6464es.c                 | 112 ++--------
 sound/pci/maestro3.c                          | 106 ++-------
 sound/pci/nm256/nm256.c                       | 130 +++--------
 sound/pci/oxygen/oxygen.c                     |   1 -
 sound/pci/oxygen/oxygen.h                     |   1 -
 sound/pci/oxygen/oxygen_lib.c                 |  66 ++----
 sound/pci/oxygen/se6x.c                       |   1 -
 sound/pci/oxygen/virtuoso.c                   |   1 -
 sound/pci/riptide/riptide.c                   |  89 ++------
 sound/pci/rme32.c                             |  49 +---
 sound/pci/rme96.c                             |  57 ++---
 sound/pci/rme9652/hdsp.c                      |  89 +++-----
 sound/pci/rme9652/hdspm.c                     |  64 +-----
 sound/pci/rme9652/rme9652.c                   |  85 ++-----
 sound/pci/sis7019.c                           |  87 ++------
 sound/pci/sonicvibes.c                        | 117 +++-------
 sound/pci/trident/trident.c                   |  39 +---
 sound/pci/trident/trident.h                   |   7 +-
 sound/pci/trident/trident_main.c              |  90 +++-----
 sound/pci/trident/trident_memory.c            |   8 +-
 sound/pci/via82xx.c                           | 116 +++-------
 sound/pci/via82xx_modem.c                     |  88 ++------
 sound/pci/vx222/vx222.c                       |  69 +-----
 sound/pci/ymfpci/ymfpci.c                     |  66 +++---
 sound/pci/ymfpci/ymfpci.h                     |   8 +-
 sound/pci/ymfpci/ymfpci_main.c                | 149 ++++---------
 sound/pcmcia/vx/vxpocket.c                    |  22 --
 sound/x86/intel_hdmi_audio.c                  |  57 ++---
 120 files changed, 1997 insertions(+), 5513 deletions(-)

-- 
2.26.2

