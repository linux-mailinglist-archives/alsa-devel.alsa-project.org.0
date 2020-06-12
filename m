Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A261F7E46
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 23:01:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 273091680;
	Fri, 12 Jun 2020 23:00:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 273091680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591995691;
	bh=bfwYPBCOJGzrVNURAzbYR0ul9IfrulZhwvYEQpnsp1M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cth9KKGnKkoafckVV64zBGw31wHmsztETcvb0VSfyb+by4FhTDOxZe1ZWnDTW1WPS
	 gUC4hL81asNwZ5kvUw/eZeKPa7QNIrFXD/jdWHymwuPICUYvc/bRm/2fAVWxuuOyME
	 hJFws4z9w24wcqjPcH8Qb98uERgO55O3O4NavE44=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53637F80228;
	Fri, 12 Jun 2020 22:59:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 449FCF8021E; Fri, 12 Jun 2020 22:59:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8E46F80058
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 22:59:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8E46F80058
IronPort-SDR: FmFALlh/Z3F/Ar8RFQLFJAvIx00dr9T2seUznvS9v0vBl0u/F1Fe7ySxfssTLa/2AwYtftHXwc
 z0H1TSyvdVAw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2020 13:59:41 -0700
IronPort-SDR: HSz8sc6NN+bEAE4w2XPiJOQIi1WM0fw5qi/ZRg+eL/jY0NAX2MVkM7sPvXtKSqkYJrIxB9xrGE
 6zjjWjG1hetw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,504,1583222400"; d="scan'208";a="272026623"
Received: from tcampell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.137])
 by orsmga003.jf.intel.com with ESMTP; 12 Jun 2020 13:59:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ASoC: topology: fix use-after-free when removing
 components
Date: Fri, 12 Jun 2020 15:59:36 -0500
Message-Id: <20200612205938.26415-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
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

This patchset fixes a memory allocation issue and removes a 100%
reproducible use-after-free report thrown by KASAN in automated module
removal tests across multiple platforms.

All the credit goes to Bard Liao for root-causing the issue. DAIs may
be registered at the same time as a component, or when the topology is
loaded. This two-step registration causes the memory for
topology-based DAIs to allocated last, and conversely to be released
first by devres, before the component is released and the DAIs removed
from the component DAI list with snd_soc_unregister_dais().

When we remove a component, by the time we walk through its dai list
to unregister all dais, the dais allocated by the topology have been
freed already by devres and the list is corrupted with pointers that
are no longer valid.

The suggestion is to add an explicit devm_ based registration for
topology-based dais, so that each dai is cleanly removed from the
component dai list in the release operation before devres releases the
allocated memory.

Pierre-Louis Bossart (2):
  ASoC: soc-devres: add devm_snd_soc_register_dai()
  ASoC: soc-topology: use devm_snd_soc_register_dai()

 include/sound/soc.h      |  4 ++++
 sound/soc/soc-devres.c   | 37 +++++++++++++++++++++++++++++++++++++
 sound/soc/soc-topology.c |  3 +--
 3 files changed, 42 insertions(+), 2 deletions(-)

-- 
2.20.1

