Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C43700E16
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 19:48:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6775E96;
	Fri, 12 May 2023 19:47:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6775E96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683913696;
	bh=G5gbNgfeg4XZDB9YlQebK9EWfdde2xq8U1cJ5PdQ4XY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LS4dKnmmtLu8MyEQJBjuy0JNBiYZgfTrdd49BTmyOBC6fhfL/iChC1cMqHjM91G5c
	 gB0RHPHO0vu8iROI509C9hPXvut30s4bD/QocxrLicYhNu1a+ui5189dgnkm09cjWO
	 /Dzcj7S0XJxKHt+QLk93T7wdcFRGT8EtIUJCvRlo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C28FFF80571; Fri, 12 May 2023 19:46:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 425D3F8055C;
	Fri, 12 May 2023 19:46:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5747FF8014C; Fri, 12 May 2023 19:46:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C441F8032D
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 19:46:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C441F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Clk6Q+UW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683913586; x=1715449586;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G5gbNgfeg4XZDB9YlQebK9EWfdde2xq8U1cJ5PdQ4XY=;
  b=Clk6Q+UWw0ESsUvxLhFqP29UFGembgpACS1deySm0t6WWHk5+8OfALQM
   b4/srXa8nq5z3Yal4KFz/Dqf3JR+YLEMUeXD6ki07DnjMj/0IEJOCJ2fl
   qBKIdv1kDoITBRduVO6sxhjaesJApeYvfDe8CFpusK1XTYw6/JqeaZcnd
   Wy1IPnVx0COW1fP04GSCEhOOTX7X0uBtgynO/zMcNm01WUgDiBCDAchxQ
   qpmxOWSzkBAlUxQnghmb+NojKJDEfKP92Hq774Q5sC5w4HQj5Nj08NDAx
   XbTTtX6KGxKx2CwIbZZqGXC7K9O6FOR0Yp5WJ9cCO6Ih9Ba0aMb3bflan
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="349688067"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="349688067"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 10:46:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="812167791"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="812167791"
Received: from winkelru-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.144.249])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 10:46:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 4/6] ASoC: SOF: Intel: hda-mlink: use 'ml_addr' parameter
 consistently
Date: Fri, 12 May 2023 12:46:09 -0500
Message-Id: <20230512174611.84372-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230512174611.84372-1-pierre-louis.bossart@linux.intel.com>
References: <20230512174611.84372-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EH3UYBVNCKYLGR7XEC5IWCW2ZCRUOI4Z
X-Message-ID-Hash: EH3UYBVNCKYLGR7XEC5IWCW2ZCRUOI4Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EH3UYBVNCKYLGR7XEC5IWCW2ZCRUOI4Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We mix the use of hlink->ml_addr and the 'ml_addr' parameter. It's the
same thing, let's align on using the parameter.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-mlink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index 7f5d0ea4abeb..c540b1d75451 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -131,7 +131,7 @@ static int hdaml_lnk_enum(struct device *dev, struct hdac_ext2_link *h2link,
 		link_idx, h2link->slcount);
 
 	/* find IP ID and offsets */
-	h2link->leptr = readl(hlink->ml_addr + AZX_REG_ML_LEPTR);
+	h2link->leptr = readl(ml_addr + AZX_REG_ML_LEPTR);
 
 	h2link->elid = FIELD_GET(AZX_REG_ML_LEPTR_ID, h2link->leptr);
 
-- 
2.37.2

