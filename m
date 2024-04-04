Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB82898E6A
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 20:56:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 783DA2CD1;
	Thu,  4 Apr 2024 20:56:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 783DA2CD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712257005;
	bh=afNioHGncXnRJlF/ZevFtsEpxu9GMprGXgRv6adODQM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HE0XXekUmF7n3cDUMxNwiPnQjpsNidshR/PIMR08ChfrE686SK4yVEhMSkBBXj0sV
	 B+NLQZNwqnCA71jP1qz7J5mYNRbozgTaRFZtj+uYut9+uEdszK2hd4wHo+ov1dn47i
	 hRY/u9hzJ7WkAbQGKg0y+jGhu6wszveW04l9HJW0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0ABCAF80630; Thu,  4 Apr 2024 20:55:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E131F80641;
	Thu,  4 Apr 2024 20:55:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C485F805E1; Thu,  4 Apr 2024 20:55:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51614F8020D
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 20:55:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51614F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=K4iS1xnB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712256905; x=1743792905;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=afNioHGncXnRJlF/ZevFtsEpxu9GMprGXgRv6adODQM=;
  b=K4iS1xnBKCmhV99J6JQHSuInfYU9PpooMIK8ktU1MZWraWL89m5Xrw7J
   s1E9ouuDZtJzzL1GkzWY2rt3Nw99FvfidLSxZYjibVPiAgi3z8jteQI1w
   oCjd+4wtWqhGmcEuD9wWd199tNKlb1v/gJMBClmGhJ7vo/B8iehtaKGd+
   2mIPL/HBiKLs9J8bwB612X6/rxgCn9xhxcG4/80F0sd2/4FyrkhtXgg41
   Xnm0Rat3s8rwr6t0XO7PMv69qKOzj32I57HmQrbpwoM8/bof0jDtzJpG1
   bQEoEDz4Fl57blYORresP+VZGsZU9AQaTKgai458jTEnzGjV/KYsyBZK2
   g==;
X-CSE-ConnectionGUID: fOl7dinUTrWMDIFdMlEv1g==
X-CSE-MsgGUID: UFqex+kRT8+NMe4apUzWUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7432810"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000";
   d="scan'208";a="7432810"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 11:55:01 -0700
X-CSE-ConnectionGUID: aHo12uyoSGS26cpp5olWEg==
X-CSE-MsgGUID: C10+nUKDTGuU152yUCmKqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000";
   d="scan'208";a="23574633"
Received: from sparrish-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.119.106])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 11:55:00 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 4/4] ASoC: SOF: Intel: hda-stream: clarify comment
Date: Thu,  4 Apr 2024 13:54:48 -0500
Message-Id: <20240404185448.136157-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240404185448.136157-1-pierre-louis.bossart@linux.intel.com>
References: <20240404185448.136157-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CKYX3X7P2YHSIGY4MD2BN2NHQICN4N5E
X-Message-ID-Hash: CKYX3X7P2YHSIGY4MD2BN2NHQICN4N5E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CKYX3X7P2YHSIGY4MD2BN2NHQICN4N5E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Yoda grammar and multiple negatives are unclear.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 76c33795ade4..91b1371745e6 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -785,7 +785,7 @@ static bool hda_dsp_stream_check(struct hdac_bus *bus, u32 status)
 				continue;
 			}
 
-			/* Inform ALSA only in case not do that with IPC */
+			/* Inform ALSA only if the IPC position is not used */
 			if (s->substream && sof_hda->no_ipc_position) {
 				snd_sof_pcm_period_elapsed(s->substream);
 			} else if (s->cstream) {
-- 
2.40.1

