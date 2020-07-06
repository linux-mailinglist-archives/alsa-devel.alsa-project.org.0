Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D7D215525
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jul 2020 12:09:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 584CC166E;
	Mon,  6 Jul 2020 12:08:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 584CC166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594030162;
	bh=oG+8HAVrb2upC3JgyqQIt9ArocdSJ7xbK0CrH8HcJRU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vjcL+LfNZwNE2TE0/pKSkhmgWNJrhch5Bo9R/B+LYfWRWd50qcqOrPHfQ9OsWu0/f
	 zxiC+yV95SRtL+7Xjaa3/zMUuxgj5remeQNkRTsa67G2ucl4F/8b3gnUgogaWjkioZ
	 suptXAbx0XtWNJDtNlba7KA5cHMHx3W+YpXpxDIw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FA64F8015C;
	Mon,  6 Jul 2020 12:07:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F390F80125; Mon,  6 Jul 2020 12:07:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F45DF80125
 for <alsa-devel@alsa-project.org>; Mon,  6 Jul 2020 12:07:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F45DF80125
IronPort-SDR: WKue/+98Wxje6Az0CZUh9Ji+go63b6BcAxjxApndn1er7Dv2M8750AMuG8CXIJeVGhD3KRo7RF
 n0se1Qhips9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9673"; a="135637956"
X-IronPort-AV: E=Sophos;i="5.75,318,1589266800"; d="scan'208";a="135637956"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 03:07:31 -0700
IronPort-SDR: ETlREV+x03q2mRdfqodGEHhNZ10wOLjlwd86bZ0NcbJafepDGNsOeLyvOqtYFr7HjvpTkiSdQO
 NY3UCa3Z/ugg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,318,1589266800"; d="scan'208";a="313912979"
Received: from test-hp-compaq-8100-elite-cmt-pc.igk.intel.com ([10.237.149.93])
 by orsmga008.jf.intel.com with ESMTP; 06 Jul 2020 03:07:30 -0700
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 00/10] topology: decode: Various fixes
Date: Mon,  6 Jul 2020 11:05:53 +0200
Message-Id: <1594026363-30276-1-git-send-email-piotrx.maziarz@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Cc: cezary.rojewski@intel.com, amadeuszx.slawinski@intel.com
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

Changelog:
v2:
  -Divide into more patches, critical fixes are in separate patches now
  -More specific descriptions
  -Fix a typo UML to UCM
  -Add error reporting in topology: decode: fix channel map memory
   allocation
  -Remove goto again in topology: Make buffer for saving dynamic size
   for better readability

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

