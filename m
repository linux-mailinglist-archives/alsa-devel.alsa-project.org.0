Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC38F5E7C09
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 15:38:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 714F5E0E;
	Fri, 23 Sep 2022 15:37:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 714F5E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663940305;
	bh=xdbdpsk5UyKue9kmH3hrd4xI1x3OlgEGELc/EKBGydY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JrGsnekwAbkh0dSOBvdratRL5JUDnuf2DIKWZIZdOhSlxnJCnFimcz3+Ck+RxSyWi
	 wAhs6RDb2Xhc2Hpcz/EUzKLAw0BMp9HL3o1mX9VOe0YPUfHMLBxPfpPTve/HHHZaP/
	 9Lp/5kqvhPg9EEQVhImE89sik5dCbs+1WggaM39A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98785F80563;
	Fri, 23 Sep 2022 15:36:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47D35F80431; Fri, 23 Sep 2022 15:36:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD0C4F80538
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 15:36:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD0C4F80538
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IuPCpMcg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663940180; x=1695476180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xdbdpsk5UyKue9kmH3hrd4xI1x3OlgEGELc/EKBGydY=;
 b=IuPCpMcgp+jFQk8oVlSuKtdJe5AzzKca2Dtc+Ydj2BLOwWEsbXoYrJrz
 cr/wXpnWibbEhi9vXnMjgiAjtEHTtc8ktF8i1T5lm69GyKIJIOLK4fmEL
 mKYF4+HjUbGbcTPXf4xbSdXLPbXotuYOscnUqf+cLERgRU8BgD58l0Puo
 cI3TGotcAI8+3Q3AaMY8rtx83+2B4IlMQ90gXhJ9M2oyuOHYfltKY27GI
 jj7yniRFel7HM04Q8JPjom/zpu9d83dALAmcL5soDD8r26U82GhV0AXCH
 RIkiZhrJIAOsiyFZdeD6VvPg3BdW9mxjzgBeJC9xMFkWxx22nQlFAo/a0 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10479"; a="300575632"
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="300575632"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 06:36:19 -0700
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="571375328"
Received: from acarr-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.3.209])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 06:36:17 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 5/6] ASoC: SOF: Intel: hda: Only dump firmware registers for
 IPC3
Date: Fri, 23 Sep 2022 16:36:15 +0300
Message-Id: <20220923133616.26267-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923133616.26267-1-peter.ujfalusi@linux.intel.com>
References: <20220923133616.26267-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com
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

The firmware register dump is IPC3 specific, it is not available for other
IPC versions.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/intel/hda.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index ca648d2a9da7..e00062f3b21c 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -598,7 +598,8 @@ void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 	/* print ROM/FW status */
 	hda_dsp_get_state(sdev, level);
 
-	if (flags & SOF_DBG_DUMP_REGS) {
+	/* The firmware register dump only available with IPC3 */
+	if (flags & SOF_DBG_DUMP_REGS && sdev->pdata->ipc_type == SOF_IPC) {
 		u32 status = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_SRAM_REG_FW_STATUS);
 		u32 panic = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_SRAM_REG_FW_TRACEP);
 
-- 
2.37.3

