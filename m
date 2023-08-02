Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C9876D136
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 17:13:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0650DE;
	Wed,  2 Aug 2023 17:12:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0650DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690989221;
	bh=ak7u4/RSbAqkTh6GICrJIv3mH73UUyut/H4Rn5Lext4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Tntb1SisBtiCVv/FdzoL2QllOvbojxRjBlYjvOOZHfNN1bcVfbg85PJwhidNPO2dx
	 2/nFEvguYCsseTcc1jRLeeVbhuPPc81bpeMREzvZKSUjVPa/KiuPo6xB81Dg+g2vXr
	 Yl86sxeMSXtw/RCg9Kmj0Ozz9ICuI8aZtPChDWZo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F954F802BE; Wed,  2 Aug 2023 17:12:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7250AF8025A;
	Wed,  2 Aug 2023 17:12:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BF98F8016D; Wed,  2 Aug 2023 17:12:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43D76F8016D
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 17:12:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43D76F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HbWX8I8b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690989161; x=1722525161;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ak7u4/RSbAqkTh6GICrJIv3mH73UUyut/H4Rn5Lext4=;
  b=HbWX8I8b1ZLYK+42DdyssKbN8ONxq3RzduMSOgwCmw8AyXK681WesTh3
   +LF7ZhJCWrDG/d0umg9E5I0bGTlr3MaMrE4ngiuQ1gGLR77Cn1MCqb52U
   WINRnB1ZT4kUFn0YwB+0ZvHIZ2JmQJEIqjaiwHhNpeTlceqwEIVbTnAQe
   EMtF0NmIOylT13U59q9Fp3zqGQifsVeH14mctqMC6ByAtl8Lwcc7zzqFH
   VWlQFubzWB4CIihPvP89uIPlRCyGK71+0V3kghT5neGaafo5Css8Xfz4B
   54SPiPcNXJsEWSGTmUYF4PIMNVmFHjAVHHHAzndrD0KkwSy+TVFQIUnU0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="369607243"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="369607243"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:01:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="732428668"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="732428668"
Received: from rickylop-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.125.114])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:01:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/5] ALSA/PCI: hda: add ARL-S support, config for MTL/LNL
Date: Wed,  2 Aug 2023 10:01:00 -0500
Message-Id: <20230802150105.24604-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QAUKJYNBRZRRBGQ67ALWSI6HZU3SW6NA
X-Message-ID-Hash: QAUKJYNBRZRRBGQ67ALWSI6HZU3SW6NA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QAUKJYNBRZRRBGQ67ALWSI6HZU3SW6NA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a new PCI ID and i915 connectivity check for ArrowLake-S, and
configuration updates for MTL/LNL.

Kai Vehmanen (2):
  ALSA: hda: add HD Audio PCI ID for Intel Arrow Lake-S
  ALSA: hda/i915: extend connectivity check to cover Intel ARL

Pierre-Louis Bossart (3):
  PCI: add ArrowLake-S PCI ID for Intel HDAudio subsystem.
  ALSA: hda: intel-dsp-cfg: use common include for MeteorLake
  ALSA: hda: intel-dsp-cfg: add LunarLake support

 include/linux/pci_ids.h      |  1 +
 sound/hda/hdac_i915.c        | 14 ++++++++++----
 sound/hda/intel-dsp-config.c | 10 +++++++++-
 sound/pci/hda/hda_intel.c    |  2 ++
 4 files changed, 22 insertions(+), 5 deletions(-)

-- 
2.39.2

