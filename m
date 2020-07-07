Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 454B52177A1
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 21:10:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB22A15F2;
	Tue,  7 Jul 2020 21:09:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB22A15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594149009;
	bh=edHLALEDDnuhivtrl0UeALCItu+XtNtPKp4qdWc27Tc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R/SiWANP4d4OPYlnGcSv45DmD3k1g11NaYKEsZKkwBtlqM+vctYOGvwtOjiZzedYA
	 ppz4Et+N59+e8pFCoX0P8Xox3k133nB+oiMLtsmxgwZn5sbI2L1A0shoUMtOWhSkIj
	 jHGb5jUxng16U8Kf7GJCK+7TEbmL4iY19oM4zPv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30ED0F802EB;
	Tue,  7 Jul 2020 21:06:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A456DF802E0; Tue,  7 Jul 2020 21:06:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6650F800D0
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 21:06:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6650F800D0
IronPort-SDR: yfVDRv9IjLx72pEjElOgKsV9eR5Me3HaP6nwYWhn4yW4g4okwIuX4zj7zEkTlE+fqORqfqQpx+
 HqEO9oRXtqYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="149202897"
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="149202897"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:06:33 -0700
IronPort-SDR: dSqgsiz0zeNqOlpMv2DOPgEuMFMnfOjMcLS2tGjIfZ2AqEdWEdnxDmSRVStHkVdh/kQIN7y7Sh
 vmIAtGj3UzMA==
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="268278527"
Received: from mrtorger-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.77.62])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:06:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 03/13] ASoC: samsung: pcm: fix kernel-doc
Date: Tue,  7 Jul 2020 14:06:02 -0500
Message-Id: <20200707190612.97799-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707190612.97799-1-pierre-louis.bossart@linux.intel.com>
References: <20200707190612.97799-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Sangbeom Kim <sbkim73@samsung.com>, broonie@kernel.org,
 Lee Jones <lee.jones@linaro.org>
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

Fix W=1 warnings - missing fields in structure

Credits to Sylwester Nawrocki for the pclk and cclk descriptions.

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/samsung/pcm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index a5b1a12b3496..45dfc534c6c7 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -104,8 +104,13 @@
 
 /**
  * struct s3c_pcm_info - S3C PCM Controller information
+ * @lock: Spin lock
  * @dev: The parent device passed to use from the probe.
  * @regs: The pointer to the device register block.
+ * @sclk_per_fs: number of sclk per frame sync
+ * @idleclk: Whether to keep PCMSCLK enabled even when idle (no active xfer)
+ * @pclk: the PCLK_PCM (pcm) clock pointer
+ * @cclk: the SCLK_AUDIO (audio-bus) clock pointer
  * @dma_playback: DMA information for playback channel.
  * @dma_capture: DMA information for capture channel.
  */
-- 
2.25.1

