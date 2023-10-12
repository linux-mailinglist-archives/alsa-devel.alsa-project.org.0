Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAEB7C7676
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:12:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56322E12;
	Thu, 12 Oct 2023 21:12:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56322E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697137972;
	bh=hI2AE8/v1W4S4jDaZGdK4AFzfRs9pPQMxX5qox6F6oE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N2FdhxU16tZvRNuYqW4zp5vRTZLM1WnEK29nlz/gnzYbltoS2H0NXd+BUhaBGy+Ns
	 2OP5C+2yLZYd+nk/w3iM0XHlD+p3LzuL6VAj5Ra9VOdCe90xm7trhTxnwoyZQFK7xI
	 1nlBOBCEFEy3VWlxcuAwQ5EXTtLMS8TPtFYTuNJg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71406F805F3; Thu, 12 Oct 2023 21:09:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C076F8057A;
	Thu, 12 Oct 2023 21:09:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F87BF805D3; Thu, 12 Oct 2023 21:09:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3717F8055A
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:09:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3717F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=N2byg8/l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697137744; x=1728673744;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hI2AE8/v1W4S4jDaZGdK4AFzfRs9pPQMxX5qox6F6oE=;
  b=N2byg8/lRw0gunbmHS/WP07InbalB+QraPRHE+DqCWUpG314aSZc7YoY
   zrqcXNptT3da3tIT6DUJYFrq8P54nOK5/tEp9pEpjDpDbjyTex7WeFVCU
   79PJ1tibO28dDEcOk9iuHNZ2x8tYVGq3+hLTRHjmrr82Pk5tnjYDMuU7K
   OJev81NXkYJ9Z5499nAik/83lwnw6w+qxXNUJmijlux4Ysu0yqdiokigA
   nvG25jooF8riSaVS8cQWfXoZltnRuLL2Aj8GHWDt+Kw4LCaxuZ93g1F4a
   de742aZPoG4PXewmxe0jT3otkBjKicZYbqfv8D02za5B8uxDcXgz9eC93
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416060210"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="416060210"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845108087"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="845108087"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 12/23] ASoC: Intel: sof_hdmi: add common header for HDMI
Date: Thu, 12 Oct 2023 15:08:15 -0400
Message-Id: <20231012190826.142619-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
References: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4Q62TEZEIO7QL7T6VMASEMJX6VUVW7IE
X-Message-ID-Hash: 4Q62TEZEIO7QL7T6VMASEMJX6VUVW7IE
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add a common header for Intel HDMI dai link (idisp) initialization.
Declare the sof_hdmi_private structure in machine driver private data
and use it to initialize dai link.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_hdmi_common.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 sound/soc/intel/boards/sof_hdmi_common.h

diff --git a/sound/soc/intel/boards/sof_hdmi_common.h b/sound/soc/intel/boards/sof_hdmi_common.h
new file mode 100644
index 000000000000..1573e089c0e5
--- /dev/null
+++ b/sound/soc/intel/boards/sof_hdmi_common.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(c) 2023 Intel Corporation.
+ */
+
+#ifndef __SOF_HDMI_COMMON_H
+#define __SOF_HDMI_COMMON_H
+
+#include <sound/soc.h>
+
+#define IDISP_CODEC_MASK	0x4
+
+/*
+ * sof_hdmi_private: data for Intel HDMI dai link (idisp) initialization
+ *
+ * @hdmi_comp: ASoC component of idisp codec
+ * @idisp_codec: true to indicate idisp codec is present
+ */
+struct sof_hdmi_private {
+	struct snd_soc_component *hdmi_comp;
+	bool idisp_codec;
+};
+
+#endif /* __SOF_HDMI_COMMON_H */
-- 
2.39.2

