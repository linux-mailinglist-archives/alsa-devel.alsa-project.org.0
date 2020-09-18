Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D98A027084C
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 23:31:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75012168C;
	Fri, 18 Sep 2020 23:30:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75012168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600464705;
	bh=BbODXysvngekJJPn3DFokm1Bo0vSrPxkQWDW9oOTHiE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Qp/fldNz8jj2/ttmrlyZz9cA+BCQg6kuNZTnpS6iHFE5fBVq/bQ1FBUr6l4nNxGYv
	 418OzaGlu8kiReH2QNvGJvwp60YXh1jPfn8pKQWvNkksEqT5mVPepwKxaN8EVpZXug
	 yvqsrry1Br533oktg9qgZcdzpvZ+lnTQDLFm0bB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9333FF80150;
	Fri, 18 Sep 2020 23:29:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7B84F8015A; Fri, 18 Sep 2020 23:29:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E34CF80150
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 23:29:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E34CF80150
IronPort-SDR: IzywTtAoNGvuVWkR8M4C1N9KcePU1sas0GYqtxs7cXmS1/wZKIwC5V2UHG3aw2F9fM/QwxlgPT
 l/ZljPDJhNLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9748"; a="160953751"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="160953751"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 14:28:49 -0700
IronPort-SDR: UyeQ4D6v47HmtObiSPQUXLVl4yIpcaJVILb3wYs5droR9+f/ia/8rDuIvl2e2Tg3H2xrPpVXR7
 SU+6ns8d+Flg==
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="452919312"
Received: from msalazar-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.41.172])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 14:28:48 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] alsa-lib/ASoC: use inclusive language for
 bclk/fsync/topology
Date: Fri, 18 Sep 2020 16:28:29 -0500
Message-Id: <20200918212832.249184-1-pierre-louis.bossart@linux.intel.com>
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

The SOF (Sound Open Firmware) tree contains a lot of references in
topology files to 'codec_slave'/'codec_master' terms, which in turn
come from alsa-lib and ALSA/ASoC topology support at the kernel
level. These terms are no longer compatible with the guidelines
adopted by the kernel community [1] and need to change in
backwards-compatible ways.

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

This suggestion is easier to review first at the alsa-lib level, and
if agreed follow-up contributions for the Linux kernel [2] and SOF
firmware [3] will be provided.

Feedback welcome
~Pierre

[1] https://lkml.org/lkml/2020/7/4/229
[2] https://github.com/plbossart/sound/tree/fix/inclusive-language-bclk-fsync
[3] https://github.com/plbossart/sof/tree/fix/inclusive-language-bclk-fsync

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

