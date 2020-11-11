Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 043CE2AF76F
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 18:37:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 834AE16C5;
	Wed, 11 Nov 2020 18:36:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 834AE16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605116247;
	bh=/lnGHDbIyzE4icofujrpAbN4qFyf1citmjIZgUi+AKY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BA5pE2mblzYaxxYsDb86yrFsRnWL6BPQns1ByKQ/dmePuT17O+WhBXhf8aUb+A3RV
	 2TPoRImVxA0rr7FbJ2yq8EZD9BcM1ZqQhdTP1RUtJHdSRESwstttDjiiK+vB/Kbc4W
	 Nlhk8MMT6GJLv0pBUe2GB6++//DgAX6uyHsLs1Ew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BB4AF8007E;
	Wed, 11 Nov 2020 18:35:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DF91F801F5; Wed, 11 Nov 2020 18:35:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E297F8020C
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 18:35:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E297F8020C
IronPort-SDR: ZqnNGjRJdJB4vnrlgvoK+69MMkifgHDRhwTvd6CnkQRxmoR0nFmicBUNtDDI24cnildZ3gxU1x
 mPuPCEvwQvVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="254893857"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; d="scan'208";a="254893857"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2020 09:35:39 -0800
IronPort-SDR: nfphM3+NSuaemWVNZIEJilqzLyRLc22JOIoXOSxEabN+cPV1SudxcTeinReDgIPyg7M8g6lp3o
 RGFYJIStZr1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; d="scan'208";a="308915658"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga007.fm.intel.com with ESMTP; 11 Nov 2020 09:35:37 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: loader: do not warn about unknown firmware headers
Date: Wed, 11 Nov 2020 19:33:21 +0200
Message-Id: <20201111173321.1933452-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 =?UTF-8?q?Karol=20Trzci=C5=84ski?= <karolx.trzcinski@linux.intel.com>,
 daniel.baluta@nxp.com
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

The firmware extended data IPC and manifest structures are designed to
be extendable without breaking the driver-firmware ABI. Driver should
not raise a warning in case a new header type is detected at
firmware boot. There are already checks for IPC ABI compatibility in
snd_sof_ipc_valid() and if the versions are deemed compatible, extra
fields in IPC messages should not trigger warnings.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Karol Trzciński <karolx.trzcinski@linux.intel.com>
---
 sound/soc/sof/loader.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index ba9ed66f98bc..ce68d708fc6f 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -124,7 +124,7 @@ int snd_sof_fw_parse_ext_data(struct snd_sof_dev *sdev, u32 bar, u32 offset)
 			/* They are supported but we don't do anything here */
 			break;
 		default:
-			dev_warn(sdev->dev, "warning: unknown ext header type %d size 0x%x\n",
+			dev_info(sdev->dev, "unknown ext header type %d size 0x%x\n",
 				 ext_hdr->type, ext_hdr->hdr.size);
 			ret = 0;
 			break;
@@ -280,7 +280,7 @@ static int snd_sof_fw_ext_man_parse(struct snd_sof_dev *sdev,
 			ret = ext_man_get_dbg_abi_info(sdev, elem_hdr);
 			break;
 		default:
-			dev_warn(sdev->dev, "warning: unknown sof_ext_man header type %d size 0x%X\n",
+			dev_info(sdev->dev, "unknown sof_ext_man header type %d size 0x%X\n",
 				 elem_hdr->type, elem_hdr->size);
 			break;
 		}
-- 
2.28.0

