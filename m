Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38ECB5B369E
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 13:45:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8E8116A9;
	Fri,  9 Sep 2022 13:44:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8E8116A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662723943;
	bh=7PZusOlPTIECNMkX/hwlmEMWOJ7R8vAyCws/9CfLP4k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BWVlEVOKqTryNZwDNW6qsDyhwH4LXMV7UuiUuaxIzJO09ij9ojMiYml04wrzQeWOb
	 LUumyG5XKuGsAVg1snMSUnNgYV7ioL50Qo+EAQreZomoLQc3yXB+hMHvpdY6IgoMUc
	 dyrPPAjF1pggww7XHQUTf6H38RH2tM4+iEaFFeRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10CA3F8053B;
	Fri,  9 Sep 2022 13:43:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50EF4F804AE; Fri,  9 Sep 2022 13:43:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8283BF8016D
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 13:43:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8283BF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XyQeKvb0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662723823; x=1694259823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7PZusOlPTIECNMkX/hwlmEMWOJ7R8vAyCws/9CfLP4k=;
 b=XyQeKvb0ok+4HxOTSDhaJ0KlJbAY4ifSdgSPwTB1U6xfFv/Gs2Gv0Hsd
 pdL0iuqRR3UPgD5UvF8FQ8brYyqnsdBH6kAdPQ6TEfdQToqQm02OruCMj
 BCdK+AkUZFQ/FD5dFKtCKxk1YcZqkVDZ1kVJ4LOjGndcQbHhxHPsQldl2
 u11ITaj3mXot0IrZ+WnDmC7+2S/GfmluAu6JtZYMBYUjcpf9MItDFyLoF
 tGnOeaNAFMg3yaC2qcPbO9KQxTUDnL/zzoClOAA4FqQye+7OZcFgyVkm0
 ZxUlRSMkEYakWzf7sqNM3HCDVUAHPGsOl5eP5iblF+WLJqRujEChJBleO Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="359180088"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="359180088"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 04:43:35 -0700
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="683613828"
Received: from desharpe-mobl1.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.0.89])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 04:43:33 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 2/7] ASoC: SOF: ipc4: Add macro to get core ID from log buffer
 status message
Date: Fri,  9 Sep 2022 14:43:27 +0300
Message-Id: <20220909114332.31393-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220909114332.31393-1-peter.ujfalusi@linux.intel.com>
References: <20220909114332.31393-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The LOG_BUFFER_STATUS message includes the ID of the core which updated
its log buffer.
With IPC4 each core logs to a different slot in the debug window.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 include/sound/sof/ipc4/header.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
index a795deacc2ea..99efe0ef1784 100644
--- a/include/sound/sof/ipc4/header.h
+++ b/include/sound/sof/ipc4/header.h
@@ -427,6 +427,11 @@ struct sof_ipc4_dx_state_info {
 #define SOF_IPC4_NOTIFICATION_TYPE_GET(x)	(((x) & SOF_IPC4_NOTIFICATION_TYPE_MASK) >> \
 						 SOF_IPC4_NOTIFICATION_TYPE_SHIFT)
 
+#define SOF_IPC4_LOG_CORE_SHIFT			12
+#define SOF_IPC4_LOG_CORE_MASK			GENMASK(15, 12)
+#define SOF_IPC4_LOG_CORE_GET(x)		(((x) & SOF_IPC4_LOG_CORE_MASK) >> \
+						 SOF_IPC4_LOG_CORE_SHIFT)
+
 /* Value of notification type field - must fit into 8 bits */
 enum sof_ipc4_notification_type {
 	/* Phrase detected (notification from WoV module) */
-- 
2.37.3

