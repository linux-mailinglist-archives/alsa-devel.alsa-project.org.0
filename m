Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FC1700E9A
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 20:21:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEB08EB3;
	Fri, 12 May 2023 20:20:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEB08EB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683915671;
	bh=akOz3a5d3O+q+dKd9QYnOfikOKhBsr355TSnY2hpehE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DAWfbVzI8G3GJdwKaZ7aJA8OUfokdPoh7TWdc2z0+SrR01/gMaGl8x3B7ntiV7iIT
	 lwkj2OrgAjjzbnBPztQsF3bip82mbk2QNWJkQC1bGEboL6lb65N6jsmQN8zUSFcxPn
	 F0Mp4imnNvgbiO+W1D5a0nGPBbNjdLycRgl3oDwo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1A5EF805E1; Fri, 12 May 2023 20:18:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CDD5F805D5;
	Fri, 12 May 2023 20:18:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49E08F8059F; Fri, 12 May 2023 20:17:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 932EFF802E8
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 20:17:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 932EFF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HkyImDvu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683915463; x=1715451463;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=akOz3a5d3O+q+dKd9QYnOfikOKhBsr355TSnY2hpehE=;
  b=HkyImDvuhjpAStJsr3qlJnjD4PplfnMwisFEB/aWstsOP5/E4PBYwDyR
   fxvJ1ktOWrSCIbhV/YCAqPaMYTa6A4MxopyEbiv/KWw9O5Tl/mxGIFuud
   8qQbMMX87TdASNPlE0ldWKkt/E+kpgewV46cdT5lKXgTopuK6BQh504xi
   vL/oP6DHOT1dP/NBbtZ/cuRYly+eWY4byzvBjOafY89gin21Dz3ER8DCi
   15PsJhuPFHU7prB2WaZfEl/uSm4hTVB15WUu+mjK+KoZ+HSNO9dsDj1q3
   ZNdhjHjTdZJgFUo6GbtREEtfIJv8R1pjvGT6Nxczoe/CX/juRI15nBlrw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="331223217"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="331223217"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 11:17:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="769895082"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="769895082"
Received: from winkelru-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.144.249])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 11:17:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 5/9] ASoC: SOF: Intel: Kconfig: move selection of
 PROBE_WORK_QUEUE
Date: Fri, 12 May 2023 13:16:58 -0500
Message-Id: <20230512181702.117483-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230512181702.117483-1-pierre-louis.bossart@linux.intel.com>
References: <20230512181702.117483-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FDGTE5CSJILRVI5A4773Y4HIUC2OKI6A
X-Message-ID-Hash: FDGTE5CSJILRVI5A4773Y4HIUC2OKI6A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FDGTE5CSJILRVI5A4773Y4HIUC2OKI6A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The probe workqueue is only needed if we have a Display Audio codec.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index f4eeacf1f281..88529a6cb20d 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -285,7 +285,6 @@ if SND_SOC_SOF_HDA_COMMON
 config SND_SOC_SOF_HDA_LINK
 	bool "SOF support for HDA Links(HDA/HDMI)"
 	depends on SND_SOC_SOF_NOCODEC_SUPPORT=n
-	select SND_SOC_SOF_PROBE_WORK_QUEUE
 	help
 	  This adds support for HDA links(HDA/HDMI) with Sound Open Firmware
 	  for Intel(R) platforms.
@@ -295,6 +294,7 @@ config SND_SOC_SOF_HDA_LINK
 config SND_SOC_SOF_HDA_AUDIO_CODEC
 	bool "SOF support for HDAudio codecs"
 	depends on SND_SOC_SOF_HDA_LINK
+	select SND_SOC_SOF_PROBE_WORK_QUEUE
 	help
 	  This adds support for HDAudio codecs with Sound Open Firmware
 	  for Intel(R) platforms.
-- 
2.37.2

