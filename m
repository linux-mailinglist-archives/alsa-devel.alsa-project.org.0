Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90919F43E3
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2019 10:51:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 930B71683;
	Fri,  8 Nov 2019 10:50:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 930B71683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573206682;
	bh=vnF46R+EYyOPhk7Z0VDL66uDSj/8FdR9vqSoOK+GCjg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tiEh+2V1MdyrrQ3g7VVrrl7RPdaHIlnA+gUI3HO+g0VTC+GlKeqj8vKPDm2vxG2B/
	 rZLI7suhR1gYO2FA8XgZLZLBJu+IZdCQIW7cl0YF83sCeRIbCJ9fcoX7rxjPPqrOPr
	 EOljilcc8dQDuRU4OgmIl98bskiZAZlvgswCnQco=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50E0AF805DF;
	Fri,  8 Nov 2019 10:49:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 067E2F80600; Fri,  8 Nov 2019 10:48:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCF7FF800F3
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 10:46:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCF7FF800F3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9329EAE68;
 Fri,  8 Nov 2019 09:46:51 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  8 Nov 2019 10:46:33 +0100
Message-Id: <20191108094641.20086-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Curtis Malainey <cujomalainey@chromium.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [alsa-devel] [PATCH 0/8] ASoC: memalloc cleanups
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

this is a patch series for ASoC to clean up ALSA memory allocation API
usages.  It's based on my recent API changes found on for-next branch
for 5.5 merge, so please give ACK if it's OK, so that I can merge them
into my sound git tree.

Basically three things:
* Drop superfluous snd_pcm_sgbuf_ops_page usages
* Drop snd_dma_continuous_data() macro usage for the normal continuous
  page allocation
* Convert PCM vmalloc buffer allocation with the preallocation API


Takashi

===

Takashi Iwai (8):
  ASoC: Remove superfluous snd_dma_continuous_data()
  ASoC: rt5514-spi: Convert to the common vmalloc memalloc
  ASoC: intel: Drop superfluous snd_pcm_sgbuf_ops_page
  ASoC: intel: Avoid non-standard macro usage
  ASoC: SOF: Drop superfluous snd_pcm_sgbuf_ops_page
  ASoC: rt5677-spi: Convert to the common vmalloc memalloc
  ASoC: cros_ec_codec: Convert to the common vmalloc memalloc
  ALSA: pcm: Unexport snd_pcm_sgbuf_ops_page

 include/sound/pcm.h                       |  8 --------
 sound/core/pcm_local.h                    |  5 +++++
 sound/core/pcm_memory.c                   |  3 +--
 sound/soc/au1x/dma.c                      |  2 +-
 sound/soc/codecs/cros_ec_codec.c          | 16 ++++++++--------
 sound/soc/codecs/rt5514-spi.c             | 21 +++++++++++----------
 sound/soc/codecs/rt5677-spi.c             | 17 ++++++++---------
 sound/soc/dwc/dwc-pcm.c                   |  2 +-
 sound/soc/intel/haswell/sst-haswell-pcm.c | 12 ------------
 sound/soc/intel/skylake/skl-pcm.c         | 14 +-------------
 sound/soc/sh/dma-sh7760.c                 |  2 +-
 sound/soc/sof/pcm.c                       | 12 ------------
 12 files changed, 37 insertions(+), 77 deletions(-)

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
