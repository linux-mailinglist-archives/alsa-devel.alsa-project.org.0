Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4D75E7C06
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 15:38:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D9EC825;
	Fri, 23 Sep 2022 15:37:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D9EC825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663940292;
	bh=KZkC4MI6zo3Os+9Y5h4Sq/zaZ19Auz4Su68d8fx8AnA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q6T46WCVVBQgyrUi+FFbWt2b2y6J5bg61VpFJdxcevMjZ1aCIcnI2SBihQP2G9eIR
	 tYANJC2oxL9RRZDLbHwOwy7/aTRDHMJqXh9zXJyJUapEdBBefZuDDtlY8n9aZoF6Ub
	 YKr4mJbqlj/VEGsITwj981iIEZrqQLm0xcx12f4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FE3DF80558;
	Fri, 23 Sep 2022 15:36:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F7B7F80549; Fri, 23 Sep 2022 15:36:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6589BF804E4
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 15:36:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6589BF804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MD4dYu2z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663940178; x=1695476178;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KZkC4MI6zo3Os+9Y5h4Sq/zaZ19Auz4Su68d8fx8AnA=;
 b=MD4dYu2zpRAMkWxEWudgLu0XetqpVTY+vPHQtdTG9ms3ZHCIy9LBQJQ3
 SRp85X5uHMtCi/eTdeYiegqH1a0U/kJVIPRTrIQpPOEri+Qxyn1K2o5PL
 WzW4S6H/Z96igsoMUID8jenqQYVGYVt24V7T5Hs3+uv1PQ3uZjQt1cxZs
 JywjTk+8ol3+5Af3wZ44GFpi5//epdMJWmVivDpS7zO2eWjrktQgV8J+o
 L4+wbqeNzv8Z28s1nVpstLnpSP5HurKQvV9rldK7xN6grkiy+PvoUPToq
 6QX3XnrmfnJzgy5NhU05+MYiRDWnNY/9mlxVlaFoW1syKZ0ABJAeHrOdT A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10479"; a="300575627"
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="300575627"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 06:36:16 -0700
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="571375315"
Received: from acarr-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.3.209])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 06:36:14 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 4/6] ASoC: SOF: Intel: mtl: Print relevant register in ipc_dump
Date: Fri, 23 Sep 2022 16:36:14 +0300
Message-Id: <20220923133616.26267-5-peter.ujfalusi@linux.intel.com>
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

The use of the IPC registers are different between IPC3 and IPC4.
The ipc_dump needs to use different prints depending on the used IPC
protocol.

The existing code was printing registers relevant for IPC3, which is not
even supported on MTL.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/intel/mtl.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 5408c34b04ef..61bcaa1556f6 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -698,20 +698,19 @@ static int mtl_dsp_runtime_resume(struct snd_sof_dev *sdev)
 
 static void mtl_ipc_dump(struct snd_sof_dev *sdev)
 {
-	u32 hipcctl;
-	u32 hipcida;
-	u32 hipctdr;
+	u32 hipcidr, hipcidd, hipcida, hipctdr, hipctdd, hipctda, hipcctl;
 
-	/* read IPC status */
+	hipcidr = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_DSP_REG_HFIPCXIDR);
+	hipcidd = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_DSP_REG_HFIPCXIDDY);
 	hipcida = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_DSP_REG_HFIPCXIDA);
-	hipcctl = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_DSP_REG_HFIPCXCTL);
 	hipctdr = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_DSP_REG_HFIPCXTDR);
+	hipctdd = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_DSP_REG_HFIPCXTDDY);
+	hipctda = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_DSP_REG_HFIPCXTDA);
+	hipcctl = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_DSP_REG_HFIPCXCTL);
 
-	/* dump the IPC regs */
-	/* TODO: parse the raw msg */
 	dev_err(sdev->dev,
-		"error: host status 0x%8.8x dsp status 0x%8.8x mask 0x%8.8x\n",
-		hipcida, hipctdr, hipcctl);
+		"Host IPC initiator: %#x|%#x|%#x, target: %#x|%#x|%#x, ctl: %#x\n",
+		hipcidr, hipcidd, hipcida, hipctdr, hipctdd, hipctda, hipcctl);
 }
 
 /* Meteorlake ops */
-- 
2.37.3

