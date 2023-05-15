Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F088702561
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 08:52:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DA6F836;
	Mon, 15 May 2023 08:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DA6F836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684133541;
	bh=ulAOPJpFKU1kbrYfiKz1ABKjFv/hYupKOQurQHC/rd0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jVhHz0IwAbzgXpe239FptOmXq9KMKPxIzy2vAAzZRX0QzlfSc9GiynI4uTuG1Uza/
	 eSMl7NVvBvhpo4SuMvwhtPGzOYOPb+f+9OqDyJB6jK86ZDjKh4UFGBdC+flN58CKRM
	 axdgeJTp1xy25qq3Po7ducDmzJnPxT+OwQRGrIUU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B905F80558; Mon, 15 May 2023 08:50:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BACD3F80558;
	Mon, 15 May 2023 08:50:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0006BF80542; Mon, 15 May 2023 08:50:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89A3EF8024E
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 08:50:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89A3EF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CCZbV4hW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684133427; x=1715669427;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ulAOPJpFKU1kbrYfiKz1ABKjFv/hYupKOQurQHC/rd0=;
  b=CCZbV4hWAUzRjD6vwmIpVKY2fY+hGYO0XvokrqIuReDcsKfoZRXPrGKM
   2mfzW6G91dALDYY/0ZYG1EqCjjiR1rrFycGsGgVtx4iElMsr8b8G9f4r2
   EisRsEuLCx85vHau/Qs4AoJ61N3z8cOEDgO00Q7+LDD2EqcLCR7zmH0ZM
   CEYyabFxEvQECgN9F5hLqTRMp+a13DsvWmAWiQ4DtRGr5obCRiwxZRfBg
   GfW0a9sCzAnjXj9+dInDlxVYK0W9lftexaFbrbyEJaVq/MR4HUm8RWeY+
   yI2kUdgesmRdkoTomS59zGs+rYqbcCn/lSVtPLLVjVDsdmoWybKwh/p0l
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="349966252"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="349966252"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:50:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694908576"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="694908576"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:50:21 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	vinod.koul@linaro.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 01/26] ASoC: SOF: Intel: shim: add enum for ACE 2.0 IP used
 in LunarLake
Date: Mon, 15 May 2023 15:10:17 +0800
Message-Id: <20230515071042.2038-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
References: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UQOJS7ZHOUURPWWK5RGFS3DB4NETPCJW
X-Message-ID-Hash: UQOJS7ZHOUURPWWK5RGFS3DB4NETPCJW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UQOJS7ZHOUURPWWK5RGFS3DB4NETPCJW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Add the new enum needed for SoundWire IP selection. The LunarLake PCI
descriptors and DSP parts will be added at a later time.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/shim.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index 48428ccbcfe0..207df48e27cf 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -21,6 +21,7 @@ enum sof_intel_hw_ip_version {
 	SOF_INTEL_CAVS_2_0,	/* IceLake, JasperLake */
 	SOF_INTEL_CAVS_2_5,	/* TigerLake, AlderLake */
 	SOF_INTEL_ACE_1_0,	/* MeteorLake */
+	SOF_INTEL_ACE_2_0,	/* LunarLake */
 };
 
 /*
-- 
2.25.1

