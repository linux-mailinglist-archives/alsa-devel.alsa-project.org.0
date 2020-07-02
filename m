Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B097212D32
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 21:38:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9B7D16CB;
	Thu,  2 Jul 2020 21:37:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9B7D16CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593718690;
	bh=RWhwFOkXsKdKsffcmPcuTiKLZ6Oa9mn9sq2CaOwyDZQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WJM3Z+4a7VKHXcS+vTnMkCZ50ECTjMC/S30Qj4EWlTStqzP6jKAelpB5prvDsNEq2
	 8oHmqoSrmrRF8F5JNt8v2WiIgSaBJu3uSjHX2dwDHBsMC39yeTAzxmzfxUbiTtnH6J
	 +dUob+9au4kqQ3eLXvh4phNw4vW/IEDj3yHHdsbo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAA43F80253;
	Thu,  2 Jul 2020 21:36:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8F6BF80134; Thu,  2 Jul 2020 21:36:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14482F80134
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 21:36:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14482F80134
IronPort-SDR: rQTJFU0XWWMNdkEF/AMaNLLAGXQzpnGgd6o82PPpzGeWadYQOgcFrRzkJnQWroYr7IOzq56+cP
 36NGYhuh6+mA==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="148549338"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="148549338"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:18 -0700
IronPort-SDR: sa8HDhVXmD5aBtyUWT5pDV6/SDLYqH89RWhG7svw60SSOKml43guHs6q21EhR2PZw/GVUXytt4
 nz9ehRDkiaQw==
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="482116349"
Received: from dhprice-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.75.219])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 00/23] ALSA: fix kernel-doc and W=1 warnings
Date: Thu,  2 Jul 2020 14:35:41 -0500
Message-Id: <20200702193604.169059-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

This cleanup touches a lot of old - and very old code for hardware
designed in the late 1990s/early 2000s -, hence the RFC status. I
mostly did dumb edits just to make warnings go away, suggestions and
feedback welcome.

Pierre-Louis Bossart (23):
  ALSA: isa/gus: remove -Wmissing-prototypes warnings
  ALSA: isa/gus: remove 'set but not used' warning
  ALSA: pci/asihpi: remove 'set but not used' warnings
  ALSA: pci/asihpi: fix kernel-doc
  ALSA: pci/asihpi: remove 'set but not used' warning
  ALSA: pci/echoaudio: remove 'set but not used' warning
  ALSA: pci/aw2-saa7146: remove 'set but not used' warning
  ALSA: pci/ctxfi/ctatc: fix kernel-doc
  ALSA: pci/ctxfi: fix kernel-doc warnings
  ALSA: usb/line6: remove 'defined but not used' warning
  ASoC: pci/emu10k1: remove "set but not used' warnings
  ALSA: firewire: fix kernel-doc
  ALSA: pci/emu10k1: remove 'set but not used' warning
  ALSA: pci/korg1212: remove 'set but not used' warnings
  ALSA: pci/rme9652/hdspm: remove always true condition
  ALSA: pci/oxygen/xonar_wm87x6: remove always true condition
  ALSA: xen: remove 'set but not used' warning
  ALSA: pci/es1938: remove 'set but not used' warning
  ALSA: pci/fm801: fix kernel-doc
  ALSA: pci/via82xx: remove 'set but not used' warnings
  ALSA: pcmcia/pdaudiocf: fix kernel-doc
  ALSA: vx_core: remove warning for empty loop body
  ALSA: pci/au88x0: remove "defined but not used" warnings

 include/sound/gus.h                |  4 ++++
 sound/drivers/vx/vx_core.c         |  3 ++-
 sound/firewire/cmp.c               |  1 -
 sound/isa/gus/gus_reset.c          |  2 --
 sound/isa/gus/gus_uart.c           |  3 ++-
 sound/pci/asihpi/asihpi.c          | 12 +++++-----
 sound/pci/asihpi/hpicmn.c          | 26 +++++++++++----------
 sound/pci/au88x0/au88x0_a3ddata.c  |  8 +++----
 sound/pci/au88x0/au88x0_xtalk.c    | 36 +++++++++++++++---------------
 sound/pci/aw2/aw2-saa7146.c        |  2 +-
 sound/pci/ctxfi/ctatc.c            |  4 ++++
 sound/pci/ctxfi/cthardware.c       |  2 +-
 sound/pci/ctxfi/cthw20k1.c         |  2 +-
 sound/pci/ctxfi/cthw20k2.c         |  2 +-
 sound/pci/ctxfi/ctimap.c           |  2 +-
 sound/pci/ctxfi/ctmixer.c          |  2 +-
 sound/pci/ctxfi/ctpcm.c            |  2 +-
 sound/pci/echoaudio/echoaudio.c    |  3 ++-
 sound/pci/emu10k1/emu10k1_main.c   |  4 ++--
 sound/pci/emu10k1/emu10k1_patch.c  |  3 ++-
 sound/pci/es1938.c                 |  3 ++-
 sound/pci/fm801.c                  | 27 ++++++++++++++++++++++
 sound/pci/korg1212/korg1212.c      |  4 +++-
 sound/pci/oxygen/xonar_wm87x6.c    |  6 +++--
 sound/pci/rme9652/hdspm.c          |  4 ++--
 sound/pci/via82xx.c                |  2 +-
 sound/pci/via82xx_modem.c          |  2 +-
 sound/pcmcia/pdaudiocf/pdaudiocf.c |  1 +
 sound/usb/line6/driver.h           |  4 ++--
 sound/xen/xen_snd_front.c          |  2 +-
 30 files changed, 110 insertions(+), 68 deletions(-)

-- 
2.25.1

