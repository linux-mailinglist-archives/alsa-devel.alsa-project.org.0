Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5D72B0A03
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 17:32:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE56117FE;
	Thu, 12 Nov 2020 17:31:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE56117FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605198758;
	bh=2/zkGvsUjsO41G8RfGBNlfkmQxUYII8roOJSATpFdTk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HD7NLRbsPRB5vucc0KNpyKwMtw27rKYD+OewQd4qz8jrfs4QvC1a8PqXjTDwxeAMP
	 zrgX/ZU2jUykDDjktuCXSM2e8ZHJPvNgEX5p+YNIt7jmAq/1QvRnW0PHP3XL4TcOkn
	 7d3POQc5xs3dMLO3qT0SZh4yEBbV0Ybmo6qkyJo0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDB1BF804CB;
	Thu, 12 Nov 2020 17:30:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E318F804C1; Thu, 12 Nov 2020 17:30:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC211F80161
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 17:30:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC211F80161
IronPort-SDR: Rm/sXEcpGHZOkkOwXEYHjKCdZ4gNi5WKw5uyBiDnfWUPz4R+TLceHNH0sbGjiKJD+nuQNhoeed
 HBgz33SRAuFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="157355216"
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="157355216"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 08:30:03 -0800
IronPort-SDR: PfevpJ+ROe/q6vYLS614n9L5Nk+kpFK8bbZCFyawdxWnN46/oUJzp9SSFTJkQPg/mmkVsGEo9k
 OfoGopOX/zLw==
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="357147657"
Received: from nsalmulx-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.36.117])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 08:30:03 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH RESEND 0/3] alsa-lib/ASoC: use inclusive language for
 bclk/fsync/topology
Date: Thu, 12 Nov 2020 10:29:37 -0600
Message-Id: <20201112162940.4970-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, broonie@kernel.org,
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

This patchset is just a rebase of the code suggested in September [1],
resent for convenience for comparison with kernel patches.

The SOF (Sound Open Firmware) tree contains a lot of references in
topology files to 'codec_slave'/'codec_master' terms, which in turn
come from alsa-lib and ALSA/ASoC topology support at the kernel
level. These terms are no longer compatible with the guidelines
adopted by the kernel community [2], standard organizations, and need
to change in backwards-compatible ways.

The main/secondary terms typically suggested in guidelines don't mean
anything for clocks, this patchset suggests instead the use of
'provider' and 'consumer' terms, with the 'codec' prefix kept to make
it clear that the codec is the reference. The CM/CS suffixes are also
replaced by CP/CC.

It can be argued that the change of suffix is invasive, but finding a
replacement that keeps the M and S shortcuts has proven difficult in
quite a few contexts.

The previous definitions are kept for backwards-compatibility so this
change should not have any functional impact. It is suggested that new
contributions only use the new terms but there is no requirement to
transition immediately to the new definitions for existing code. Intel
will however update all its past contributions related to bit
clock/frame sync configurations immediately.

This patchset contains the alsa-lib changes only, the kernel changes
will be shared in a different patchset. The SOF firmware changes are
already applied, only topology-related changes will be modified after
alsa-lib changes.

Feedback welcome
~Pierre

[1] https://mailman.alsa-project.org/pipermail/alsa-devel/2020-September/174387.html
[2] https://lkml.org/lkml/2020/7/4/229

Changes since RFC:
replaced 'follower' by 'consumer' as suggested by Jaroslav and Marc
minor cleanups

Pierre-Louis Bossart (3):
  topology: use inclusive language for bclk
  topology: use inclusive language for fsync
  topology: use inclusive language in documentation

 include/sound/uapi/asoc.h | 22 +++++++-----
 include/topology.h        |  8 ++---
 src/topology/pcm.c        | 75 +++++++++++++++++++++++++++------------
 3 files changed, 71 insertions(+), 34 deletions(-)

-- 
2.25.1

