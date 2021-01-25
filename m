Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BC23022B3
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jan 2021 09:16:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE5D71871;
	Mon, 25 Jan 2021 09:15:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE5D71871
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611562586;
	bh=hsui3kNPnzvp7toO+cvFccDEVY3af1FSlEzP4StNI5o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hFX071zT7HUJTS5JI0PnVWcZ9/TLX1FJ1a1OcpK77BHz6wNLQlhMzl8kRX/z7eICq
	 pefYK7mmGefLEfBEEkXpIO0XVMheHnET0p9W9ALFsZ7rGO7ANiSgAOPGskKWPvmLWf
	 QKgDzwupfLUpZR1x8j33Txr2PMq3UsuYTo7/jQhU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BD0EF8025F;
	Mon, 25 Jan 2021 09:14:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 478BFF80259; Mon, 25 Jan 2021 09:14:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB6E5F8014D
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 09:14:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB6E5F8014D
IronPort-SDR: RYucjiO4bJNDwO9vZM2cPiGMFQLYNDx/PkmU6vFcOD3XLNOrKOnwqLF6QwZhEI5mvD9AUHCq0d
 4fTgaIKVu0hg==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="264504906"
X-IronPort-AV: E=Sophos;i="5.79,372,1602572400"; d="scan'208";a="264504906"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 00:14:33 -0800
IronPort-SDR: CtoSiTd5L8JX58Y8YZDj+IjBZki4YgOQBLCVqJjJyRjd5xDypZwec6PmiWIwulsk9TQQtIXhnz
 KkrFqOBh2FNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,372,1602572400"; d="scan'208";a="361273222"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008.fm.intel.com with ESMTP; 25 Jan 2021 00:14:31 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: Intel: sof_sdw: set proper flags for Dell TGL-H SKU 0A5E
Date: Mon, 25 Jan 2021 10:11:17 +0200
Message-Id: <20210125081117.814488-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Libin Yang <libin.yang@intel.com>, cezary.rojewski@intel.com,
 kai.vehmanen@linux.intel.com, yang.jie@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 Hui Wang <hui.wang@canonical.com>, Bard Liao <bard.liao@intel.com>
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

From: Libin Yang <libin.yang@intel.com>

Add flag "SOF_RT711_JD_SRC_JD2", flag "SOF_RT715_DAI_ID_FIX"
and "SOF_SDW_FOUR_SPK" to the Dell TGL-H based SKU "0A5E".

Signed-off-by: Libin Yang <libin.yang@intel.com>
Co-developed-by: Hui Wang <hui.wang@canonical.com>
Signed-off-by: Hui Wang <hui.wang@canonical.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index ca968901ac96..6d0d6ef711e0 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -67,6 +67,16 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		.driver_data = (void *)(SOF_RT711_JD_SRC_JD2 |
 					SOF_RT715_DAI_ID_FIX),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0A5E")
+		},
+		.driver_data = (void *)(SOF_RT711_JD_SRC_JD2 |
+					SOF_RT715_DAI_ID_FIX |
+					SOF_SDW_FOUR_SPK),
+	},
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
-- 
2.29.2

