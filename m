Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 911555804E8
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 21:55:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BBAD84D;
	Mon, 25 Jul 2022 21:55:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BBAD84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658778957;
	bh=9ekmslf8bxQ/U9/EoCRc9GSVbn1UK1QRTwUKHGL3Atw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C5ISmAEchv9Mlhq2NS0GNWP1lhFaeZmzXaaUdvDmY1kba4SsESD8InHP0IiClJPQ6
	 wk3xT/kmx84JcqIeWOnyI+VZC3uRu8fup1CtUzAaD3OkTm3yhpUx/+0M0nFiulEbxm
	 0A3h97A6Ba8tCA3lo3bT2pyAZkP4fNf73a0cs5Kc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0936BF8054A;
	Mon, 25 Jul 2022 21:54:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0711DF8053C; Mon, 25 Jul 2022 21:54:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96B67F80163
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 21:53:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96B67F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Lw1vLjWG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658778840; x=1690314840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9ekmslf8bxQ/U9/EoCRc9GSVbn1UK1QRTwUKHGL3Atw=;
 b=Lw1vLjWGvc/+COpv1yX1XB8R+lpS2qKkuUrLcCSjFmj7Cy8e80ebegFu
 2Oe1TdAjZNAkvdhLO7AEHiJ4pE5tEes7MtFzL2PMtPIhtreKwiq6Kus/f
 2EsvTkWZLB+SvEIa+KEY3ygKmmfD1ms30Vu1PxSEYWKhwTjk67DofxWOq
 BkHGOHXIlHJPWpGDz9v+Od1SfKXuepGSaRYW9w2flB0hrAkJ8GUaV340p
 AROKd23wEHrdHm7rjd6t5LP/R68Axj6txzf0J8LEfA0MKMVshn7brsZw4
 uvu4f8uueKCShbLrrfcaCC0ycBi2KHqfLUT3xlmmJjlafpTfE/dTYlZGe Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="270820367"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="270820367"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 12:53:53 -0700
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="627593519"
Received: from mbianco-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.71.159])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 12:53:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoC: SOF: dai-intel: add
 SOF_DAI_INTEL_SSP_CLKCTRL_MCLK_AON bit
Date: Mon, 25 Jul 2022 14:53:43 -0500
Message-Id: <20220725195343.145603-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220725195343.145603-1-pierre-louis.bossart@linux.intel.com>
References: <20220725195343.145603-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Brent Lu <brent.lu@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

From: Brent Lu <brent.lu@intel.com>

Update definition for mclk always-on feature and increase the
SOF_ABI_MINOR number for interface change.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/dai-intel.h | 2 ++
 include/uapi/sound/sof/abi.h  | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/sound/sof/dai-intel.h b/include/sound/sof/dai-intel.h
index 7a266f41983c..5b93b7292f5e 100644
--- a/include/sound/sof/dai-intel.h
+++ b/include/sound/sof/dai-intel.h
@@ -52,6 +52,8 @@
 #define SOF_DAI_INTEL_SSP_CLKCTRL_MCLK_ES               BIT(6)
 /* bclk early start */
 #define SOF_DAI_INTEL_SSP_CLKCTRL_BCLK_ES               BIT(7)
+/* mclk always on */
+#define SOF_DAI_INTEL_SSP_CLKCTRL_MCLK_AON		BIT(8)
 
 /* DMIC max. four controllers for eight microphone channels */
 #define SOF_DAI_INTEL_DMIC_NUM_CTRL			4
diff --git a/include/uapi/sound/sof/abi.h b/include/uapi/sound/sof/abi.h
index b7dce4df7ecd..3566630ca965 100644
--- a/include/uapi/sound/sof/abi.h
+++ b/include/uapi/sound/sof/abi.h
@@ -28,7 +28,7 @@
 
 /* SOF ABI version major, minor and patch numbers */
 #define SOF_ABI_MAJOR 3
-#define SOF_ABI_MINOR 22
+#define SOF_ABI_MINOR 23
 #define SOF_ABI_PATCH 0
 
 /* SOF ABI version number. Format within 32bit word is MMmmmppp */
-- 
2.34.1

