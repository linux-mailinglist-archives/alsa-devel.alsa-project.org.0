Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5071176A311
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:39:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92AB884C;
	Mon, 31 Jul 2023 23:38:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92AB884C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690839576;
	bh=TT//xhE8LJQih3OlJzpd6S9o6Jf8OcD3SeZFDVF5am8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pYTNxaOxBeMf6Wavv+S+orOMJOtT7Ke1LwmPNggJKEDcywpF/AjUDoL5YJvaAQ2wj
	 x17HuTU2IyVlfV/oScCmWkIdupbCqWuW53w5u4I/WzncelisJAmGLS2dc9C8D92s1m
	 f47dFaPfDSJnWei6asLJECSaCL5uIJ/K//bfyiCg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7561CF80578; Mon, 31 Jul 2023 23:38:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3078F8055A;
	Mon, 31 Jul 2023 23:38:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBFDBF80564; Mon, 31 Jul 2023 23:38:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RDNS_NONE,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ACEB5F8025A
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:38:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACEB5F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WgMlN1+a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839489; x=1722375489;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TT//xhE8LJQih3OlJzpd6S9o6Jf8OcD3SeZFDVF5am8=;
  b=WgMlN1+aBDXxeqB5r6fFdohezBGxnJ5+vi2PPt6CbibyFbqiBwQ8e76Z
   VSbpuqL/Of3gp13Ozb9Qc4UgXdk9zaf4KO0YGazTzzbVcDUrIwxC6PxCx
   bN0Zk6meqdTyuR2I/DuxOqz3bBJb1eHE1j+EgaLde7Yt6X7DR9euKaIxP
   4WQnLvw8R8xNUsOuFCBlOVYijSrn9ejMA90ru65uAHmePIn29gf78a37A
   HAMSkBh0xkxPUjIJUgtdcZ+X67OL38hE1qdqQ2HcwqR7bO6tVMRHMgXLW
   VRnqsa/KgmjWbeNw8+QVsohYRdxY8/GOqVS0Ejby88B4sW1SIwOYf5BNP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="366604099"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="366604099"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:38:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="793880034"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="793880034"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:38:05 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Yaochun Hung <yc.hung@mediatek.com>
Subject: [PATCH 2/8] ASoC: SOF: ipc3: add checks to prevent static analysis
 warnings
Date: Mon, 31 Jul 2023 16:37:42 -0500
Message-Id: <20230731213748.440285-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731213748.440285-1-pierre-louis.bossart@linux.intel.com>
References: <20230731213748.440285-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VWFZGFRIMYCJAPAF53UZQ77NTG2KUQEP
X-Message-ID-Hash: VWFZGFRIMYCJAPAF53UZQ77NTG2KUQEP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VWFZGFRIMYCJAPAF53UZQ77NTG2KUQEP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

make KCFLAGS='-fanalyzer' sound/soc/sof/ reports an issue with memcpy:

sound/soc/sof/ipc3.c: In function ‘ipc3_wait_tx_done’:
sound/soc/sof/ipc3.c:309:33: error: use of NULL ‘reply_data’ where
non-null expected [CWE-476] [-Werror=analyzer-null-argument]

  309 |                        memcpy(reply_data, msg->reply_data,
      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  310 |                               msg->reply_size);

The finding is legit with this call:
    return sof_ipc3_tx_msg(sdev, &pm_ctx, sizeof(pm_ctx), NULL, 0, false);

Static analysis has no way of knowing that the reply will be zero-sized.

Add a check to only do the memcpy if the reply size is not zero and
the destination pointer is not NULL.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>
---
 sound/soc/sof/ipc3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index 2c5aac31e8b0..09834205b119 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -312,7 +312,7 @@ static int ipc3_wait_tx_done(struct snd_sof_ipc *ipc, void *reply_data)
 		} else {
 			if (sof_debug_check_flag(SOF_DBG_PRINT_IPC_SUCCESS_LOGS))
 				ipc3_log_header(sdev->dev, "ipc tx succeeded", hdr->cmd);
-			if (msg->reply_size)
+			if (reply_data && msg->reply_size)
 				/* copy the data returned from DSP */
 				memcpy(reply_data, msg->reply_data,
 				       msg->reply_size);
-- 
2.39.2

