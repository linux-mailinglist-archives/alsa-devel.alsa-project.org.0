Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 084507C7698
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:21:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66C94EB9;
	Thu, 12 Oct 2023 21:20:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66C94EB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697138465;
	bh=sAHB7fmSUKevt1U+ojjUC0DYZuDwCCtdZ51toos2gaY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O+xwVTpgQK2utAM68nSosE9sV0xLwuIugvoDRLI8LWqznbklrpN3od9shvtZF0aB6
	 DO2/MpPZGDJ/d+jaR5OKG80k6Dt0tcnmtEt0O68O2yW92qRjMDuChfo7sGXwjlVq0X
	 FX8T5N3kSoKYN6i6sjGQuq15L4+GKhFftu6R2Dg8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63954F8057C; Thu, 12 Oct 2023 21:19:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA9DCF80571;
	Thu, 12 Oct 2023 21:19:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB311F80310; Thu, 12 Oct 2023 21:19:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9791F8027B
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:19:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9791F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=c9pfFHSD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697138357; x=1728674357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sAHB7fmSUKevt1U+ojjUC0DYZuDwCCtdZ51toos2gaY=;
  b=c9pfFHSD3uXjiKIn4Hz+cB+gIQb1GkIL9kBTTDp+z1q1ckG1u/favRjQ
   icxo4q2frPO6uYK5SesXq4QcP+ya66Hau5zvXyZscz44MYgyT+SnTmmGe
   4f+shYHCUPFL35pNafoIkWDcZj33sg5SYTK8B+py76HAKyopGsHuJWfu0
   xWGMEhLQT0C409R3CN1oVtx3jwokFwY1VW5z4skTUaUaIfZcBRHvzolRk
   pzkcukBT0DBuP02WwxfzTkEVOBqJMrP9i9Mhbfo/OmDmw+s4U+qeGv+Kh
   fm84x9RZun3y09IjoiKW2jskfrgQWIIHsz98bxsygDo6TRS5qLFE8Itex
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="383875368"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="383875368"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:19:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001628013"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="1001628013"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:19:00 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 3/4] ASoC: SOF: ipc4: Dump the notification payload
Date: Thu, 12 Oct 2023 15:18:49 -0400
Message-Id: <20231012191850.147140-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012191850.147140-1-pierre-louis.bossart@linux.intel.com>
References: <20231012191850.147140-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TIUER3USCAI3LDT7JNDFAZRZATL74QCD
X-Message-ID-Hash: TIUER3USCAI3LDT7JNDFAZRZATL74QCD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TIUER3USCAI3LDT7JNDFAZRZATL74QCD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Now that we have notifications with payload (kcontrol change
notifications), it is time to add the payload dump on the rx path as well.

Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 3f4d57dba972..8441f4ae4065 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -666,6 +666,10 @@ static void sof_ipc4_rx_msg(struct snd_sof_dev *sdev)
 	sof_ipc4_log_header(sdev->dev, "ipc rx done ", ipc4_msg, true);
 
 	if (data_size) {
+		if (sof_debug_check_flag(SOF_DBG_DUMP_IPC_MESSAGE_PAYLOAD))
+			sof_ipc4_dump_payload(sdev, ipc4_msg->data_ptr,
+					      ipc4_msg->data_size);
+
 		kfree(ipc4_msg->data_ptr);
 		ipc4_msg->data_ptr = NULL;
 		ipc4_msg->data_size = 0;
-- 
2.39.2

