Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1485A60B333
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 18:58:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADAEC7062;
	Mon, 24 Oct 2022 18:58:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADAEC7062
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666630735;
	bh=s6/a6QMiU7l2u3Ca/40fg7t2cSVDMjLr0ervSJHqJNE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cZDZ/T/Qqr1/EDk9g8Fon+K+FD7AFPvwLkkyktvLE3UaBcF69+cBns6S5E+F+odGs
	 3dBHhTeeUPQvceEDPdn3GpFvjmbg+DKGpFr7BThuBQfVmAFnObK8zGkl7eT6g8Nio+
	 Zrn+folY0QoK4b+Vav9rJGLMj5ub+nepLwwwlSx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E390EF805DF;
	Mon, 24 Oct 2022 18:53:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9252CF805B2; Mon, 24 Oct 2022 18:53:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 974A4F80564
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 18:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 974A4F80564
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jUJoFB2f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666630416; x=1698166416;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s6/a6QMiU7l2u3Ca/40fg7t2cSVDMjLr0ervSJHqJNE=;
 b=jUJoFB2fbdgH9T+tjIN2KwQczYYu+NapV23xhgyT+rpW3CrXfgfDLs5P
 UIeWaynC874w0Rl0YOMeV+wgDlcge6YYmORYjg8yy9dInlGxf2ZqTp+OI
 b3y2fXoWV+BoZpSlMl6vkPhCUa0rMiMM8o3ebwpfFZFMc94/f5JlLIAGo
 XEx2cn27dmxaNkdx7GtYO0BIf+UFa/zARRF/AL+EOLJIviQgc525Pk1J/
 LdrkmNnh0b7vGYbOLl+qno4h/10Y1QdMGAeohCI8jQ8NlJFd2Wa835PWH
 wKkM1qhk/d+BlAUQeNv2mT0M2ahbWOvbfQkYL1eZgbZ+yqEkKft9SUDLp w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="287868667"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="287868667"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:32 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="609263082"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="609263082"
Received: from tdsilva-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.186.236])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 14/16] ASoC: SOF: Intel: hda: use SOF helper for consistency
Date: Mon, 24 Oct 2022 11:53:08 -0500
Message-Id: <20221024165310.246183-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
References: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

No functionality change, just more consistency in the code.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 2ee414600f779..79c32d948b2de 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -625,7 +625,6 @@ static bool hda_check_ipc_irq(struct snd_sof_dev *sdev)
 
 void hda_ipc_irq_dump(struct snd_sof_dev *sdev)
 {
-	struct hdac_bus *bus = sof_to_bus(sdev);
 	u32 adspis;
 	u32 intsts;
 	u32 intctl;
@@ -637,7 +636,7 @@ void hda_ipc_irq_dump(struct snd_sof_dev *sdev)
 	intsts = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTSTS);
 	intctl = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTCTL);
 	ppsts = snd_sof_dsp_read(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPSTS);
-	rirbsts = snd_hdac_chip_readb(bus, RIRBSTS);
+	rirbsts = snd_sof_dsp_readb(sdev, HDA_DSP_HDA_BAR, AZX_REG_RIRBSTS);
 
 	dev_err(sdev->dev, "hda irq intsts 0x%8.8x intlctl 0x%8.8x rirb %2.2x\n",
 		intsts, intctl, rirbsts);
-- 
2.34.1

