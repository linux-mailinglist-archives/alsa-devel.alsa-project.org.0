Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E73537AEE
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 14:59:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1383A188A;
	Mon, 30 May 2022 14:58:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1383A188A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653915585;
	bh=zwLZOtzsjIrGjVkgMSw7EhmnbACABlAKZCgHcg080zU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FqA3QtF+x8KF2fLIL1Lc1wjq+WtCpyouoPufGwmkGO01rjyCIqCl74YfOixaEK1d0
	 9ukvOoEaEUWwnPKDO5BfSVinlApYAkvJJRZG43SepHJ267oxQq7dUW3/dV8gCumiXp
	 FSoQJ41n1IY1hcgQiPSLlxeEtTNK/43s/mCH9cNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75CB7F801F5;
	Mon, 30 May 2022 14:58:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2E5BF800E5; Mon, 30 May 2022 14:58:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3308EF800E5
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 14:58:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3308EF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XUzaMHUL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653915520; x=1685451520;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zwLZOtzsjIrGjVkgMSw7EhmnbACABlAKZCgHcg080zU=;
 b=XUzaMHULlOXAJfMMMWeBWAUjt3UQr22O5x3FXCF/LbYR3QtA1IYwuJDe
 r5zLz3T9SikKx4P4qbI8LlvTDZobjqnA1NhcdFYjwiPh5aikW8HJcbc79
 rOLoN2ZFmpzaNBNZ2dgWuPIDAJuGcQdjRR6iravHL7qB7o9aTHRQKiv6b
 HyG3LNQkg9s7mnsp0gTy7S1K4Lop+q1Z7Ggg13w3U8V9ag2PRHFHRKyS7
 6nhhnYUdUtqBKKKsWb0FaDPUN2S849Y/gxLxDqiQp7ynLN8+Hg/jdGAhX
 cdKgJ5MZwREkRwpj/ygE5wVrIvJ90PF5EehHlDe1u+DuJ9uT/oq2/d7d1 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="255481757"
X-IronPort-AV: E=Sophos;i="5.91,262,1647327600"; d="scan'208";a="255481757"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2022 05:58:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,262,1647327600"; d="scan'208";a="561916818"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.25])
 by orsmga002.jf.intel.com with ESMTP; 30 May 2022 05:58:27 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: cirrus-common: fix incorrect channel mapping
Date: Mon, 30 May 2022 20:54:21 +0800
Message-Id: <20220530125421.885236-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, xliu <xiang.liu@cirrus.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>
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

From: xliu <xiang.liu@cirrus.com>

The default mapping of ASPRX1 Slot is left channel. Map the slots of
right amplifiers (WR and TR) to right channel.

Signed-off-by: xliu <xiang.liu@cirrus.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/boards/sof_cirrus_common.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/intel/boards/sof_cirrus_common.c b/sound/soc/intel/boards/sof_cirrus_common.c
index e71d74ec1b0b..64ca0e3991dc 100644
--- a/sound/soc/intel/boards/sof_cirrus_common.c
+++ b/sound/soc/intel/boards/sof_cirrus_common.c
@@ -107,6 +107,7 @@ static int cs35l41_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	int clk_freq, i, ret;
+	int rx_ch[2] = {1, 0};
 
 	clk_freq = sof_dai_get_bclk(rtd); /* BCLK freq */
 
@@ -134,6 +135,17 @@ static int cs35l41_hw_params(struct snd_pcm_substream *substream,
 				ret);
 			return ret;
 		}
+
+		/* Setup for R channel Slot: WR and TR */
+		if (i % 2) {
+			ret = snd_soc_dai_set_channel_map(codec_dai, 0, NULL,
+							  ARRAY_SIZE(rx_ch), rx_ch);
+			if (ret < 0) {
+				dev_err(codec_dai->dev, "fail to set channel map, ret %d\n",
+					ret);
+				return ret;
+			}
+		}
 	}
 
 	return 0;
-- 
2.25.1

