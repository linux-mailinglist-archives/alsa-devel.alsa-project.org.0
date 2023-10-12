Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 913877C768F
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:17:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C343EB2;
	Thu, 12 Oct 2023 21:16:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C343EB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697138256;
	bh=xwTmDUgKWFTMwtx+0fK5FEMjG1SbAl8vZqnnMOVgTzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=owIqlSsIMdI4Pv/hEkzRIvOiKyQK44Vwz/KXDlzNirPrJ7IsHmXGjoCBSnL66IqIL
	 O2f2x6aN+wXLs4L5bSuF10/cLVTZsNeigYjBfCHuf4/M8S/lJQcILvVPku6RszyhhP
	 g8XL9Duwb9Wp0Ii2Qo7iYwyvypI3qdfL+cyLtAUI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 762B0F805C9; Thu, 12 Oct 2023 21:13:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E6CCF805BD;
	Thu, 12 Oct 2023 21:13:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4C97F8027B; Thu, 12 Oct 2023 21:13:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F789F8019B
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:13:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F789F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Hs1moqAN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697138012; x=1728674012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xwTmDUgKWFTMwtx+0fK5FEMjG1SbAl8vZqnnMOVgTzI=;
  b=Hs1moqAN+OQPo7OxKCRWV46scITc4XGO5d+suZ+gw/iz+Ha3nmSAx0Am
   UBviF435cNJfum/Q+H3vIal7lMuptE+sHgQZ5ektPjZmdqyFLxlI/2BpR
   G+xaW+FG2WlVnOsQ9lBVEuAJ+8H2aHDdZlPXjJHdBUKXSQfmxgrnIbtbD
   mrVnlhLr/5AQbFO0iW9rHtEZvGz+Egh2w3Nmm381zOo0th6yZtV9XkzAI
   pfKPkOq6E2TDMlXBwSK2FkZDjh1P7idh2ZDF053yViSxDTogDhCEZ4zal
   W0gwryqznpbxPBnSEXV5BfKaZabHfOQ2Ru/OhistsMbhHdOCLCFao7+Hp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="382249211"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="382249211"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:13:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="704295159"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="704295159"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:13:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 1/2] ASoC: rt715-sdca: reorder the argument in error log
Date: Thu, 12 Oct 2023 15:13:14 -0400
Message-Id: <20231012191315.145411-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012191315.145411-1-pierre-louis.bossart@linux.intel.com>
References: <20231012191315.145411-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JRNLTLEZFORMDJ7GNBWOEUWHKOCBGNDP
X-Message-ID-Hash: JRNLTLEZFORMDJ7GNBWOEUWHKOCBGNDP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JRNLTLEZFORMDJ7GNBWOEUWHKOCBGNDP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

"Failed to set private value: ffffffea <= 6100000 24832" is confusing.
It should be "Failed to set private value: 6100000 <= 24832 -22"

Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt715-sdca.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
index 9fa96fd83d4a..4533eedd7e18 100644
--- a/sound/soc/codecs/rt715-sdca.c
+++ b/sound/soc/codecs/rt715-sdca.c
@@ -41,8 +41,8 @@ static int rt715_sdca_index_write(struct rt715_sdca_priv *rt715,
 	ret = regmap_write(regmap, addr, value);
 	if (ret < 0)
 		dev_err(&rt715->slave->dev,
-				"Failed to set private value: %08x <= %04x %d\n", ret, addr,
-				value);
+			"Failed to set private value: %08x <= %04x %d\n",
+			addr, value, ret);
 
 	return ret;
 }
-- 
2.39.2

