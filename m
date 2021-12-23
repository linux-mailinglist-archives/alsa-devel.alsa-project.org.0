Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6D347E262
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 12:38:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2EF71852;
	Thu, 23 Dec 2021 12:37:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2EF71852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640259487;
	bh=n3U/5UEy7DTiAItrGuJ7MEu3Uq5ZBPWazjtLpsqj6uk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W0eU5Ja8nD0/6JUGfSo5i7cn7Dh7KlsjP1WCSORSMMO4nL3MnI3orZ6oPvuq45S2j
	 iLlZXhIAroiO4tsolP84c57IxEObiFdFoGLy2OPAoJB8Bpyt2Ijn9Bg4Qr5iv4g7Q5
	 C3Ci+wp3G8YMyWonspZtU2DPAQxZzlSKE8u81Hnw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41B37F80084;
	Thu, 23 Dec 2021 12:36:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28B47F804E6; Thu, 23 Dec 2021 12:36:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 392D6F800AF
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 12:36:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 392D6F800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WBhmhSr4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640259380; x=1671795380;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n3U/5UEy7DTiAItrGuJ7MEu3Uq5ZBPWazjtLpsqj6uk=;
 b=WBhmhSr4bCOIHDIHXMlIvyp1DU9cLX0fYN06VmwAelG2bpOh5qbG3LXs
 SwvT1wQGHXrinuuzKxJmFAV9KOrlvs8GhVg25xRq+5nxz8d5OWVL5+29m
 hxiMpbR89Q06wwHQEixvburX9liYPGPY+DGoQLdt1Aza85MrCEPtKbcqQ
 sp9RMQOlREo9qMCUp803cWVWsad5YaNz0005ggGokaZHt/NWxkQhlzSRZ
 RUvXlBguD40v7t52caO0GbrR6+klupYWApikZlHSmv9jMd8fQ14cQ9f6D
 uwdwUZlwNOzYb6e3kj+joKYFggMq5uJCC623/PNrNloCFbofybq5+UDjY w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="304180785"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="304180785"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522065040"
Received: from gcatala-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:09 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 01/20] ASoC: SOF: ops: Use dev_warn() if the panic offsets
 differ
Date: Thu, 23 Dec 2021 13:36:09 +0200
Message-Id: <20211223113628.18582-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
References: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 chao.song@intel.com, daniel.baluta@nxp.com
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

Catch the cases when the stored sdev->dsp_oops_offset and the offset
received via the panic message differs and print a warning, but keep using
the dsp_oops_offset for the oops query.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ops.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/ops.c b/sound/soc/sof/ops.c
index 160b88a2d59f..1d6a95a00cf5 100644
--- a/sound/soc/sof/ops.c
+++ b/sound/soc/sof/ops.c
@@ -144,18 +144,23 @@ EXPORT_SYMBOL(snd_sof_dsp_update_bits_forced);
 
 void snd_sof_dsp_panic(struct snd_sof_dev *sdev, u32 offset)
 {
-	dev_err(sdev->dev, "error : DSP panic!\n");
-
 	/*
-	 * check if DSP is not ready and did not set the dsp_oops_offset.
-	 * if the dsp_oops_offset is not set, set it from the panic message.
-	 * Also add a check to memory window setting with panic message.
+	 * if DSP is not ready and the dsp_oops_offset is not yet set, use the
+	 * offset from the panic message.
 	 */
 	if (!sdev->dsp_oops_offset)
 		sdev->dsp_oops_offset = offset;
-	else
-		dev_dbg(sdev->dev, "panic: dsp_oops_offset %zu offset %d\n",
-			sdev->dsp_oops_offset, offset);
+
+	/*
+	 * Print warning if the offset from the panic message differs from
+	 * dsp_oops_offset
+	 */
+	if (sdev->dsp_oops_offset != offset)
+		dev_warn(sdev->dev,
+			 "%s: dsp_oops_offset %zu differs from panic offset %u\n",
+			 __func__, sdev->dsp_oops_offset, offset);
+
+	dev_err(sdev->dev, "DSP panic!\n");
 
 	/* We want to see the DSP panic! */
 	sdev->dbg_dump_printed = false;
-- 
2.34.1

