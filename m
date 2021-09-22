Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7475E41521E
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Sep 2021 22:56:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEFC615E2;
	Wed, 22 Sep 2021 22:55:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEFC615E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632344168;
	bh=1bXxnY/baEqP4CfaheIKzhrj2ixHw7ZvVIUbDxXjXy4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vIALelmEGpGh96QKTk1TasVgHh05Le/9NHt2DWlior+htIjkEBIHoVcOayvEPhYNL
	 mBSJ58NVlkJYDKpddv+ri3ZmoLa/B5JbfEcoz9Q6Gos598nc0t9yaPz66upRB5yKn5
	 5ERixOFY1H0A9psFhL17txWaPcSLowdCs96OsHVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D027F8014E;
	Wed, 22 Sep 2021 22:54:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67434F8025D; Wed, 22 Sep 2021 22:54:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8613F8011F
 for <alsa-devel@alsa-project.org>; Wed, 22 Sep 2021 22:54:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8613F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VOX/1XqO"
Received: by mail-lf1-x12f.google.com with SMTP id u18so16605044lfd.12
 for <alsa-devel@alsa-project.org>; Wed, 22 Sep 2021 13:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3cZeXwR2k4hTcaH9mMdu8oiulnnc0/J5L3qGGtoXYkE=;
 b=VOX/1XqOVC0VuQxpTcgYxzURn2nBP/v5n9cHk5GMCHvurDdQ01yW8/eJiRqLD6Ywh5
 NMcyrqu9AmxXvcZ+ldCDbJGl1P0N+yk7IAUujRdexxJgXOd3giyPU4OQX3eACta8/ATD
 qcDMjQ1TZ/X6hpfLApbH/XjoZif4Whl7GSo90xHM7t4V1fRyyLWrV1/hj7/fJ/iIgCV3
 Ij4IkB/jdGyI+fZ84GPTFKNeKZLre3M/Nc8xBwSF9h5mJLKLrpoV6EI8nQy7miD4Tze4
 PitFWhftCmSCpylPet2EtuX/ebuUxdS/cUm37Y+AT6Es7N5RjRhwMwRoKUTxsWPxyDGh
 qMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3cZeXwR2k4hTcaH9mMdu8oiulnnc0/J5L3qGGtoXYkE=;
 b=wLcxKB8LvWLS6ox0esv5B12uG9nkI9uTg1x/Ra42qWc2M6pdBlpTXWp/ec9DBT2KJy
 EWoU2pnLRRn1N4G5ZRGe5SgrCya8ZLjWOJa7stWgeMbTX7rt1lhcRKzsCeBZRVnYMm2F
 oxCQy+o5jH1B6tcrDrHkEYz9Ke/I8bafg0IaHoUxgZMtMIkhOol6YNqVYPyTuav/TGSv
 p31Xk/3N05s/JR2aFabMRt8wEoytCvFkFWbuduri5+Tyah1ULWm7I2TlxYwPGqEXFD+v
 yZ9dpRzCpr/0qqTiBb8C7+eqLnZeW8QiWdGwJZX/dtwLfCOt8TipCvFKHLKSkfP56djC
 c0HQ==
X-Gm-Message-State: AOAM530Km9Xdjb0IpduwqbKuAiwJAvwt1sdaR4sl9XLZmKEUSTA0LAKS
 CCcKr3qcE9s75Mvk/mpXmgo=
X-Google-Smtp-Source: ABdhPJzFVQnTTYL1T8QNgYqC6+HYZ4LqvglqVxbOzzAWLXdF28v4QpsMsXlM+ycKlVC2jQYjif6Y0A==
X-Received: by 2002:a2e:5443:: with SMTP id y3mr1401240ljd.482.1632344084132; 
 Wed, 22 Sep 2021 13:54:44 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se.
 [98.128.228.193])
 by smtp.gmail.com with ESMTPSA id e24sm261883lfs.212.2021.09.22.13.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 13:54:43 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH] ASoC: tegra: Constify static snd_soc_dai_ops structs
Date: Wed, 22 Sep 2021 22:54:38 +0200
Message-Id: <20210922205438.34519-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
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

