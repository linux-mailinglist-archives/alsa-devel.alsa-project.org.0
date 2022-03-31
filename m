Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A23634ED8B1
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 13:49:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3532C18EC;
	Thu, 31 Mar 2022 13:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3532C18EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648727364;
	bh=zLyV51MFGb7lHLqT0TvbSmI+u5TpyINqhr9H9jsDu+4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H3OOQRzn41wpLd4lY//vSNP5NmdHRDP5gbGPBueoUoQfep80UwdKImjjI+4NuOjRv
	 nr1VoYcVrcHNwwwKoIq4JCY3qcvtBmcCEw8PHhcFaMpvYNWEmg7GAz+iQHjLSPiqo6
	 0dWdhIAhBDyYcstghxnu1DOJMg8cWSRwZBBg1V/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E816F800B8;
	Thu, 31 Mar 2022 13:48:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5347F80227; Thu, 31 Mar 2022 13:48:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1840BF800B8
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 13:48:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1840BF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="feN+lQMn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648727289; x=1680263289;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zLyV51MFGb7lHLqT0TvbSmI+u5TpyINqhr9H9jsDu+4=;
 b=feN+lQMnd5lWaNo3Q65SDWUYnFBwNa2Zmi/wgaF/LJ0xrI5Fc9+2pZrN
 LZu264CSpsVCMBTSQ9Lo2FjuNlXL2LeI73EqfrgDt7MtJIfwDyOpqjvks
 opMvaojLeFYcg9CSA2i/MH6hYH3+AghQItDELA7v0Eu3S5c3pga2jxu1a
 Pq3n1AHsNkwJurW0Vlifv/ornDFGgNBBk+EgoaWfsdrU/wiheQPoLqsBk
 AVpQJETp38MEo8WHj9IbtzH+y6gAZtv5BP0b/LiTOpBGaKW6QYqDs9K2O
 YwM8I70OmUFhNM7G2Gh19ifgCUJazqR7Oe9XH4iFCjem9l21HoiX07Dxl A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="322986852"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="322986852"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 04:47:44 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="547294166"
Received: from dmmatarr-mobl1.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.22])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 04:47:42 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc3-topology: Set scontrol->priv to NULL after
 freeing it
Date: Thu, 31 Mar 2022 14:47:57 +0300
Message-Id: <20220331114757.32551-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

Since the scontrol->priv is freed up during load operation it should be set
to NULL to be safe against double freeing attempt.

Fixes: b5cee8feb1d48 ("ASoC: SOF: topology: Make control parsing IPC agnostic")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 2f8450a8c0a1..2e1c76ed087d 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -1592,6 +1592,7 @@ static int sof_ipc3_control_load_bytes(struct snd_sof_dev *sdev, struct snd_sof_
 	if (scontrol->priv_size > 0) {
 		memcpy(cdata->data, scontrol->priv, scontrol->priv_size);
 		kfree(scontrol->priv);
+		scontrol->priv = NULL;
 
 		if (cdata->data->magic != SOF_ABI_MAGIC) {
 			dev_err(sdev->dev, "Wrong ABI magic 0x%08x.\n", cdata->data->magic);
-- 
2.35.1

