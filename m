Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1277A724F8D
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 00:26:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 315331FE;
	Wed,  7 Jun 2023 00:25:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 315331FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686090408;
	bh=RnkxITXVAFQ/wCQH/iGZ4xHnn6sfwUwbi16MdjyQSvk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NwAvhkGI82FQpVpmKD46juMls0U6syqpu7B0N+h4ri48xlqIBoNHxTx2zIIn/J6TV
	 sCarRUm05MAq8QgZu7Gy+ADDDRrOOF3IYvfn3aHjB3ABOyfnUHw0tov9Xv5EWsg39s
	 gKEf8Xd3+7o2FZg0DZTeXLgdjLc95i3xLbDcGGfo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B1C3F80548; Wed,  7 Jun 2023 00:25:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B7ECF80199;
	Wed,  7 Jun 2023 00:25:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A276EF80290; Wed,  7 Jun 2023 00:25:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD59DF80155
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 00:25:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD59DF80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=M6nKB9ST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686090345; x=1717626345;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RnkxITXVAFQ/wCQH/iGZ4xHnn6sfwUwbi16MdjyQSvk=;
  b=M6nKB9STNyjfkv49YzzJdF/OgrFLyjF+UOsnSH2KalDKOL4uFcLoqLHz
   OOTlJ32z7HB0d59PPHfF+gqBnA4PAi/rir3USdDnJKT3YcAoTfmolWBZ3
   x61Xbyhnfsv6N7tIY+j7EB5D4TP5QvRKVIgLd78ogza9UXWDT8HGMoFkE
   8KeDIh89d2vEqaCW7sSMg6egfChq3pVUBssE8NeicDLzbBrHwXEqxjiw1
   QzBfb3S8Y3ZxJVBkFosmnqfoytivANdeCboxS88saExIMiXrv9YsRRx8M
   Xsefn3nwhcgZDgBmOV0Lgsii9S9G/CwZSXkwfu1M02wd2AuJR0V0U2XKl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="341465397"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400";
   d="scan'208";a="341465397"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 15:25:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="712356549"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400";
   d="scan'208";a="712356549"
Received: from jrmonard-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.150.10])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 15:25:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/2] ASoC: Intel: HDA: two cleanups
Date: Tue,  6 Jun 2023 17:25:27 -0500
Message-Id: <20230606222529.57156-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3YQHF7P2ZRSGQL6HXT73OGOZDFMN2BMH
X-Message-ID-Hash: 3YQHF7P2ZRSGQL6HXT73OGOZDFMN2BMH
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3YQHF7P2ZRSGQL6HXT73OGOZDFMN2BMH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

One removal of a non-existent Kconfig initialization and one
correction to enable SoundWire link when no HDaudio external codec is
detected. This will generate more information and help resolve cases
where the ACPI information is incorrect.

Pierre-Louis Bossart (2):
  ASoC: SOF: Intel: fix SoundWire/HDaudio mutual exclusion
  ASoC: SOF: Intel: hda-pcm: remove kernel parameter init

 sound/soc/sof/intel/hda-pcm.c |  2 +-
 sound/soc/sof/intel/hda.c     | 12 +++++++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

-- 
2.37.2

