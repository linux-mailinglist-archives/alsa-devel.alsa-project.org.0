Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 123181B3128
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 22:26:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9624316BA;
	Tue, 21 Apr 2020 22:25:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9624316BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587500761;
	bh=GYjSt6TjrcpmdsJbh1Xw5miZ3VXgFpgUZwAVFYWVG2c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Wb3DaDqt5UVMqsyYFRGE2EgFFoVxHp6zim0Y2sofFN5UdXvtokGOyh8rwN5XJZ3Kl
	 hNYb6P3elA4KrUOsuKljpjHQHX+sM7qacim4PPb98jWRys7401XAF4ezOoyFXi6vZL
	 PcnfgpqHT+zUtbZbc/M5m9EcWFEtnoEVOQ/Z+FPY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C146F80143;
	Tue, 21 Apr 2020 22:24:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B139DF801EC; Tue, 21 Apr 2020 22:24:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDA94F8012F
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 22:24:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDA94F8012F
IronPort-SDR: JebOcSKBvsgjbFlIiISmAqVYGwrz30MkfQwaPYbmR6ChF8+pzvKRVWjIenxngGz7G5hqDY+BZk
 UlUJ9Mj8lQ5g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2020 13:24:10 -0700
IronPort-SDR: cS8398oXs+cZg7/dogqA3i1bzLFJSTd2Ep8foaw5L2Xq0REGGe9ChFlIhv7pCu+G3tUAc8KBkR
 0dKYiLswQJXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,411,1580803200"; d="scan'208";a="456236600"
Received: from mgorski-all-series.igk.intel.com ([10.237.149.201])
 by fmsmga005.fm.intel.com with ESMTP; 21 Apr 2020 13:24:07 -0700
From: Mateusz Gorski <mateusz.gorski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] Add support for different DMIC configurations
Date: Tue, 21 Apr 2020 22:25:15 +0200
Message-Id: <20200421202519.4008-1-mateusz.gorski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: cezary.rojewski@intel.com, Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 tiwai@suse.com
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

Set of patches to enable DMIC capture on different hardware
configurations.
Information about supported DMIC configuration is read from NHLT and
correct pipeline configuration is selected automatically.
Also, adding additional option for topology binary name which is
based on used machine driver.

Mateusz Gorski (4):
  ASoC: Intel: Skylake: Change the order of machine device and platform
    registration
  ASoC: Intel: Skylake: Add alternative topology binary name
  ASoC: Intel: Multiple I/O PCM format support for pipe
  ASoC: Intel: Skylake: Automatic DMIC format configuration according to
    information from NHLT

 include/uapi/sound/skl-tplg-interface.h |   2 +
 sound/soc/intel/skylake/skl-topology.c  | 189 +++++++++++++++++++++++-
 sound/soc/intel/skylake/skl-topology.h  |   1 +
 sound/soc/intel/skylake/skl.c           |  10 +-
 4 files changed, 192 insertions(+), 10 deletions(-)

-- 
2.17.1

