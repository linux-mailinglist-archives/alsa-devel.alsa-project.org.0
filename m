Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF8547807F
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 00:25:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCFE52804;
	Fri, 17 Dec 2021 00:25:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCFE52804
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639697158;
	bh=nxMzOaeGR2EfDithtS92f2IEOx9xOqnXotIh8ZbMYnE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kurFWAu7dOi7rqAsseXyOldKaq7LHho84+w+376bd6r3qM+kgjwx8pKncLdx8kcAR
	 6SwicBZX3mPf83IyQ95eorP01oI4nRfIcIOYdE64QNfVqjxNKbk0Pg1mpucqVE+hJh
	 tDr0nkJXq2qlHQILUPhCrJYfF9NCQmCsE/Npw7i8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5ED63F8014C;
	Fri, 17 Dec 2021 00:24:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42B1AF8014C; Fri, 17 Dec 2021 00:24:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85435F800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 00:24:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85435F800B0
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="239439655"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="239439655"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 15:24:42 -0800
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="605702532"
Received: from priyosmi-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.100.174])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 15:24:42 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ASoC: SOF: couple of cleanups
Date: Thu, 16 Dec 2021 17:24:19 -0600
Message-Id: <20211216232422.345164-1-pierre-louis.bossart@linux.intel.com>
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

Guennadi spotted inconsistencies with our 'const' handling, Ajit Kumar
flagged a missing check for a null pointer and we missed the
definition of debug zones.

This should be queued for 5.17.

Ajit Kumar Pandey (1):
  ASoC: SOF: ipc: Add null pointer check for substream->runtime

Guennadi Liakhovetski (1):
  ASoC: SOF: avoid casting "const" attribute away

Karol Trzcinski (1):
  ipc: debug: Add shared memory heap to memory scan

 include/sound/sof/debug.h  |  2 ++
 sound/soc/sof/amd/renoir.c |  7 +++--
 sound/soc/sof/intel/atom.c | 13 +++++----
 sound/soc/sof/intel/atom.h |  4 +--
 sound/soc/sof/intel/bdw.c  | 11 +++----
 sound/soc/sof/intel/hda.c  | 60 ++++++++++++++++++--------------------
 sound/soc/sof/intel/hda.h  |  4 +--
 sound/soc/sof/ipc.c        |  3 +-
 sound/soc/sof/ops.h        |  8 +++--
 sound/soc/sof/sof-audio.c  |  9 +++---
 sound/soc/sof/sof-priv.h   |  4 +--
 11 files changed, 66 insertions(+), 59 deletions(-)

-- 
2.25.1