The only usage of these is to assign their address to the ops field in
the snd_soc_dai_driver struct, which is a pointer to const. Make them
const to allow the compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 sound/soc/tegra/tegra210_adx.c   | 4 ++--
 sound/soc/tegra/tegra210_amx.c   | 4 ++--
 sound/soc/tegra/tegra210_mixer.c | 4 ++--
 sound/soc/tegra/tegra210_mvc.c   | 2 +-
 sound/soc/tegra/tegra210_sfc.c   | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index 78d660447bb1..d7c7849c2f92 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -206,12 +206,12 @@ static int tegra210_adx_put_byte_map(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
-static struct snd_soc_dai_ops tegra210_adx_in_dai_ops = {
+static const struct snd_soc_dai_ops tegra210_adx_in_dai_ops = {
 	.hw_params	= tegra210_adx_in_hw_params,
 	.startup	= tegra210_adx_startup,
 };
 
-static struct snd_soc_dai_ops tegra210_adx_out_dai_ops = {
+static const struct snd_soc_dai_ops tegra210_adx_out_dai_ops = {
 	.hw_params	= tegra210_adx_out_hw_params,
 };
 
diff --git a/sound/soc/tegra/tegra210_amx.c b/sound/soc/tegra/tegra210_amx.c
index 83176e1663ab..af9bddfc3120 100644
--- a/sound/soc/tegra/tegra210_amx.c
+++ b/sound/soc/tegra/tegra210_amx.c
@@ -241,12 +241,12 @@ static int tegra210_amx_put_byte_map(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
-static struct snd_soc_dai_ops tegra210_amx_out_dai_ops = {
+static const struct snd_soc_dai_ops tegra210_amx_out_dai_ops = {
 	.hw_params	= tegra210_amx_out_hw_params,
 	.startup	= tegra210_amx_startup,
 };
 
-static struct snd_soc_dai_ops tegra210_amx_in_dai_ops = {
+static const struct snd_soc_dai_ops tegra210_amx_in_dai_ops = {
 	.hw_params	= tegra210_amx_in_hw_params,
 };
 
diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
index 53fcd8f6605a..55e61776c565 100644
--- a/sound/soc/tegra/tegra210_mixer.c
+++ b/sound/soc/tegra/tegra210_mixer.c
@@ -283,11 +283,11 @@ static int tegra210_mixer_out_hw_params(struct snd_pcm_substream *substream,
 					    dai->id - TEGRA210_MIXER_RX_MAX);
 }
 
-static struct snd_soc_dai_ops tegra210_mixer_out_dai_ops = {
+static const struct snd_soc_dai_ops tegra210_mixer_out_dai_ops = {
 	.hw_params	= tegra210_mixer_out_hw_params,
 };
 
-static struct snd_soc_dai_ops tegra210_mixer_in_dai_ops = {
+static const struct snd_soc_dai_ops tegra210_mixer_in_dai_ops = {
 	.hw_params	= tegra210_mixer_in_hw_params,
 };
 
diff --git a/sound/soc/tegra/tegra210_mvc.c b/sound/soc/tegra/tegra210_mvc.c
index 3646ce9b0fd1..7b9c7006e419 100644
--- a/sound/soc/tegra/tegra210_mvc.c
+++ b/sound/soc/tegra/tegra210_mvc.c
@@ -387,7 +387,7 @@ static int tegra210_mvc_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_dai_ops tegra210_mvc_dai_ops = {
+static const struct snd_soc_dai_ops tegra210_mvc_dai_ops = {
 	.hw_params	= tegra210_mvc_hw_params,
 };
 
diff --git a/sound/soc/tegra/tegra210_sfc.c b/sound/soc/tegra/tegra210_sfc.c
index 260dca6f6d25..dc477ee1b82c 100644
--- a/sound/soc/tegra/tegra210_sfc.c
+++ b/sound/soc/tegra/tegra210_sfc.c
@@ -3287,12 +3287,12 @@ static int tegra210_sfc_put_control(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
-static struct snd_soc_dai_ops tegra210_sfc_in_dai_ops = {
+static const struct snd_soc_dai_ops tegra210_sfc_in_dai_ops = {
 	.hw_params	= tegra210_sfc_in_hw_params,
 	.startup	= tegra210_sfc_startup,
 };
 
-static struct snd_soc_dai_ops tegra210_sfc_out_dai_ops = {
+static const struct snd_soc_dai_ops tegra210_sfc_out_dai_ops = {
 	.hw_params	= tegra210_sfc_out_hw_params,
 };
 
-- 
2.33.0

