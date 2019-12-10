Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3AF118BF6
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 16:05:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBF7016ED;
	Tue, 10 Dec 2019 16:04:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBF7016ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575990316;
	bh=TmxuLGYlMlLydCI5pB6nGJVtufDTrMOJ4O5WKNZU2fw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ys8EP3G24U/i6B823hXiSwfZhq17RUPfjICbAA7KwqCqWLlvN2vO8EjopjZnwc8nr
	 ZpfKVVLCDSoC5RfixLwpUhPQSpXpjayf+5iYLQDjlrvGt44jK6qVH3BX7m6bvpLLdl
	 ERzKoyCV/zhVbEMSltb4cab6eDSmJ9bkYlDX/+b4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B02AF80303;
	Tue, 10 Dec 2019 15:54:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CF28F8029B; Tue, 10 Dec 2019 15:54:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B904F80259
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:54:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B904F80259
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BE2CAAE46;
 Tue, 10 Dec 2019 14:54:12 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2019 15:53:55 +0100
Message-Id: <20191210145406.21419-13-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210145406.21419-1-tiwai@suse.de>
References: <20191210145406.21419-1-tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Patrick Lai <plai@codeaurora.org>
Subject: [alsa-devel] [PATCH for-5.6 12/23] ASoC: qcom: Drop superfluous
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

Cc: Patrick Lai <plai@codeaurora.org>
Cc: Banajit Goswami <bgoswami@codeaurora.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/qcom/lpass-platform.c  | 1 -
 sound/soc/qcom/qdsp6/q6asm-dai.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 2e8892316423..b05091c283b7 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -543,7 +543,6 @@ static const struct snd_soc_component_driver lpass_component_driver = {
 	.name		= DRV_NAME,
 	.open		= lpass_platform_pcmops_open,
 	.close		= lpass_platform_pcmops_close,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= lpass_platform_pcmops_hw_params,
 	.hw_free	= lpass_platform_pcmops_hw_free,
 	.prepare	= lpass_platform_pcmops_prepare,
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 8150c10f081e..5e2327708772 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -880,7 +880,6 @@ static const struct snd_soc_component_driver q6asm_fe_dai_component = {
 	.open		= q6asm_dai_open,
 	.hw_params	= q6asm_dai_hw_params,
 	.close		= q6asm_dai_close,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.prepare	= q6asm_dai_prepare,
 	.trigger	= q6asm_dai_trigger,
 	.pointer	= q6asm_dai_pointer,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
