Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA374CDEF0
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 22:00:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B18401EDE;
	Fri,  4 Mar 2022 21:59:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B18401EDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646427616;
	bh=QED7ZVhjKqtqNrgAUqKRId7gCiZRUqlrig8eZyQ+HKk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uZCttAJRBeXRDWQpFv9xoIBhcNOyB/uB0Gizj7BDx/v1XqRpsNtWOHB8fcpCTf2wo
	 x/XLPO/Z91IHO+g27qnMnHDguQegD4pt0DZkX0Z0CmVFCMHsiZErKPorMUY7042zaU
	 /6LY5U9Og2S2YYlZ52sExF3EVWeefzu5ez0WtcgY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86E6FF80520;
	Fri,  4 Mar 2022 21:57:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DE4CF80224; Fri,  4 Mar 2022 21:57:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57BC4F80139
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 21:57:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57BC4F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fReBZUn9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646427466; x=1677963466;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QED7ZVhjKqtqNrgAUqKRId7gCiZRUqlrig8eZyQ+HKk=;
 b=fReBZUn9TSgAc73zBObGzKEwKXk3U3aDNXEkYcTzFd+rmJs6GsBkGkbf
 XvyuZY0DuZn/yJ0Ztj8kwjLWudxeAfJrTHAQ4PIMI1IXxMm6xhSAido01
 HwG5CGzZmh46xUG7iQoUEZRl0jBxm7+pDxCfKHqBDg9n82xWwertcwf0z
 mP+8B/saLi3tMoOuPX+yvShXj+oBQToT7RAAxEn8M3zIGpBmUNExhQKcL
 qBQKHbkZxQN07JN2OFVAfF5dB/Nr5fOGBw6sMz8dCec8sewze4GvX61BK
 x/+0eZgAl2T6buRkEhZbq+uC2W91txBUQffE8VvveNiuQ5yTW0cQSyrpo A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="340492542"
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="340492542"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:57:41 -0800
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="631271271"
Received: from grmundad-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.115.48])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:57:40 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/10] ASoC: SOF: updates for 5.18
Date: Fri,  4 Mar 2022 14:57:23 -0600
Message-Id: <20220304205733.62233-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

A couple of updates for Intel and AMD hardware, along with minor
cleanups

Ajit Kumar Pandey (4):
  ASoC: SOF: amd: Flush cache after ATU_BASE_ADDR_GRP register update
  ASoC: SOF: amd: Use semaphore register to synchronize ipc's irq
  ASoC: SOF: amd: Move group register configuration to acp-loader
  ASoC: SOF: amd: Increase ACP_HW_SEM_RETRY_COUNT value

Curtis Malainey (1):
  ASoC: SOF: fix 32 signed bit overflow

Gongjun Song (1):
  ASoC: SOF: Intel: pci-tgl: add RPL-S support

Peter Ujfalusi (2):
  ASoC: SOF: amd: acp-pcm: Take buffer information directly from runtime
  ASoC: SOF: amd: Do not set ipc_pcm_params ops as it is optional

Pierre-Louis Bossart (2):
  ASoC: SOF: debug: clarify operator precedence
  ASoC: SOF: Intel: hda: clarify operator precedence

 include/sound/sof/header.h         |  2 +-
 include/uapi/sound/sof/abi.h       |  2 +-
 sound/soc/sof/amd/acp-dsp-offset.h |  1 +
 sound/soc/sof/amd/acp-ipc.c        | 22 ++++++++++++++--------
 sound/soc/sof/amd/acp-loader.c     |  9 +++++++++
 sound/soc/sof/amd/acp-pcm.c        |  7 ++++---
 sound/soc/sof/amd/acp-stream.c     |  3 +++
 sound/soc/sof/amd/acp.c            | 29 ++++++++++++++---------------
 sound/soc/sof/amd/acp.h            |  3 +--
 sound/soc/sof/amd/renoir.c         |  1 -
 sound/soc/sof/debug.c              |  2 +-
 sound/soc/sof/intel/hda.c          |  2 +-
 sound/soc/sof/intel/pci-tgl.c      |  2 ++
 13 files changed, 52 insertions(+), 33 deletions(-)

-- 
2.30.2

