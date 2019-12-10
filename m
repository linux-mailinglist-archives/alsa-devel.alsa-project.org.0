Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD01118BD8
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 16:00:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C11B843;
	Tue, 10 Dec 2019 15:59:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C11B843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575990039;
	bh=hreNZq425k/EmlbM3iRz3vHJrw+5SbE0DDDi5UJngR8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T+GXZ3BhXW7fP7ioowK38zMU7z5GvHf8RHJKpPISwc9wFiFamp/Ay5s3+rG8NU4NW
	 6iZg7Csuf8my3AERjSpDc9QfzOvgnyn0gbvD3/NCA+CbQaxMkHYt+UVCHlOEuFU4gv
	 99CN0F0H9mTVOMj6jrRlCSI54nT2o8Q3FI8axMsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5073F8025E;
	Tue, 10 Dec 2019 15:54:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62B7DF8028A; Tue, 10 Dec 2019 15:54:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AE7BF80254
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:54:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AE7BF80254
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9B8BAAE2E;
 Tue, 10 Dec 2019 14:54:12 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2019 15:53:52 +0100
Message-Id: <20191210145406.21419-10-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210145406.21419-1-tiwai@suse.de>
References: <20191210145406.21419-1-tiwai@suse.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH for-5.6 09/23] ASoC: mediatek: Drop superfluous
	ioctl PCM ops
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

ASoC PCM core deals the empty ioctl field now as default.
Let's kill the redundant lines.

Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/mediatek/common/mtk-afe-platform-driver.c | 1 -
 sound/soc/mediatek/common/mtk-btcvsd.c              | 1 -
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c          | 1 -
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c          | 1 -
 4 files changed, 4 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index 719d43bb0b8f..44dfef713905 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -128,7 +128,6 @@ EXPORT_SYMBOL_GPL(mtk_afe_pcm_new);
 
 const struct snd_soc_component_driver mtk_afe_pcm_platform = {
 	.name		= AFE_PCM_NAME,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.pointer	= mtk_afe_pcm_pointer,
 	.pcm_construct	= mtk_afe_pcm_new,
 };
diff --git a/sound/soc/mediatek/common/mtk-btcvsd.c b/sound/soc/mediatek/common/mtk-btcvsd.c
index 2b490ae2e642..668fef3e319a 100644
--- a/sound/soc/mediatek/common/mtk-btcvsd.c
+++ b/sound/soc/mediatek/common/mtk-btcvsd.c
@@ -1271,7 +1271,6 @@ static const struct snd_soc_component_driver mtk_btcvsd_snd_platform = {
 	.probe		= mtk_btcvsd_snd_component_probe,
 	.open		= mtk_pcm_btcvsd_open,
 	.close		= mtk_pcm_btcvsd_close,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= mtk_pcm_btcvsd_hw_params,
 	.hw_free	= mtk_pcm_btcvsd_hw_free,
 	.prepare	= mtk_pcm_btcvsd_prepare,
diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index 0743c699d8c1..378bfc16ef52 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -712,7 +712,6 @@ static int mt6797_afe_component_probe(struct snd_soc_component *component)
 static const struct snd_soc_component_driver mt6797_afe_component = {
 	.name		= AFE_PCM_NAME,
 	.probe		= mt6797_afe_component_probe,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.pointer	= mtk_afe_pcm_pointer,
 	.pcm_construct	= mtk_afe_pcm_new,
 };
diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 6b5f407de3d0..6e2270bbb10e 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -1050,7 +1050,6 @@ static int mt8183_afe_component_probe(struct snd_soc_component *component)
 static const struct snd_soc_component_driver mt8183_afe_component = {
 	.name		= AFE_PCM_NAME,
 	.probe		= mt8183_afe_component_probe,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.pointer	= mtk_afe_pcm_pointer,
 	.pcm_construct	= mtk_afe_pcm_new,
 };
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
