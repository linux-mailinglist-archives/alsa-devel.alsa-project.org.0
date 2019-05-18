Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DBF2247D
	for <lists+alsa-devel@lfdr.de>; Sat, 18 May 2019 20:32:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 072991691;
	Sat, 18 May 2019 20:31:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 072991691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558204329;
	bh=5H/kQLfN/dEvGgRJmnX1Znalahg7NJKl+wYSExfafeM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uKK+i8Zu/UUS1sSjoVkzYNHGTl97xuZpNem5c2dKFcerHUiN4kxahUZ/xajfNHMye
	 JPVw9qJgfXAVFWUgt+7LDp4GRwE1u4hP6CSDgRUooiUv53g0rc3qgKNHc58OdWNSEy
	 lNvY3dOAzYU1NYA/sr80EKmYRfJOX97tLc2bKLCk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D0AAF896CB;
	Sat, 18 May 2019 20:30:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AE18F896CB; Sat, 18 May 2019 20:30:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BD6FF80C18
 for <alsa-devel@alsa-project.org>; Sat, 18 May 2019 20:30:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BD6FF80C18
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 May 2019 11:30:15 -0700
X-ExtLoop1: 1
Received: from darrenlp-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.186.92])
 by orsmga008.jf.intel.com with ESMTP; 18 May 2019 11:30:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Sat, 18 May 2019 13:30:06 -0500
Message-Id: <20190518183009.13359-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 0/3] ASoC: Intel: fix rt5682-based machine
	drivers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

We have two machine drivers based on rt5682 and they both need a
correction for the mapping of the buttons, the initial mapping taken
from the DA7219 is incorrect.

Also fix ACPI tables, quirks as needed.

Sathya Prakash M R (2):
  ASoC: Intel: sof-rt5682: Few minor fixes for AMP SSP and codec button
  ASoC: Intel: soc-acpi: Fix machine selection order

Yong Zhi (1):
  ASoC: Intel: glk_rt5682_max98357a: Remap button control-function

 sound/soc/intel/boards/glk_rt5682_max98357a.c     |  7 ++++---
 sound/soc/intel/boards/sof_rt5682.c               | 12 +++++++-----
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c | 10 +++++-----
 3 files changed, 16 insertions(+), 13 deletions(-)


base-commit: d0723c9d845f9a6ff1069e5786ccda8e81566763
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
