Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A54E58F47E
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 21:26:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 357EC167D;
	Thu, 15 Aug 2019 21:25:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 357EC167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565897175;
	bh=8xEbllNfs4hh2xh3VJz0Z3QQeTjhikXf2Tg9Zj5ir+o=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pcyVd1NlmU2OcLaxSsakCLn+F4z+yPX/2a7KX8lML66yvcM+P2E3tCrnBb0t7y31s
	 5AzK5L94OsvjaZrvZlvkbf21W+qxkmKCJxIUJ0mjhR9wCdNg5bk07tufwlTEFQxKp/
	 CeEBDNegibX9JMRb518bKIRoJAB5IaC50MiYr0ZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C377F80290;
	Thu, 15 Aug 2019 21:22:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A828F804CA; Thu, 15 Aug 2019 21:22:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC325F80274
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 21:22:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC325F80274
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Aug 2019 12:20:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,389,1559545200"; d="scan'208";a="179457176"
Received: from smharb-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.255.228.248])
 by orsmga003.jf.intel.com with ESMTP; 15 Aug 2019 12:20:24 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 15 Aug 2019 14:20:14 -0500
Message-Id: <20190815192018.30570-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 0/4] ASoC: SOF: i.MX8 SAI and Intel
	ALH/SoundWire DAI support
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

This patchset adds the basic functionality to extract DAI information
from the topology and send the information to firmware.

The i.MX8 SAI/ESAI definitions are minimal placeholders for now, they
are included to keep the alignment with the firmware/topology.

For the Intel ALH, there is no specific configuration in topology
file, all the programming takes place based on the dai index and the
related ALH stream ID. The renaming from SoundWire to ALH (Audio Link
Hub) is a better representation of the hardware, the ALH acts as a
proxy between the DMA transfers and the Cadence IP.

Bard liao (1):
  ASoC: SOF: rename SOUNDWIRE to ALH

Daniel Baluta (1):
  ASoC: SOF: topology: Add dummy support for i.MX8 DAIs

Pierre-Louis Bossart (2):
  ASoC: SOF: topology: initial support for Intel ALH DAI type
  ASoC: SOF: pcm: add ALH support

 include/sound/sof/dai.h         |  4 +-
 include/uapi/sound/sof/tokens.h |  8 ++++
 sound/soc/sof/pcm.c             |  3 ++
 sound/soc/sof/topology.c        | 72 ++++++++++++++++++++++++++++++++-
 4 files changed, 85 insertions(+), 2 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
