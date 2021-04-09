Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C201D35A889
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Apr 2021 00:03:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A799167D;
	Sat, 10 Apr 2021 00:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A799167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618005785;
	bh=WQx0ka2Wi1uIADmhZiDHECsmbc0jX5kONjkDxrWjm7M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LqiYSYzmxQ4/ajC+Eg/Iytowmf2+3wmYsdOQFk+wYwqV4EmgV3EMA4Ut8XYDKenig
	 25GFSMPbL+EVqq+c0hVg3N+ml1H058M7u0sC5AK4ggZSN3nZmou/leDbAU/0bKhloz
	 zj/sDyt8QAz3C/U7u3vfJoKwUZPhTBSQ/rWuqlvY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0733F8016D;
	Sat, 10 Apr 2021 00:01:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D85F5F8016A; Sat, 10 Apr 2021 00:01:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9196EF800EE
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 00:01:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9196EF800EE
IronPort-SDR: 3n9Gl4XDZVTFOFI1w5VFh6JU7dem32x2FIHA14WkrrA9DN0pQhq+djsEX0x/CFbo19qDnaYhAj
 ARsXb0uxRfHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9949"; a="255178278"
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; d="scan'208";a="255178278"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 15:01:28 -0700
IronPort-SDR: GtcrCU1JxpdNFUuoLHkdH9my3js9dz4+AshS/PFqiHalq+7benscPeVOCMA2+oDDhsiYeNzut8
 2QkuYDoyv2Pg==
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; d="scan'208";a="599290584"
Received: from ukorat-mobl2.amr.corp.intel.com (HELO rsridh-mobl1.localdomain)
 ([10.212.104.152])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 15:01:28 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/6] ASoC: SOF: simplify nocodec mode
Date: Fri,  9 Apr 2021 15:01:15 -0700
Message-Id: <20210409220121.1542362-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

This set of patches simplify the implementation
of nocodec mode in SOF.

Pierre-Louis Bossart (6):
  ASoC: SOF: add Kconfig option for probe workqueues
  ASoC: soc-acpi: add new fields for mach_params
  ASoC: SOF: change signature of set_mach_params() callback
  ASoC: SOF: Intel: update set_mach_params()
  ASoC: SOF: pcm: export snd_pcm_dai_link_fixup
  ASOC: SOF: simplify nocodec mode

 include/sound/soc-acpi.h  |  4 ++++
 include/sound/sof.h       |  3 ---
 sound/soc/sof/Kconfig     | 11 +++++++++++
 sound/soc/sof/intel/bdw.c |  8 ++++++--
 sound/soc/sof/intel/byt.c | 22 +++++++++++++---------
 sound/soc/sof/intel/hda.c |  8 ++++++--
 sound/soc/sof/intel/hda.h |  2 +-
 sound/soc/sof/nocodec.c   | 39 +++++++++++++++++++++------------------
 sound/soc/sof/ops.h       |  6 ++----
 sound/soc/sof/pcm.c       |  1 +
 sound/soc/sof/sof-audio.c | 34 +++++++++++++++-------------------
 sound/soc/sof/sof-priv.h  |  2 +-
 12 files changed, 81 insertions(+), 59 deletions(-)

-- 
2.25.1

