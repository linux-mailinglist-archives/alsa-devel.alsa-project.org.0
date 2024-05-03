Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1848BADC0
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2024 15:34:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE5679F6;
	Fri,  3 May 2024 15:33:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE5679F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714743240;
	bh=zSyuO6Kje+lI8CV89ruIv0tHijXiAxyK0TNFcZ5zZJ0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NQIPSLenWOVnbswsTo/AWS+l1kVPSrC23HTVHqTitCTgaPi/TyXqT82oRvKyv8Xyq
	 r2if7jcMtz+qKQbbEnGo6B3Dw8+MK6EjPj9GkoW11LYVTTBXHkIacA9/Q+8A520gpY
	 cjfQpSB5GgTVZMmsrqpUpyumifZ6+h0rYL4nUnWE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69638F805B2; Fri,  3 May 2024 15:33:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DE98F8059F;
	Fri,  3 May 2024 15:33:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 291C4F8049C; Fri,  3 May 2024 15:33:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF544F8023A
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 15:33:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF544F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Dm6bADNl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714743197; x=1746279197;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zSyuO6Kje+lI8CV89ruIv0tHijXiAxyK0TNFcZ5zZJ0=;
  b=Dm6bADNl3mauJCI8JRvFkaWrB0GQp41fYjpD3yAHlMkwLjkikp8Wi20H
   lpq2/ylfvk668RpHRFSDPPvblrt9N+YlN/epCZ6Dg90eVCMv5ayCO+EsU
   ogLVQThlBmXzw144lIpM9D0LVNA98h1uwAHA4gS5nEebqiKumVFjp30EV
   l3RkbUBjM/mN/4KtgkzWc8TXCJBema2bJHBGMgxZKFCE1g5m5LwdVzo9+
   JRM6PBEOV3914kQiS6HE9W1+DYxc2Q++Geu5nCh4GWKHFDZSU/cYzvq8G
   DZ3d27J3I9BcXtD/y9/c9oEMXrMXwLSLtBOJx+CV2r/q+vtmplc04WzZb
   A==;
X-CSE-ConnectionGUID: ZK84TSM8R/qgbFDujJn2VQ==
X-CSE-MsgGUID: tlVMlBnDR96a/PlsK0BIdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="13499103"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="13499103"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 06:33:06 -0700
X-CSE-ConnectionGUID: 2IaRme5cSNWQ4aT8Zknz9A==
X-CSE-MsgGUID: HCj/73mETSWgvdkraY2qqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="27501175"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.113.3])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 06:33:02 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/3] ASoC: SOF: Intel: HDA/DMIC updates
Date: Fri,  3 May 2024 08:32:50 -0500
Message-Id: <20240503133253.108201-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MUNI4OERQLHS3RXFJ3RP533TLM3FAUWM
X-Message-ID-Hash: MUNI4OERQLHS3RXFJ3RP533TLM3FAUWM
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MUNI4OERQLHS3RXFJ3RP533TLM3FAUWM/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The first patch handles a problematic configuration where the wrong
machine driver/topology is used: when the hardware reports an external
HDaudio codec the direction is to ignore/discard ACPI SoundWire
devices.

The last two patch deal with DMIC format configurations and allow
users to select S16_LE even if the DMIC and internal copiers only
support 24 or 32-bits. The code changes are located in sound/soc/sof/
but in the scope of Intel DAIs.

Peter Ujfalusi (2):
  ASoC: SOF: ipc4-topology: Allow selective update in
    sof_ipc4_update_hw_params
  ASoC: SOF: ipc4-topology: Correct DAI copier config and NHLT blob
    request

Pierre-Louis Bossart (1):
  ASoC: SOF: Intel: discard SoundWire configuration if HDaudio codec is
    reported

 sound/soc/sof/intel/hda.c     |   9 +-
 sound/soc/sof/intel/hda.h     |   2 +
 sound/soc/sof/ipc4-topology.c | 245 ++++++++++++++++++++++++++--------
 3 files changed, 196 insertions(+), 60 deletions(-)

-- 
2.40.1

