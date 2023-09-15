Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8090D7A17C0
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 09:50:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DFA41F2;
	Fri, 15 Sep 2023 09:49:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DFA41F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694764206;
	bh=wwVTAWX9gcEoa388hHuAXpX/wtgQF+mnPZRHUVGuysM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Cg/A0+xoUs5NFkeOEDU9ciM2RsUpOGHc6Js7m6G9ANzkDWi4vcLk9OtOGJG3f1Mup
	 VQoBWFeNo+LASniuRNxv1qXUtJ7YlKacMUTs7Fh+tGOJxXuS/BI+652iBkhQC/XaCy
	 HQa6mhQReoLdE/Ik9FfR9z0V028LVlhU7T0ETeOU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FB73F80552; Fri, 15 Sep 2023 09:49:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CB34F80246;
	Fri, 15 Sep 2023 09:49:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5AB2F80549; Fri, 15 Sep 2023 09:49:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9282DF80246
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 09:49:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9282DF80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lhKgYwuF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694764144; x=1726300144;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wwVTAWX9gcEoa388hHuAXpX/wtgQF+mnPZRHUVGuysM=;
  b=lhKgYwuF6M0JveG/w7UPJGL5nDVzhfFwVTuyMMmOjyUGtJcTRLQ35TJc
   yR5jdrXAh0twhCxrvFzE2jnqt6e+IAbu5acjBjkc3v7Dkn/zdkVQIdnMw
   EMgCtD0JuHKSbcuZLWS56FXgSELdqQTZHbuWzaXAs+UFHB7X7qEGBUcU+
   YmnBl9ak2BaAJWbYHHgNf4m8rKqgqNh2E8ahQ7TPHomUa8VWXgOi9cwYS
   rQ+JSaf0nQg7wiN4FbftN3juai0xyJAyXXEiQtboQyTHUb3Ybbaw5F5dW
   zJEmiE6LrmGVb0Cj8eCrP8I1p8DW7BVSeQXyAhw9rm7slDhg6I1x+W+/o
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="376527513"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000";
   d="scan'208";a="376527513"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:48:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="779998337"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000";
   d="scan'208";a="779998337"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:47:32 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	ckeepax@opensource.cirrus.com
Subject: [PATCH 0/4] ASoC: intel: sof_sdw: Remove large global CPUs array
Date: Fri, 15 Sep 2023 15:56:07 +0800
Message-Id: <20230915075611.1619548-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: A2K4GHTQDB2SO5N54K7IDF5IB37OC4KY
X-Message-ID-Hash: A2K4GHTQDB2SO5N54K7IDF5IB37OC4KY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A2K4GHTQDB2SO5N54K7IDF5IB37OC4KY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rather than keeping a single array of CPU dai link components allocate a
smaller one for each DAI link, this reduces the amount of state that
needs to be passed back and forth in the driver.

Charles Keepax (4):
  ASoC: intel: sof_sdw: Move sdw_pin_index into private struct
  ASoC: intel: sof_sdw: Add simple DAI link creation helper
  ASoC: intel: sof_sdw: Make create_sdw_dailink allocate link components
  ASoC: intel: sof_sdw: Increment be_id in init_dai_link

 sound/soc/intel/boards/sof_sdw.c        | 244 ++++++++++--------------
 sound/soc/intel/boards/sof_sdw_common.h |   4 +
 2 files changed, 101 insertions(+), 147 deletions(-)

-- 
2.25.1

