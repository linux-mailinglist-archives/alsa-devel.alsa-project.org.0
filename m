Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 256888BAE1A
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2024 15:53:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B451DFA;
	Fri,  3 May 2024 15:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B451DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714744425;
	bh=eFNR+JqcybsABMcMvGl8rSovVLy67z3mX6vDmfwZpGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NOAKaOAL6ZU0Yz0cCIQ0nzc+JsexsyMDdlPrW8CYiQV06PSb3tErd2jiJMvtESuZc
	 HuGfCA39b9GhXuiWRBwVbz3oqTpV9+qM5nEdhaQWrf4RyCRJlWHpwRXeZEvOwqTk8R
	 xnqjx48v8DHr7vk3ddAK7ZTw50WsPnEWJQT1xmbA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 627ACF805DA; Fri,  3 May 2024 15:52:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 388A7F805C8;
	Fri,  3 May 2024 15:52:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 783ABF8025D; Fri,  3 May 2024 15:52:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C351F8025D
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 15:52:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C351F8025D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FwfK27DG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714744358; x=1746280358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eFNR+JqcybsABMcMvGl8rSovVLy67z3mX6vDmfwZpGY=;
  b=FwfK27DGkbSBfkzOmvuOjxly82eQ58smQlkotxmxILL6c2mXiUakamDb
   sQ+9RS8yMD3Opx15hdZEud9bPCGtzpJxlLFt5ngi+ibp6ELpeBpMG6byQ
   8Tq+DegYoQDYUjrTTEkxyt4uNTX234m9JufyHOEfqJxTsqWvEd07tea1F
   pdl7lqVWlecg5A9qeyid9+CbFJPsS6KlrThJsrFUCe+2Uwt2LC1mI1v6n
   H6GyzRDWevPg5Xmyi1lMTcYBJ/DguY766D7mwSu2kMzVA6TYUYAtC/fwZ
   QwhLY3jLoBF/ebsT/FmyKv60tw+58vZQt9GUw6Iq5Y/yhETyI6gaY42Pg
   w==;
X-CSE-ConnectionGUID: 9BY/GAy3R9agrylUCtWw8w==
X-CSE-MsgGUID: /D7t/xCoSH6rL4BuW7wilA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="28029408"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="28029408"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 06:52:33 -0700
X-CSE-ConnectionGUID: Gbo4GFfOQbuNA47R9SJrdw==
X-CSE-MsgGUID: 0UYwXGLbShGyywQG7wxXqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="27548724"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.113.3])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 06:52:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>
Subject: [PATCH 1/7] ASoC: SOF: Intel: hda-stream: export
 stream_get_position() helper
Date: Fri,  3 May 2024 08:52:15 -0500
Message-Id: <20240503135221.229202-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503135221.229202-1-pierre-louis.bossart@linux.intel.com>
References: <20240503135221.229202-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: K37TU4CCGEIGGZ3A6K2RTLABE64JR76X
X-Message-ID-Hash: K37TU4CCGEIGGZ3A6K2RTLABE64JR76X
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Export this helper so that we can report the DPIB position if the BPT
DMA do not complete - this is very useful to see if the DMA started or
gets stuck somehow with invalid bandwidth configurations.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 91b1371745e6..c5afcda18359 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -1079,6 +1079,7 @@ snd_pcm_uframes_t hda_dsp_stream_get_position(struct hdac_stream *hstream,
 
 	return pos;
 }
+EXPORT_SYMBOL_NS(hda_dsp_stream_get_position, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 #define merge_u64(u32_u, u32_l) (((u64)(u32_u) << 32) | (u32_l))
 
-- 
2.40.1

