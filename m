Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B7262EC37
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 03:57:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B4A616E6;
	Fri, 18 Nov 2022 03:56:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B4A616E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668740260;
	bh=sFoTlN5v6r79HUZxzN2vBniRQPFO0vULAV0J7b3pGgI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DPUk5aTnAB2VGtPJ33LfKylRAOOwAuKIrv9y1kN9gH7vpMyxlZ2ZHerHZqtOd7mDR
	 fdL6Yemi2l71Cs4FqJ6Br9QcBg6Rm39SzLvTa1XuE8EPyVulH/DGS/woiwMM6rxVkh
	 +Yx60QBvKJ6jGz9wVYOivMywuuFxyT49fSroQfzM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20DD6F80563;
	Fri, 18 Nov 2022 03:56:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8934F80557; Fri, 18 Nov 2022 03:55:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27CC6F8016E
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 03:55:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27CC6F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GwHFAHYQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668740154; x=1700276154;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sFoTlN5v6r79HUZxzN2vBniRQPFO0vULAV0J7b3pGgI=;
 b=GwHFAHYQq/2+Vj6eLm/HWErJAXBiWArQANTxsdPnqLwpHBKTJZd2HnGl
 LHKLVEweTmKjPs/jqjUr4NjThufvX0hBKLDbjlQMYzNezHXVx/fP9jcK2
 NWex2nmH+/CbdwAISmSmJwkJrRP6rTAQgT1vcnRI/CFERMzFlQWHMPUDk
 gGO7vrdrvE5s64sqrHYTaJNNB+wH1Sil3MiL78N+3govMdNcI/3HTXvhA
 93MgPjfPLkzJMs6qyK6NLyR7LwUMrSRMHMbR7b/2BqzwlqJVvj8nc0Ewd
 HLkCGJ2IDVbqrrlvpb/SC9XUdTKig4KSmj1oAuT/f0H5Xnjxl8N52Lxpp A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="399323297"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="399323297"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 18:55:50 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="642347898"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="642347898"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 18:55:48 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH v2 2/2] soundwire: enable optional clock registers for
 SoundWire 1.2 devices
Date: Fri, 18 Nov 2022 10:58:07 +0800
Message-Id: <20221118025807.534863-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221118025807.534863-1-yung-chuan.liao@linux.intel.com>
References: <20221118025807.534863-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, vinod.koul@linaro.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, vkoul@kernel.org,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The bus supports the mandatory clock registers for SDCA devices, these
registers can also be optionally supported by SoundWire 1.2 devices
that don't follow the SDCA class specification.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c       | 7 ++++---
 include/linux/soundwire/sdw.h | 4 ++++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index c23275b443ac..55d393247a0f 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1233,10 +1233,11 @@ static int sdw_slave_set_frequency(struct sdw_slave *slave)
 
 	/*
 	 * frequency base and scale registers are required for SDCA
-	 * devices. They may also be used for 1.2+/non-SDCA devices,
-	 * but we will need a DisCo property to cover this case
+	 * devices. They may also be used for 1.2+/non-SDCA devices.
+	 * Driver can set the property, we will need a DisCo property
+	 * to discover this case from platform firmware.
 	 */
-	if (!slave->id.class_id)
+	if (!slave->id.class_id && !slave->prop.clock_reg_supported)
 		return 0;
 
 	if (!mclk_freq) {
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 8fb458931772..9a49263c53cf 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -365,6 +365,9 @@ struct sdw_dpn_prop {
  * @sink_dpn_prop: Sink Data Port N properties
  * @scp_int1_mask: SCP_INT1_MASK desired settings
  * @quirks: bitmask identifying deltas from the MIPI specification
+ * @clock_reg_supported: the Peripheral implements the clock base and scale
+ * registers introduced with the SoundWire 1.2 specification. SDCA devices
+ * do not need to set this boolean property as the registers are required.
  */
 struct sdw_slave_prop {
 	u32 mipi_revision;
@@ -388,6 +391,7 @@ struct sdw_slave_prop {
 	struct sdw_dpn_prop *sink_dpn_prop;
 	u8 scp_int1_mask;
 	u32 quirks;
+	bool clock_reg_supported;
 };
 
 #define SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY	BIT(0)
-- 
2.25.1

