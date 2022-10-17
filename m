Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F8D601AD1
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Oct 2022 22:58:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAAC67E54;
	Mon, 17 Oct 2022 22:57:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAAC67E54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666040324;
	bh=eZlB8/i4dPvSz0StJ7bY65OLZ/psqwi/D0PtBRykriA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q3BuEFXitXvzwFyd1e0sO61APFYPAM8DpF+svzdPXLpF3Ss8nX+7yV0sS1dXO5nyu
	 XpVvl4YKVEQa9ISDmxLfUMILL60RUf+HYyKxskFvmfRuxHDr12pjDNDmb2MQ2tUx6o
	 szQGjj8vjlKy3E+XcHCaW/pRg+VxcpTgHao9JwpI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FFDCF800AA;
	Mon, 17 Oct 2022 22:57:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 026ECF8025E; Mon, 17 Oct 2022 22:57:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 729EFF800AA
 for <alsa-devel@alsa-project.org>; Mon, 17 Oct 2022 22:57:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 729EFF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="f+smvWSy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666040261; x=1697576261;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eZlB8/i4dPvSz0StJ7bY65OLZ/psqwi/D0PtBRykriA=;
 b=f+smvWSy2APB+XpoCoiOtVdPczvN30HEFEALzop6MRKR4Z7rwjOB0rf7
 O65gN07ea/Fw604nkqUKrpDbCM6RHIXPtyA5QvdAU/VMBEjwjIhilQKGm
 X+IekZYcIWn4XOOiJSQMaRwVNI4Bqcl9X4nZfR0Md12OlAteY7JyTKrtZ
 w7fIQSm/NROjUDyCVWolKLk7cAzPOiyIORYnOemeufbqRen+FfpKNstHE
 /6CflVgShaAmgO4Wh7bJxVhYABObSAKe55yuidytXZx4KOY05h4I8m6zP
 LqsvSoUqkRIIYztJbn1pqBcvFW85FbR027L7lcd4e5q4aLbT4N+f89obf Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="307003263"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="307003263"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 13:57:38 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="873616685"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="873616685"
Received: from cmontgom-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.54.140])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 13:57:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: Intel: sof_rt5682: Add quirk for Rex board
Date: Mon, 17 Oct 2022 15:57:28 -0500
Message-Id: <20221017205728.210813-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Curtis Malainey <cujomalainey@chromium.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>
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

From: Yong Zhi <yong.zhi@intel.com>

Add mtl_mx98357_rt5682 driver data for Chrome Rex board support.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
v2: added my Signed-off-by this time.

 sound/soc/intel/boards/sof_rt5682.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 1bf9455eaf935..adc964d363a29 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -225,6 +225,18 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 					SOF_RT5682_SSP_AMP(2) |
 					SOF_RT5682_NUM_HDMIDEV(4)),
 	},
+	{
+		.callback = sof_rt5682_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Rex"),
+		},
+		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(2) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(0) |
+					SOF_RT5682_NUM_HDMIDEV(4)
+					),
+	},
 	{}
 };
 
-- 
2.34.1

