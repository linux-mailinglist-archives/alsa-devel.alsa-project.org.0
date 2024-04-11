Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 681408A21B9
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Apr 2024 00:30:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0762E2BF1;
	Fri, 12 Apr 2024 00:30:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0762E2BF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712874631;
	bh=QpmYI3nCN/RiyTRwE47bcfkwM06N232vNmHtjvJJQbU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LSQIKAmaz/DR+faE8mklTcc8CqK3RKu+j5VHVm3cTK5gp5duGyXFXSnMidZdyvzhl
	 1no8nYtCZkF4dzq9sstgpBQtUw4hpeJfu9BA7FsSX+Sq0vPlblmrx8Ny8MJRV+EZ+J
	 dm01HXerdV9UD3gc7XxDpn9cPK2adW/AheTlNKyw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66BF0F80588; Fri, 12 Apr 2024 00:29:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16755F8058C;
	Fri, 12 Apr 2024 00:29:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D8C7F80236; Fri, 12 Apr 2024 00:14:25 +0200 (CEST)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8712DF80423
	for <alsa-devel@alsa-project.org>; Fri, 12 Apr 2024 00:04:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8712DF80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hlWFQgPp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712873063; x=1744409063;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QpmYI3nCN/RiyTRwE47bcfkwM06N232vNmHtjvJJQbU=;
  b=hlWFQgPppW8YKi0O7rnvRtIlqYteDJlAjvZWktcQM87SmR0e+vSJ2hAl
   qG5/R6ec/SscSM39DlqUCO+bmXoL5xyN8OKRZwqeu0sOKMkf61LMaDU5n
   8a5wB/aAYkJuX5vi0ZhHvBL4cQbprJ/F48EhbGRYt5kSGQ2JlEYUd/pae
   rz8NyGWcg1RKI5CR40ffv/4gcItwkZPec1/Lk8RPf5XFduhc9iUr/55Z/
   LU37Lj2GlrxqPs+IwaVHSFAGo4Fm3uMiYVO5pY65WDuPI6oktxameqOSB
   Odc2EHjR5WAnebFBR9CwaRKqUvVu60UTXRo2H6WuMwYOL9Z0f53K9+Zic
   w==;
X-CSE-ConnectionGUID: mkYwtBybThOmCC0j3ZFMJQ==
X-CSE-MsgGUID: d/IC2HueRqKMLg1ZJ4HyMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19708346"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000";
   d="scan'208";a="19708346"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 15:04:13 -0700
X-CSE-ConnectionGUID: j2dPpetiTZ2o5SQfKuEuug==
X-CSE-MsgGUID: 0shJCrDxQ+6W4/ovGEazMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000";
   d="scan'208";a="21628727"
Received: from aramana1-mobl.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.213.177.233])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 15:04:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 03/12] ASoC: Intel: sof_sdw: add JD2 quirk for HP Omen 14
Date: Thu, 11 Apr 2024 17:03:38 -0500
Message-Id: <20240411220347.131267-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
References: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Y3ZF47KRNPZ6MJ74WZNBRO5EY5CENEJ6
X-Message-ID-Hash: Y3ZF47KRNPZ6MJ74WZNBRO5EY5CENEJ6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y3ZF47KRNPZ6MJ74WZNBRO5EY5CENEJ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The default JD1 does not seem to work, use JD2 instead.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 8a2cd19d8be6..f191dc72bc3d 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -498,6 +498,15 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					SOF_BT_OFFLOAD_SSP(1) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "OMEN Transcend Gaming Laptop"),
+		},
+		.driver_data = (void *)(RT711_JD2),
+	},
+
 	/* LunarLake devices */
 	{
 		.callback = sof_sdw_quirk_cb,
-- 
2.40.1

