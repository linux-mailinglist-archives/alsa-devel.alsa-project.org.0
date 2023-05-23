Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A98C770DAA4
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 12:35:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBE09206;
	Tue, 23 May 2023 12:34:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBE09206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684838134;
	bh=NI+C//hd7W0yl5NlOzcXIC8Gc6fq0RP/Oi6Ay9Zf89Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fDMgS2eL8BnUMGBtwdi9coKS6ouYHavlo2bfg3hMZM1xmGJs51cpQtxagy6yZaWEL
	 aaqHza+2xFOow2IKRxOvRSR8LPL2Snoj/qv0YyO1DKyelpbK2j5Htl8SLgk6hXIB5c
	 siH4yCXAjZmjjg1SQ2TSLbogd/LZo47psYGpQROA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02828F80589; Tue, 23 May 2023 12:33:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BEFBF80587;
	Tue, 23 May 2023 12:33:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D24D0F80568; Tue, 23 May 2023 12:33:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D283DF800DF
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 12:33:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D283DF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=aDqwHh2/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684837999; x=1716373999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NI+C//hd7W0yl5NlOzcXIC8Gc6fq0RP/Oi6Ay9Zf89Y=;
  b=aDqwHh2/PkOOjSP9jOvx3tHAjeXEAAs5E40spdY9/UkPTlLXYLp5Q6oM
   3k7VWT+5bJ6HG7a407x1F/kLr1iu8Z57vW8rQNePdn1VHqKdi75cFQWgS
   gFBhxC2ZysCXTJO11Rk82GDWl+bnNhEUZYagMywhR/ogINes+irqic2ib
   POlL2hbSgm8wOr/vJJegpaL06pfVZQXMrcwaJr/I1nSZq7p2w3RTIj08i
   lyKuTTHSurksvrSFbAJNT6XfZnQVMgQXHxXNEhEWk969OjyB/yBQAIb9F
   ijnY4Z/tub+OIOHt18rDp8Q88L0ehWq0VhWyMtcppuRjf7o7YgACeZ5zD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="333562947"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400";
   d="scan'208";a="333562947"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 03:31:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="681333518"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400";
   d="scan'208";a="681333518"
Received: from nmkenne1-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.53.154])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 03:31:21 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	rander.wang@intel.com
Subject: [PATCH 1/3] ASoC: SOF: Intel: mtl: setup primary core info on
 MeteorLake platform
Date: Tue, 23 May 2023 13:32:15 +0300
Message-Id: <20230523103217.20412-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523103217.20412-1-peter.ujfalusi@linux.intel.com>
References: <20230523103217.20412-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VBON3CCOPTX3HZOACOCI55LGLXEER5MI
X-Message-ID-Hash: VBON3CCOPTX3HZOACOCI55LGLXEER5MI
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VBON3CCOPTX3HZOACOCI55LGLXEER5MI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

Set primary core mask and refcount.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/mtl.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 46caf3ccde66..4788ba3b25aa 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -361,11 +361,17 @@ static int mtl_dsp_core_power_up(struct snd_sof_dev *sdev, int core)
 	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR, MTL_DSP2CXCTL_PRIMARY_CORE, dspcxctl,
 					    (dspcxctl & cpa) == cpa, HDA_DSP_REG_POLL_INTERVAL_US,
 					    HDA_DSP_RESET_TIMEOUT_US);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(sdev->dev, "%s: timeout on MTL_DSP2CXCTL_PRIMARY_CORE read\n",
 			__func__);
+		return ret;
+	}
 
-	return ret;
+	/* set primary core mask and refcount to 1 */
+	sdev->enabled_cores_mask = BIT(SOF_DSP_PRIMARY_CORE);
+	sdev->dsp_core_ref_count[SOF_DSP_PRIMARY_CORE] = 1;
+
+	return 0;
 }
 
 static int mtl_dsp_core_power_down(struct snd_sof_dev *sdev, int core)
@@ -388,10 +394,15 @@ static int mtl_dsp_core_power_down(struct snd_sof_dev *sdev, int core)
 					    !(dspcxctl & MTL_DSP2CXCTL_PRIMARY_CORE_CPA_MASK),
 					    HDA_DSP_REG_POLL_INTERVAL_US,
 					    HDA_DSP_PD_TIMEOUT * USEC_PER_MSEC);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(sdev->dev, "failed to power down primary core\n");
+		return ret;
+	}
 
-	return ret;
+	sdev->enabled_cores_mask = 0;
+	sdev->dsp_core_ref_count[SOF_DSP_PRIMARY_CORE] = 0;
+
+	return 0;
 }
 
 static int mtl_power_down_dsp(struct snd_sof_dev *sdev)
-- 
2.40.1

