Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9152C3C7227
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:28:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23B2D16C9;
	Tue, 13 Jul 2021 16:27:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23B2D16C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626186501;
	bh=fUk0hvgWXiHeQbBEOr4eUZbWu+yI4mIGxEfriA2tTe0=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uopSV/QL/cwoN/vgO10b09wF0yVxeR8FNfPFVgSRV+XpfCwDG+NZCsTLyrOp1v2e0
	 L6JXQ9hin6zg8YYGuL09zvVqLo09uNd+cTZtPmkJIKXSJTkoGjijwtiB0v3QAN63T/
	 KfWlTtbVDRa0Krb46p2hhUpNS+x1l4xzm8KhSLvQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77548F804FB;
	Tue, 13 Jul 2021 16:25:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 703A2F804F1; Tue, 13 Jul 2021 16:25:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 197EAF802E0
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:24:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 197EAF802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="FYxdYJaw"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="MU557g+p"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id C695722837
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=xzo6vhoKd5947wjz6YmV4d8Wh2vRKwf8TYvaiJc4H54=;
 b=FYxdYJawx/lSCa576DSzlxAAAMfmwx+pwQClhmz0LFkfwK8lCBLRqLDwgVoIbguSDA2pbf
 bctMfY5+PUkgXeCTs/yrH/3UXrvkCHYQGyvz0f1Bkf3P1pQmeY3zqyLmK6Fi5C1PbNIARM
 aOG1XcDBSKfN4UmmmDy5x2HUpKWxlXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186294;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=xzo6vhoKd5947wjz6YmV4d8Wh2vRKwf8TYvaiJc4H54=;
 b=MU557g+pUVk3PGZ62+ZYO8WMaPTV6f/SR7cRFIMqfwMg4tvKrn78RW0lsBifiDlGahevfo
 p22o9060Ssk4UiAw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id B6253A3B88;
 Tue, 13 Jul 2021 14:24:54 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/51] ALSA: More devres usages
Date: Tue, 13 Jul 2021 16:24:36 +0200
Message-Id: <20210713142445.19252-1-tiwai@suse.de>
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

this is a resurrect of my early RFC patch with the fix and applying to
more drivers.  The main purpose is merely the code cleanup over the
tree by replacing the resource allocations with devres helpers as much
as possible.

The only major change is the addition of devres-supported card object
handling snd_devm_card_new() and the page allocation helper
snd_devm_alloc_pages().  Those allow us to get rid of the remove
callback completely in many drivers.  In the end, the series resulted
in a significant amount of code reduction.

This series covers only the drivers in pci, x86 and drivers
subdirectories.  The patches for isa subdirectory will follow later.


Takashi

===

Takashi Iwai (51):
  ALSA: core: Add device-managed page allocator helper
  ALSA: core: Add managed card creation
  ALSA: intel8x0: Allocate resources with device-managed APIs
  ALSA: atiixp: Allocate resources with device-managed APIs
  ALSA: hda: Allocate resources with device-managed APIs
  ALSA: doc: Add device-managed resource section
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
  ALSA: korg1212: Allocate resources with device-managed APIs
  ALSA: lola: Allocate resources with device-managed APIs
  ALSA: oxygen: Allocate resources with device-managed APIs
  ALSA: riptide: Allocate resources with device-managed APIs
  ALSA: hdsp: Allocate resources with device-managed APIs
  ALSA: hdspm: Allocate resources with device-managed APIs
  ALSA: rme9652: Allocate resources with device-managed APIs
  ALSA: trident: Allocate resources with device-managed APIs
  ALSA: vx: Manage vx_core object with devres
  ALSA: vx222: Allocate resources with device-managed APIs
  ALSA: ymfpci: Allocate resources with device-managed APIs
  ALSA: x86: Allocate resources with device-managed APIs
  ALSA: virmidi: Allocate resources with device-managed APIs
  ALSA: mtpav: Allocate resources with device-managed APIs
  ALSA: serial-u16550: Allocate resources with device-managed APIs
  ALSA: mpu401: Allocate resources with device-managed APIs

 .../kernel-api/writing-an-alsa-driver.rst     |  33 +++
 include/sound/core.h                          |   5 +
 include/sound/emu10k1.h                       |   6 +-
 include/sound/memalloc.h                      |   4 +
 sound/core/init.c                             | 101 ++++++++-
 sound/core/memalloc.c                         |  46 ++++
 sound/drivers/mpu401/mpu401.c                 |  33 +--
 sound/drivers/mtpav.c                         |  30 +--
 sound/drivers/serial-u16550.c                 |  57 +----
 sound/drivers/virmidi.c                       |  21 +-
 sound/drivers/vx/vx_core.c                    |  12 +-
 sound/pci/ad1889.c                            | 144 +++---------
 sound/pci/ali5451/ali5451.c                   |  88 ++------
 sound/pci/als300.c                            |  79 ++-----
 sound/pci/als4000.c                           |  59 ++---
 sound/pci/atiixp.c                            |  92 ++------
 sound/pci/atiixp_modem.c                      |  92 ++------
 sound/pci/au88x0/au88x0.c                     | 134 +++--------
 sound/pci/aw2/aw2-alsa.c                      | 102 ++-------
 sound/pci/azt3328.c                           | 124 +++-------
 sound/pci/bt87x.c                             |  97 ++------
 sound/pci/ca0106/ca0106.h                     |   3 +-
 sound/pci/ca0106/ca0106_main.c                | 114 +++-------
 sound/pci/cmipci.c                            | 104 +++------
 sound/pci/cs4281.c                            | 112 ++--------
 sound/pci/cs46xx/cs46xx.c                     |  51 ++---
 sound/pci/cs46xx/cs46xx.h                     |   4 +-
 sound/pci/cs46xx/cs46xx_lib.c                 | 109 ++-------
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
 sound/pci/ice1712/ice1724.c                   | 127 +++--------
 sound/pci/intel8x0.c                          | 140 ++++--------
 sound/pci/intel8x0m.c                         | 139 ++++--------
 sound/pci/korg1212/korg1212.c                 | 211 +++++-------------
 sound/pci/lola/lola.c                         | 127 +++--------
 sound/pci/lola/lola.h                         |   5 +-
 sound/pci/lola/lola_pcm.c                     |  20 +-
 sound/pci/maestro3.c                          | 106 ++-------
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
 sound/pci/via82xx.c                           | 106 +++------
 sound/pci/via82xx_modem.c                     |  86 ++-----
 sound/pci/vx222/vx222.c                       |  69 +-----
 sound/pci/ymfpci/ymfpci.c                     |  66 +++---
 sound/pci/ymfpci/ymfpci.h                     |   8 +-
 sound/pci/ymfpci/ymfpci_main.c                | 149 ++++---------
 sound/pcmcia/vx/vxpocket.c                    |  21 --
 sound/x86/intel_hdmi_audio.c                  |  57 ++---
 77 files changed, 1449 insertions(+), 3944 deletions(-)

-- 
2.26.2

