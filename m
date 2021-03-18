Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A713409B0
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 17:09:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB04C169A;
	Thu, 18 Mar 2021 17:08:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB04C169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616083784;
	bh=r6oH2MlozEUiXnczTdoDAtdU88+YSt1xuhcRMdNkHXs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vrY/kD1tEbnDjR38d5NeplBX/pwHI0UYjHR8xvaCsM2fsPCsVMa2b8hW8G81KJBOx
	 Uk1s9gQbUbwZMoznkPG1nu1OSrAaSI9skOGB3A+tNL5whm+OBEUPXyukJcHa837dm/
	 CturXmFTJPd/wDBHXeBkZ7bljMnMx1mbv6Xe3uM0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACF54F80224;
	Thu, 18 Mar 2021 17:08:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05FF3F80124; Thu, 18 Mar 2021 17:08:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63F93F80124
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 17:08:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63F93F80124
IronPort-SDR: kgo1kIwxobd6xV+ElqUMmI3U/ljCKIU4csedECI0ydvti1e3ksOUKNgZwqq/zfAJp1STJkxBUt
 VKVQF8C2FGAw==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="186360107"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="186360107"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 09:07:56 -0700
IronPort-SDR: RgnhQZAw2paLgJLNe411KbBwiuaqqnXFGCNNA+rxArjGm7wmtqeE34TyJpWwxlxtFJDGTPMQU2
 ANDJschbuFTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="413142051"
Received: from pi-desktop.igk.intel.com ([10.237.148.102])
 by orsmga008.jf.intel.com with ESMTP; 18 Mar 2021 09:07:54 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 0/3] Fix SND_HDA_PREALLOC issue
Date: Thu, 18 Mar 2021 17:06:15 +0100
Message-Id: <20210318160618.2504068-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

For context it started with user reporting failures when running arecord
without any error or warning in dmesg (after fixing some configuration
problems thet they had).
https://bugzilla.kernel.org/show_bug.cgi?id=201251#c279

After spending time investigating the issue it was narrowed to quite big
setting of CONFIG_SND_HDA_PREALLOC_SIZE (4096).
When looking at code
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/core/pcm_memory.c?id=6417f03132a6952cd17ddd8eaddbac92b61b17e0#n30
there is a limit of memory per card:
max_alloc_per_card = 32UL * 1024UL * 1024UL

When SND_HDA_PREALLOC_SIZE is set to 4096 it only has memory to alloc
for 8 frontends, while Skylake HDA card has 10 of them (6 playback and 4
capture), so preallocated memory is exhausted while probing. In
consequence 2 of FEs end without allocated memory.

It can be workarounded on user side with setting SND_HDA_PREALLOC_SIZE
to lower value, other is changing memory limit per card.

However in order to not waste user memory, change maximum allocation
size on HDA controller to 4MB and force automatical memory allocation
insted of preallocated one.

First patch adds prints, so similar issues can be easily identified in
the future.
Second changes maximum size of hda buffer to reasonable value of 4MB.
And last one reverts patch which allowed setting prealloc size on X86
platforms.

Amadeusz Sławiński (3):
  ALSA: pcm: Add debug print on memory allocation failure
  ALSA: hda: Change AZX_MAX_BUF_SIZE from 1GB to 4MB
  ALSA: hda: Revert "ALSA: hda: Allow setting preallocation again for
    x86"

 include/sound/hda_register.h | 8 ++++++--
 sound/core/pcm_memory.c      | 8 ++++++++
 sound/hda/Kconfig            | 7 +++----
 3 files changed, 17 insertions(+), 6 deletions(-)

-- 
2.25.1

