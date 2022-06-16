Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA13D54ECEB
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 23:56:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49A981B18;
	Thu, 16 Jun 2022 23:56:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49A981B18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655416618;
	bh=n2U0AeRSHQQSTBYckbxzcDuezlEcPXhJrUuMBQM3oUc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=km9/Dgq6pRrFKgKgWYX+be9xICiOknS4ypvf3RsrZQ/6eS92JMYNGTQ1tncGwSs0Q
	 RKn8b+b7mAy14AjwnuPRKlX+SRyiGmcQglsKWQn0lVIUKgcX6BwW0N2MR4A7dU21tN
	 a0Vp5bzHIrEoQgaHoQQjhoTBNrBh0Rki4XTKffeI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75EE7F8053E;
	Thu, 16 Jun 2022 23:54:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 039EDF8052D; Thu, 16 Jun 2022 23:54:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52DE2F8012A
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 23:54:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52DE2F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="diwxM2Rf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655416482; x=1686952482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n2U0AeRSHQQSTBYckbxzcDuezlEcPXhJrUuMBQM3oUc=;
 b=diwxM2RfQLxjG+2WdWC5ap2ma7JmkHBZ0qtNkVvg3DTFqOJYkyBJ3Wnu
 Caao5R6DyF35I1n6goHJO8aO2Rxma/8gJBCvnNAaEHuSZ+EpGPxK6YwMj
 0QNJlLKzFOQ468bbnBsTZDM73uKxPNycU/J2s4WAjtn/ZhCEy9ikvYEnh
 MtWu8fY9REU3MkDOIRRQJa1foYuLu8/DMb1Ao4WuZ0HHUzxgfCneVJSvS
 Gi8CMmnhFggt0EmQIWjxdMeRMTMhckRBAp3fgkwu2G67xsAVZMGN5vCA6
 JpWyTieUMDUyXR+o9kNvSRCXmgs5Bu+NV0RrrVNDpXhlfLBoOkXVdPU5B A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="268047805"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="268047805"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:54:17 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="675212652"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:54:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/13] ASoC: SOF: Intel: hda-dai: remove use of __func__ in
 dev_dbg
Date: Thu, 16 Jun 2022 16:53:41 -0500
Message-Id: <20220616215351.135643-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616215351.135643-1-pierre-louis.bossart@linux.intel.com>
References: <20220616215351.135643-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
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

The module and function information can be added with
'modprobe foo dyndbg=+pmf'

Suggested-by: Greg KH <gregkh@linuxfoundation.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 70721defca467..ed74a1f264e86 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -393,7 +393,7 @@ static int hda_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 	if (hext_stream && hext_stream->link_prepared)
 		return 0;
 
-	dev_dbg(sdev->dev, "%s: prepare stream dir %d\n", __func__, substream->stream);
+	dev_dbg(sdev->dev, "prepare stream dir %d\n", substream->stream);
 
 	ret = hda_link_dma_prepare(substream);
 	if (ret < 0)
@@ -419,7 +419,7 @@ static int ipc3_hda_dai_trigger(struct snd_pcm_substream *substream,
 	struct snd_soc_dapm_widget *w;
 	int ret;
 
-	dev_dbg(dai->dev, "%s: cmd=%d dai %s direction %d\n", __func__, cmd,
+	dev_dbg(dai->dev, "cmd=%d dai %s direction %d\n", cmd,
 		dai->name, substream->stream);
 
 	ret = hda_link_dma_trigger(substream, cmd);
@@ -468,7 +468,7 @@ static int ipc4_hda_dai_trigger(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *cpu_dai;
 	int ret;
 
-	dev_dbg(dai->dev, "%s: cmd=%d dai %s direction %d\n", __func__, cmd,
+	dev_dbg(dai->dev, "cmd=%d dai %s direction %d\n", cmd,
 		dai->name, substream->stream);
 
 	hstream = substream->runtime->private_data;
-- 
2.34.1

