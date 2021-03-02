Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 357E032AC01
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:03:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C36561917;
	Tue,  2 Mar 2021 22:03:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C36561917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614719033;
	bh=U/PMnNO1UcCfDxYiEKKK+Ip2EthO7gF0z6vGRJfcu2Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IM0Au6By4MKSdNvcz/aj/RnLUK370LUwCLUH2ifnlW3qJK6nO6K6OvdbaBmBPImM0
	 eRZ/afUNrv5ea+vakUJ7kAFPSkViaRh3700JtVNf2ftb76t6bbO/XV1VJYOlhAd2eo
	 TboMbSfFvSdSFN5kLkKfa7Re9f6aAIfMjvArfrRs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7DE8F804A9;
	Tue,  2 Mar 2021 22:00:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5986F80423; Tue,  2 Mar 2021 22:00:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28AD5F802E7
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:00:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28AD5F802E7
IronPort-SDR: 7NUmNDzchQkz7R04aAmW/KFeN/LfDfAl9ryckhnL69Uxl0B3z7r/xV/HlGDpu+lbfg7IfyxW7o
 lLQoK43r6Xdg==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174623747"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="174623747"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:00:30 -0800
IronPort-SDR: Fs1CXllicfczZA962PoasOF+UJeT7jC+yHqGYDVsT7+SKuFHaMHgz7W7Cv+vWLmvMpBOFZevP1
 B39XkejvOpeQ==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="373727802"
Received: from btucker-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.60.230])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:00:30 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/9] ASoC: fsl: fsl_ssi: fix kernel-doc warning
Date: Tue,  2 Mar 2021 14:59:23 -0600
Message-Id: <20210302205926.49063-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302205926.49063-1-pierre-louis.bossart@linux.intel.com>
References: <20210302205926.49063-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

make W=1 warning:

sound/soc/fsl/fsl_ssi.c:371: warning: expecting prototype for
fsl_ssi_irq(). Prototype was for fsl_ssi_isr() instead

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/fsl/fsl_ssi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 4e2ce47a7c6e..2b57b60431bb 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -363,7 +363,7 @@ static bool fsl_ssi_is_i2s_cbm_cfs(struct fsl_ssi *ssi)
 }
 
 /**
- * fsl_ssi_irq - Interrupt handler to gather states
+ * fsl_ssi_isr - Interrupt handler to gather states
  * @irq: irq number
  * @dev_id: context
  */
-- 
2.25.1

