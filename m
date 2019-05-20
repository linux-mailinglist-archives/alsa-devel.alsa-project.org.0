Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F3B24178
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2019 21:48:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 891AA1615;
	Mon, 20 May 2019 21:47:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 891AA1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558381725;
	bh=gZQJhzY4fR5xRs3YI23TH0iwTKWw7/QdInx7gUSeZ2A=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JTYZFLUZqtQE+QuiqbJ9Z41Ld9Trem90BgLzuBDfWe3wQMdLX+ObUBqLre0lYG3NH
	 Fy/EvTzQTHzuglm80OUgTaVEXm2LLkptiSfetJtN8kNqZL9LoTVZhIDlQqxmjnSJUK
	 8U0ttZlgxTU4YcK/t1VapZehmjiuIfoVdRH7y9h0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24ED7F896E9;
	Mon, 20 May 2019 21:47:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61C9BF806E7; Mon, 20 May 2019 21:46:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C493CF806E7
 for <alsa-devel@alsa-project.org>; Mon, 20 May 2019 21:46:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C493CF806E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 May 2019 12:46:50 -0700
X-ExtLoop1: 1
Received: from nvkremer-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.207.212])
 by FMSMGA003.fm.intel.com with ESMTP; 20 May 2019 12:46:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 20 May 2019 14:46:40 -0500
Message-Id: <20190520194645.432-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 0/5] ASoC: Intel: fix rt5682-based machine
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

Also fix ACPI tables, quirks as needed, and add newlines for clarity

Changes since v1:
Split first patch in 3 (feedback from Mark). No code changes.

Sathya Prakash M R (4):
  ASoC: Intel: sof-rt5682: fix for codec button mapping
  ASoC: Intel: sof-rt5682: fix AMP quirk support
  ASoC: Intel: sof-rt5682: add newline for clarity
  ASoC: Intel: soc-acpi: Fix machine selection order

Yong Zhi (1):
  ASoC: Intel: glk_rt5682_max98357a: Remap button control-function

 sound/soc/intel/boards/glk_rt5682_max98357a.c     |  7 ++++---
 sound/soc/intel/boards/sof_rt5682.c               | 12 +++++++-----
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c | 10 +++++-----
 3 files changed, 16 insertions(+), 13 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
