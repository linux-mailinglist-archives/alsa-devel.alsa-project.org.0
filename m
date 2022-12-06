Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3D4644DF0
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 22:27:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AB5C1845;
	Tue,  6 Dec 2022 22:26:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AB5C1845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670362035;
	bh=GDCIlh30cdWhTy20dGUhF0iFrWH3dw0Pi1Z6+w5JVmw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EUaQXZTvuQb8/X9557k75+aVKmc+rjl31ZwAeK6nW2P2/4pnhiqt8oQ8UhHxzNrpa
	 ABnJEJmtpZOFvudXqRfrsC1fXW5xcW9POJKCDYrPKnjCuePLsbOkUYJkISJY+5NjuB
	 2gxnSLbkhPLfHeF9koD8dPijgXu2ExuGmDsL9osY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A54BF804B0;
	Tue,  6 Dec 2022 22:25:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF1F6F8055A; Tue,  6 Dec 2022 22:25:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A9D8F804B0
 for <alsa-devel@alsa-project.org>; Tue,  6 Dec 2022 22:25:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A9D8F804B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LfBGZBxm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670361934; x=1701897934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GDCIlh30cdWhTy20dGUhF0iFrWH3dw0Pi1Z6+w5JVmw=;
 b=LfBGZBxmRxjN2LKxyjzH2fZHN7UMr/jtULAxJG4dx8h0hzHNKomxcsZg
 veUC1MFsOUMFoDa/6Vf2lkJVdkrJ02EQR9MQnqEHkVCwrnUdJ1HFNucZ1
 2VJWSaB21rDSECLC0B55BNJsmhNFO0HTuVa2R+GHkFytVE4gqrgNk0RY4
 O2fzIAx+mp2FoLcu1m6+Hxuycbaic7jJ3z1V5g7d148KabhJbaoVenr27
 JyMFmYAN1XRpxgY0Ltw3VlfcLdCZHTjfYH5uEHeg1KmT4Q7Nf6f5gANZo
 KfKT10tlZ0Yy13gVt3XOHI9oXZI7z0/lVeGfJE7cFxXEdOK5afCbFYvNv Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="300154679"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; d="scan'208";a="300154679"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2022 13:25:27 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="646362661"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; d="scan'208";a="646362661"
Received: from rwwalthe-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.186.124])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2022 13:25:26 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoC: Intel: sof_realtek_common: set ret = 0 as initial
 value
Date: Tue,  6 Dec 2022 15:25:07 -0600
Message-Id: <20221206212507.359993-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206212507.359993-1-pierre-louis.bossart@linux.intel.com>
References: <20221206212507.359993-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

'ret' will not be initialized if dai_fmt is not DSP_A or DSP_B.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_realtek_common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_realtek_common.c b/sound/soc/intel/boards/sof_realtek_common.c
index ff2851fc8930a..6c12ca92f3713 100644
--- a/sound/soc/intel/boards/sof_realtek_common.c
+++ b/sound/soc/intel/boards/sof_realtek_common.c
@@ -267,7 +267,8 @@ static int rt1015_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *codec_dai;
-	int i, clk_freq, ret;
+	int i, clk_freq;
+	int ret = 0;
 
 	clk_freq = sof_dai_get_bclk(rtd);
 
-- 
2.34.1

