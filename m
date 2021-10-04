Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB3F4216E0
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 20:57:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8E6E1660;
	Mon,  4 Oct 2021 20:56:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8E6E1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633373857;
	bh=kukjGc/I3KmOaSDXdQPoIywOhXb/N8v/OIIFSS+vn3o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dh+8y/K4o0SDHKbH+SUo2T8F0BU2VHllRYJU5KTMGlXofa7Z+NkQIv4fC6sF3b0uQ
	 Cwzz5SV78u2BcvDiiz8OPrcUGzkXVpLnHYfMW3E3jDwAUFaqNt0zCEtPQFlKiWyb2w
	 pNh0tFX/NQMFIlHn0LdKny8I8EZxsIwdU1iORDt0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F53DF804ED;
	Mon,  4 Oct 2021 20:55:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77C8EF804ED; Mon,  4 Oct 2021 20:55:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9DFAF8032D
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 20:55:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9DFAF8032D
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="206360939"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="206360939"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 10:14:43 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="523435373"
Received: from mbrescia-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.77.4])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 10:14:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/5] ASoC: SOF: dai-intel: add
 SOF_DAI_INTEL_SSP_CLKCTRL_MCLK/BCLK_ES bits
Date: Mon,  4 Oct 2021 12:14:29 -0500
Message-Id: <20211004171430.103674-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004171430.103674-1-pierre-louis.bossart@linux.intel.com>
References: <20211004171430.103674-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Brent Lu <brent.lu@intel.com>, Bard Liao <bard.liao@intel.com>
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Add two clks_control bits. MCLK and/or BCLK will start during hw_params
and stop during hw_free if the corresponding bit is set.

While the kernel does not do anything with these bitfields, this is
also tagged as part of the ABI 3.19 changes.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Brent Lu <brent.lu@intel.com>
---
 include/sound/sof/dai-intel.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/sound/sof/dai-intel.h b/include/sound/sof/dai-intel.h
index 136adf6686e2..7a266f41983c 100644
--- a/include/sound/sof/dai-intel.h
+++ b/include/sound/sof/dai-intel.h
@@ -48,6 +48,10 @@
 #define SOF_DAI_INTEL_SSP_CLKCTRL_FS_KA			BIT(4)
 /* bclk idle */
 #define SOF_DAI_INTEL_SSP_CLKCTRL_BCLK_IDLE_HIGH	BIT(5)
+/* mclk early start */
+#define SOF_DAI_INTEL_SSP_CLKCTRL_MCLK_ES               BIT(6)
+/* bclk early start */
+#define SOF_DAI_INTEL_SSP_CLKCTRL_BCLK_ES               BIT(7)
 
 /* DMIC max. four controllers for eight microphone channels */
 #define SOF_DAI_INTEL_DMIC_NUM_CTRL			4
-- 
2.25.1

