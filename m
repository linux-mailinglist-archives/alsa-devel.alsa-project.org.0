Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 425B1275ECD
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 19:39:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2E451767;
	Wed, 23 Sep 2020 19:38:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2E451767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600882758;
	bh=nMGiGN6zGtF23AHaZJLD/PivAynCWvjgeLLtWmE+h80=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M8j9a/c0/GSakL+EiiADMtTDD0IUrEtYEKshpfKnLZjVMjEgMe5ZZkl2y+Sg3MZQW
	 6Qqu3/BUDDJXHFEmnUEJzVPDQa4SB4LUJbPKgDoSBuGVo0I2v79Msfm6KabLYlmP+t
	 gQ3AbWQQGVMDhZ9Vp4e0J4SWyRano338EDrKDgZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3311EF802E1;
	Wed, 23 Sep 2020 19:36:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 949E2F8010A; Wed, 23 Sep 2020 19:35:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D38FF801EB
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 19:35:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D38FF801EB
IronPort-SDR: RZojeUF0T9TvI8X9hsmsaxkXL5LXI+FSwPxhzmEbt2O0cHLthqY3BN4grAzL9YuFvXVTsloPIP
 TBJr+9GnIMlg==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="148628859"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="148628859"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 10:35:37 -0700
IronPort-SDR: YDZ7REhGjkzPgP2algDjdk6GtwVuLPYqf3ki0LZf3SAfZ/j0etnjXd3S5AGTN/T0gFhDBO4Ow5
 HA6Etf1Ip8xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="335562352"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga004.fm.intel.com with ESMTP; 23 Sep 2020 10:35:35 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 2/6] ASoC: Intel: sof_sdw: remove ternary operator
Date: Wed, 23 Sep 2020 20:33:54 +0300
Message-Id: <20200923173358.3247215-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200923173358.3247215-1-kai.vehmanen@linux.intel.com>
References: <20200923173358.3247215-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jaska Uimonen <jaska.uimonen@intel.com>, kai.vehmanen@linux.intel.com,
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

cppcheck reports the following warning:

sound/soc/intel/boards/sof_sdw.c:866:46: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
 hdmi_num = sof_sdw_quirk & SOF_SDW_TGL_HDMI ?
                                             ^

There's no reason to use the ternary operator here, we might as well
use a regular if-else construct.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Jaska Uimonen <jaska.uimonen@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index efd96c9c6e39..4b1cd3011d37 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -863,8 +863,10 @@ static int sof_card_dai_links_create(struct device *dev,
 	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
 		codec_info_list[i].amp_num = 0;
 
-	hdmi_num = sof_sdw_quirk & SOF_SDW_TGL_HDMI ?
-				SOF_TGL_HDMI_COUNT : SOF_PRE_TGL_HDMI_COUNT;
+	if (sof_sdw_quirk & SOF_SDW_TGL_HDMI)
+		hdmi_num = SOF_TGL_HDMI_COUNT;
+	else
+		hdmi_num = SOF_PRE_TGL_HDMI_COUNT;
 
 	ssp_mask = SOF_SSP_GET_PORT(sof_sdw_quirk);
 	/*
-- 
2.27.0

