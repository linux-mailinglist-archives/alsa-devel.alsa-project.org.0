Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 469752D7390
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Dec 2020 11:13:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97215173C;
	Fri, 11 Dec 2020 11:12:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97215173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607681581;
	bh=ehgBgqZ1pBBBQl6/2FZvpUCgS/KcigbeqGzVQbPqKL8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pGiDCCbVN4v3MVElQeudD5ssQPHF6F9KP2iZglOmvZabv21W26UZ53YW7iXbvHafR
	 OKdfmG/SLsoKmMLdaUu+Ca0gQZb37HfC4USGTXK4IWK8RcYZRrTkjlP6MkNEJz10iw
	 iRzvGEYAknmg//PgCJ6oKHc03pNEgFan2s3UlFis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3201F804C2;
	Fri, 11 Dec 2020 11:10:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 027BDF804C2; Fri, 11 Dec 2020 11:10:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56652F8021D
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 11:10:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56652F8021D
IronPort-SDR: IoGrQG8W+Sf8XARMy8VipB7i4kPRzMiju+TsypMHcc29xCFmuF3GHznl++4+u/fN8rGD/JQ29L
 TysZDaYz+FMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="174554244"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="174554244"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 02:10:26 -0800
IronPort-SDR: X1Kn6whWcpnIw0veAXb6Xcqeny1nWKN4pTG8u+gl9MDg+6x0LP2TlB8yMDJoPWcmjm0e1DS42f
 v88KVYQK8eRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="376450958"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga007.jf.intel.com with ESMTP; 11 Dec 2020 02:10:25 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 1/3] ASoC: SOF: Intel: hda: remove duplicated status dump
Date: Fri, 11 Dec 2020 12:07:41 +0200
Message-Id: <20201211100743.3188821-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211100743.3188821-1-kai.vehmanen@linux.intel.com>
References: <20201211100743.3188821-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, daniel.baluta@nxp.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Remove the duplicate status dump in case DSP init fails. The core will
be powered down in this case and the status dump will be invalid anyway.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 02c3ff897274..d8fb4e277c19 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -408,10 +408,12 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	 * should be ready for code loading and firmware boot
 	 */
 	ret = cl_copy_fw(sdev, stream);
-	if (!ret)
+	if (!ret) {
 		dev_dbg(sdev->dev, "Firmware download successful, booting...\n");
-	else
+	} else {
+		hda_dsp_dump(sdev, SOF_DBG_REGS | SOF_DBG_PCI | SOF_DBG_MBOX);
 		dev_err(sdev->dev, "error: load fw failed ret: %d\n", ret);
+	}
 
 cleanup:
 	/*
@@ -435,9 +437,6 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	if (!ret)
 		return chip_info->init_core_mask;
 
-	/* dump dsp registers and disable DSP upon error */
-	hda_dsp_dump(sdev, SOF_DBG_REGS | SOF_DBG_PCI | SOF_DBG_MBOX);
-
 	/* disable DSP */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR,
 				SOF_HDA_REG_PP_PPCTL,
-- 
2.29.2

