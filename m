Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 664046E8238
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 21:58:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB48EF0A;
	Wed, 19 Apr 2023 21:57:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB48EF0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681934294;
	bh=IJ+fwitynAIAX9EKxUj/jGrAg6HhpdhNXreZieQ0oNQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yg/ZYZmpFwJeSqtDshcUnGmgiBBhxPa27qF/HyG+iDgmdqXFRwLBvRU1lg4U7yLei
	 +7QiOORpIyEkIV9DUeETzUbGe18T5MJdvY6tozmSMKeAKpuM2fqQY7+FZz2scqt6VZ
	 U/qwvjPORH3DJ8c9DWP8UURKSM7QY3KQQSfApPu4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B24F2F80542;
	Wed, 19 Apr 2023 21:56:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EC40F8052E; Wed, 19 Apr 2023 21:56:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3818F800F8
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 21:56:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3818F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=L7Qmh4AS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681934167; x=1713470167;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IJ+fwitynAIAX9EKxUj/jGrAg6HhpdhNXreZieQ0oNQ=;
  b=L7Qmh4AS8WO4OJZ/y3RiheOuX9IKO3zCJYZEHNF6uNzVnrP2af87CYad
   FgKoOvlFsP+48xNBS19JPBPOi4tcktge2xIzdRz/+tARvpQ+0bFqp2scs
   sK96MH0mxljqF+r03JI+ouAHbigbtmuNE1kpQJvqyYbp8rNWlX4DXtQRq
   slf64X7wHwj1zierxZjHCqluUscmRgkggq5WSoawmBenMb1mjpd1PkP28
   UIldQIvdPWGMA6N1x++g4VywQnWP4+/LKHJyNXllT6XHUTiXAgd5oET8i
   cSIKxFhEc3T8pK9Vpchp3qgJu4gr2vbh3BYI+AoE1pYzbPPFwHFPS9AmH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="373434396"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200";
   d="scan'208";a="373434396"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:56:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="815728108"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200";
   d="scan'208";a="815728108"
Received: from gargicha-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.74.38])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:56:02 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/7] ASoC: Intel: sof_sdw: set codec_num = 1 if the device is
 not aggregated
Date: Wed, 19 Apr 2023 14:55:22 -0500
Message-Id: <20230419195524.46995-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230419195524.46995-1-pierre-louis.bossart@linux.intel.com>
References: <20230419195524.46995-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SWRXX7TCJ25MEQVJFXEKO6YFBVMN4UWL
X-Message-ID-Hash: SWRXX7TCJ25MEQVJFXEKO6YFBVMN4UWL
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SWRXX7TCJ25MEQVJFXEKO6YFBVMN4UWL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

We assume adr_link->num_adr = 1 if a device is not aggregated. However,
the assumption is not valid if there are different type devices on the
same soundwire link.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 7d398b45d48f..e5729df4fd44 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -961,6 +961,7 @@ static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 	cpu_dai_id[index++] = ffs(adr_link->mask) - 1;
 	if (!adr_d->endpoints->aggregated || no_aggregation) {
 		*cpu_dai_num = 1;
+		*codec_num = 1;
 		*group_id = 0;
 		return 0;
 	}
-- 
2.37.2

