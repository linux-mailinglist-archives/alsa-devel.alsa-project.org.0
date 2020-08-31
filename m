Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 474E1257610
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 11:09:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA6681812;
	Mon, 31 Aug 2020 11:09:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA6681812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598864998;
	bh=89joR9/zpS8vilsluG36LHWRh7mlloqkuZvMn2ar180=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KQ2aSNxs4xQLi5K05X+5309k+ja9j+TVLTgQ6d9XWgQCAVkP8wvRdOtG3neO4aUiz
	 X7Hfl9iKYheDMndo5zzt2dEN2Stff3qm5gPMjkkQ+4B1z+seT43JojGZlyv8glYLwr
	 8wnJf3qDOUW+kVz36PLTHtwCqsNjwPAC7a7+5Bdc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3763F802A2;
	Mon, 31 Aug 2020 11:08:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE57BF80058; Mon, 31 Aug 2020 11:08:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61E4CF80058
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 11:08:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61E4CF80058
IronPort-SDR: 9xC4f+OC/zE3KP+ClodmllCh/2WECOYM9fezjF3YSVX3knVaLKpzrLD1Aw2fZ7sZt1EjgoRBnw
 85PVsIMWSknA==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="136466734"
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; d="scan'208";a="136466734"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 02:08:02 -0700
IronPort-SDR: D4z0tz07zkxSZioXaXoHSAbsy2AkrfyKp6rKLHo3rJ8+jVWrOWqZxfnkothUuZrzZPKVcJuH7x
 2qci4NxCFfsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; d="scan'208";a="314286851"
Received: from test-hp-compaq-8100-elite-cmt-pc.igk.intel.com ([10.237.149.93])
 by orsmga002.jf.intel.com with ESMTP; 31 Aug 2020 02:08:00 -0700
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 00/10] topology: decode: Various fixes
Date: Mon, 31 Aug 2020 11:08:53 +0200
Message-Id: <1598864943-22883-1-git-send-email-piotrx.maziarz@linux.intel.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com,
 amadeuszx.slawinski@linux.intel.com, tiwai@suse.com
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

This series fixes various problems with topology decoding mechanism.
Some of the problems were critical like improper memory management or
infinite loops that were causing undefined behaviour or program crashes,
while other resulted in losing some data during conversion.

Bugs found while testing with Intel SST topologies.

Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Changelog:
v2:
  -Divide into more patches, critical fixes are in separate patches now
  -More specific descriptions
  -Fix a typo UML to UCM
  -Add error reporting in topology: decode: fix channel map memory
   allocation
  -Remove goto again in topology: Make buffer for saving dynamic size
   for better readability

v3:
  -No functional changes
  -Changed UCM to more descriptive standard ALSA configuration files
  -removed Gerrit's Change-Id
  -Added missing signed-offs

v4:
  -Resend, added Reviewed-by tags

Piotr Maziarz (10):
  topology: decode: Fix channel map memory allocation
  topology: decode: Fix infinite loop in decoding enum control
  topology: decode: Remove decoding  values for enum control
  topology: decode: Add enum control texts as separate element
  topology: decode: Fix printing texts section
  topology: decode: Change declaration of enum decoding function
  topology: decode: Fix decoding PCM formats and rates
  topology: decode: Print sig_bits field in PCM capabilities section
  topology: decode: Add DAI name printing
  topology: Make buffer for saving dynamic size

 src/topology/ctl.c        | 51 ++++++++++++++++++++++-------------------------
 src/topology/dapm.c       |  3 +--
 src/topology/pcm.c        | 11 +++++++---
 src/topology/save.c       | 34 ++++++++++++++++++++++++++-----
 src/topology/text.c       |  2 +-
 src/topology/tplg_local.h |  2 +-
 6 files changed, 64 insertions(+), 39 deletions(-)

-- 
2.7.4

