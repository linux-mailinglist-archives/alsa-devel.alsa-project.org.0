Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA6E762B43
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 08:18:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32E8C207;
	Wed, 26 Jul 2023 08:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32E8C207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690352322;
	bh=js5eLjuH8dKH2vHgVoNL1hwwICaDvEgaMk24LXytU+c=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=syJZOQJLHcvcKEt4+IabARitToSUCLdPZIgAszH1CqsaQ5AGZG8aj8mq5WYLj6uu/
	 xdRPc/8fwdCLXjI/sQ7JZrYOAcmTYXpfBC+lbwmlPgwi64xNUNt9pmJoiDBl4WgLkY
	 JT9Qriw8wEYmHMbIOBQlI6/K715bKqWs5Ht7hM04=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0EA8F80520; Wed, 26 Jul 2023 08:17:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40E78F80153;
	Wed, 26 Jul 2023 08:17:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65C20F800C7; Wed, 26 Jul 2023 08:15:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36106F800C7
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 08:15:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36106F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hoq/8oKx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690352106; x=1721888106;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=js5eLjuH8dKH2vHgVoNL1hwwICaDvEgaMk24LXytU+c=;
  b=hoq/8oKx15GooU8PdZsL8CCSZ1MZhjmrK+IN33MY107YjLsmi4qaM8dn
   Cm1SP+pVneG+L5gws7WNeIS3emo4SNO773n/9qKGop/oOzvsuBUqHy/6n
   wAlRV8BmW2FIZmldDtS/QW5eClURVyCC8vE9xVMQxuJgmSZ6P/NDujPWe
   ZT9lwINYqs1QDjdVolcOsT8OL/fBPWbTRGaw90QBTJ6CTJTpAwSCf0Ms6
   jVwkEY7bHdV3J7S6Qh4LaYsMNxpBO6WV/bA/K3LoZ/pKOVJY7zDyfbDCx
   phhfi7NhXcq2PGclQxpzyPZBhnYPgWzCG4MZBwrVIlTvr9Hl+6lxVkoxq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="367950241"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200";
   d="scan'208";a="367950241"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 23:14:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="703606278"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200";
   d="scan'208";a="703606278"
Received: from brentlu-desktop.itwn.intel.com ([10.5.252.92])
  by orsmga006.jf.intel.com with ESMTP; 25 Jul 2023 23:14:54 -0700
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
Subject: [PATCH v2 0/2] Intel: sof_rt5682: remove quirk flag
Date: Wed, 26 Jul 2023 22:08:46 +0800
Message-Id: <20230726140848.2267568-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NIJRFCYUS4NB3S5G23R53RVGHAJBEO34
X-Message-ID-Hash: NIJRFCYUS4NB3S5G23R53RVGHAJBEO34
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NIJRFCYUS4NB3S5G23R53RVGHAJBEO34/>
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

