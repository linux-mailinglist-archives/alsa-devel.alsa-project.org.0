Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E66D340C054
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 09:19:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7056417E9;
	Wed, 15 Sep 2021 09:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7056417E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631690377;
	bh=yX+XNqeb5s0sMkmQXK/Nri9WwtPPZqo2wrxphZRbh6s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mPSILfUuHddPxnZN+LaSrUo5Ix6qlotoG98tCHS68gznHO9CESfC+9gYNEjl5xFwk
	 VUvSxhm0i2SQkxvwcqkGe9dcqVrtWyGVZFpS75I4guJue11jgCZNdvoOepCKs4KMT9
	 XRJqBEUOiiOzzHFjTIlRRxjr6W3uSyOT1rew4WSs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC1E0F802E8;
	Wed, 15 Sep 2021 09:18:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD4B6F802E8; Wed, 15 Sep 2021 09:18:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F061F800EF
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 09:18:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F061F800EF
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="285934957"
X-IronPort-AV: E=Sophos;i="5.85,294,1624345200"; d="scan'208";a="285934957"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 00:18:09 -0700
X-IronPort-AV: E=Sophos;i="5.85,294,1624345200"; d="scan'208";a="544654675"
Received: from msavu-mobl1.ti.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.216.36])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 00:18:07 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 0/3] ASoC: SOF: Intel: hda: Cleanups for local function uses
Date: Wed, 15 Sep 2021 10:18:02 +0300
Message-Id: <20210915071805.5704-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

Small cleanups regarding to HDA function locations and dropping of definitions
of not implemented functions.

Regards,
Peter
---
Peter Ujfalusi (3):
  ASoC: SOF: Intel: hda-dsp: Declare locally used functions as static
  ASoC: SOF: Intel: hda: Remove boot_firmware skl and iccmax_icl
    declarations
  ASoC: SOF: Intel: hda: Relocate inline definitions from hda.h to hda.c
    for sdw

 sound/soc/sof/intel/hda-dsp.c | 61 +++++++++++++++++------------------
 sound/soc/sof/intel/hda.c     | 33 ++++++++++++++++++-
 sound/soc/sof/intel/hda.h     | 41 -----------------------
 3 files changed, 62 insertions(+), 73 deletions(-)

-- 
2.33.0

