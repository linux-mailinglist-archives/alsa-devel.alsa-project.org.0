Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EC379A442
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 09:16:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AFA0D8;
	Mon, 11 Sep 2023 09:15:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AFA0D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694416559;
	bh=KArebcRQbLe+0cHGqcWa33ZfoxKv8pqd18NKG13tXf0=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=o6rqgbAkik0pbjU8B29C0Y330x2kpWrR57CvB9oPVP3tyHlgDmGRdQeRDfJiNhwNK
	 JyXMa6jsvnFql9FvjD1u567iqEYMfpSt441+SZk8fVfbOxJ2lCNo0e9XbPc+Ks/iJu
	 oDX2K1WDDMNNqDFi3H0adwvpmGvworq6PVMpwziY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBE3EF80552; Mon, 11 Sep 2023 09:14:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 647C6F80246;
	Mon, 11 Sep 2023 09:14:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05D51F80425; Mon, 11 Sep 2023 09:14:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6824F8007C
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 09:14:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6824F8007C
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F1E481A135A;
	Mon, 11 Sep 2023 09:14:38 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B9D4B1A1380;
	Mon, 11 Sep 2023 09:14:38 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 30A171820F56;
	Mon, 11 Sep 2023 15:14:37 +0800 (+08)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl: imx-pcm-rpmsg: Add SNDRV_PCM_INFO_BATCH flag
Date: Mon, 11 Sep 2023 14:38:07 +0800
Message-Id: <1694414287-13291-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: 4PD3345GQ2WH37P6TBTW2PNNHYIAJLYG
X-Message-ID-Hash: 4PD3345GQ2WH37P6TBTW2PNNHYIAJLYG
X-MailFrom: shengjiu.wang@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4PD3345GQ2WH37P6TBTW2PNNHYIAJLYG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rpmsg pcm device is a device which should support
double buffering.

Found this issue with pipewire. When there is no
SNDRV_PCM_INFO_BATCH flag in driver, the pipewire will
set headroom to be zero, and because rpmsg pcm device
don't support residue report, when the latency setting
is small, the "delay" always larger than "target" in
alsa-pcm.c, that reading next period data is not
scheduled on time.

With SNDRV_PCM_INFO_BATCH flag in driver, the pipewire
will select a smaller period size for device, then
the task of reading next period data will be scheduled
on time.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index d63782b8bdef..bb736d45c9e0 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -19,6 +19,7 @@
 static struct snd_pcm_hardware imx_rpmsg_pcm_hardware = {
 	.info = SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
+		SNDRV_PCM_INFO_BATCH |
 		SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_MMAP_VALID |
 		SNDRV_PCM_INFO_NO_PERIOD_WAKEUP |
-- 
2.34.1

