Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5B7417BC9
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Sep 2021 21:26:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 214771658;
	Fri, 24 Sep 2021 21:25:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 214771658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632511566;
	bh=cuQCPWSKlipuSL0UnujDeAGVJCMYHyZX4mngLYbv6nE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K64X2jd0cevrdHKWFs2lCpSeok84Zo83N4uj81AGHl83++uposT5cuZwAAgEx7KtI
	 ZjCmqTDy8NXXzp+asPT+qZDnieI/oGBeIMX5CwxVjgjrHOILeLDhZmT1IpztZBuVuV
	 Wd+383fSGTBCwR3hgLW24jgmatn5xf4y8YDPLjvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75F6AF804CA;
	Fri, 24 Sep 2021 21:24:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF8D6F802A0; Fri, 24 Sep 2021 21:24:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFA9DF8013F
 for <alsa-devel@alsa-project.org>; Fri, 24 Sep 2021 21:24:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFA9DF8013F
X-IronPort-AV: E=McAfee;i="6200,9189,10117"; a="203643399"
X-IronPort-AV: E=Sophos;i="5.85,320,1624345200"; d="scan'208";a="203643399"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2021 12:24:37 -0700
X-IronPort-AV: E=Sophos;i="5.85,320,1624345200"; d="scan'208";a="551922484"
Received: from bordone-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.164.235])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2021 12:24:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 0/4] ALSA: hda: potential hdac_stream locking issues?
Date: Fri, 24 Sep 2021 14:24:13 -0500
Message-Id: <20210924192417.169243-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>,
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

While reviewing the HDAudio DMA handling, I found a number of
inconsistencies in how spin_locks are used. It's not clear what the
HDaudio bus->reg_lock is supposed to protect. In most cases only the
writes to specific boolean status flags are protected, and there are
multiple cases of taking the lock after testing a status flag.

This patchset suggests a more consistent locking pattern, but it's
entirely possible that the bus->reg_lock is only intented to protect
register read/write access on the HDaudio bus, and not the status
flags, and that this entire piece of code is completely
over-engineered.

On the Intel side no one knows why this spinlock was used, the reasons
are lost to history. I set the 'RFC' status on purpose in the hope
that Takashi might recall what this lock is supposed to protect. The
diff format makes this patchset difficult to review, it's recommended
to apply the patches and look at entire functions with changes to get
a better idea of the suggested changes.

Pierre-Louis Bossart (4):
  ALSA: hda: hdac_stream: fix potential locking issue in
    snd_hdac_stream_assign()
  ALSA: hda: hdac_stream: reset assigned_key in stream_release()
  ALSA: hda: hdac_ext_stream: fix potential locking issues
  ASoC: SOF: Intel: hda-dai: fix potential locking issue

 include/sound/hdaudio_ext.h     |  2 ++
 sound/hda/ext/hdac_ext_stream.c | 46 ++++++++++++++++++++-------------
 sound/hda/hdac_stream.c         |  5 ++--
 sound/soc/sof/intel/hda-dai.c   |  7 ++---
 4 files changed, 37 insertions(+), 23 deletions(-)

-- 
2.25.1

