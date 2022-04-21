Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD4B50A4DB
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 17:58:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9D57AE9;
	Thu, 21 Apr 2022 17:57:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9D57AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650556720;
	bh=NgQKtYVQd6Ve2Uu/oAmrqXji0aTJSP6xs6VZKOV7EBE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rH3KzNei528Qi/HzN8BTm1D5kKvk1Lz7YNf5VSs85XfuRKpdYpxzSrtrF89MC5u+O
	 qV9YjvtttArOn86HPLRq+w0gHkzM/GvMkvhtb4TLHoNaupE4sNutVJXeg1xWYOvYWI
	 bO+Un+EoaNlTUbI+KnCACQtGEfbqxknLvBkhyzoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46B83F804C1;
	Thu, 21 Apr 2022 17:57:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8B7BF800C1; Thu, 21 Apr 2022 17:57:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6457BF800C1
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 17:57:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6457BF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="Hr7mGBNy"
Received: by mail-wr1-x42b.google.com with SMTP id t6so3889953wra.4
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 08:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E0Xr29KwZXsM1RSTvbGVQLKdFlm6gLr6JsvZ9omdm1g=;
 b=Hr7mGBNybXCXwQwcy2LhZMdh/KpBSQgzb45nO28fqdIb6vNwaGHZPto4AqwTiu36U7
 1J2H0Cy3CB0P4pTBdwieJdyBcv8KveCl9drrDLRiGm4BlVARbKLHJW/hnop9cbcN9I90
 EV5xQyDgi4Z8kbFDOjkHK67bStZIAzJ+QmzlgzdXGURjmqUy2J54hMne6Klj01BitVe1
 bx92ejZJKC2cswFvPxZFkteZOeEVIbqyfasj3U3pvxTyRoZniputX4dbzF2PiqgIPwv4
 Wkz+RJJq2OMylno4iVKeRVvwDTKo4U9zMIyUfsT1lfUkqCnm7E8bIGShTC/eAnKcDC2w
 GCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E0Xr29KwZXsM1RSTvbGVQLKdFlm6gLr6JsvZ9omdm1g=;
 b=dxV3FPcHrJ3dS3LMrBHi4ETtnmWmovD3N5ImGsN+ro0XSHQPVl6xdG0/+9XQsy+lAA
 TeWhTVNALQf7hDR0A0S/B5pSt2g/ft0Bp3o1aIqiv5OIHxtwq9QCbm6/dnoD6s1VNoTX
 ti1dG6riAAZ3m7T0uR3wwSQNbIkP0jwwnmzISzCjIUUREiXZ5vPrt/op5zWpfbkhVllF
 NIp7vQLmEF6npSNo79JFnwvYAIT2/60hm5gmWvKxpmVToE6hlkqGAwaltUrchUpsYGmf
 1rJ7J9iCsFNgcxnnJocVpQih56DsW0W4Qy6aiiJwOFXnva6xyd6MeOxK3kVY0h2GPMNV
 N8kQ==
X-Gm-Message-State: AOAM532vEMK/cIjpb/0mAKXcOVHCCb1GwG3+Pmyz2kl3mKSdbOXjtU8t
 52fjlz0DrBn8Wbib0seWh4U+dg==
X-Google-Smtp-Source: ABdhPJx7vw1kRWMEjCJYzAEdaiwrgrOvmaqPUNeDkFIzBjyf49b6SsrkX7g8rEkQbjTibXRCOHMuJg==
X-Received: by 2002:adf:efc6:0:b0:207:b89b:232b with SMTP id
 i6-20020adfefc6000000b00207b89b232bmr280197wrp.403.1650556650106; 
 Thu, 21 Apr 2022 08:57:30 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:35ba:2677:956:980d])
 by smtp.gmail.com with ESMTPSA id
 61-20020adf8143000000b002061d8d807esm2623140wrm.87.2022.04.21.08.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:57:29 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	broonie@kernel.org
Subject: [PATCH 1/2] Revert "ASoC: meson: axg-tdm-interface: manage formatters
 in trigger"
Date: Thu, 21 Apr 2022 17:57:24 +0200
Message-Id: <20220421155725.2589089-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Dmitry Shmidt <dimitrysh@google.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

This reverts commit bf5e4887eeddb48480568466536aa08ec7f179a5 because
the following and required commit e138233e56e9829e65b6293887063a1a3ccb2d68
causes the following system crash when using audio:
 BUG: sleeping function called from invalid context at kernel/locking/mutex.c:282

Reported-by: Dmitry Shmidt <dimitrysh@google.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 sound/soc/meson/axg-tdm-interface.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index 0c31934a9630..e076ced30025 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -351,29 +351,13 @@ static int axg_tdm_iface_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int axg_tdm_iface_trigger(struct snd_pcm_substream *substream,
-				 int cmd,
+static int axg_tdm_iface_prepare(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
-	struct axg_tdm_stream *ts =
-		snd_soc_dai_get_dma_data(dai, substream);
-
-	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
-	case SNDRV_PCM_TRIGGER_RESUME:
-	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		axg_tdm_stream_start(ts);
-		break;
-	case SNDRV_PCM_TRIGGER_SUSPEND:
-	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-	case SNDRV_PCM_TRIGGER_STOP:
-		axg_tdm_stream_stop(ts);
-		break;
-	default:
-		return -EINVAL;
-	}
+	struct axg_tdm_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
 
-	return 0;
+	/* Force all attached formatters to update */
+	return axg_tdm_stream_reset(ts);
 }
 
 static int axg_tdm_iface_remove_dai(struct snd_soc_dai *dai)
@@ -413,8 +397,8 @@ static const struct snd_soc_dai_ops axg_tdm_iface_ops = {
 	.set_fmt	= axg_tdm_iface_set_fmt,
 	.startup	= axg_tdm_iface_startup,
 	.hw_params	= axg_tdm_iface_hw_params,
+	.prepare	= axg_tdm_iface_prepare,
 	.hw_free	= axg_tdm_iface_hw_free,
-	.trigger	= axg_tdm_iface_trigger,
 };
 
 /* TDM Backend DAIs */
-- 
2.25.1

