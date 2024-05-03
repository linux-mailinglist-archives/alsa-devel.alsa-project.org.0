Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5460A8BAE75
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2024 16:07:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95ECDE65;
	Fri,  3 May 2024 16:07:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95ECDE65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714745231;
	bh=NmmnMJQdA3MzA4mxXa0y5BDRdNBbJ9xUXNe5fJ3MO1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uUlZR0twENyHTZCQPDHyWFpc98204NjOgWRX0tydff37/wfL62DBYe3CsiYp4VKWn
	 XxFmCb1L/DcTSNKZVH1AesyBs6fCsI7HnUYDicwGRUdJ27J1xW/H9XUQkylW6enQM4
	 taRHSsvHUij4sEDJMzElrD3sC67wyMFNgv1ZknH4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DF2FF806C2; Fri,  3 May 2024 16:05:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14E65F806C2;
	Fri,  3 May 2024 16:05:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CD67F8065C; Fri,  3 May 2024 16:04:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB632F804FB
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 16:04:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB632F804FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=c9WGuBJ0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714745074; x=1746281074;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NmmnMJQdA3MzA4mxXa0y5BDRdNBbJ9xUXNe5fJ3MO1I=;
  b=c9WGuBJ0azab0p6MFlrwEZUPr5+ni3e2zyMmHtGkigxxJ0e6cYVrPn/Q
   qZybwL58vpNhxqTFAdZ6TM59ItberEqsOXa+YRNNQofzASCDyth/X45Gp
   RT/eGm0DH33DPKvV/WpwUliHiQbAApuCfXFSODr/XV4EeyPnBDUh4LBmy
   SY+EOaX6geySPWv2B0kB6BQiWblUM6kFvgT4owTBixpiqSsJQL8U2+dG+
   QgnaNaP9HKKx4ps2RaCPnPaoSMll9cif6BcuA1AB9o4TLHnZpqpSDzThA
   Nz99Sb3ZReDug7sRjwfGfYKqDjEdK9fZv5d8+BHANT4RHxqMHw7W/2dj7
   Q==;
X-CSE-ConnectionGUID: /+wrJ9WKQkWN9mkMnKqwnQ==
X-CSE-MsgGUID: UbeJLoBQRei+BLgi49DfDg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14369534"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="14369534"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 07:04:22 -0700
X-CSE-ConnectionGUID: BwPhQY/YSauoP9lJPawxng==
X-CSE-MsgGUID: KuU5QnNNT8ajGFaEUPzdsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="64908114"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.113.3])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 07:04:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 7/9] ASoC: soc-topology-test: clarify Copyright information
Date: Fri,  3 May 2024 09:03:57 -0500
Message-Id: <20240503140359.259762-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
References: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XAJSCDNYBPJG7IR4FRTOJYDV2CU2PJT3
X-Message-ID-Hash: XAJSCDNYBPJG7IR4FRTOJYDV2CU2PJT3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XAJSCDNYBPJG7IR4FRTOJYDV2CU2PJT3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For some reason a number of files included the "All rights reserved"
statement. Good old copy-paste made sure this mistake proliferated.

Remove the "All rights reserved" in all Intel-copyright to align with
internal guidance.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/soc-topology-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index 70cbccc42a42..02aa2448f0e6 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -2,7 +2,7 @@
 /*
  * soc-topology-test.c  --  ALSA SoC Topology Kernel Unit Tests
  *
- * Copyright(c) 2021 Intel Corporation. All rights reserved.
+ * Copyright(c) 2021 Intel Corporation.
  */
 
 #include <linux/firmware.h>
-- 
2.40.1

