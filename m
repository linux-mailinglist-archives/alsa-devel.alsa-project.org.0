Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AA5809564
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 23:32:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC1D9A4D;
	Thu,  7 Dec 2023 23:31:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC1D9A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701988326;
	bh=u4/yWFhGYkVI8D1iXkWMb8DzoHd+jsVaXCeuqfKMjdM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PWxRI+du08I+n7TJzM7NZhAIHKoO37D0rCpMycwbg06qGN/INwP7qU+5k9OgwLGvt
	 Zf+SASkW0Xd4hSfy34QtEzdrDd8EICFFLrwpEPvcGNouOZ4b6TJArFFYMQMWhT/BiD
	 WiyF7kyEoW8D5iQKyTNVVMED6tk1+U6Rq22Vi1Ws=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0830F8061C; Thu,  7 Dec 2023 23:30:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81133F8061F;
	Thu,  7 Dec 2023 23:30:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C920F805BF; Thu,  7 Dec 2023 23:30:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 431C9F8024E
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 23:30:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 431C9F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=R0vTNkh4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701988216; x=1733524216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u4/yWFhGYkVI8D1iXkWMb8DzoHd+jsVaXCeuqfKMjdM=;
  b=R0vTNkh4WHCF+rxKjNtaascZMOB86bPmCw9pVe1pq3ERPsZKxR4cpB9M
   8eAXjClgfqJQPT3sW/Nhrq/Uz/0ZJbXsA2MrSOi9vGmgEV5aEUVgiSXrW
   H6mBPlgihLBclUOQ/JwaH2hAJG/woN9XqEYBn69b+/XSj8WmWaRfwVZxu
   KVK8eaS0z8kBPBdgVooXapjtJs3WjY5iLUUm0D6m/6TwdMbPoDg/hpXqZ
   SggqJeiITvHeqQib/Dht5SBL0gpiTqbZ+RKfVk4goXq2+/wD+YbTyOy4p
   4aYHkwjG9TwOMJXk7tGNS/+KLr+Kw84dplVCJJUxd3XjY5bfk7O8SITEf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480516584"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="480516584"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895307464"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="895307464"
Received: from hrcolco-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.159])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:07 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH 02/16] soundwire: cadence: add BTP support for DP0
Date: Thu,  7 Dec 2023 16:29:30 -0600
Message-Id: <20231207222944.663893-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IRJQ7IAMCUYAHAFNUKD7DAPJ7VMA75PO
X-Message-ID-Hash: IRJQ7IAMCUYAHAFNUKD7DAPJ7VMA75PO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IRJQ7IAMCUYAHAFNUKD7DAPJ7VMA75PO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The register definitions are missing a BULK_ENABLE bitfield which must
be set for DP0.

In addition, the existing mapping from PDI to Data Port is 1:1. That's
fine for PCM streams which are by construction in one direction
only. The BTP/BRA protocol is bidirectional and relies on DP0 only,
which breaks the 1:1 mapping. DP0 MUST be mapped to both PDI0 and
PDI1, with PDI1 taking care of the TX direction and PDI1 of the RX
direction.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 725222036853..bb623f82826c 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -183,6 +183,7 @@ MODULE_PARM_DESC(cdns_mcp_int_mask, "Cadence MCP IntMask");
 #define CDNS_PORTCTRL_TEST_FAILED		BIT(1)
 #define CDNS_PORTCTRL_DIRN			BIT(7)
 #define CDNS_PORTCTRL_BANK_INVERT		BIT(8)
+#define CDNS_PORTCTRL_BULK_ENABLE		BIT(16)
 
 #define CDNS_PORT_OFFSET			0x80
 
@@ -1831,13 +1832,20 @@ void sdw_cdns_config_stream(struct sdw_cdns *cdns,
 
 		if (cdns->bus.params.m_data_mode != SDW_PORT_DATA_MODE_NORMAL)
 			val |= CDNS_PORTCTRL_TEST_FAILED;
+	} else if (pdi->num == 0) {
+		val |= CDNS_PORTCTRL_BULK_ENABLE;
 	}
 	offset = CDNS_PORTCTRL + pdi->num * CDNS_PORT_OFFSET;
 	cdns_updatel(cdns, offset,
-		     CDNS_PORTCTRL_DIRN | CDNS_PORTCTRL_TEST_FAILED,
+		     CDNS_PORTCTRL_DIRN | CDNS_PORTCTRL_TEST_FAILED |
+		     CDNS_PORTCTRL_BULK_ENABLE,
 		     val);
 
-	val = pdi->num;
+	/* The DataPort0 needs to be mapped to both PDI and PDI1 ! */
+	if (pdi->num == 1)
+		val = 0;
+	else
+		val = pdi->num;
 	val |= CDNS_PDI_CONFIG_SOFT_RESET;
 	val |= FIELD_PREP(CDNS_PDI_CONFIG_CHANNEL, (1 << ch) - 1);
 	cdns_writel(cdns, CDNS_PDI_CONFIG(pdi->num), val);
-- 
2.39.2

