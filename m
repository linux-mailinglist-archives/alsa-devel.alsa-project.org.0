Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F05F970059F
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 12:33:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2997C1D9;
	Fri, 12 May 2023 12:32:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2997C1D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683887618;
	bh=3v3CBM5YbeKaWA3Iv8466FnrmmHHwDOtWuAWyZSRUA4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KezfCdDff144xn+V2sBd9DLYJUw5WcqbhBjiq7UrjNSn29+oak+R0D/vKdHBLhPVf
	 GRgJALqIN68cgwn/++2x1pMK1EWl3k3xBN39WOqBCHgX1MTApTBO8BlcAXxi7QEVDN
	 lBX/aBz4XWxOV9HPp6seKXdxu4yEPbtsVd0nvF5I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CADA4F802E8; Fri, 12 May 2023 12:32:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3380F8052E;
	Fri, 12 May 2023 12:32:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F089F8053B; Fri, 12 May 2023 12:32:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C889F802E8
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 12:32:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C889F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jcb5kL+W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683887548; x=1715423548;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3v3CBM5YbeKaWA3Iv8466FnrmmHHwDOtWuAWyZSRUA4=;
  b=jcb5kL+W+81C2dHPWxyKiZXAqTd8hnahH6jBsGkzSUWrDdN4or+JuPW1
   bn7+Dx113ApOo0iFBHfK5oeZVdkdM//2DynDlDuBkQdg79ifkTdOjdu1k
   NpsFFJBQrN5zMX/ToU3wFo4+4t3W+T3S/jdaf3IVGeEgx8fTqTnDmAblA
   htu9qWCbsYhFdxiZWv3gc+mHjTdG0s3qneJLnvzFjL6sOTMCPPuIuVkzx
   z9XNAe5nUfMtkocppfjKTLWpETOGBxsQ7DexnGUNxjhTNerclYzvhcVSO
   8whLZ72Xzfbo4b6B635dJMiiyhivEt+2jCCH5YBfZeVyq/dbZSVZaTnNS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="416390470"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="416390470"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 03:32:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="730774128"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="730774128"
Received: from nhanph1x-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.38.84])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 03:32:22 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	daniel.baluta@nxp.com
Subject: [PATCH 0/3] ASoC: SOF: Various runtime pm fixes, improvements
Date: Fri, 12 May 2023 13:33:12 +0300
Message-Id: <20230512103315.8921-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NJB3RDH5HD7OKF5MVJJGDVX6UV2UQLZ3
X-Message-ID-Hash: NJB3RDH5HD7OKF5MVJJGDVX6UV2UQLZ3
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NJB3RDH5HD7OKF5MVJJGDVX6UV2UQLZ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Three patch to correct error path PM runtime handling in few places.

Regards,
Peter
---
Pierre-Louis Bossart (3):
  ASoC: SOF: debug: conditionally bump runtime_pm counter on exceptions
  ASoC: SOF: pcm: fix pm_runtime imbalance in error handling
  ASoC: SOF: sof-client-probes: fix pm_runtime imbalance in error
    handling

 sound/soc/sof/debug.c             |  4 ++--
 sound/soc/sof/pcm.c               | 11 ++++++-----
 sound/soc/sof/sof-client-probes.c | 14 ++++++++------
 3 files changed, 16 insertions(+), 13 deletions(-)

-- 
2.40.1

