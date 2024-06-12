Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC64904C20
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 08:58:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0A3210BE;
	Wed, 12 Jun 2024 08:58:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0A3210BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718175532;
	bh=s7TgO1xFEFshQBAQY8OYv14stw9Qgxt8pZDh96opt3k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eic0QWmxCQpa5tucn8kpQm0KCqHKcvMjL9jtlQHoFWEwZgdF84D5lRyrxhHDla7yF
	 UsFJVzAskdHyrmSnb7xL5IInCyMbnsAa0LJHsKyWBlt2A130HIC44fvJwe8DuSAjI6
	 2rES+FHLcfj2Vhc8PtY4cOaVLOmmSHsUKazhdMaw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5A30F805F1; Wed, 12 Jun 2024 08:58:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54F61F805F4;
	Wed, 12 Jun 2024 08:58:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA88AF805C4; Wed, 12 Jun 2024 08:57:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.0 required=5.0 tests=RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E3CBF8057A
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 08:57:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E3CBF8057A
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BA9851A124C;
	Wed, 12 Jun 2024 08:57:47 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6D2A51A0FFA;
	Wed, 12 Jun 2024 08:57:47 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 1D65C180222C;
	Wed, 12 Jun 2024 14:57:45 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: viorel.suman@nxp.com
Subject: [PATCH 2/3] ASoC: fsl_audmix: Split playback and capture stream to
 different DAI
Date: Wed, 12 Jun 2024 14:40:51 +0800
Message-Id: <1718174452-17596-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1718174452-17596-1-git-send-email-shengjiu.wang@nxp.com>
References: <1718174452-17596-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: IPSCI7NCRHAYQNLJCERWKXL6XOBUISOW
X-Message-ID-Hash: IPSCI7NCRHAYQNLJCERWKXL6XOBUISOW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IPSCI7NCRHAYQNLJCERWKXL6XOBUISOW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As audmix requires playback and capture stream in different
master/slave mode, so separate playback and capture stream to
different DAI. There are three DAIs required, two DAIs for playback
one DAI for capture.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_audmix.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index 0ab2c1962117..1671a3037c60 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -326,15 +326,6 @@ static struct snd_soc_dai_driver fsl_audmix_dai[] = {
 			.rates = SNDRV_PCM_RATE_8000_96000,
 			.formats = FSL_AUDMIX_FORMATS,
 		},
-		.capture = {
-			.stream_name = "AUDMIX-Capture-0",
-			.channels_min = 8,
-			.channels_max = 8,
-			.rate_min = 8000,
-			.rate_max = 96000,
-			.rates = SNDRV_PCM_RATE_8000_96000,
-			.formats = FSL_AUDMIX_FORMATS,
-		},
 		.ops = &fsl_audmix_dai_ops,
 	},
 	{
@@ -349,8 +340,13 @@ static struct snd_soc_dai_driver fsl_audmix_dai[] = {
 			.rates = SNDRV_PCM_RATE_8000_96000,
 			.formats = FSL_AUDMIX_FORMATS,
 		},
+		.ops = &fsl_audmix_dai_ops,
+	},
+	{
+		.id   = 2,
+		.name = "audmix-2",
 		.capture = {
-			.stream_name = "AUDMIX-Capture-1",
+			.stream_name = "AUDMIX-Capture-0",
 			.channels_min = 8,
 			.channels_max = 8,
 			.rate_min = 8000,
-- 
2.34.1

