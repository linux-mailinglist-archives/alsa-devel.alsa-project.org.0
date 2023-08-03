Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE9576E02A
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 08:25:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B37836C0;
	Thu,  3 Aug 2023 08:25:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B37836C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691043955;
	bh=5dHLhZfkM4fPP4ODNsxE3CV5Tq4sdvHjv7CD0L/AoHo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sCsfAfwv9lwf8gqPiZbHK+k3SFgmrPZiPgQJXIyk7sqVN6A2NESosew6KbFMXSU59
	 sPewAJ5p1To8mnz6EwqvZUsyYpBAizSY3KE1gteFD0jYhvoLTL9X7B43+zXZ8KGmju
	 2vjNedZ4vmkgUz4EdXveBL/9l8Eufj1iJ1AmmX5M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35BF0F802BE; Thu,  3 Aug 2023 08:25:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 460C0F801D5;
	Thu,  3 Aug 2023 08:25:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6405DF802BE; Thu,  3 Aug 2023 08:24:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84A19F80087
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 08:24:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84A19F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PTMKuI/V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691043892; x=1722579892;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5dHLhZfkM4fPP4ODNsxE3CV5Tq4sdvHjv7CD0L/AoHo=;
  b=PTMKuI/VpyEbLw3HtT/o6/vJsvXpxYAuUQ94qOlWU6/Jwr1ZQnfJ+9bd
   tbixhDUaGg/smyv55Qt6vu9fpCdxB9R7/7nCfNMBUFpY+BQ9ig/G2gbTn
   oILYpE6lZtJ8ojAgB4J34BdlykhF9Ropd9is+X+d5fbtpi9cW9c4vc+84
   34vIg7yAL49Eh3ODS+5frEh73cC4CyzKp4xy45jemwVBuSX7eMlqzfxF0
   +FpDoJmrBjKnT5kO2VDak0af4kADXPYW9dZ8GsAZqO3W5S1M2XnpqI4eJ
   xtuZ7a/WPTSJNIGK54O2YtklgtSTuV/Rhca3UAWYyPKvoGJeVboqRhj3G
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="350075219"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200";
   d="scan'208";a="350075219"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 23:23:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="1060117879"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200";
   d="scan'208";a="1060117879"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 23:23:57 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 0/2] soundwire: improve pm_runtime handling
Date: Thu,  3 Aug 2023 14:52:18 +0800
Message-Id: <20230803065220.3823269-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZV7JZPNPK5KHOD6L5YJRG7PWDQTJHC2K
X-Message-ID-Hash: ZV7JZPNPK5KHOD6L5YJRG7PWDQTJHC2K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZV7JZPNPK5KHOD6L5YJRG7PWDQTJHC2K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset improves the pm_runtime behavior in rare corner cases
identified by the Intel CI in the last 6 months.

a) in stress-tests, it's not uncommon to see the following type of
warnings when the codec reports as ATTACHED

    "rt711 sdw:0:025d:0711:00: runtime PM trying to activate child device
    sdw:0:025d:0711:00 but parent (sdw-master-0) is not active"

This warning was not correlated with any functional issue, but it
exposed a design issue on when to enable pm_runtime. The recommended
practice in the pm_runtime documentation is to keep the devices in
'suspended' mode and mark them as 'active' when they are really
functional.

Pierre-Louis Bossart (2):
  soundwire: intel_auxdevice: enable pm_runtime earlier on startup
  soundWire: intel_auxdevice: resume 'sdw-master' on startup and system
    resume

 drivers/soundwire/intel_auxdevice.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

-- 
2.25.1

