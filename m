Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C75707643FE
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 04:51:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE7F6207;
	Thu, 27 Jul 2023 04:50:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE7F6207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690426299;
	bh=1cqg8XWA880hz+tYVWZgsJCbByja1Pcs6NSiVkqFjqM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZYcaswcw0PnKb0/cV0BquSU1/RR2yQZyqb6HWPyMHghvwRr4wV6QGGHFx8OJjMMNE
	 5nksu+8g4xhb099DaSDicZEX7wMbEStBSB67UU9wX5GPM4IYETL/Foib/3c9mYIUdA
	 l/w7YRNiaSq/Uprv0IxvmQt3UqEZJLY7VUChP0xk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B26A5F8019B; Thu, 27 Jul 2023 04:50:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8198FF80153;
	Thu, 27 Jul 2023 04:50:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59BD0F802E8; Thu, 27 Jul 2023 04:50:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35928F80149
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 04:50:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35928F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Y3SNJPBv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690426213; x=1721962213;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1cqg8XWA880hz+tYVWZgsJCbByja1Pcs6NSiVkqFjqM=;
  b=Y3SNJPBvWrnEzASxKtNWtOL4h5zpCG4mUSSGttADK2z10hd/aLpSrx/T
   DHgPCMW8whtV5mxWvZchYCmxaLroa0ef5bXJiwcxl6iY+ilvxA/FHEgCh
   642cx/VQHp+BoQftkISN94NJ4Qo/vl6FUDfr+ZZZeouBUXR8VTpVxa3Yx
   YCTbYD6PDIIuhJOPOXZ+kouzYFNYWZ9gtsySojpmqmkLNRV1sZsYz1B/l
   575FOMSiTDpJfIijiYNn+liihjYSe5WhCxDdw2xzuPvVQD59qahek4z0l
   GnIXHg4aLWpvyep4l41HTTRzvSE6yaUqXnT80V2IxWp8PifJR1xa2Jonk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="358187868"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200";
   d="scan'208";a="358187868"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 19:50:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057488612"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200";
   d="scan'208";a="1057488612"
Received: from brentlu-desktop.itwn.intel.com ([10.5.252.92])
  by fmsmga005.fm.intel.com with ESMTP; 26 Jul 2023 19:50:03 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Brent Lu <brent.lu@intel.com>,
	linux-kernel@vger.kernel.org,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	Yong Zhi <yong.zhi@intel.com>,
	Terry Cheong <htcheong@chromium.org>,
	Uday M Bhat <uday.m.bhat@intel.com>,
	Mac Chiang <mac.chiang@intel.com>,
	"Dharageswari . R" <dharageswari.r@intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 0/2] Intel: sof_rt5682: remove quirk flag
Date: Thu, 27 Jul 2023 18:43:52 +0800
Message-Id: <20230727104354.2344418-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TVD2Z2BMS7Z3HLJAZSXCP4TRV2KASAWO
X-Message-ID-Hash: TVD2Z2BMS7Z3HLJAZSXCP4TRV2KASAWO
X-MailFrom: brent.lu@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TVD2Z2BMS7Z3HLJAZSXCP4TRV2KASAWO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We add a helper function to detect amplifier number according to device instance
in ACPI table so the SOF_MAX98390_TWEETER_SPEAKER_PRESENT flag and a dmi quirk
for 4-amplifier configuration could be safely removed.

Also refactor the max_98390_hw_params() function to use an array to handle the
TDM parameter.

Amplifier number detection and TDM parameter are tested on two Chromebooks. One
with 2 MAX98390 and one with 4 MAX98390 amplifier.

V2 Changes:
- fix some typos in cover letter
- use for_each_acpi_dev_match() macro to simplify the codec
- use 'unsign int' for codec number variable

V3 Changes:
- replace pr_err() with dev_err()

Brent Lu (2):
  ASoC: Intel: maxim-common: get codec number from ACPI
  ASoC: Intel: sof_rt5682: remove SOF_MAX98390_TWEETER_SPEAKER_PRESENT
    flag

 sound/soc/intel/boards/sof_maxim_common.c | 171 +++++++++++++---------
 sound/soc/intel/boards/sof_maxim_common.h |  21 ++-
 sound/soc/intel/boards/sof_rt5682.c       |  37 +----
 3 files changed, 112 insertions(+), 117 deletions(-)

-- 
2.34.1

