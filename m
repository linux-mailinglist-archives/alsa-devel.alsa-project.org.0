Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D06060B2F3
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 18:55:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA1647047;
	Mon, 24 Oct 2022 18:54:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA1647047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666630521;
	bh=z1ylxMAmAZliYsPntqDZjdwvOEZKF9ikAQI/gIXH780=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uTIY2Og0K24n8ut/vlgM5cXrTnOg1aOkELekicfLlPVk4rtm8soPP/zZkvMAEo9DZ
	 Y/RVTTDvwWcRP5mlY+tFjxqV1DXdS/6uVlrUc7n/qOCT0VnQTdrSUZlYoHDXRAWWuR
	 /cg9zVVZwPikTpFVShFmREetHFOxudWyq3T1/hJo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F88DF8057B;
	Mon, 24 Oct 2022 18:53:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8A82F8055C; Mon, 24 Oct 2022 18:53:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2409F80533
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 18:53:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2409F80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="NwmvOTjl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666630412; x=1698166412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z1ylxMAmAZliYsPntqDZjdwvOEZKF9ikAQI/gIXH780=;
 b=NwmvOTjljF0lqhWTKIoZAq3LSTDCpjAR7VGTK8dXUGLqUuZDWSJcltR9
 2rwqGkJTbdKvluQZsBQEUfUXd+erJN+Xz3vQRVOS42moaT46heTFAZsRB
 2wIrO4l3nNpTwVcfQaR9PMtZMSMBHJ8lT59Z/sK2gAp03fUdvjwu40xN2
 fZfqaxXvD61vXCYxYC8GTL4aSZ25rBVLoqu3h/zcQu1cr703i2zoQEldS
 4scyMZjiH2zhZQlJl2s0Uj3glRkIuFOa+88dAmHicgoQxzZuXMgF4UsLr
 QL/WzTcvY3VuLGFpazHRFvb1eJSUhzUYkfHHi0eBeI9M1+bRDfEJ8s7A7 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="287868641"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="287868641"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:27 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="609263062"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="609263062"
Received: from tdsilva-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.186.236])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/16] ASoC: SOF: Intel: hda-dai: use component_get_drvdata to
 find hdac_bus
Date: Mon, 24 Oct 2022 11:53:01 -0500
Message-Id: <20221024165310.246183-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
References: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
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

Remove the last usage of substream->runtime->private_data in the
HDAudio BE hw_params.

The SOF core saves the 'sdev' global context as component drvdata, and
we already save the bus information in sdev.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index c7b07c2693653..2bce8dff4627a 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -207,14 +207,17 @@ static int hda_link_dma_params(struct hdac_ext_stream *hext_stream,
 static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params)
 {
-	struct hdac_stream *hstream = substream->runtime->private_data;
-	struct hdac_ext_stream *hext_stream;
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct hda_pipe_params p_params = {0};
-	struct hdac_bus *bus = hstream->bus;
+	struct hdac_ext_stream *hext_stream;
 	struct hdac_ext_link *hlink;
+	struct snd_sof_dev *sdev;
+	struct hdac_bus *bus;
+
+	sdev = snd_soc_component_get_drvdata(cpu_dai->component);
+	bus = sof_to_bus(sdev);
 
 	hext_stream = snd_soc_dai_get_dma_data(cpu_dai, substream);
 	if (!hext_stream) {
-- 
2.34.1

