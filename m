Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3979E76A337
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:46:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 908B17F4;
	Mon, 31 Jul 2023 23:45:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 908B17F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690839986;
	bh=yqVF/bVG/uHDk11u4SX8tAYg6rmI6nvqQtzEy6ojGdQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KEsa8utBu6J1+fSz7tPu7Ge9LoIDUkpc65qZmJP9hDBT/CdpHGTEdrK3gbS4ae3Xi
	 mVKIf75z8qfcquDhAOfES2U7KXxUCdO+MKitU+7p15KC4MONIIXgxm6JYRtVkg7P1f
	 8s9hvGxOTJQ53h0pqwHgYZisWH65FlZLFiZKXcLI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 712E8F805D7; Mon, 31 Jul 2023 23:43:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8869F805CA;
	Mon, 31 Jul 2023 23:43:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 843B0F8059F; Mon, 31 Jul 2023 23:43:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,RDNS_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC501F80425
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC501F80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EMXRsRiX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839795; x=1722375795;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yqVF/bVG/uHDk11u4SX8tAYg6rmI6nvqQtzEy6ojGdQ=;
  b=EMXRsRiXE7EJ4GwO0Aqatbfp8J7hlPq1G2r6NYBK0gVQJuY7Dm4dpvtb
   IU5o6lL6SPqm3wADNekSMt/kdTHb5LTA6X+uKtGdQ7x1UvtLV8/aWK+7c
   VpnzNiHKp4J4SVUvna6zpMpOklmLfIbLw3TlhkMMK9MWaEMj6xTibxz0/
   7ItpPYNpSQLAaT3WtRq+FWwJv1tM5FTaVaOaTylQ4x1cHt++qdZeffywU
   UqpJ1/wPP6f0sU9oI0E26Bd1XZ1C8uOpCeBj1lCsjtro1UskPPhkmNL6Y
   /ncQpZPNEcKQOCOBttULsFBmxqFLN7NWApMJr+HqiHAFnTEZrACMwmGLg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="435449745"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="435449745"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763523531"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="763523531"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:10 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 05/23] ASoC: Intel: sof_sdw: reorder SoundWire codecs in
 Kconfig
Date: Mon, 31 Jul 2023 16:42:39 -0500
Message-Id: <20230731214257.444605-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
References: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IBCVWHUVRKKFKD7WJM2XDJI4IJZEOC7K
X-Message-ID-Hash: IBCVWHUVRKKFKD7WJM2XDJI4IJZEOC7K
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IBCVWHUVRKKFKD7WJM2XDJI4IJZEOC7K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

No functionality change, just sort Realtek codecs using increasing
part IDs.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 1fe830af2b84..141fba0f8c70 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -671,12 +671,12 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_RT711_SDCA_SDW
 	select SND_SOC_RT712_SDCA_SDW
 	select SND_SOC_RT712_SDCA_DMIC_SDW
+	select SND_SOC_RT715_SDW
+	select SND_SOC_RT715_SDCA_SDW
 	select SND_SOC_RT1308_SDW
 	select SND_SOC_RT1308
 	select SND_SOC_RT1316_SDW
 	select SND_SOC_RT1318_SDW
-	select SND_SOC_RT715_SDW
-	select SND_SOC_RT715_SDCA_SDW
 	select SND_SOC_RT5682_SDW
 	select SND_SOC_CS42L42_SDW
 	select SND_SOC_DMIC
-- 
2.39.2

