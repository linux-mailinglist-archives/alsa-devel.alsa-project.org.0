Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B3D1A39F0
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 20:46:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDDF8168F;
	Thu,  9 Apr 2020 20:45:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDDF8168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586457988;
	bh=aQDwjIsnLslr/gOkPenV5IwzLpBOT2EwmTrqX/lZ8G0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ufJLuqAw1aUpDlFUA+F6U8/55i6R2O12FL1kBNWXvtLoJNT1JF8h3Rk01UOPkqCCY
	 bvfSSkoEiDt4NgBvqmJk3iidgvqF6Rn5Jb9MNxrczjr1VqKQhbsqArLq6GSe+XSbR5
	 TIWRj2Z9SyjXuaIZO6YbW6EHYs/UYKG675QRGcSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11217F80213;
	Thu,  9 Apr 2020 20:44:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E339F801F9; Thu,  9 Apr 2020 20:44:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E58D1F80107
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 20:44:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E58D1F80107
IronPort-SDR: RDgqFgM5fWHr+u6EoDLnxxjaL3Wl0169+BeR6gSYRXcPdgcGSbs+FcGbW9pJKn73mieUWw9wYa
 m/Vcws1ia+tw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 11:44:30 -0700
IronPort-SDR: pkUMwMfkcdABUtYKWuZI3d7OJ+B+mp7djG/70W2U4v2xw74XqkHcgt3ttTQUxLEE2CzDuYpKAC
 EaiToY5axIug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; d="scan'208";a="251981334"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
 by orsmga003.jf.intel.com with ESMTP; 09 Apr 2020 11:44:29 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] ASoC: SOF: adjust dmesg verbosity
Date: Thu,  9 Apr 2020 13:44:12 -0500
Message-Id: <20200409184416.15591-1-pierre-louis.bossart@linux.intel.com>
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

Decrease the dmesg verbosity to remove unnecessary logs on SoundWire
platforms, and conversely add more information to help the community
and downstream distros with HDaudio/SOF support (DMIC detection and card
instanciation are the most prevalent issues on GitHub).

Pierre-Louis Bossart (3):
  ASoC: codecs: rt1308-sdw: reduce verbosity
  ASoC: SOF: Intel: hda: reduce verbosity on SoundWire detection
  ASoC: SOF: Intel: hda: log number of microphones detected in NHLT
    tables

Ranjani Sridharan (1):
  ASoC: soc-core: Add dynamic debug logs in soc_dai_link_sanity_check()

 sound/soc/codecs/rt1308-sdw.c |  4 ++--
 sound/soc/soc-core.c          | 18 +++++++++++++++---
 sound/soc/sof/intel/hda.c     | 10 ++++++----
 3 files changed, 23 insertions(+), 9 deletions(-)


base-commit: dd8e871d4e560eeb8d22af82dde91457ad835a63
-- 
2.20.1

