Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D24A232E59
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 10:20:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29806176C;
	Thu, 30 Jul 2020 10:19:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29806176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596097209;
	bh=hq2SoT39gabgZPtzelejazXBJuBf8IU3oTF+N87Mgeo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Eutbz/dMotw9h/AWcR8tiIGj5UVRhXmYoC7KAOjZiuuKX8qjXZxhM+Nxfvo/Ce9US
	 jltXzBPLMC06Cafbxc34FYJ6V8j6YSHgw2KoZQ51qXbex1rcLMvqKwGgxuaHtcN9Hw
	 ujsGIYbREJevEAMKRzzQa1TbLNLxiS9lPu7L5kkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60195F80292;
	Thu, 30 Jul 2020 10:18:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EC09F8028D; Thu, 30 Jul 2020 10:18:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06A70F8012F
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 10:18:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06A70F8012F
IronPort-SDR: 8d2l07jjCRIVi+jqh0JZueLYHNr/3CoSmH9DXbYS5IPzubF75C/Cdsamqv0yIn1Ye1LmkjVZlX
 7zmtxaISyLMQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9697"; a="152784364"
X-IronPort-AV: E=Sophos;i="5.75,413,1589266800"; d="scan'208";a="152784364"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 01:18:19 -0700
IronPort-SDR: k0kGGPm0otlYqoP7r1Zz2We7YFrNk5rK8v6oAb+SU6HippbZesdgZMt2V/i2BuuFOUrIfeHDqd
 7dvdEoZrLqpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,413,1589266800"; d="scan'208";a="272863433"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.11])
 by fmsmga007.fm.intel.com with ESMTP; 30 Jul 2020 01:18:15 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/2] ASoC: intel: atom: Add period size constraint
Date: Thu, 30 Jul 2020 16:13:34 +0800
Message-Id: <1596096815-32043-2-git-send-email-brent.lu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596096815-32043-1-git-send-email-brent.lu@intel.com>
References: <1596096815-32043-1-git-send-email-brent.lu@intel.com>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>, Daniel Stuart <daniel.stuart14@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Brent Lu <brent.lu@intel.com>, Damian van Soelen <dj.vsoelen@gmail.com>
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

Use constraint to enforce the period sizes which are validated in
Android BSP.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index 49b9f18..70100ef 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -300,6 +300,16 @@ static void power_down_sst(struct sst_runtime_stream *stream)
 	stream->ops->power(sst->dev, false);
 }
 
+static const unsigned int media_period_size[] = {
+	/* sizes validated on Android platform */
+	240, 320, 960, 3072,
+};
+
+static const struct snd_pcm_hw_constraint_list constraints_media_period_size = {
+	.count = ARRAY_SIZE(media_period_size),
+	.list  = media_period_size,
+};
+
 static int sst_media_open(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
@@ -333,6 +343,11 @@ static int sst_media_open(struct snd_pcm_substream *substream,
 	if (ret_val < 0)
 		return ret_val;
 
+	/* Avoid using period size which is not validated */
+	snd_pcm_hw_constraint_list(substream->runtime, 0,
+			SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+			&constraints_media_period_size);
+
 	/* Make sure, that the period size is always even */
 	snd_pcm_hw_constraint_step(substream->runtime, 0,
 			   SNDRV_PCM_HW_PARAM_PERIODS, 2);
-- 
2.7.4

