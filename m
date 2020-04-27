Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D10B51B9A91
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 10:44:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 317351666;
	Mon, 27 Apr 2020 10:43:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 317351666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587977065;
	bh=oo9d4CuAmu9CeUNvpO3Gsy9twarzo4P3bzBUx8vd0kM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fWId4gQ6h6GAMLmdKZQGbRrqnb1GHj7ZZMmIiOyer2og3IegmmWW9tiOTidyvNSRw
	 E13YMSoSUKuL/wRpqf7CWdKi9rHKLF24/hzVZtkmhvGZJnKapVnh8dMsZbNVQh0XlX
	 B2yHLD44nVK2FcP6945Q56TNSMvs2QPcD2E63fsc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD36AF80245;
	Mon, 27 Apr 2020 10:43:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 552E5F8022B; Mon, 27 Apr 2020 10:43:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD93AF8010A
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 10:43:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD93AF8010A
IronPort-SDR: O6FvGHKhwTRhWmiP+mm8k5qoSV5Lmhcr9WORFUd1LEaL7uSFzziU31YcRc07w+bCjagxN4Jdws
 Dlb1mKYGhzog==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 01:43:21 -0700
IronPort-SDR: VemkF1BSfDr8+m1vWMNfQ9oiEJlrq/vAWoJMxvZNd9BMuLKnpgsOHprvrTtmARAJkjF4V+W02A
 +lmcugod51rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,323,1583222400"; d="scan'208";a="431673859"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.11])
 by orsmga005.jf.intel.com with ESMTP; 27 Apr 2020 01:43:18 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] add channel constraint for BDW machine drivers
Date: Mon, 27 Apr 2020 16:37:15 +0800
Message-Id: <1587976638-29806-1-git-send-email-brent.lu@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mac Chiang <mac.chiang@intel.com>,
 Mark Brown <broonie@kernel.org>, Brent Lu <brent.lu@intel.com>
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

The machine driver bdw-rt5650 (for Google buddy) supports 2 or 4-channel
recording while other two drivers support only 2-channel recording. HW
constraints are implemented to reflect the hardware limitation on BDW
platform.

Brent Lu (3):
  ASoC: bdw-rt5677: channel constraint support
  ASoC: bdw-rt5650: channel constraint support
  ASoC: broadwell: channel constraint support

 sound/soc/intel/boards/bdw-rt5650.c | 34 ++++++++++++++++++++++++++++++++++
 sound/soc/intel/boards/bdw-rt5677.c | 33 +++++++++++++++++++++++++++++++++
 sound/soc/intel/boards/broadwell.c  | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 100 insertions(+)

-- 
2.7.4

