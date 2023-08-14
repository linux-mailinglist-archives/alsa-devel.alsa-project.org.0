Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4055977C3CB
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 01:15:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF9DA829;
	Tue, 15 Aug 2023 01:14:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF9DA829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692054930;
	bh=nN9KjBgRn0dOYP8ptzEVvZyYgZkxwyTHnJn4VOzNSj0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Ky1vOXzAKk3F9+rdlnxNdHNaUTSMVeb551D0DiA/9nkMNumGAScOZqGvkmlmecnWl
	 jkOfctXdhWkknp0aRCXJDFyhmXMzthGjpL61DmCp2TPtQpQTSZzrYU08h8GeOlw4fy
	 HbSzVEEw9lG5p/U3GnrRh5b1rhigQQRZ7oOtbXcc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2805F80549; Tue, 15 Aug 2023 01:14:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64248F80290;
	Tue, 15 Aug 2023 01:14:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DFCDF80510; Tue, 15 Aug 2023 01:14:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D1A2F800EE
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 01:14:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D1A2F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UH/Qo281
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692054856; x=1723590856;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nN9KjBgRn0dOYP8ptzEVvZyYgZkxwyTHnJn4VOzNSj0=;
  b=UH/Qo28160eV+f4v5B5d+PSlcwYghsp7CjbzANGSfVHyfKDujN4vJidQ
   RZCixZvwgx2elp9zAqqKz9DOwStoL3P8pZURkQnmCnKSB0svrsOtM5fwU
   vDZ4I7EaeAqlPYqHNOtH6/el68XWf/GCz/vYUff9LaQQj1w0QskaVbi0v
   2MNpycyysvyg6253uadq5Unsm8pys77jFGWi++0ZKrya1fcncJJuWQqaz
   37+Dcy/68CWnKe6ybYf3+T58GxCPSDY1EVOWxej5FpsHdRNvxVF5NIIB3
   QPxV2YazHANeC52Fp4q4di09BCDWy0fDAUZprPtBc8mhHU0umbXOkeBP8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="403136787"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200";
   d="scan'208";a="403136787"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 16:14:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="1064250671"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200";
   d="scan'208";a="1064250671"
Received: from dishasur-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.104.139])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 16:14:10 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/4] ASoC: Intel: RPL/MTL machine updates for 6.6
Date: Mon, 14 Aug 2023 18:13:54 -0500
Message-Id: <20230814231358.78971-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: V32CJNTQU2TUUMTIKMZJ6L6QO73ASQMW
X-Message-ID-Hash: V32CJNTQU2TUUMTIKMZJ6L6QO73ASQMW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V32CJNTQU2TUUMTIKMZJ6L6QO73ASQMW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

4 commits with the match tables for RaptorLake and MeteorLake devices.

Balamurugan C (3):
  ASoC: Intel: soc-acpi: Add entry for sof_es8336 in RPL match table.
  ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in RPL
    match table
  ASoC: Intel: RPL: Add entry for HDMI-In capture support on non-I2S
    codec boards.

Chao Song (1):
  ASoC: Intel: soc-acpi: add support for Dell SKU0C87 devices

 sound/soc/intel/boards/sof_es8336.c           | 10 ++++
 sound/soc/intel/boards/sof_ssp_amp.c          |  9 ++++
 .../intel/common/soc-acpi-intel-mtl-match.c   | 52 +++++++++++++++++++
 .../intel/common/soc-acpi-intel-rpl-match.c   | 30 +++++++++++
 4 files changed, 101 insertions(+)

-- 
2.39.2

