Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F310B4F0A17
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Apr 2022 16:07:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56C0D1750;
	Sun,  3 Apr 2022 16:06:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56C0D1750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648994865;
	bh=gfSTeIak7S7jkGaotScTSmb7D/9UcGuTLsXjhHoGQc0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AwC4dUnpZi2gENqwc+Q1O7lLmhkD+i94obWOx3A8vAwA+lzSO8gq2xhJjX9965ISm
	 e5FGpdNgkQuDr/afxtyWCgz3V5F/K/geHyqP0EEIDX7KfSOhIRBBKRfQH18xLzuTCT
	 q9SVQ8EbBQIaU+2RrcQO2DpVd95X0nCQlMQPmSVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACA04F8028B;
	Sun,  3 Apr 2022 16:06:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2933DF80248; Sun,  3 Apr 2022 16:06:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 563D8F8012A
 for <alsa-devel@alsa-project.org>; Sun,  3 Apr 2022 16:06:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 563D8F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZywAPg8B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648994789; x=1680530789;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gfSTeIak7S7jkGaotScTSmb7D/9UcGuTLsXjhHoGQc0=;
 b=ZywAPg8BqUl8Dnm745Xim9Ua7ATo2Q1mv9orZ191eq9tpozO4DeAumH+
 HiIHAgB1sAO8qn9Z8z/u2vf1uct+sY6d1CaFtEdqdAdic+T8Z6XczUlF0
 K0fzyhUpR3RCJReSbGkfBGTrSjXOOuMcUk+sZK1Z16Q04QWHoR3ZcRO0E
 JoiU90KPqfFdfshYkvNfPWs8TsDcUe4clZzbV5ue4ikVJOmrJSVQrInk+
 WQmhqZ/v49wDFR0uqg93Lx1OqgFR3fdh+ElW5ZFmgQC58FsOSh9MYe9mV
 4QH/6c6uHtlx9Ff2gv+z0u0E+IolqucApRPiwjXLziTwWpC/e+r/weEzH g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10305"; a="346826812"
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; d="scan'208";a="346826812"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2022 07:06:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; d="scan'208";a="523304381"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 03 Apr 2022 07:06:14 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: Intel: catpt: Drop redundant enum constant
Date: Sun,  3 Apr 2022 16:16:47 +0200
Message-Id: <20220403141647.1037173-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

CATPT_SSP_IFACE_LAST is being used only to calculate CATPT_SSP_COUNT.
Make CATPT_SSP_COUNT part of the enum directly and remove the redundant
constant.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/messages.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/intel/catpt/messages.h b/sound/soc/intel/catpt/messages.h
index 978a20b3f471..c17e948d9f52 100644
--- a/sound/soc/intel/catpt/messages.h
+++ b/sound/soc/intel/catpt/messages.h
@@ -219,11 +219,9 @@ int catpt_ipc_free_stream(struct catpt_dev *cdev, u8 stream_hw_id);
 enum catpt_ssp_iface {
 	CATPT_SSP_IFACE_0 = 0,
 	CATPT_SSP_IFACE_1 = 1,
-	CATPT_SSP_IFACE_LAST = CATPT_SSP_IFACE_1,
+	CATPT_SSP_COUNT,
 };
 
-#define CATPT_SSP_COUNT (CATPT_SSP_IFACE_LAST + 1)
-
 enum catpt_mclk_frequency {
 	CATPT_MCLK_OFF = 0,
 	CATPT_MCLK_FREQ_6_MHZ = 1,
-- 
2.25.1

