Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05981896A43
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 11:15:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CE4B2C64;
	Wed,  3 Apr 2024 11:15:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CE4B2C64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712135743;
	bh=SHp+9nsh1AjyCsGFbMDMqy0Yw804wTr4lt2IRMmFxBQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ToYXlmshPXQNs7eLz30op6X9z9vfYkNio+DSpzHBLOfdNFO/P8/Rndf5CaJEm02nS
	 XLYBT/rbHc9kW1h6K+C02RbAgvmUsn4EryARtJWNTmR0H86eoVu14B7iVT8mB3BTzg
	 4BK3AfgudR2xSM35o4Kza6Txj5X/TWJEzutKFhMc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B47A3F8059F; Wed,  3 Apr 2024 11:15:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 021A4F80588;
	Wed,  3 Apr 2024 11:15:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62FDAF80238; Wed,  3 Apr 2024 11:15:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7AD1FF80114
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 11:14:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AD1FF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OxJb7fQH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712135698; x=1743671698;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SHp+9nsh1AjyCsGFbMDMqy0Yw804wTr4lt2IRMmFxBQ=;
  b=OxJb7fQHXku2OCjPLdRWT5muLHIfr+rz5fsHb9pghkereiB5BA3VWaLn
   hlhJ0j7DM4HwEARPFS1ZFZASgQ1qAnnUHAB/IM62yirTyUdG+ctzlUKXd
   Zb19+t+tmoZR+9srdbLmuA7esilVSnpCupVbu3ohDdgMRvQo7zFIulmrE
   OTvjliQHrFXauF3QgsCXDAtFT5IRBm6BxkFjafRTBoQ0arApJMzFO0dSQ
   HgylM5MdveS1l2Brc5K+Sd8GOFDJJHrwngW62DrfmWLGcOifSEpFmIkGs
   VokiV6A3D99uWSa8wtS7Z+z8wjP9bL5tHv2HXo6cOkTWLQxwJaqfeIwHz
   g==;
X-CSE-ConnectionGUID: D8apTpb5QW6t0Le35jehWg==
X-CSE-MsgGUID: C5ai98z8SXCu9BX4jcuKFw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="10322541"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="10322541"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 02:14:52 -0700
X-CSE-ConnectionGUID: 1KAdb+wURLenVbGljQR7mA==
X-CSE-MsgGUID: luELzXxrQlOky9soH02NoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="18410497"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 03 Apr 2024 02:14:50 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	cujomalainey@chromium.org,
	lmajczak@google.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/4] ASoC: Drop soc-topology ABI v4 support
Date: Wed,  3 Apr 2024 11:16:25 +0200
Message-Id: <20240403091629.647267-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HQWS57KFNP3YRYT6XXCDRI2ENDI6F6RA
X-Message-ID-Hash: HQWS57KFNP3YRYT6XXCDRI2ENDI6F6RA
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HQWS57KFNP3YRYT6XXCDRI2ENDI6F6RA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset impacts UAPI.

The only known users of the soc-topology ABI v4 are Chromebook
configurations. Starting from kernel v5.4, all of them are making use of
soc-topology ABI v5. The patchset first removes obsolete code from the
Intel's skylake-driver - the driver of choice for the mentioned
Chromebooks - and then proceeds with removal of relevant soc-topology.c
and uapi bits.

Cezary Rojewski (4):
  ASoC: Intel: Skylake: Remove soc-topology ABI v4 support
  ASoC: topology: Remove ABI v4 support
  ASoC: topology: Cleanup after ABI v4 support removal
  ASoC: topology: Remove obsolete ABI v4 structs

 include/uapi/sound/asoc.h               |  56 ------
 include/uapi/sound/skl-tplg-interface.h |  74 --------
 sound/soc/intel/skylake/skl-topology.c  | 169 -----------------
 sound/soc/soc-topology.c                | 241 ++----------------------
 4 files changed, 18 insertions(+), 522 deletions(-)

-- 
2.25.1

