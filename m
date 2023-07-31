Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A833768A19
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 04:41:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E754823;
	Mon, 31 Jul 2023 04:40:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E754823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690771289;
	bh=/zCvpUO3+yntTjDh38Ej4kXqiMhmp7yIaO7/Tr0CFyE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NBcth916gvJSWY/EzZpd3Joau42Q+BuU6Oq/E1+fUacMqHk/2ubJjWdHnCLZPHrKg
	 EquKeGxAAfma6SPNxNTB0oiV1ivYYqBwDhbfxLFA8Wem0RQXAB/xu3W2FReRkYw8xa
	 l3jmaZIDiMzgCoyWJjeF4Eo1Ze8Cy3FCGrta1EOE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 192C7F80163; Mon, 31 Jul 2023 04:40:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C838CF8016D;
	Mon, 31 Jul 2023 04:40:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8BB1F8025A; Mon, 31 Jul 2023 04:40:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31000F80149
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 04:40:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31000F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kaceqPq4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690771231; x=1722307231;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/zCvpUO3+yntTjDh38Ej4kXqiMhmp7yIaO7/Tr0CFyE=;
  b=kaceqPq4jSOPP+Z1AqAAEjTiJIe7iaeVObFjrdugbHWcwrcneZeWN5yM
   +b7XiyEV6bVWUg8z9Mnm+X2Zwq5ecTsx65jbK0pzdJhAclo0PUDE6zYvL
   NTKwLpe1CBT35sHGQRn1U1XR+O0cJChlpwirbPtlXXKvy6KsXpJMBQfNU
   vl4rQdNHbe+JsiBsXfscnO7z7ipYdhwDJxd7VmeXtzmR/+/mPmcFoCKCS
   +Q3/AUk8YdU8km7fOcSJ7EQGM1cm6quLe697ayfnjiPXX/dod30iaR3c+
   93iWklDYt9qU1Vx2OYE3RUpwlzGOC3fwtKz5M95IZKNBF3Z+wUbNfoukH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="349205990"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200";
   d="scan'208";a="349205990"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2023 19:40:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="678158299"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200";
   d="scan'208";a="678158299"
Received: from brentlu-desktop.itwn.intel.com ([10.5.252.92])
  by orsmga003.jf.intel.com with ESMTP; 30 Jul 2023 19:40:22 -0700
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
Subject: [PATCH v4 0/1] Intel: sof_rt5682: remove quirk flag
Date: Mon, 31 Jul 2023 18:34:18 +0800
Message-Id: <20230731103419.2536036-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: D3OW3ZEUTCD55MKRC7PFIC52OYVP24L4
X-Message-ID-Hash: D3OW3ZEUTCD55MKRC7PFIC52OYVP24L4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D3OW3ZEUTCD55MKRC7PFIC52OYVP24L4/>
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

V4 Changes:
- merge two patches to avoid build break
- remove redundant assignment in max_98390_hw_params()
- refactor MAX_98390_DEVX_NAME macros

Brent Lu (2):
  ASoC: Intel: maxim-common: get codec number from ACPI
  ASoC: Intel: sof_rt5682: remove SOF_MAX98390_TWEETER_SPEAKER_PRESENT
    flag

Brent Lu (1):
  ASoC: Intel: maxim-common: get codec number from ACPI table

 sound/soc/intel/boards/sof_maxim_common.c | 170 +++++++++++++---------
 sound/soc/intel/boards/sof_maxim_common.h |  21 ++-
 sound/soc/intel/boards/sof_rt5682.c       |  37 +----
 3 files changed, 111 insertions(+), 117 deletions(-)

-- 
2.34.1

