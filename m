Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C3D118099
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 07:40:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E5A516A5;
	Tue, 10 Dec 2019 07:40:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E5A516A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575960053;
	bh=YvUmkWnL55gAZvjFKYaVU6s37Cr9X8MiWXRGLBQwJjk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Dpw7oD7FZYEyNi8+nXD0BpNe6rB8ZjBOQwUByNzO0tIFxHhWVMEqJ2sscBKw8hhBx
	 jiH/214HVsn8FOBKeuGyWC1tfJp3eSTaF+wRGnez+X899afwjeZs9WS052HREQdN3r
	 yl0j0Ji6+aImokl2itQC8w0BLiaj947z70UJOFn4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2F65F80259;
	Tue, 10 Dec 2019 07:35:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77A92F80249; Tue, 10 Dec 2019 07:35:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 615D6F8020C
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 07:34:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 615D6F8020C
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 13FC1AC2C
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 06:34:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 07:33:59 +0100
Message-Id: <20191210063454.31603-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH 00/55] ALSA: Support PCM sync_stop
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

this is the last episode of the trilogy of PCM enhancements for
non-ASoC drivers.

Basically this either adds the setup for card->sync_irq and removes
the superfluous synchronize_irq() calls, or replaces the
synchronization code with the new sync_irq PCM ops.

For the explanation about PCM ssync_stop and card sync_irq, see the
commits:
1e850beea2781d30418743dd99250291cef37919
    ALSA: pcm: Add the support for sync-stop operation
fabb26dcd104027b971c018275fe40f2ebe09ae3
    ALSA: pcm: Add card sync_irq field


thanks,

Takashi

===

