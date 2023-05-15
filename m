Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B45702614
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 09:29:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 895BD847;
	Mon, 15 May 2023 09:28:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 895BD847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684135783;
	bh=mgbFI2LcjG+t3blbDMXWX8oWe0oop5OUSyXsMN4g61I=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=U/OeWFCJn+xI38FFCWlNCPk+QWVOjn6re9VmwO6Nve55sZmf3M9oqMvj7m+Lz6QI7
	 WuM4pa0lvmAGfHcUzJAe2Ls2yVKzD3QSxUrA5KwWVRxPBxqrVVQpTZXWQZaQlcw8/1
	 8n98NvUQ2BEZe7JvJaCuMdne64uaffn3xx2JULHE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D44A0F80431; Mon, 15 May 2023 09:28:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86C67F8025A;
	Mon, 15 May 2023 09:28:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44753F80272; Mon, 15 May 2023 09:28:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6567F8024E
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 09:28:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6567F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EABH8l9H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684135720; x=1715671720;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mgbFI2LcjG+t3blbDMXWX8oWe0oop5OUSyXsMN4g61I=;
  b=EABH8l9HhZypwGlGYB0snfeAf2jrtd+YoXawu6W2fs6hKmk9JNFxnkmx
   XEK+g3B4SxW2rwjp4KpgAXfGzwkK58eW3SAGQN6/kw2uKR0nHL1YvvmUz
   lZa1LQDkI0E1T/JrzoQgA/eP+Nt+oKHN2hj0bDCfOrpCCfcsYIye+2oc+
   ls6dBmbz6jfs+cAwvMfVE/WRV4IuM/BzrGZYn2uG1i5cWKLegZxJixLwi
   xWMEzIybGm2Sgmjw4gdG6cRvOtnXDY+GI2rN2GVJfk7nNaG29dN8Fj3bO
   qcSLtn/VC670/Fg2+9+Q11o6x9ftikIF0VBSwOS8gUzR/PykUhVO+URHr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="349973276"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="349973276"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 00:28:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694916013"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="694916013"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 00:28:27 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH] soundwire: dmi-quirks: add new mapping for HP Spectre x360
Date: Mon, 15 May 2023 15:48:59 +0800
Message-Id: <20230515074859.3097-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Y7YWCWTG7QVH3YPOFVATCQBVUGGQYOMM
X-Message-ID-Hash: Y7YWCWTG7QVH3YPOFVATCQBVUGGQYOMM
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y7YWCWTG7QVH3YPOFVATCQBVUGGQYOMM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

A BIOS/DMI update seems to have broken some devices, let's add a new
mapping.

Link: https://github.com/thesofproject/linux/issues/4323
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/dmi-quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index 58ea013fa918..2a1096dab63d 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -99,6 +99,13 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
 		},
 		.driver_data = (void *)intel_tgl_bios,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8709"),
+		},
+		.driver_data = (void *)intel_tgl_bios,
+	},
 	{
 		/* quirk used for NUC15 'Bishop County' LAPBC510 and LAPBC710 skews */
 		.matches = {
-- 
2.25.1

