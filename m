Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 181FF232E57
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 10:19:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B2651758;
	Thu, 30 Jul 2020 10:19:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B2651758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596097190;
	bh=wCBhM3eEDNGCbwc1VQu0JwRFRi1K4tzSwJhX9oMHUDA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nnSpOQwL/jQKZ2b7hfIkdnXOI3OZ3/ZZwQYM0HyyT7kcOUV5jwYbJJoCrqDOPWiBV
	 I7lMrkSrafl4Oc5aGSEVFkMJ2Utr9+Lww99SEQEHm9/oLjXrgCcsmKZZsQIt0n8Yf3
	 QoLt8Q8gnojm5c4VuZVD3ExFflfpJwqLTolCIe48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65AE6F8021C;
	Thu, 30 Jul 2020 10:18:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84D5CF80240; Thu, 30 Jul 2020 10:18:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5267CF8021C
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 10:18:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5267CF8021C
IronPort-SDR: cMjRQmVNmvv1/r+ZQku11ytzrYEdUWaJbFsfAgob5o51ROMVThJQTtY6sF4pF851XuBdlMBU4M
 PLJbhIO3cjHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9697"; a="169678380"
X-IronPort-AV: E=Sophos;i="5.75,413,1589266800"; d="scan'208";a="169678380"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 01:18:13 -0700
IronPort-SDR: jaZKtJOdnhQfRkuwu/E9Qg3bLhMxpMW0GMvfkwl0ukZT/0OihGCwGi03VLxU4UV62TFSE26MZQ
 dXEpFnkQKRtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,413,1589266800"; d="scan'208";a="272863409"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.11])
 by fmsmga007.fm.intel.com with ESMTP; 30 Jul 2020 01:18:07 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/2] Add period size constraint for Atom Chromebook
Date: Thu, 30 Jul 2020 16:13:33 +0800
Message-Id: <1596096815-32043-1-git-send-email-brent.lu@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>, Daniel Stuart <daniel.stuart14@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Brent Lu <brent.lu@intel.com>, Damian van Soelen <dj.vsoelen@gmail.com>
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

Two different constraints are implemented: one is in platform's CPU
DAI to enforce period sizes which are already used in Android BSP. The
other is in Atom Chromebook's machine driver to use 240 as period size.

Changes since v1:
-Add comma at the end of media_period_size array declaration.

Brent Lu (1):
  ASoC: intel: atom: Add period size constraint

Yu-Hsuan Hsu (1):
  ASoC: Intel: Add period size constraint on strago board

 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 15 +++++++++++++++
 sound/soc/intel/boards/cht_bsw_max98090_ti.c | 14 +++++++++++++-
 sound/soc/intel/boards/cht_bsw_rt5645.c      | 14 +++++++++++++-
 3 files changed, 41 insertions(+), 2 deletions(-)

-- 
2.7.4

