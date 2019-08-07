Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB4F84F65
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 17:04:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E39584B;
	Wed,  7 Aug 2019 17:03:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E39584B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565190242;
	bh=CTNHz+6YvzFb3QWa2QVUROcTYIm4icQ67WbOya1Ak1M=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AX7skD0NOMfKZJYMYIqfNZWjn/33A/7C0yL9MKC1caMRjh96gYXHb8aS0Y65U/+Ft
	 Dq737fKWAlVHflOem538tQua3psZyY5f0YWy04JS2plpecZ4uqLy62wqmHvQc1s5Lw
	 A6mgDwN4u0Ahsdo8lUlX6U1yZn9bD2teP6ZRf/qI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D882F804CA;
	Wed,  7 Aug 2019 17:02:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5C34F80290; Wed,  7 Aug 2019 17:02:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC296F800E4
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 17:02:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC296F800E4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2019 08:02:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,357,1559545200"; d="scan'208";a="182305850"
Received: from knguye7-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.255.81.127])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Aug 2019 08:02:09 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  7 Aug 2019 10:01:57 -0500
Message-Id: <20190807150203.26359-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 0/6] ASoC: SOF: refactor duplicated code
	between Intel and i.MX8
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

During the initial i.MX patch reviews on GitHub, we realized a lot of
the i.MX mailbox/window code was common with the Intel loader code
except for a couple of offsets. Most of the credit goes to Daniel
Baluta for working on this series which adds a better abstraction and
reduces code duplication. Comments from Keyon and Ranjani helped
remove unnecessary parts kept for historical reasons and improve the
code overall.

Daniel Baluta (6):
  ASoC: SOF: Remove call to snd_sof_dsp_mailbox_init
  ASoC: SOF: Introduce snd_sof_dsp_get_mailbox_offset
  ASoC: SOF: Introduce snd_sof_dsp_get_window_offset
  ASoC: SOF: Intel: byt: Refactor fw ready / mem windows creation
  ASoC: SOF: Intel: bdw: Use generic function for fw ready / mem windows
    creation
  ASoC: SOF: Intel: hda: Use generic function for fw ready / mem windows
    creation

 sound/soc/sof/intel/apl.c     |   4 +-
 sound/soc/sof/intel/bdw.c     | 161 +++-----------------------------
 sound/soc/sof/intel/byt.c     | 169 ++++------------------------------
 sound/soc/sof/intel/cnl.c     |   4 +-
 sound/soc/sof/intel/hda-ipc.c | 150 +-----------------------------
 sound/soc/sof/intel/hda.h     |   4 +-
 sound/soc/sof/loader.c        | 168 +++++++++++++++++++++++++++++++++
 sound/soc/sof/ops.h           |  18 ++++
 sound/soc/sof/sof-priv.h      |   6 ++
 9 files changed, 237 insertions(+), 447 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
