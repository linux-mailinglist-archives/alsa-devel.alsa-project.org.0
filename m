Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6104E6C4471
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 08:53:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA496A4F;
	Wed, 22 Mar 2023 08:53:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA496A4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679471630;
	bh=F/Cphp9CUaghSLSx9ZXGTTWDFHLI2tFv228SRmpRZDc=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=q49urOjUhbDU8ZzsvOYrxrRbMtCzZohpPhbKUkOpEnrb3ZWa2QLoSN6BcFEHoXB60
	 xnwqbT8WrSA2vlL+2tlVMY8D5IKruzwOACXKLJU3PG0nkKkU6GEvP8OHGPThOn30+0
	 hr686Be+o75i6FlHm6GviPVT/Tc0Y4Lk9ucINKoI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69A5DF80254;
	Wed, 22 Mar 2023 08:52:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15DCEF8027B; Wed, 22 Mar 2023 08:52:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30E5BF80105
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 08:50:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30E5BF80105
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=F9A5MTYT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679471415; x=1711007415;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=F/Cphp9CUaghSLSx9ZXGTTWDFHLI2tFv228SRmpRZDc=;
  b=F9A5MTYTtWksrYYwmuWXRSZFPMZc+/PTck8kI9LdnXVOmgaXv/ruvEtZ
   NH4o8K7NmsxnB9Wvc4tVY3Zqnb6+QojEz57dT8Al+KoL5U5JeEo3M0dfS
   +KI32c9Wi5YWblTtDOEqnrLIioEE/5dcrePAND4CemMUek6ksWd+HSnc/
   WstV1pMBTGjeiqRbzTFfmAzn1uKXDel/HzZQltYHJ9IFq0l7z0GurwR8r
   lZi4zKI+AoWXJU+HhB76zzZGycfTr3p9C+QPCr6qnyE+FmmmEo57Zt2MV
   r4sbLsMNeL0dScC5VPT2Dy70BfdnB227vls2BAuyUDZgwZcmZAUfbmjIL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="341507348"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400";
   d="scan'208";a="341507348"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 00:48:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="631893416"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400";
   d="scan'208";a="631893416"
Received: from gjantea-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.222.2])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 00:48:46 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 0/2] ASoC: Intel: sof_rt5682: Updates for MTL BT offload
Date: Wed, 22 Mar 2023 09:49:14 +0200
Message-Id: <20230322074916.23225-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VTT4T66L2PRMRSROX2W62OS5IVSGRFVT
X-Message-ID-Hash: VTT4T66L2PRMRSROX2W62OS5IVSGRFVT
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 uday.m.bhat@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VTT4T66L2PRMRSROX2W62OS5IVSGRFVT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Enable BT offload for Rex variants and RVP.

Regards,
Peter
---
Uday M Bhat (2):
  ASoC: Intel: sof_rt5682: Update BT offload config for Rex
  ASoC: Intel: sof_rt5682: Update BT offload config for MTL RVP

 sound/soc/intel/boards/sof_rt5682.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

-- 
2.40.0

