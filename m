Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9B7898E66
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 20:55:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F4052CDC;
	Thu,  4 Apr 2024 20:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F4052CDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712256941;
	bh=fPFoUzRC7yp0tHLHieUekcRDHzzgkJTA10VfyCjPKN0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YEls8WmtbUhKFvUHWYINjikYZmms88yNvRpmVm9Px867jcJ72K8KlAEUx+M2xIKZZ
	 9+rc/Z78SBel+eHiEENe1n5I3XcJznLsCzJAMssaq75W+QUsTLbdjYLTxR8WNpdF7y
	 SA7NFYI+zPBsc0dA+c92jjqesVQQImQEsXc+8RR8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F12AAF8057F; Thu,  4 Apr 2024 20:55:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1CDAF805AA;
	Thu,  4 Apr 2024 20:55:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 063A9F80238; Thu,  4 Apr 2024 20:55:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EAD89F80114
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 20:54:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAD89F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TV0IABCK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712256901; x=1743792901;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fPFoUzRC7yp0tHLHieUekcRDHzzgkJTA10VfyCjPKN0=;
  b=TV0IABCK3jDeiY1buDMMzyA+89oT9ETiVW33ac/q0I6qu+877ItFncUY
   b+Esfq/W1XzLQMO8loZ/TKKGUDdk2BWv5X1wIYCR3+mSRHOAhyW0wIS36
   IbfypQ45lMhQLryVhaX3gCl4WVrwIxVsjK0hYRqUZkdB66o8j+0sEZa5z
   cXXdp+Y4sjmuF833uSbySEPZKQ/c3OaIJf8RfnspFpaJxFvnPU+1t6Nkq
   FYo+f09Y5vpxqJoiWBYYLvquLcj5U//5zoqASl82ekFP4veVuOpn0HEnF
   djYeOKLZq4HsUY138PWj4P/sS/zGTy1jtjqKJJCMcFiRPNuenH3MNACUz
   g==;
X-CSE-ConnectionGUID: 6aI4O9K8SZOKo6yU/tsneA==
X-CSE-MsgGUID: ZgQYBSoQT8yzeLqtcrl7qQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7432792"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000";
   d="scan'208";a="7432792"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 11:54:58 -0700
X-CSE-ConnectionGUID: n68B0qNzTbeYvffkFS7usQ==
X-CSE-MsgGUID: fnE6eCGqSOmAmYnVy7YiTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000";
   d="scan'208";a="23574615"
Received: from sparrish-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.119.106])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 11:54:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/4] ASoC: SOF: Intel: extend hda-loader for BTP/BRA transfers
Date: Thu,  4 Apr 2024 13:54:44 -0500
Message-Id: <20240404185448.136157-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 53RLWM2BMOWJCDEQFPLSSK6Z5ZQA74HC
X-Message-ID-Hash: 53RLWM2BMOWJCDEQFPLSSK6Z5ZQA74HC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/53RLWM2BMOWJCDEQFPLSSK6Z5ZQA74HC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For SoundWire BPT/BRA transfers, we need to reuse the HDaudio DMA
infrastructure. This patchset extends the code used by the code
loader. The BPT/BRA functionality will be provided in a follow-up
contribution.

Pierre-Louis Bossart (4):
  ASoC: SOF: Intel: hda-loader: add flag to tag ICCMAX stream
  ASoC: SOF: Intel: hda-loader: change signature of code loader helpers
  ASoC: SOF: Intel: don't ignore IOC interrupts for non-audio transfers
  ASoC: SOF: Intel: hda-stream: clarify comment

 sound/soc/sof/intel/hda-loader.c | 80 ++++++++++++++++++++++----------
 sound/soc/sof/intel/hda-stream.c | 24 ++++++++--
 sound/soc/sof/intel/hda.h        | 13 ++++--
 3 files changed, 85 insertions(+), 32 deletions(-)

-- 
2.40.1

