Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB634243EA0
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 20:00:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4917F1668;
	Thu, 13 Aug 2020 19:59:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4917F1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597341644;
	bh=w87R2jDciF/7Lqd3pqmY9hGHepUizlK37hTLx52Z8T4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TipXlCo3sA9TmpEYU/LE+KmEt001t/Vgkwb+0qAGUP5eDFZENXdrv7BSbtXtABir3
	 O+bOddNYSCFY2lFOtDIoXKlH0lFSZrZoyY4jBRSASafEkJvwY8HFWI95vkAyCudKjm
	 YP+PGbKaLJ7AkD+V8mNSkn9AoaBl86FTK3VktvYY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E8E9F800D3;
	Thu, 13 Aug 2020 19:59:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5714DF80162; Thu, 13 Aug 2020 19:58:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8764BF800D3
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 19:58:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8764BF800D3
IronPort-SDR: SXFfqYb24a/V+GdpTaPicq7qbW+eIi41m6KAEu54ORDV8tIcGj/Tv30NouNWiFcfq3XzirbJEH
 sJMNOvK2Jy0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="239124807"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="239124807"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 10:58:54 -0700
IronPort-SDR: 5qP2Hheb42ysEnYSpkgM/lfvkmQidaVBYYafTiO949F1OgM7sXHmLNa+BmiJQ2oe9m3I4XVW2Z
 CklLdQ2Rk4Lg==
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="295510732"
Received: from jctorres-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.137.200])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 10:58:53 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/5] ASoC: SOF/Intel: fix cppcheck warnings
Date: Thu, 13 Aug 2020 12:58:34 -0500
Message-Id: <20200813175839.59422-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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

A small set of fixes to reduce the number of warnings.

Pierre-Louis Bossart (5):
  ASOC: SOF: Intel: hda-codec: move unused label to correct position
  ASoC: SOF: Intel: hda-codec: move variable used conditionally
  ASoC: Intel: rename shadowed variable for all broadwell boards
  ASoC: Intel: bytcht_cx2072x: simplify return handling
  ASoC: Intel: sof_sdw: clarify operator precedence

 sound/soc/intel/boards/bdw-rt5650.c     | 10 +++++-----
 sound/soc/intel/boards/bdw-rt5677.c     |  8 ++++----
 sound/soc/intel/boards/broadwell.c      |  8 ++++----
 sound/soc/intel/boards/bytcht_cx2072x.c |  2 +-
 sound/soc/intel/boards/sof_sdw.c        |  2 +-
 sound/soc/sof/intel/hda-codec.c         |  7 ++++++-
 6 files changed, 21 insertions(+), 16 deletions(-)

-- 
2.25.1

