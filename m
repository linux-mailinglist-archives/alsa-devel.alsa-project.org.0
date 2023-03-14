Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0736B87CD
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 02:46:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BEC11464;
	Tue, 14 Mar 2023 02:45:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BEC11464
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678758375;
	bh=wQHje0SaVUOSrY4QPSqRiDq9cs1tJEQsHuQNuafDUnw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YB0V3O5Z4xf5NYvvQjcK87IIJgZl7TcgUEaxd8Hg2WFPuYzIfonLq8p4IVGpvkE8W
	 ko61ASstpUTHQg39Rav31MPAc1T5FYHMiYF0h3f18PsFT2Xm9tkCiatTA+p7MXUiY+
	 2ymwCHqPjt/eIxqIY/mUv8dwWvVHZbAyxDlKpzEA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CE65F805C0;
	Tue, 14 Mar 2023 02:41:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 601A0F8057C; Tue, 14 Mar 2023 02:41:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ACC75F80570
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 02:41:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACC75F80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=A1B3DppH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678758098; x=1710294098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wQHje0SaVUOSrY4QPSqRiDq9cs1tJEQsHuQNuafDUnw=;
  b=A1B3DppHmNmzK2wGYSXRzZqlLtaC1/m8JWWE+oakfX2JsfZcCvIJ1K0t
   6psHiJ8Ml82awxL9mEtaV4g3kK8RmmV2+BmU724iIyV/vOB1uleMF4PnV
   YoVACEtixufhpqiCrx5rhD/NJlcSU1fT2C/EIqP6uegs6oevKS4nDeu4e
   GRFU+A9vIVEp1Ee7/8uiPmOPS1H9v81uhd0t+35buma015giV0KdDF87K
   CMNsxx6sE8i3oO7I9xDg6apAipCRw+gM15xXsPljQbipnMPbJRKg6N2GI
   FwutQAjyANs47vYskbHswbLHG5ouG4+222UDwZpz3HRSILzpA/p32eKOs
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="316949316"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400";
   d="scan'208";a="316949316"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:41:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="711327575"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400";
   d="scan'208";a="711327575"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:41:34 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 15/16] soundwire: cadence: split access to IP_MCP_CMDCTRL
 fields
Date: Tue, 14 Mar 2023 09:54:09 +0800
Message-Id: <20230314015410.487311-16-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314015410.487311-1-yung-chuan.liao@linux.intel.com>
References: <20230314015410.487311-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3IP2ZHMXBPQSR4OC6FMXSXUTSZ46LPBR
X-Message-ID-Hash: 3IP2ZHMXBPQSR4OC6FMXSXUTSZ46LPBR
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3IP2ZHMXBPQSR4OC6FMXSXUTSZ46LPBR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The latest Cadence IP splits the MCP_CMDCTRL fields in two registers:
MCP_CMDCTRL and IP_MCP_CMDCTRL. Rename the relevant fields and change
the access methods used for those fields.

In practice we only use the Parity error insertion in IP_CMD_CTRL.

For existing solutions, this is an iso-functionality change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 4c82712944b9..5128923f051e 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -54,9 +54,9 @@ MODULE_PARM_DESC(cdns_mcp_int_mask, "Cadence MCP IntMask");
 #define CDNS_IP_MCP_CONTROL_CMD_ACCEPT		BIT(1)
 #define CDNS_IP_MCP_CONTROL_BLOCK_WAKEUP	BIT(0)
 
-#define CDNS_MCP_CMDCTRL			0x8
+#define CDNS_IP_MCP_CMDCTRL			0x8 /* IP offset added at run-time */
 
-#define CDNS_MCP_CMDCTRL_INSERT_PARITY_ERR	BIT(2)
+#define CDNS_IP_MCP_CMDCTRL_INSERT_PARITY_ERR	BIT(2)
 
 #define CDNS_MCP_SSPSTAT			0xC
 #define CDNS_MCP_FRAME_SHAPE			0x10
@@ -428,9 +428,9 @@ static int cdns_parity_error_injection(void *data, u64 value)
 	mutex_lock(&bus->bus_lock);
 
 	/* program hardware to inject parity error */
-	cdns_updatel(cdns, CDNS_MCP_CMDCTRL,
-		     CDNS_MCP_CMDCTRL_INSERT_PARITY_ERR,
-		     CDNS_MCP_CMDCTRL_INSERT_PARITY_ERR);
+	cdns_ip_updatel(cdns, CDNS_IP_MCP_CMDCTRL,
+			CDNS_IP_MCP_CMDCTRL_INSERT_PARITY_ERR,
+			CDNS_IP_MCP_CMDCTRL_INSERT_PARITY_ERR);
 
 	/* commit changes */
 	cdns_updatel(cdns, CDNS_MCP_CONFIG_UPDATE,
@@ -442,9 +442,9 @@ static int cdns_parity_error_injection(void *data, u64 value)
 	dev_info(cdns->dev, "parity error injection, read: %d\n", ret);
 
 	/* program hardware to disable parity error */
-	cdns_updatel(cdns, CDNS_MCP_CMDCTRL,
-		     CDNS_MCP_CMDCTRL_INSERT_PARITY_ERR,
-		     0);
+	cdns_ip_updatel(cdns, CDNS_IP_MCP_CMDCTRL,
+			CDNS_IP_MCP_CMDCTRL_INSERT_PARITY_ERR,
+			0);
 
 	/* commit changes */
 	cdns_updatel(cdns, CDNS_MCP_CONFIG_UPDATE,
-- 
2.25.1

