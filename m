Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E995816A9B
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 11:10:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E422844;
	Mon, 18 Dec 2023 11:10:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E422844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702894244;
	bh=YgvwR8zWdOnEkkhdXIkZltsY5i5Y7+noZhDYzIh4r18=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=eUdXeto03NWExoNMaKMAkfD6tjJ10GIGeqlB3IbnrixSlKScwQ8QfUvTYj4l1hiO+
	 n94JsPIufXH6xpJ+j8ClOz+2ywq2Q5dXM2RkQaGJAdKnl5elUnj9MXH11V/d1RFzl0
	 sdFbk9swerHjgHnDdLuOuj7epYZ/M9LYrn3AV1mo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F68EF80579; Mon, 18 Dec 2023 11:10:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A6C7F8057A;
	Mon, 18 Dec 2023 11:10:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 458C4F80425; Mon, 18 Dec 2023 11:10:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23BC8F800D2
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 11:10:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23BC8F800D2
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 268B62012CB;
	Mon, 18 Dec 2023 11:10:01 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8C3F22012D6;
	Mon, 18 Dec 2023 11:10:00 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id DA6B6181D0C0;
	Mon, 18 Dec 2023 18:09:58 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: fsl_sai: Fix channel swap issue on i.MX8MP
Date: Mon, 18 Dec 2023 17:28:51 +0800
Message-Id: <1702891731-3417-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: C5GZWREV74UCEAXL4N3YK33XA36B4ZYF
X-Message-ID-Hash: C5GZWREV74UCEAXL4N3YK33XA36B4ZYF
X-MailFrom: shengjiu.wang@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C5GZWREV74UCEAXL4N3YK33XA36B4ZYF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When flag mclk_with_tere and mclk_direction_output enabled,
The SAI transmitter or receiver will be enabled in very early
stage, that if FSL_SAI_xMR is set by previous case,
for example previous case is one channel, current case is
two channels, then current case started with wrong xMR in
the beginning, then channel swap happen.

The patch is to clear xMR in hw_free() to avoid such
channel swap issue.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 32bbe5056a63..546bd4e333b5 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -714,6 +714,9 @@ static int fsl_sai_hw_free(struct snd_pcm_substream *substream,
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	unsigned int ofs = sai->soc_data->reg_offset;
 
+	/* Clear xMR to avoid channel swap with mclk_with_tere enabled case */
+	regmap_write(sai->regmap, FSL_SAI_xMR(tx), 0);
+
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx, ofs),
 			   FSL_SAI_CR3_TRCE_MASK, 0);
 
-- 
2.34.1

