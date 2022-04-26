Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DB051072B
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 20:36:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFACB1777;
	Tue, 26 Apr 2022 20:35:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFACB1777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650998170;
	bh=j+uH2pQDCOuN+3TgsmvC1/4thPN+oeou1DpVMQZ9xgo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Oc9CXNKbopRLjbQRX1SnZ7u4e6yj1HaRDq4pBGf6xRYk8lFsB3YRy8G+JU9Ak82pO
	 LTvjHuUmvFqrt1K7TAU/ZTYfcInB0pjKfdA47XxslJsjPdMf2p52NAsVkrT0nXXroU
	 1F4m5hHyE6zNCOeHG/9+c7BHXppW6LraMxIpI8f4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D92FF8025C;
	Tue, 26 Apr 2022 20:35:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18F2EF801D5; Tue, 26 Apr 2022 20:35:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAADDF8014B
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 20:35:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAADDF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="c5zaZxDo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650998112; x=1682534112;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j+uH2pQDCOuN+3TgsmvC1/4thPN+oeou1DpVMQZ9xgo=;
 b=c5zaZxDorupRVSUd+2EadcyDGK4gMsMzATseFjjd2YYavFLQvU2wQBWI
 6M435Ifon9ICchUlmnM+hmSfDKP4JnJ/RscOJ/wEChO1iDf/9FCGDBcL0
 ZKNnH+3YwhJIdLRVQxWx+saD3yXAuxQkLl3iL3XGuoS9ZJ/g/l4Qs3I+/
 JvEBaSOgKw92+kHuxSPxmFfMWGQJqHn7xA7DVIor0wQz6GqD9nv6mIWJ7
 aM7XWXEAFbH0G/b1z3iGg5wvJzk2+Trz3pp1r0xLjpsIHrn1To40+iTgf
 k34trIOo/EW067cHcYnxOA+PlILxHRcEmw2IuF/Om+b2lSHtrmy5/d/9T Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="264531544"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="264531544"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 11:35:07 -0700
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="628656921"
Received: from jzhang96-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.202])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 11:35:06 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: mediatek: mt8195 change ipc timeout as 1 second
Date: Tue, 26 Apr 2022 13:34:59 -0500
Message-Id: <20220426183459.102251-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, YC Hung <yc.hung@mediatek.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: YC Hung <yc.hung@mediatek.com>

The IPC message sending can take longer than the default 500ms during
system boot up due to the concurrent loading of different drivers.
Increase the IPC timeout to 1 second to avoid timeout errors due to
Linux load and scheduling.

Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: YC Hung <yc.hung@mediatek.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 90ec7b14823bb..6216af2d2263f 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -453,6 +453,7 @@ static const struct sof_dev_desc sof_of_mt8195_desc = {
 	},
 	.nocodec_tplg_filename = "sof-mt8195-nocodec.tplg",
 	.ops = &sof_mt8195_ops,
+	.ipc_timeout = 1000,
 };
 
 static const struct of_device_id sof_of_mt8195_ids[] = {
-- 
2.30.2

