Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFCE1628C8
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 15:45:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BE8A1699;
	Tue, 18 Feb 2020 15:44:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BE8A1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582037126;
	bh=er2df4sjzs9GkLyoYycDUZDSOqrtViaCfiwM5AlD41I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gPsXA/ZyviMf3FKJLOaMVBOs9LjAKY630xpDxWJWdJ5Iv7gy6o7kOeMzm60BLFgXo
	 cvaZij/qoVVuv84+56o0BtM37ZIA31268r7lOtZCNZtm26JcC2j0O6NXic5bx3a6J2
	 EcRFKtl4UqyGpWFb6o6qLlSaInm+pEE4HleSu9Rk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C678F802BC;
	Tue, 18 Feb 2020 15:40:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E591EF8027C; Tue, 18 Feb 2020 15:40:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4701F80135
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 15:40:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4701F80135
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2020 06:40:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; d="scan'208";a="235549863"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga003.jf.intel.com with ESMTP; 18 Feb 2020 06:40:09 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 6/9] ASoC: SOF: Intel: Expose SDnFMT helpers
Date: Tue, 18 Feb 2020 15:39:21 +0100
Message-Id: <20200218143924.10565-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200218143924.10565-1-cezary.rojewski@intel.com>
References: <20200218143924.10565-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, lgirdwood@gmail.com,
 tiwai@suse.com, vkoul@kernel.org, broonie@kernel.org
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

Hda stream is setup in similar fashion for compress as it is for pcm
operations. To reuse existing code in compress path, expose SDnFMT
helper routines.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/sof/intel/hda-pcm.c | 8 ++++----
 sound/soc/sof/intel/hda.h     | 2 ++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index 23872f6e708d..a46a6baa1c3f 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -27,7 +27,7 @@
 #define SDnFMT_BITS(x)	((x) << 4)
 #define SDnFMT_CHAN(x)	((x) << 0)
 
-static inline u32 get_mult_div(struct snd_sof_dev *sdev, int rate)
+u32 hda_dsp_get_mult_div(struct snd_sof_dev *sdev, int rate)
 {
 	switch (rate) {
 	case 8000:
@@ -61,7 +61,7 @@ static inline u32 get_mult_div(struct snd_sof_dev *sdev, int rate)
 	}
 };
 
-static inline u32 get_bits(struct snd_sof_dev *sdev, int sample_bits)
+u32 hda_dsp_get_bits(struct snd_sof_dev *sdev, int sample_bits)
 {
 	switch (sample_bits) {
 	case 8:
@@ -95,8 +95,8 @@ int hda_dsp_pcm_hw_params(struct snd_sof_dev *sdev,
 	u32 size, rate, bits;
 
 	size = params_buffer_bytes(params);
-	rate = get_mult_div(sdev, params_rate(params));
-	bits = get_bits(sdev, params_width(params));
+	rate = hda_dsp_get_mult_div(sdev, params_rate(params));
+	bits = hda_dsp_get_bits(sdev, params_width(params));
 
 	hstream->substream = substream;
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index a46b66437a3d..2b5fde372790 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -502,6 +502,8 @@ void hda_dsp_d0i3_work(struct work_struct *work);
 /*
  * DSP PCM Operations.
  */
+u32 hda_dsp_get_mult_div(struct snd_sof_dev *sdev, int rate);
+u32 hda_dsp_get_bits(struct snd_sof_dev *sdev, int sample_bits);
 int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
 		     struct snd_pcm_substream *substream);
 int hda_dsp_pcm_close(struct snd_sof_dev *sdev,
-- 
2.17.1

