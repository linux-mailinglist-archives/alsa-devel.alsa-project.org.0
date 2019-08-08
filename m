Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E79A85F7F
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 12:26:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C51611615;
	Thu,  8 Aug 2019 12:25:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C51611615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565259980;
	bh=gFxNLUBZPXGq7cm3i9mFrEsT1qAPanwfj5UGUxcdhX4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pykuEYGNaI6mbGKlKriV3Qb8rxoZ9RW/P+6UftNW/cvQ1LncaK+JmFYqSrHfOvrEH
	 CGHfQwobdtYmXTNbdXT9zvWv7kneSK/8uv6NKyj5R5qcTA478S19OscRkT5Ak3HlQX
	 eBupdyl1FbWtbsHqfj6Yb1C7Ef7yS/+8CQF82RGE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00536F800E4;
	Thu,  8 Aug 2019 12:24:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D920F80534; Thu,  8 Aug 2019 12:24:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21346F800E4
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 12:24:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21346F800E4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 03:24:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,360,1559545200"; d="scan'208";a="203526208"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2019 03:24:24 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu,  8 Aug 2019 12:24:03 +0200
Message-Id: <20190808102403.16541-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH v4 0/2] ASoC: Intel: Skylake: large_config_get
	overhaul
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

LARGE_CONFIG_GET is among the most crucial IPCs. Host is expected to
send single request first to obtain total payload size from received
header's data_off_size. From then on, it loops for each frame exceeding
inbox size until entire payload is read. If entire payload is contained
within the very first frame, no looping is performed.

LARGE_CONFIG_GET is a flexible IPC, it not only receives payload but may
carry one with them to provide list of params DSP module should return
info for. This behavior is usually reserved for vendors and IPC handler
should not touch that content. To achieve that, simply pass provided
payload and bytes to sst_ipc_tx_message_wait as a part of request.

In current state, LARGE_CONFIG_GET message handler does nothing of that,
in consequence making it dysfunctional. Overhaul said handler allowing
rightful king of IPCs to return back on his throne - kingdom he shares
with his twin brother: LARGE_CONFIG_SET.

The looping has not been added in this update as payloads of such size
do not exist in practice. Will need to create custom module specifically
for that very case and test against it before that feature can be added.

Changes since v3:
- Split "large_config_get overhaul" patch into two segments as suggested
  by Pierre: first remove looping, then adjust function's behavior

Changes since v2:
- None, just for-next rebase

Changes since v1:
- None, just for-next rebase

Cezary Rojewski (2):
  ASoC: Intel: Skylake: Limit large_config_get to single frame
  ASoC: Intel: Skylake: large_config_get overhaul

 sound/soc/intel/skylake/skl-messages.c |  3 +-
 sound/soc/intel/skylake/skl-sst-ipc.c  | 54 +++++++++++---------------
 sound/soc/intel/skylake/skl-sst-ipc.h  |  3 +-
 3 files changed, 27 insertions(+), 33 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
