Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 345E6143526
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 02:27:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 432AC166B;
	Tue, 21 Jan 2020 02:26:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 432AC166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579570054;
	bh=mMQQmYCs7XRSKmcQPw2BmGjm31TlebijTBoiOGC1X5k=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H+XsqhAckb+6UJFvH01ujNEfyU1zr2sYf2uPOjWakmeMov3QGSEZ5ulIcG1rk42lL
	 Uq+7VZGnytmuSH6FG3AG88JWpuHF6kSRrb0Go2jIkCUdJ3Kix2kRekF/WYIIXKB19Y
	 bHQmEX3OeyAAq4otkSkqk+1+GHpMw8UXHGKVVUc0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D69E5F80271;
	Tue, 21 Jan 2020 02:25:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1514BF8012F; Tue, 21 Jan 2020 02:25:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96459F8012F
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 02:25:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96459F8012F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jan 2020 17:25:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,344,1574150400"; d="scan'208";a="258879997"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2020 17:25:38 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Date: Mon, 20 Jan 2020 21:29:22 +0800
Message-Id: <20200120132928.25257-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 bard.liao@intel.com, pierre-louis.bossart@linux.intel.com,
 kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] [PATCH RFC v4 0/6] ASoC: Add Multi CPU DAI support
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

As discussed in [1], ASoC core supports multi codec DAIs
on a DAI link. However it does not do so for CPU DAIs.

So, add support for multi CPU DAIs on a DAI Link by adding
multi CPU DAI in Card instantiation, suspend and resume
functions, PCM ops, stream handling functions and DAPM.

[1]: https://www.spinics.net/lists/alsa-devel/msg71369.html

changes in v4:
 - fix "rtd->num_codecs > 1" error in ASoC: Add Multi CPU DAI support
 - split "ASoC: pcm: check if cpu DAI support the given stream" from
   "ASoC: Add multiple CPU DAI support for PCM ops"
 - add helper "ASoC: Add dapm_add_valid_dai_widget helper" for
   "ASoC: Add multiple CPU DAI support in DAPM" 

Bard Liao (2):
  ASoC: return error if the function is not support multi cpu yet.
  ASoC: pcm: check if cpu DAI support the given stream

Shreyas NC (4):
  ASoC: Add initial support for multiple CPU DAIs
  ASoC: Add multiple CPU DAI support for PCM ops
  ASoC: Add dapm_add_valid_dai_widget helper
  ASoC: Add multiple CPU DAI support in DAPM

 include/sound/soc.h                   |  15 +
 sound/soc/soc-compress.c              |   5 +-
 sound/soc/soc-core.c                  | 205 +++++-----
 sound/soc/soc-dapm.c                  | 133 ++++---
 sound/soc/soc-generic-dmaengine-pcm.c |  18 +
 sound/soc/soc-pcm.c                   | 554 ++++++++++++++++++--------
 6 files changed, 615 insertions(+), 315 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
