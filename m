Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F3D60DBFC
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 09:18:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E72774134;
	Wed, 26 Oct 2022 09:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E72774134
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666768724;
	bh=8/eH7Gu81CNmTsHwbaGvDjXLn8pW44OxlFiYMaTQxsk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rt4N2op6deBkpe9ZNfrMt3MWogEwMxy59h9lkZf7G9MimqjgQwzj4aTm/4rJlZh14
	 Ty3NQfwniGkIJiSgGwHG5kfUGeaT9tvwevqfnjYmLYligEgD1RBP13JeOgOSS7An06
	 FcbhO09ZAQfGZ1Jn5fnMOVhLQe92k7iscFc0D8nU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3926F804B4;
	Wed, 26 Oct 2022 09:17:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD9E7F804B4; Wed, 26 Oct 2022 09:17:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 306E6F80240
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 09:17:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 306E6F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QwE5dLM+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666768640; x=1698304640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8/eH7Gu81CNmTsHwbaGvDjXLn8pW44OxlFiYMaTQxsk=;
 b=QwE5dLM+01XEiJEduMvURuSHvBxWtzRP4fde6qsjWqIjoeGPThzznrkU
 4N/vjmohHONmsV90fEVpylI8xRdczYyxa/6w/y4qVMxBYYE7cCBxKnMxN
 SFw3mwbMRPjGm4Yj2lSP6MY39i7iUmvDtVXGI9aeJocl5xL69R7V7udQa
 gu6Gij1hTOuYAJSh0mXW78yMDKAl425UAmngFXkUJioeNgzXnglyanwaO
 ExIWNQlGjuN+2WX5LjVcXiwo4PvuX+tsvr9qhSJROwRDDpjoR7NeJcoMU
 zGXepyUBG9RToLfHhxb9zCbrbh0YLp74r3163BuGsOSL2YwB3gSwffe78 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="287596228"
X-IronPort-AV: E=Sophos;i="5.95,213,1661842800"; d="scan'208";a="287596228"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 00:17:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="663096914"
X-IronPort-AV: E=Sophos;i="5.95,213,1661842800"; d="scan'208";a="663096914"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.25])
 by orsmga008.jf.intel.com with ESMTP; 26 Oct 2022 00:16:57 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: Intel: add helpers to detect SoCs
Date: Wed, 26 Oct 2022 15:14:08 +0800
Message-Id: <20221026071409.3235144-2-brent.lu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221026071409.3235144-1-brent.lu@intel.com>
References: <20221026071409.3235144-1-brent.lu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "balamurugan . c" <balamurugan.c@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Chao Song <chao.song@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Gongjun Song <gongjun.song@intel.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Muralidhar Reddy <muralidhar.reddy@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Ajye Huang <ajye.huang@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Vamshi Krishna <vamshi.krishna.gopal@intel.com>, Yong Zhi <yong.zhi@intel.com>
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

Add helpers to detect JSL, TGL, ADL, and ADL-N SoCs.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 include/linux/platform_data/x86/soc.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/linux/platform_data/x86/soc.h b/include/linux/platform_data/x86/soc.h
index da05f425587a..08d08c91d57b 100644
--- a/include/linux/platform_data/x86/soc.h
+++ b/include/linux/platform_data/x86/soc.h
@@ -33,6 +33,10 @@ SOC_INTEL_IS_CPU(cht, ATOM_AIRMONT);
 SOC_INTEL_IS_CPU(apl, ATOM_GOLDMONT);
 SOC_INTEL_IS_CPU(glk, ATOM_GOLDMONT_PLUS);
 SOC_INTEL_IS_CPU(cml, KABYLAKE_L);
+SOC_INTEL_IS_CPU(jsl, ATOM_TREMONT_L);
+SOC_INTEL_IS_CPU(tgl, TIGERLAKE_L);
+SOC_INTEL_IS_CPU(adl, ALDERLAKE_L);
+SOC_INTEL_IS_CPU(adl_n, ALDERLAKE_N);
 
 #else /* IS_ENABLED(CONFIG_X86) */
 
@@ -60,6 +64,26 @@ static inline bool soc_intel_is_cml(void)
 {
 	return false;
 }
+
+static inline bool soc_intel_is_jsl(void)
+{
+	return false;
+}
+
+static inline bool soc_intel_is_tgl(void)
+{
+	return false;
+}
+
+static inline bool soc_intel_is_adl(void)
+{
+	return false;
+}
+
+static inline bool soc_intel_is_adl_n(void)
+{
+	return false;
+}
 #endif /* IS_ENABLED(CONFIG_X86) */
 
 #endif /* __PLATFORM_DATA_X86_SOC_H */
-- 
2.25.1

