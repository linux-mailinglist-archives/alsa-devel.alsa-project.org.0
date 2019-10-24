Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B44C6E3DF2
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 23:06:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44DC041;
	Thu, 24 Oct 2019 23:05:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44DC041
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571951164;
	bh=MxhEIJ9BFzQgQ1UcQltDUo4rEjlVq3iGQ4loh+sscGw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iCZVlgyW8ViX+kYaPuhfnlUmjmQ5Wf/GsjBn3jlf6wr/1df3M678broI6LWKSrdq0
	 sCEwPHEL6rqF3+yoNyKT1Y680Ysacu+4G3FsVHGm6Ny+OSclpVQY+mQQa54EJ4mmhp
	 Y9tIZlOPq9ymQJ3HZ7pOQR3GsQRzJdgd6nA9b4VI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB5C4F805FB;
	Thu, 24 Oct 2019 23:03:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85D95F8036E; Thu, 24 Oct 2019 23:03:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A4A1F80274
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 23:03:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A4A1F80274
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Oct 2019 14:03:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,226,1569308400"; d="scan'208";a="398553498"
Received: from ksengupt-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.138.183])
 by fmsmga005.fm.intel.com with ESMTP; 24 Oct 2019 14:03:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 24 Oct 2019 16:03:16 -0500
Message-Id: <20191024210318.30068-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 0/2] ASoC: SOF: make hw_info platform
	specific
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

The SOF core blindly sets the hw_info, when it should really be
platform-specific.

This move enable us to temporarily fix PulseAudio issues resulting
from inaccuracies in the hw_ptr position provided by the firmware on
Baytrail-Broadwell.

This is the first time we experiment with the GitHub low-level API to
automagically keep track of 'approvers' by inserting a Reviewed-by tag
when merging a pull-request, thanks to Ranjani for her initial work
and bearing with my habit of breaking things :-)

v2: make the code apply on Mark's tree. Sorry about that bad patch.

Pierre-Louis Bossart (2):
  ASoC: SOF: define INFO_ flags in dsp_ops
  ASoC: SOF: Intel: only support INFO_BATCH for legacy platforms

 sound/soc/sof/imx/imx8.c  |  7 +++++++
 sound/soc/sof/intel/apl.c |  7 +++++++
 sound/soc/sof/intel/bdw.c |  9 ++++++++-
 sound/soc/sof/intel/byt.c | 21 +++++++++++++++++++++
 sound/soc/sof/intel/cnl.c |  7 +++++++
 sound/soc/sof/pcm.c       |  8 +++-----
 sound/soc/sof/sof-priv.h  |  3 +++
 7 files changed, 56 insertions(+), 6 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
