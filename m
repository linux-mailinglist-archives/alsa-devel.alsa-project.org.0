Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB664D5028
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 18:24:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2B54195A;
	Thu, 10 Mar 2022 18:23:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2B54195A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646933072;
	bh=Zjcu60bEs3gtPOUHEmKDTPwRP3guWqrCKQaDTCC54BU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DAxNAyBbyKz8fJCk7Xo/wRNodCy1AN0OlU/uEyXib4aTlXWEpkqG8/QwEadIl7tcc
	 wAd9AdtSDd8oaQjPVN8drgEIORVKOv56KkIckqJPR1aPTVv8MbASUdgOCEjgG0vMUF
	 Npp+WtJS5rT1W/y3pHEYLH8z06zaJp5dKG371Kp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17A52F804CA;
	Thu, 10 Mar 2022 18:22:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 625D9F804CA; Thu, 10 Mar 2022 18:22:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E012AF800D2
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 18:22:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E012AF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CbPmwnVy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646932968; x=1678468968;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zjcu60bEs3gtPOUHEmKDTPwRP3guWqrCKQaDTCC54BU=;
 b=CbPmwnVyLDxVn23a7R8yKOZvhqvP1+LXvIvzdOD0bWnsPlKsI79nHF2B
 jvf8v8ci88z0q2Du3tUSXMqeGSgzwqitxteAnc1YjuxMMQpMpdyxl49kX
 6SXkdjXLTkNE3jA3C1CzXLausKWaT9VFLFnV3glPnFE3DFkaO8+77VG0j
 0rpM8FUTyFdtu4kRjR3pxiWbAcORgQm8gT1d1RXpWCm17bUhAsKhncRbf
 iwnPRyu8nPBdA9oZZqlPQ8cJWs61LIZA+MX4/l6smvbc+QIMc3JyVGiku
 /P1MLCfw1xv7IYQtYnBg8safPdtpUGpebrtET7vKrT6TtyLP1ySMcjh0S w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="235918911"
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; d="scan'208";a="235918911"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 09:22:39 -0800
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; d="scan'208";a="554738625"
Received: from maxdorn-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.77.185])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 09:22:39 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/5] ASoC: SOF: Intel: enable DMI L1 for playback streams
Date: Thu, 10 Mar 2022 11:16:47 -0600
Message-Id: <20220310171651.249385-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220310171651.249385-1-pierre-louis.bossart@linux.intel.com>
References: <20220310171651.249385-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Add back logic to mark all playback streams as L1 compatible.

Fixes: 246dd4287dfb ("ASoC: SOF: Intel: make DMI L1 selection more robust")
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index eec83ca557a1..3e77a2352b98 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -315,6 +315,7 @@ int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
 		runtime->hw.info &= ~SNDRV_PCM_INFO_PAUSE;
 
 	if (hda_always_enable_dmi_l1 ||
+	    direction == SNDRV_PCM_STREAM_PLAYBACK ||
 	    spcm->stream[substream->stream].d0i3_compatible)
 		flags |= SOF_HDA_STREAM_DMI_L1_COMPATIBLE;
 
-- 
2.30.2

