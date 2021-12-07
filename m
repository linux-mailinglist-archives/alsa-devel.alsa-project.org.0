Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2154846C3D7
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 20:43:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A698E2593;
	Tue,  7 Dec 2021 20:43:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A698E2593
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638906236;
	bh=SKnEH4VR81yo6m5uquxWOiBsLLtQUicEyod7GMXNZsU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kNqKZm2d9GF5gDHGAV+ltAvjVxuR9hvQC7d95CcB/hBKSww5jmRPOASn83A6U0QF9
	 fida7XiSWKaXO9owUWzu7Ziot+4K2sfAw3BwjwlMNtOFbr4sMiTMgExhcuQJHV0Uva
	 WQzC4hVSF/YDH1TTOjJd2+erSuOtIhnNMPtWRx4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FCF3F80529;
	Tue,  7 Dec 2021 20:40:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 548F1F80508; Tue,  7 Dec 2021 20:40:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37DA0F804FC
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 20:40:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37DA0F804FC
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="236407818"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="236407818"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 11:40:13 -0800
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="479641191"
Received: from nthiag2-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.74.17])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 11:40:12 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 7/7] ASoC: SOF: Intel: add comment on JasperLake support
Date: Tue,  7 Dec 2021 13:39:47 -0600
Message-Id: <20211207193947.71080-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207193947.71080-1-pierre-louis.bossart@linux.intel.com>
References: <20211207193947.71080-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

Explain why JasperLake is exposed in cnl.c instead of icl.c
No functionality change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/cnl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 04daaa6100f1..3da158d08980 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -358,6 +358,13 @@ const struct sof_intel_dsp_desc cnl_chip_info = {
 };
 EXPORT_SYMBOL_NS(cnl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
 
+/*
+ * JasperLake is technically derived from IceLake, and should be in
+ * described in icl.c. However since JasperLake was designed with
+ * two cores, it cannot support the IceLake-specific power-up sequences
+ * which rely on core3. To simplify, JasperLake uses the CannonLake ops and
+ * is described in cnl.c
+ */
 const struct sof_intel_dsp_desc jsl_chip_info = {
 	/* Jasperlake */
 	.cores_num = 2,
-- 
2.25.1

