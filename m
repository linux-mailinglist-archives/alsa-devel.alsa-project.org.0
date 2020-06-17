Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB3B1FD2F8
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 18:58:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4641D1676;
	Wed, 17 Jun 2020 18:57:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4641D1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592413094;
	bh=r/qqcyowhoP0FhMZEeigl9CQLJtMHqH8vj6MhXsjv/I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ggUmeLE9jAQFNykITss+i8GNPPulCh1NXsFcCDI+sIkH0dZF3pa60JG0L4O3i4/ZM
	 wlNBiEdAsLTxkCX+iKNFCsa0j5y1xZf2uixpKpohNfdhaE66kyh85br/7gdkv2OZ+Z
	 ggEOo29iVNiuK7+AnHrXojXlAb4bOstcV4uzpa2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6424AF801ED;
	Wed, 17 Jun 2020 18:56:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43A9CF801ED; Wed, 17 Jun 2020 18:56:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6143F80162
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 18:56:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6143F80162
IronPort-SDR: OSFylSCeEC/BT7xhqERWQXKszh7GB84vUeF7YRNiliV6aB+Qa0FBsRNUzJhWklFW9ZAFBKqcui
 Gs6vm2XNpltQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 09:56:22 -0700
IronPort-SDR: w4MOacDebxULyK0gdS+LNAwB92WqpvRm+w2G8EbNFASwT1z6mPcRFOYpLEP7G2t8Qj1/G5ce5a
 xdsEzOwiuvmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,523,1583222400"; d="scan'208";a="277339139"
Received: from zdsmith-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.128])
 by orsmga006.jf.intel.com with ESMTP; 17 Jun 2020 09:56:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH RESEND 0/3] ASoC: Intel: simplify driver/card names for
 SOF/UCM integration
Date: Wed, 17 Jun 2020 11:56:13 -0500
Message-Id: <20200617165616.18511-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

As suggested by Jaroslav, this patchset simplifies legacy cards
compiled with SOF: they now expose an 'SOF' driver name and an
'sof-bytcht <codec>' card name. UCM uses this driver name and
additionally checks for the card name to load a configuration shared
with the SST driver.

This patchset is just a rename with no functionality change. There is
no modification when SOF is not used, and Kconfig for SOF are disabled
when SST is enabled so no risk of interference.

This helps make 5.9 the first kernel version where SOF 'just
works'(tm) on legacy platforms with no additional configuration needed
(as is already the case with more recent HDaudio+DMIC platforms).

Thanks to Jaroslav for all the hard work on the alsa-lib/UCM side (the
majority of the configs are already merged in alsa-ucm-conf, only
minor updates are in-flight for max98090 and broadwell).

Patches sent initially on May 29, probably missed with the merge window.
No changes except for the addition of Jaroslav's Reviewed-by tag.

Pierre-Louis Bossart (3):
  ASoC: Intel: byt*: simplify card names for SOF uses
  ASoC: Intel: cht*: simplify card names for SOF uses
  ASoC: Intel: broadwell: simplify card names for SOF uses

 sound/soc/intel/boards/bdw-rt5650.c          | 12 +++++++++++-
 sound/soc/intel/boards/bdw-rt5677.c          | 12 +++++++++++-
 sound/soc/intel/boards/broadwell.c           | 12 +++++++++++-
 sound/soc/intel/boards/bytcht_cx2072x.c      | 12 +++++++++++-
 sound/soc/intel/boards/bytcht_da7213.c       | 12 +++++++++++-
 sound/soc/intel/boards/bytcht_es8316.c       | 12 +++++++++++-
 sound/soc/intel/boards/bytcr_rt5640.c        | 12 +++++++++++-
 sound/soc/intel/boards/bytcr_rt5651.c        | 12 +++++++++++-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c | 12 +++++++++++-
 sound/soc/intel/boards/cht_bsw_nau8824.c     | 12 +++++++++++-
 sound/soc/intel/boards/cht_bsw_rt5645.c      | 17 +++++++++++++++--
 sound/soc/intel/boards/cht_bsw_rt5672.c      | 12 +++++++++++-
 12 files changed, 136 insertions(+), 13 deletions(-)

-- 
2.20.1

