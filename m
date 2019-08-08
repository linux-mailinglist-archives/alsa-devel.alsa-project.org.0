Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7019F85F21
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 12:01:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 092F4166F;
	Thu,  8 Aug 2019 12:00:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 092F4166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565258464;
	bh=PgaJEIcXbo4JUV0mrARuMywokToRU29mC15YQxA5RAg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p3hXnHEgRqw/5QatX1S+7mWDFkuGdJT/eego5xFzYkfQaFDTgYeERSDlMs7g7bwmQ
	 jNZfQnCrVjiGbOGIFLZ09cQI9C833k7EhwFkAcBDJVFvbI1mQ2gx3P9l1IVEJrVhCB
	 0gUVqkvtvsYE5PQ5hk9htp0fjz9jVh8w5cBfoECA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8304AF805FA;
	Thu,  8 Aug 2019 11:57:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B1D4F800E4; Thu,  8 Aug 2019 11:57:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1004F803F3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 11:57:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1004F803F3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B0461AF2D;
 Thu,  8 Aug 2019 09:57:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu,  8 Aug 2019 11:57:12 +0200
Message-Id: <20190808095715.29713-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Mark Brown <broonie@kernel.org>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [alsa-devel] [PATCH 0/3] ALSA: hda: bus cleanup
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

this is a few patches to simplify and cleanup the HD-audio bus ops.

The first two patches translate the indirect calls of DMA page
allocation and MMIO accesses with the direct ones, as well as
eliminating the whole bus->io_ops.

The last one is SOF-specific, and fixes/cleans up by calling the
proper hdaudio bus init function, as formerly discussed.


Takashi

===

Takashi Iwai (3):
  ALSA: hda: Remove page allocation redirection
  ALSA: hda: Direct MMIO accesses
  ASoC: SOF: Intel: Initialize hdaudio bus properly

 include/sound/hdaudio.h                | 69 +++++++++++++--------------
 include/sound/hdaudio_ext.h            |  1 -
 sound/hda/Kconfig                      |  3 ++
 sound/hda/ext/hdac_ext_bus.c           | 60 +-----------------------
 sound/hda/hdac_bus.c                   | 36 ++++++++++++--
 sound/hda/hdac_controller.c            | 18 +++----
 sound/hda/hdac_stream.c                |  8 ++--
 sound/pci/hda/Kconfig                  |  1 +
 sound/pci/hda/hda_controller.c         |  6 +--
 sound/pci/hda/hda_controller.h         |  3 +-
 sound/pci/hda/hda_intel.c              | 71 ++--------------------------
 sound/pci/hda/hda_tegra.c              | 84 +--------------------------------
 sound/soc/intel/skylake/skl-messages.c | 15 +-----
 sound/soc/intel/skylake/skl.c          |  7 ++-
 sound/soc/sof/intel/hda-bus.c          | 85 ++++------------------------------
 sound/soc/sof/intel/hda-dsp.c          |  2 +-
 sound/soc/sof/intel/hda.c              |  6 +--
 sound/soc/sof/intel/hda.h              |  3 +-
 18 files changed, 107 insertions(+), 371 deletions(-)

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