Takashi Iwai (55):
  ALSA: ad1889: Support PCM sync_stop
  ALSA: ali5451: Support PCM sync_stop
  ALSA: als300: Support PCM sync_stop
  ALSA: atiixp: Support PCM sync_stop
  ALSA: au88x0: Support PCM sync_stop
  ALSA: aw2: Support PCM sync_stop
  ALSA: azt3328: Support PCM sync_stop
  ALSA: bt87x: Support PCM sync_stop
  ALSA: ca0106: Support PCM sync_stop
  ALSA: cmipci: Support PCM sync_stop
  ALSA: cs4281: Support PCM sync_stop
  ALSA: cs46xx: Support PCM sync_stop
  ALSA: cs5535audio: Support PCM sync_stop
  ALSA: ctxfi: Support PCM sync_stop
  ALSA: echoaudio: Support PCM sync_stop
  ALSA: emu10k1: Support PCM sync_stop
  ALSA: ens137x: Support PCM sync_stop
  ALSA: es1938: Support PCM sync_stop
  ALSA: es1968: Support PCM sync_stop
  ALSA: fm801: Support PCM sync_stop
  ALSA: hda: Support PCM sync_stop
  ALSA: ice1712: Support PCM sync_stop
  ALSA: ice1724: Support PCM sync_stop
  ALSA: intel8x0: Support PCM sync_stop
  ALSA: korg1212: Support PCM sync_stop
  ALSA: lola: Support PCM sync_stop
  ALSA: maestro3: Support PCM sync_stop
  ALSA: nm256: Support PCM sync_stop
  ALSA: oxygen: Support PCM sync_stop
  ALSA: riptide: Support PCM sync_stop
  ALSA: rme32: Support PCM sync_stop
  ALSA: rme96: Support PCM sync_stop
  ALSA: rme9652: Support PCM sync_stop
  ALSA: sis7019: Support PCM sync_stop
  ALSA: sonicvibes: Support PCM sync_stop
  ALSA: trident: Support PCM sync_stop
  ALSA: via82xx: Support PCM sync_stop
  ALSA: ymfpci: Support PCM sync_stop
  ALSA: ad1816a: Support PCM sync_stop
  ALSA: es1688: Support PCM sync_stop
  ALSA: es18xx: Support PCM sync_stop
  ALSA: gus: Support PCM sync_stop
  ALSA: msnd: Support PCM sync_stop
  ALSA: opl3sa2: Support PCM sync_stop
  ALSA: opti9xx: Support PCM sync_stop
  ALSA: sb: Support PCM sync_stop
  ALSA: wavefront: Support PCM sync_stop
  ALSA: wss: Support PCM sync_stop
  ALSA: lx6464es: Support PCM sync_stop
  ALSA: mixart: Support PCM sync_stop
  ALSA: pcxhr: Support PCM sync_stop
  ALSA: vx222: Support PCM sync_stop
  ALSA: pdaudiocf: Support PCM sync_stop
  ALSA: vxpocket: Support PCM sync_stop
  ALSA: usb-audio: Support PCM sync_stop

 sound/isa/ad1816a/ad1816a_lib.c     |  1 +
 sound/isa/es1688/es1688_lib.c       |  1 +
 sound/isa/es18xx.c                  |  1 +
 sound/isa/gus/gus_main.c            |  1 +
 sound/isa/gus/gusmax.c              |  3 ++-
 sound/isa/gus/interwave.c           |  1 +
 sound/isa/msnd/msnd_pinnacle.c      |  1 +
 sound/isa/opl3sa2.c                 |  1 +
 sound/isa/opti9xx/opti92x-ad1848.c  |  1 +
 sound/isa/sb/sb_common.c            |  1 +
 sound/isa/wavefront/wavefront.c     |  1 +
 sound/isa/wss/wss_lib.c             |  1 +
 sound/pci/ad1889.c                  |  2 +-
 sound/pci/ali5451/ali5451.c         |  3 +--
 sound/pci/als300.c                  |  2 +-
 sound/pci/atiixp.c                  |  2 +-
 sound/pci/atiixp_modem.c            |  2 +-
 sound/pci/au88x0/au88x0.c           |  1 +
 sound/pci/aw2/aw2-alsa.c            |  1 +
 sound/pci/azt3328.c                 |  2 +-
 sound/pci/bt87x.c                   |  2 +-
 sound/pci/ca0106/ca0106_main.c      |  1 +
 sound/pci/cmipci.c                  |  1 +
 sound/pci/cs4281.c                  |  5 +----
 sound/pci/cs46xx/cs46xx_lib.c       |  1 +
 sound/pci/cs5535audio/cs5535audio.c |  2 +-
 sound/pci/ctxfi/cthw20k1.c          |  4 +---
 sound/pci/ctxfi/cthw20k2.c          |  1 +
 sound/pci/echoaudio/echoaudio.c     |  3 +++
 sound/pci/emu10k1/emu10k1_main.c    |  1 +
 sound/pci/emu10k1/emu10k1x.c        |  1 +
 sound/pci/ens1370.c                 |  4 +---
 sound/pci/es1938.c                  |  3 +++
 sound/pci/es1968.c                  |  3 +--
 sound/pci/fm801.c                   |  1 +
 sound/pci/hda/hda_intel.c           |  4 +++-
 sound/pci/hda/hda_tegra.c           |  4 +---
 sound/pci/ice1712/ice1712.c         |  2 +-
 sound/pci/ice1712/ice1724.c         |  2 +-
 sound/pci/intel8x0.c                |  4 +++-
 sound/pci/intel8x0m.c               |  3 +++
 sound/pci/korg1212/korg1212.c       |  1 +
 sound/pci/lola/lola.c               |  2 +-
 sound/pci/lx6464es/lx6464es.c       |  1 +
 sound/pci/maestro3.c                |  1 +
 sound/pci/mixart/mixart.c           |  1 +
 sound/pci/nm256/nm256.c             |  2 ++
 sound/pci/oxygen/oxygen_lib.c       |  2 +-
 sound/pci/pcxhr/pcxhr.c             |  1 +
 sound/pci/riptide/riptide.c         |  1 +
 sound/pci/rme32.c                   |  1 +
 sound/pci/rme96.c                   |  1 +
 sound/pci/rme9652/hdsp.c            |  1 +
 sound/pci/rme9652/hdspm.c           |  1 +
 sound/pci/rme9652/rme9652.c         |  1 +
 sound/pci/sis7019.c                 |  1 +
 sound/pci/sonicvibes.c              |  1 +
 sound/pci/trident/trident_main.c    |  1 +
 sound/pci/via82xx.c                 |  3 +--
 sound/pci/via82xx_modem.c           |  3 +--
 sound/pci/vx222/vx222.c             |  1 +
 sound/pci/ymfpci/ymfpci_main.c      |  1 +
 sound/pcmcia/pdaudiocf/pdaudiocf.c  |  1 +
 sound/pcmcia/vx/vxpocket.c          |  1 +
 sound/usb/pcm.c                     | 37 +++++++++++++++++++++++++------------
 65 files changed, 101 insertions(+), 47 deletions(-)

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
