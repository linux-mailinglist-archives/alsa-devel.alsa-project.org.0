Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DDE6D5BC6
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 11:24:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBBD91E7;
	Tue,  4 Apr 2023 11:23:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBBD91E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680600243;
	bh=ikThbq1dr7JFOod1zIsE9FJCg7832herRAuKCnK8tKw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oCKJO6oe4q6Ps32MqOhU2zkCQVQEYHaTYDFYWZdQlKOla9M9EGRO56HSIiXZRnOt6
	 UuJ5hmYPd23ICg/AhtPvEFlmzFPqht9ad4YF/myRKTij3Sh/g/MRvN4U7422SSZjFT
	 vFKH5bqucVRCmN9n8Zwkd/SBD5TFHBn1vRogtxa0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79017F8057C;
	Tue,  4 Apr 2023 11:21:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24CA6F80534; Tue,  4 Apr 2023 11:21:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21158F80552
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 11:21:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21158F80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=khHyN7bG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680600071; x=1712136071;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ikThbq1dr7JFOod1zIsE9FJCg7832herRAuKCnK8tKw=;
  b=khHyN7bGx1YvLRphgsIZ8qA265/E0VFTDHH8SZ6zrLfB41KV7bRhsJ9L
   zKnuJOwz2m5gw6LnK6NLwoaeYgv5fl/LCUMT5d7bH7aIzlphUszllTrSz
   /RKpxXGNP9FdGQ3VpPdyR0H5R72BVp4A3vMgmasB9xktwPFwQcGaXiedI
   HcxpI99pefOwqvFJ+ci3cuAX1QyafPqHsc79UjVaPtN/sXmIqzLRmIMzY
   DFpMx35DvUh7hxMkpcKa2IIEOPxKsbLV9M6xA8/9EnG7596FjrvyLllaa
   DCCqQqzWjnnGbq5gzJo+dvAarU70sBFu7/ZJMrYvgMg1D9m5ycE96ZbqK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="339620685"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="339620685"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 02:21:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="688820157"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="688820157"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 02:21:05 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 11/12] ASoC: SOF: Intel: pci-skl: Allow DSPless mode
Date: Tue,  4 Apr 2023 12:21:14 +0300
Message-Id: <20230404092115.27949-12-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404092115.27949-1-peter.ujfalusi@linux.intel.com>
References: <20230404092115.27949-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MTLWQBQO3XNM2PLCH2DBDA4JTQERCPKV
X-Message-ID-Hash: MTLWQBQO3XNM2PLCH2DBDA4JTQERCPKV
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MTLWQBQO3XNM2PLCH2DBDA4JTQERCPKV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

set the dspless_mode_supported flag to true for skl family to allow
DSPless mode.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/intel/pci-skl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/intel/pci-skl.c b/sound/soc/sof/intel/pci-skl.c
index 5b4bccf81965..5e69af6eed34 100644
--- a/sound/soc/sof/intel/pci-skl.c
+++ b/sound/soc/sof/intel/pci-skl.c
@@ -26,6 +26,7 @@ static struct sof_dev_desc skl_desc = {
 	.irqindex_host_ipc	= -1,
 	.ipc_supported_mask	= BIT(SOF_INTEL_IPC4),
 	.ipc_default		= SOF_INTEL_IPC4,
+	.dspless_mode_supported	= true,		/* Only supported for HDaudio */
 	.default_fw_path = {
 		[SOF_INTEL_IPC4] = "intel/avs/skl",
 	},
@@ -50,6 +51,7 @@ static struct sof_dev_desc kbl_desc = {
 	.irqindex_host_ipc	= -1,
 	.ipc_supported_mask	= BIT(SOF_INTEL_IPC4),
 	.ipc_default		= SOF_INTEL_IPC4,
+	.dspless_mode_supported	= true,		/* Only supported for HDaudio */
 	.default_fw_path = {
 		[SOF_INTEL_IPC4] = "intel/avs/kbl",
 	},
-- 
2.40.0

