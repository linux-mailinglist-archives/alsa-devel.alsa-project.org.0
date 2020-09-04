Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC28325D9A2
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 15:32:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 290DC1B15;
	Fri,  4 Sep 2020 15:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 290DC1B15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599226330;
	bh=RYp/Wpc1bjAkl4VrA76bPCDdYYFR69xx8M1n6I9NzeM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dMXyiN769h3sp41qqcAnWzLxIPa3Z3EO2Z1dP9+b2iXuc0AJL4Z1DUfd5qfrxWwdD
	 B9PX/L1Fz8QxO85GpEVSQyOUrbL7V68TDClSM7hgZRG9AoRgMCHQHxzPqdEffGzbnp
	 N6dxRdjJjzo/rHlcnS3y6K1wC3hhN98u7cd7uM90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9239F802C4;
	Fri,  4 Sep 2020 15:29:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95FB3F802D2; Fri,  4 Sep 2020 15:29:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C16EAF800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 15:29:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C16EAF800F0
IronPort-SDR: n4qAlofsGP79QAfqi6a8C4p9aMp4BFXl9jLxihYifOiux1NEhAmAoulTKEChbwg5nY5M3sVq86
 FWRpq89VufIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="137259547"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="137259547"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 06:29:31 -0700
IronPort-SDR: DmqfJa9Dw/gDBGR/RTG3cPDP/AekOCiGeNqdf39HjrP0dXI+vy5tZdvX5851o19+HTtBD2EPIW
 I2UpbA65pFrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="284416696"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008.fm.intel.com with ESMTP; 04 Sep 2020 06:29:30 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 01/16] ASoC: SOF: tokens: add token for component UUID
Date: Fri,  4 Sep 2020 16:27:29 +0300
Message-Id: <20200904132744.1699575-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200904132744.1699575-1-kai.vehmanen@linux.intel.com>
References: <20200904132744.1699575-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, Keyon Jie <yang.jie@linux.intel.com>,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

From: Keyon Jie <yang.jie@linux.intel.com>

Add the definition SOF_TKN_COMP_UUID for the component UUID token, this
shall be used for all types of component in the future.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/uapi/sound/sof/tokens.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index 37f5aaa09c2b..d3aae4ad8959 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -74,6 +74,7 @@
  * #define SOF_TKN_COMP_PRELOAD_COUNT		403
  */
 #define SOF_TKN_COMP_CORE_ID			404
+#define SOF_TKN_COMP_UUID                       405
 
 /* SSP */
 #define SOF_TKN_INTEL_SSP_CLKS_CONTROL		500
-- 
2.27.0

