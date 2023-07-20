Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C19775A3FF
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 03:33:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 710081F4;
	Thu, 20 Jul 2023 03:33:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 710081F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689816831;
	bh=EEH92Op2Nr+VsnZvGqzZkmZfh8Q0ed/IE38X40WNBaE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NdGUdQO6wyhLE1YmVtOnzen2xqz4CzYSqx8jFH8AHOJ6tdCLO3eCTWduN433lO2hm
	 62r1d/YbZ4WY7VPBlSI0UKd4cvYciW5JRe78hl6jUiGLKdW25aFWjjN4ARzadR8Epd
	 C/yiFfDA9U4pdsFa2pqbKBgvJouRGtPbwt1dMA3M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6585CF80527; Thu, 20 Jul 2023 03:33:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94991F80494;
	Thu, 20 Jul 2023 03:32:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E850F804DA; Thu, 20 Jul 2023 03:32:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8685CF8027B
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 03:32:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8685CF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ck9x5ngb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689816766; x=1721352766;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EEH92Op2Nr+VsnZvGqzZkmZfh8Q0ed/IE38X40WNBaE=;
  b=ck9x5ngbYaBlvp0geS1Lv+sRD+KaILnhbLWOny8Ha8+CdmauwvJjIGB5
   Dn7+iLftIC2fUT4iQjjnQh/EzurIMhBHUFfPrbDHJDP6gNC94NM2FJfnf
   RL7mHrXn7x7Kc6dksagQ/9ZhS0nxnUW/8ZV8IY1dAgTyG7X0nsAwPaA75
   tkg5MZijt2KGknZVK31VCHIsG3bqfiyFFDcRM/rbfBx65fvojSwa1R5Rk
   wdpIDWhk72v6lfoYGl138F7eDbO5+7TPvFvEqGPkXCmZ/U8SvJGUzqe/n
   Ftn6wCqH8KqDyJk88A4SSjKNqbc+RMaB7qEHo/t2cQBF3Lq9ngUrhf7Ts
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="364067931"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200";
   d="scan'208";a="364067931"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 18:32:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200";
   d="scan'208";a="867681273"
Received: from brentlu-desktop.itwn.intel.com ([10.5.252.92])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jul 2023 18:32:37 -0700
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
	Yong Zhi <yong.zhi@intel.com>,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	Uday M Bhat <uday.m.bhat@intel.com>,
	Terry Cheong <htcheong@chromium.org>,
	Mac Chiang <mac.chiang@intel.com>,
	"Dharageswari . R" <dharageswari.r@intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] Intel: sof_rt5682: remove quirk flag
Date: Thu, 20 Jul 2023 17:26:26 +0800
Message-Id: <20230720092628.758834-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FGXEW4GMFEY3XG5URZXLI6376PP7SIWB
X-Message-ID-Hash: FGXEW4GMFEY3XG5URZXLI6376PP7SIWB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FGXEW4GMFEY3XG5URZXLI6376PP7SIWB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We add a helper funcion to detect amplifier number according to device instance
in ACPI table so the SOF_MAX98390_TWEETER_SPEAKER_PRESENT flag and a dmi quirk
for 4-amplifier configuration could be safely removed.

Also refactory the max_98390_hw_params() function to use an array to handle the
TDM parameter.

Amplifier number detection and TDM parameter are tested on two Chromebooks. One
with 2 MAX98390 and one with 4 MAX98390 amplifier.


*** BLURB HERE ***

Brent Lu (2):
  ASoC: Intel: maxim-common: get codec number from ACPI
  ASoC: Intel: sof_rt5682: remove SOF_MAX98390_TWEETER_SPEAKER_PRESENT
    flag

 sound/soc/intel/boards/sof_maxim_common.c | 174 +++++++++++++---------
 sound/soc/intel/boards/sof_maxim_common.h |  21 ++-
 sound/soc/intel/boards/sof_rt5682.c       |  37 +----
 3 files changed, 115 insertions(+), 117 deletions(-)

-- 
2.34.1

