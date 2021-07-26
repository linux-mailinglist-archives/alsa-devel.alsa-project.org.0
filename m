Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 133E53D570F
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jul 2021 12:07:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 843F51721;
	Mon, 26 Jul 2021 12:06:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 843F51721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627294045;
	bh=gOe+31h2lP8r7a+5TJ3DrqMolUmIsxmLJnH88zvv62k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uQav6uxohFCKWHd+vvhWTZFpz/92hI5R2h2ODm15KDsQMYbXRjG/bRpcYf1+coJ7s
	 uhH/FrejuJA8NcKOp8+XXFegIR68/71ZpvqBIjqRoTEKmfkRZ0dXQRz6Wz8O6kl05R
	 DPKqa+rcnu1AxLFVtCdQwEcD/l3ZwKfiVpVPXdGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F18C4F80130;
	Mon, 26 Jul 2021 12:05:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6253F8025A; Mon, 26 Jul 2021 12:05:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27CA8F80130
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 12:05:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27CA8F80130
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="297774559"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="297774559"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 03:05:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="579317934"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.32])
 by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2021 03:05:36 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: sof_da7219_mx98360a: fail to initialize soundcard
Date: Mon, 26 Jul 2021 17:45:25 +0800
Message-Id: <20210726094525.5748-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Paul Olaru <paul.olaru@oss.nxp.com>,
 Zou Wei <zou_wei@huawei.com>, Rander Wang <rander.wang@intel.com>,
 Brent Lu <brent.lu@intel.com>
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

The default codec for speaker amp's DAI Link is max98373 and will be
overwritten in probe function if the board id is sof_da7219_mx98360a.
However, the probe function does not do it because the board id is
changed in earlier commit.

Fixes: 1cc04d195dc2 ("ASoC: Intel: sof_da7219_max98373: shrink platform_id below 20 characters")
Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/boards/sof_da7219_max98373.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_da7219_max98373.c b/sound/soc/intel/boards/sof_da7219_max98373.c
index 896251d742fe..b7b3b0bf994a 100644
--- a/sound/soc/intel/boards/sof_da7219_max98373.c
+++ b/sound/soc/intel/boards/sof_da7219_max98373.c
@@ -404,7 +404,7 @@ static int audio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/* By default dais[0] is configured for max98373 */
-	if (!strcmp(pdev->name, "sof_da7219_max98360a")) {
+	if (!strcmp(pdev->name, "sof_da7219_mx98360a")) {
 		dais[0] = (struct snd_soc_dai_link) {
 			.name = "SSP1-Codec",
 			.id = 0,
-- 
2.17.1

