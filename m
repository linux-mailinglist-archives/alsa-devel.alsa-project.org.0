Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D6C8D24AB
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2024 21:32:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10FA5EF2;
	Tue, 28 May 2024 21:32:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10FA5EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716924738;
	bh=yrLkMNL0vjGtPcpJMxCjfDCJZd9eHDtZHTZMrLNb4lI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uIGJEaTzaNXB6497kH0LdLcW0aolYqOBp9JKNPZNwHk5lDH2zs5vmUHnV7mu6Ve1R
	 taZOtDSRm8elrsJyg+3nl4I57tQyFHOPchy85NEDLKkrDN8IR3cHlUu0cANC8A5yFE
	 wYPD/WcsEBfXSpyolSs0UOyAoa/hQh/u6RpMXsNE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16A90F800BA; Tue, 28 May 2024 21:31:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6609CF800BA;
	Tue, 28 May 2024 21:31:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7693CF800E9; Tue, 28 May 2024 21:31:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C6EDF8026D
	for <alsa-devel@alsa-project.org>; Tue, 28 May 2024 21:30:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C6EDF8026D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Qwx2MQrs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716924603; x=1748460603;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yrLkMNL0vjGtPcpJMxCjfDCJZd9eHDtZHTZMrLNb4lI=;
  b=Qwx2MQrsQHNs8Zp1wk4KvWTTA28mt4jF2E4yVqqW3a2VekSlpP6BwcSa
   +tEP+GwLKKl/OT7rM4PjjeS+TZt5gLLDbvBqhwZntHuwtPt4u9SlGIrm6
   2L8+7pOx7wruqCNB1FPU1SrsR/Q8S9rqmxcnBYC1lLt14uXildpa4xCt2
   YUaeZFhGcWTNtXjQlOAtFLoY1zyKFFfIjImrT2pNqqVqf1WYilLcQ8KF2
   oCEwoEJYYL5BN5ZEncZTroUOGQMwSLtWAduPg6OualfjJ/suBcRX/KGf3
   IeQY0FbVg+M799mexzbIMJ4Se3ga9Dnp3Z1c+27SVRKRxM6/vcMQ1CW6R
   A==;
X-CSE-ConnectionGUID: +3vTUN2sSQi/iY2RJPC8Fw==
X-CSE-MsgGUID: a/sNb5VDT2ih56OXGIfEWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24711849"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000";
   d="scan'208";a="24711849"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 12:29:56 -0700
X-CSE-ConnectionGUID: oPjQrdN/TZOsComV4T9Q5g==
X-CSE-MsgGUID: dw+3EAeBTcyrDD4eXkFDRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000";
   d="scan'208";a="35246723"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.237])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 12:29:55 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	rafael@kernel.org,
	vkoul@kernel.org,
	andriy.shevchenko@linux.intel.com,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rander Wang <rander.wang@intel.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/3] ALSA: hda: intel-sdw-acpi: use
 acpi_get_local_u64_address()
Date: Tue, 28 May 2024 14:29:35 -0500
Message-ID: <20240528192936.16180-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240528192936.16180-1-pierre-louis.bossart@linux.intel.com>
References: <20240528192936.16180-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2FKNRIXJ3BLENCKI4NIWIRU6ZROGB3CP
X-Message-ID-Hash: 2FKNRIXJ3BLENCKI4NIWIRU6ZROGB3CP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2FKNRIXJ3BLENCKI4NIWIRU6ZROGB3CP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now we have a helper so there's no need to open-code.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/hda/intel-sdw-acpi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/hda/intel-sdw-acpi.c b/sound/hda/intel-sdw-acpi.c
index d7417a40392b..f3b2a610df23 100644
--- a/sound/hda/intel-sdw-acpi.c
+++ b/sound/hda/intel-sdw-acpi.c
@@ -125,11 +125,11 @@ static acpi_status sdw_intel_acpi_cb(acpi_handle handle, u32 level,
 				     void *cdata, void **return_value)
 {
 	struct sdw_intel_acpi_info *info = cdata;
-	acpi_status status;
 	u64 adr;
+	int ret;
 
-	status = acpi_evaluate_integer(handle, METHOD_NAME__ADR, NULL, &adr);
-	if (ACPI_FAILURE(status))
+	ret = acpi_get_local_u64_address(handle, &adr);
+	if (ret < 0)
 		return AE_OK; /* keep going */
 
 	if (!acpi_fetch_acpi_dev(handle)) {
-- 
2.43.0

