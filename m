Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2EB571AA8
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 14:59:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E0E216B1;
	Tue, 12 Jul 2022 14:58:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E0E216B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657630744;
	bh=OZf4yp7Wi1fYelBYFB6J04bAMAdtoleEfScP2hdlvDQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gE2xFUeN/mLdCLzhSwAAiQqq/UY3fj3MKBFryQHIn32aQZOpEUR1kscQuz7BimFc2
	 hdPHHCFYR51pUYECiI1WEsPRr5LyF+LkbageWt/85V4qWMU8Vjs9Gl4SA2k+KVdxN6
	 j3I8uH/9xs2zdjF8MuUOp77J/qwulDVV7tA3R4dQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48021F80246;
	Tue, 12 Jul 2022 14:57:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F116BF80557; Tue, 12 Jul 2022 14:57:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B644F80246
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 14:56:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B644F80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WKkPA1MS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657630618; x=1689166618;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OZf4yp7Wi1fYelBYFB6J04bAMAdtoleEfScP2hdlvDQ=;
 b=WKkPA1MSxzpLTBd8wkdAyHH/kk/pS4IicwKZjQ5me7isWeGLfk+d8JzF
 aYF5uC+hkeBIEHSNfVmzImIh3tXoXfv+eDQkRgsPY6f5dNBQNlt9vzzz6
 6Pxz42d1SnXT2JuhJptL5Zds3bgPm59psHaP0LbjKh3NDl+Q3E0j/1LGT
 OBueHvPzGAxSbsTC+e5fNzM6t6ZJC7PzSJl/THCN25+dokBIV40etZN4e
 9yFAtqi2nBxwfA7bNNC8pBixIygBCIzFfODDVVGZYbtNib7h8YsTLG2pu
 pqCOZvToCiXiz6W4TwkWAyL17vHaz8QGo52yLbq6LbZekgxYf01LnEFuB Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="346607588"
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="346607588"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 05:56:56 -0700
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="662942928"
Received: from ahedstro-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.254.175])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 05:56:54 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 3/3] ASoC: SOF: Intel: hda: Drop no longer used ROM state
 definitions
Date: Tue, 12 Jul 2022 15:57:34 +0300
Message-Id: <20220712125734.30512-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220712125734.30512-1-peter.ujfalusi@linux.intel.com>
References: <20220712125734.30512-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

All code have been switched to use the new FSR defines and macros for
ROM/FW state tracking.
The old definitions can be dropped now.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 77c74e3c09b1..effa1b0f556d 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -251,12 +251,6 @@
 #define FSR_STATE_BRINGUP_FW_ENTERED		FSR_STATE_FW_ENTERED
 
 /* ROM  status/error values */
-#define HDA_DSP_ROM_STS_MASK			GENMASK(23, 0)
-#define HDA_DSP_ROM_INIT			0x1
-#define HDA_DSP_ROM_FW_MANIFEST_LOADED		0x3
-#define HDA_DSP_ROM_FW_FW_LOADED		0x4
-#define HDA_DSP_ROM_FW_ENTERED			0x5
-#define HDA_DSP_ROM_RFW_START			0xf
 #define HDA_DSP_ROM_CSE_ERROR			40
 #define HDA_DSP_ROM_CSE_WRONG_RESPONSE		41
 #define HDA_DSP_ROM_IMR_TO_SMALL		42
-- 
2.37.0

