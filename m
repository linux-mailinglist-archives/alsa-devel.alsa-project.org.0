Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 453F9192966
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 14:18:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A78531668;
	Wed, 25 Mar 2020 14:17:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A78531668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585142306;
	bh=oJY1nj/fYBVHKNy9xUuzxsbU801Klp5EqC+W/JzdTUI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gPxKqYfxKoFT+JnzzcBEOSo3W2EoZS7JxRPgCoyKRMODyZ+rt4TDmSgSBoPqVBceY
	 JkXvnHXvWw9s2N6YmN6ylg97o3RYB053R2UdCIb8/Wvvy4V3UvUPQdz9usbln/d5YH
	 higc/CMQ8S30S7ZHy64tS8qhMjawGy0GEZB0hYz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C397CF80158;
	Wed, 25 Mar 2020 14:16:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 035BBF80218; Wed, 25 Mar 2020 14:16:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 541ECF800EF
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 14:16:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 541ECF800EF
IronPort-SDR: nV01ekkJJP8i7C9RlOGsY2FnGc0QdNr39sLMa5dGJRjEwWJaCYkCYlCSia3bZyTRcVRSA7Bb0C
 fqFzB/gPT4iA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 06:16:33 -0700
IronPort-SDR: dGO5437KZkkwSD/7n08RgdsKIFNaK9ZEay1wMCnywDteC/fkKex01z5Gg1h7mP/DJTy0dDTAgd
 ooTfhvKeHttw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; d="scan'208";a="446618786"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 25 Mar 2020 06:16:31 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ASoC: Intel: boards: Revert SSP0 links to use dummy
Date: Wed, 25 Mar 2020 14:16:08 +0100
Message-Id: <20200325131611.545-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
 tiwai@suse.com, linux@dominikbrodowski.net,
 pierre-louis.bossart@linux.intel.com
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

Recent series of patches targeting broadwell boards, while enabling
SOF, changed behavior for non-SOF solutions. In essence replacing
platform 'dummy' with actual 'platform' causes redundant stream
initialization to occur during audio start. hw_params for haswell-pcm
destroys initial stream right after its creation - only to recreate it
again from proceed from there.

While harmless so far, this flow isn't right and should be corrected.
The actual need for dummy components for SSP0 link is questionable but
that issue is subject for another series.

Link to first message in conversation:
https://lkml.org/lkml/2020/3/18/54

Cezary Rojewski (3):
  ASoC: Intel: broadwell: Revert back SSP0 link to use dummy components
  ASoC: Intel: bdw-rt5677: Revert SSP0 link to use dummy components
  ASoC: Intel: bdw-rt5650: Revert SSP0 link to use dummy components

 sound/soc/intel/boards/bdw-rt5650.c | 7 ++++---
 sound/soc/intel/boards/bdw-rt5677.c | 7 ++++---
 sound/soc/intel/boards/broadwell.c  | 7 ++++---
 3 files changed, 12 insertions(+), 9 deletions(-)

-- 
2.17.1

