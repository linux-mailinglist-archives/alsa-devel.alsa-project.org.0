Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C2957C95B
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 12:48:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFE54181D;
	Thu, 21 Jul 2022 12:47:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFE54181D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658400499;
	bh=+y3Va/A1VsbyZ4o+KAoLyegIRpArFXhDHwV8w0iodM8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=efi484NPWVU7FDtDuEtd1QQ+Uq8lnvwFcxJ3j50LDD2BAoW50dUkmpZ61oeN9MBFI
	 HeA2ao6E2k7RYxDsqpAyn3fsH1OpzuPeVn+fkUr1Me4EIKBgGDifD1oUWPCUVzglVa
	 B4M8+qD1hnZqtYIMOkH8Z/EsKvUgGdC3CIApWlwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F145F80567;
	Thu, 21 Jul 2022 12:45:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14C92F80529; Thu, 21 Jul 2022 12:45:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B306F80527
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 12:45:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B306F80527
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id DE5571A362E;
 Thu, 21 Jul 2022 12:45:44 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7D3351A362D;
 Thu, 21 Jul 2022 12:45:44 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 0ACC5180222A;
 Thu, 21 Jul 2022 18:45:42 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: [PATCH v2 -next 4/5] ASoC: fsl_easrc: use snd_pcm_format_t type for
 sample_format
Date: Thu, 21 Jul 2022 18:29:52 +0800
Message-Id: <1658399393-28777-5-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1658399393-28777-1-git-send-email-shengjiu.wang@nxp.com>
References: <1658399393-28777-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

Fix sparse warning:
sound/soc/fsl/fsl_easrc.c:562:33: sparse: warning: restricted snd_pcm_format_t degrades to integer
sound/soc/fsl/fsl_easrc.c:563:34: sparse: warning: restricted snd_pcm_format_t degrades to integer
sound/soc/fsl/fsl_easrc.c:565:38: sparse: warning: restricted snd_pcm_format_t degrades to integer
sound/soc/fsl/fsl_easrc.c:566:39: sparse: warning: restricted snd_pcm_format_t degrades to integer
sound/soc/fsl/fsl_easrc.c:608:33: sparse: warning: restricted snd_pcm_format_t degrades to integer
sound/soc/fsl/fsl_easrc.c:609:34: sparse: warning: restricted snd_pcm_format_t degrades to integer
sound/soc/fsl/fsl_easrc.c:615:40: sparse: warning: restricted snd_pcm_format_t degrades to integer
sound/soc/fsl/fsl_easrc.c:616:41: sparse: warning: restricted snd_pcm_format_t degrades to integer

sound/soc/fsl/fsl_easrc.c:1465:51: sparse: warning: incorrect type in assignment (different base types)
sound/soc/fsl/fsl_easrc.c:1465:51: sparse:    expected unsigned int sample_format
sound/soc/fsl/fsl_easrc.c:1465:51: sparse:    got restricted snd_pcm_format_t [usertype] format
sound/soc/fsl/fsl_easrc.c:1467:52: sparse: warning: incorrect type in assignment (different base types)
sound/soc/fsl/fsl_easrc.c:1467:52: sparse:    expected unsigned int sample_format
sound/soc/fsl/fsl_easrc.c:1467:52: sparse:    got restricted snd_pcm_format_t [usertype] asrc_format
sound/soc/fsl/fsl_easrc.c:1470:52: sparse: warning: incorrect type in assignment (different base types)
sound/soc/fsl/fsl_easrc.c:1470:52: sparse:    expected unsigned int sample_format
sound/soc/fsl/fsl_easrc.c:1470:52: sparse:    got restricted snd_pcm_format_t [usertype] format
sound/soc/fsl/fsl_easrc.c:1472:51: sparse: warning: incorrect type in assignment (different base types)
sound/soc/fsl/fsl_easrc.c:1472:51: sparse:    expected unsigned int sample_format
sound/soc/fsl/fsl_easrc.c:1472:51: sparse:    got restricted snd_pcm_format_t [usertype] asrc_format
sound/soc/fsl/fsl_easrc.c:1484:41: sparse: warning: incorrect type in argument 2 (different base types)
sound/soc/fsl/fsl_easrc.c:1484:41: sparse:    expected restricted snd_pcm_format_t [usertype] *in_raw_format
sound/soc/fsl/fsl_easrc.c:1484:41: sparse:    got unsigned int *
sound/soc/fsl/fsl_easrc.c:1485:41: sparse: warning: incorrect type in argument 3 (different base types)
sound/soc/fsl/fsl_easrc.c:1485:41: sparse:    expected restricted snd_pcm_format_t [usertype] *out_raw_format
sound/soc/fsl/fsl_easrc.c:1485:41: sparse:    got unsigned int *
sound/soc/fsl/fsl_easrc.c:1937:60: sparse: warning: incorrect type in argument 3 (different base types)
sound/soc/fsl/fsl_easrc.c:1937:60: sparse:    expected unsigned int [usertype] *out_value
sound/soc/fsl/fsl_easrc.c:1937:60: sparse:    got restricted snd_pcm_format_t *
sound/soc/fsl/fsl_easrc.c:1943:49: sparse: warning: restricted snd_pcm_format_t degrades to integer

Fixes: 955ac624058f ("ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_easrc.c | 9 ++++++---
 sound/soc/fsl/fsl_easrc.h | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index ea96b0fb6b20..3153d19136b2 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -476,7 +476,8 @@ static int fsl_easrc_prefilter_config(struct fsl_asrc *easrc,
 	struct fsl_asrc_pair *ctx;
 	struct device *dev;
 	u32 inrate, outrate, offset = 0;
-	u32 in_s_rate, out_s_rate, in_s_fmt, out_s_fmt;
+	u32 in_s_rate, out_s_rate;
+	snd_pcm_format_t in_s_fmt, out_s_fmt;
 	int ret, i;
 
 	if (!easrc)
@@ -1874,6 +1875,7 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct device_node *np;
 	void __iomem *regs;
+	u32 asrc_fmt = 0;
 	int ret, irq;
 
 	easrc = devm_kzalloc(dev, sizeof(*easrc), GFP_KERNEL);
@@ -1934,13 +1936,14 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = of_property_read_u32(np, "fsl,asrc-format", &easrc->asrc_format);
+	ret = of_property_read_u32(np, "fsl,asrc-format", &asrc_fmt);
+	easrc->asrc_format = (__force snd_pcm_format_t)asrc_fmt;
 	if (ret) {
 		dev_err(dev, "failed to asrc format\n");
 		return ret;
 	}
 
-	if (!(FSL_EASRC_FORMATS & (1ULL << easrc->asrc_format))) {
+	if (!(FSL_EASRC_FORMATS & (pcm_format_to_bits(easrc->asrc_format)))) {
 		dev_warn(dev, "unsupported format, switching to S24_LE\n");
 		easrc->asrc_format = SNDRV_PCM_FORMAT_S24_LE;
 	}
diff --git a/sound/soc/fsl/fsl_easrc.h b/sound/soc/fsl/fsl_easrc.h
index 86d5c360d4f5..7c70dac52713 100644
--- a/sound/soc/fsl/fsl_easrc.h
+++ b/sound/soc/fsl/fsl_easrc.h
@@ -569,7 +569,7 @@ struct fsl_easrc_io_params {
 	unsigned int access_len;
 	unsigned int fifo_wtmk;
 	unsigned int sample_rate;
-	unsigned int sample_format;
+	snd_pcm_format_t sample_format;
 	unsigned int norm_rate;
 };
 
-- 
2.34.1

