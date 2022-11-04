Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 339E96196A5
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 13:57:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B80EDAEA;
	Fri,  4 Nov 2022 13:56:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B80EDAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667566629;
	bh=xKEKbJY7g0DcUG5t7lhojI0A3/JMIh2Ctib7f/4fwGI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JoS2qnfeBWxO8tyAmExSomikXnqRLXUHKA+ctZgXd5lPBW27Jsqfnihwkj5OLKq8Z
	 Jf8J57e76qGeL3InNddQ3IhsMjLUbGQxQUek4Y+SV0zWxD+ZEsMdOynNQkqeson3XL
	 dJaQunn1mdtpGBtlsYHb+XozhxRiEV/DWDfN2XCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AFEBF8049E;
	Fri,  4 Nov 2022 13:56:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C73BF80448; Fri,  4 Nov 2022 13:56:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
 RCVD_IN_ZEN_BLOCKED_OPENDNS, 
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 497D2F80155
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 13:56:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 497D2F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="h2ErOmKS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667566569; x=1699102569;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xKEKbJY7g0DcUG5t7lhojI0A3/JMIh2Ctib7f/4fwGI=;
 b=h2ErOmKSpHG6SPDeaAJ7FKpRYJF8S1rLdt8jfQoRjGw0NTEzvA11hO7W
 Di69C9Wx2KO/1l8LaFoRsqFhiHAu4c3Y/AT79p0PJ+3MAiwyOZkIX75PB
 KUbtXZDpuXB3CjGYqUeg4al+kZ1gLKXAHVjFP5pTBpeOGEekMN4OTBxvA
 VsBwdBFiMiz/oPp9jVwPALcp5IqKG4fzCJhqwiLTeTy9eaRcCgbk9aW3O
 cyww7dyLEQI1dvOR+uMnYH2Jyf23GtCf++e/4MsrZImVGbO3BqWqGRGKq
 F1WAm7+9Pvk3S38rR3DEONj7OUK5uQcEt75ShUcAxaLCBcUxR3cSOuwJa w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="311079741"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="311079741"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 05:55:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="666357602"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="666357602"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga008.jf.intel.com with ESMTP; 04 Nov 2022 05:55:38 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 0/3] ASoC: core: Suspend/resume error propagation
Date: Fri,  4 Nov 2022 14:12:41 +0100
Message-Id: <20221104131244.3920179-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Currently all erros encountered during suspend/resume are squelched
what limits the error-handling possibilities.

Patches found here combined together allow for those errors to be
propagated up. This aligns ASoC component's behavior with how
PM-framework handles suspend/resume for a device - there's always an
option for a client (driver) to return an error code in case of failure.

Amadeusz Sławiński (3):
  ASoC: component: Propagate result of suspend and resume callbacks
  ASoC: core: Inline resume work back to resume function
  ASoC: core: Propagate component suspend/resume errors

 include/sound/soc-component.h |  4 +-
 include/sound/soc.h           |  3 --
 sound/soc/soc-component.c     | 22 +++++++---
 sound/soc/soc-core.c          | 75 ++++++++++++++++-------------------
 4 files changed, 52 insertions(+), 52 deletions(-)

-- 
2.25.1

