Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB2732DCA0
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Mar 2021 22:59:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CF6A1890;
	Thu,  4 Mar 2021 22:59:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CF6A1890
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614895196;
	bh=AGeJPFJFZFiDlEuYA4DT1F8PN/bvBGhbJT1Yqb7fKdE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bDatQfsKSV0VOX66a7kjLd86k4uMD3ivkEhmIG1nvFk8aa+/CZ5HwjWjGRSndNf5d
	 GY1zZllx7W/gkxjDFVHzGHJFPaAy4iFrLnHom9e+B0gYJCB1aNfWrSXl5JkIdzfFKs
	 xnDpipIHv8remEvBoA05VxluVgpIOEQGHuBeSeLA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB10EF800ED;
	Thu,  4 Mar 2021 22:58:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19194F80269; Thu,  4 Mar 2021 22:58:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8469DF80227
 for <alsa-devel@alsa-project.org>; Thu,  4 Mar 2021 22:58:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8469DF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com
 header.i=@marek-ca.20150623.gappssmtp.com header.b="IZjJYUNq"
Received: by mail-qk1-x72a.google.com with SMTP id l132so28359991qke.7
 for <alsa-devel@alsa-project.org>; Thu, 04 Mar 2021 13:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nbze8gCMaDI1IAu3LD9VNB/zoM+54xD6O96EqggyI0s=;
 b=IZjJYUNqOQbo9CYLDbRcg72SwHxQPuq2eSOygLV6vR9RtY3wNlxNYVh7g26gKTKvwt
 mWsJwGMFB7TO7XflIEjcWFfm/NPylMEMCkH8H+qLhwFm6dCZPQgfedOIaxv7Oi/qHF9G
 UacVXBbyE4YNwNWxWnRgCfpPy7asBHKc3MKUrS2v8aRqxsBEsuxZSIQCnr7Bj6GufwhE
 lcSyInQxYjODsYO8xzmJGu/1eMh7n5OXVx2P9O4WZ8deWyiseVdDrjewmZrgtv9+ngRK
 2Fe2o29USbcfSyaXBORZ0igeMGXa7jrQWX5OlF3GYx3qseMIhhl8rCNdikmCBNITh6Hg
 AYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nbze8gCMaDI1IAu3LD9VNB/zoM+54xD6O96EqggyI0s=;
 b=jsYxVtZzWWvIIbjsjIx7nSrKbwUHymBFM7C/GIMqMNLWCb6lGaLV8aVsav6Yir/+XW
 3Nic8X+SPkgBbHFb4AQINxNcT7yOA9/0mRZj+BooTsXVif/0iACK74VFsJ1iz7S+/LSF
 6SbOAo2lypZJWpARgEqkVjmzDs0yMzy45ZE2BI3CRXWrAJx4zKl7wSLQNpeZrUi0xJAx
 1EHlf3RHz1Y/C3zlSgjyMjrNVl7hv0da3Th+k81TG+CYfhLLEfgxjB1T0FHxGBbTqlem
 my9yXrYbEE+KLzCKwVK5DMROKMcoXCHhbcZPQxXKWb73jZ7jPqg/SHiTf/OJSCze3fRH
 x3/A==
X-Gm-Message-State: AOAM5319Hdy+8uh5h1BPR2pVjuDXWiJLnsC6z5mcT1a/xG5d0/eXmQFY
 j7koxSKK7DbY7DyLxLrHNHJ8qQ==
X-Google-Smtp-Source: ABdhPJyFUWcvnNRd82OokzjaRJTgmmSWE/c7ZWKgoh6oN5NNeHBtiFc/KvFGUxbGcE3941wMNT/0Cg==
X-Received: by 2002:a37:9f91:: with SMTP id i139mr6270897qke.72.1614895093854; 
 Thu, 04 Mar 2021 13:58:13 -0800 (PST)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id m21sm460478qka.28.2021.03.04.13.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 13:58:13 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH] ASoC: codecs: lpass-va-macro: mute/unmute all active
 decimators
Date: Thu,  4 Mar 2021 16:56:46 -0500
Message-Id: <20210304215646.17956-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "moderated list:QCOM AUDIO ASoC DRIVERS" <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

An interface can have multiple decimators enabled, so loop over all active
decimators. Otherwise only one channel will be unmuted, and other channels
will be zero. This fixes recording from dual DMIC as a single two channel
stream.

Also remove the now unused "active_decimator" field.

Fixes: 908e6b1df26e ("ASoC: codecs: lpass-va-macro: Add support to VA Macro")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/lpass-va-macro.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 91e6890d6efcb..3d6976a3d9e42 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -189,7 +189,6 @@ struct va_macro {
 	struct device *dev;
 	unsigned long active_ch_mask[VA_MACRO_MAX_DAIS];
 	unsigned long active_ch_cnt[VA_MACRO_MAX_DAIS];
-	unsigned long active_decimator[VA_MACRO_MAX_DAIS];
 	u16 dmic_clk_div;
 
 	int dec_mode[VA_MACRO_NUM_DECIMATORS];
@@ -549,11 +548,9 @@ static int va_macro_tx_mixer_put(struct snd_kcontrol *kcontrol,
 	if (enable) {
 		set_bit(dec_id, &va->active_ch_mask[dai_id]);
 		va->active_ch_cnt[dai_id]++;
-		va->active_decimator[dai_id] = dec_id;
 	} else {
 		clear_bit(dec_id, &va->active_ch_mask[dai_id]);
 		va->active_ch_cnt[dai_id]--;
-		va->active_decimator[dai_id] = -1;
 	}
 
 	snd_soc_dapm_mixer_update_power(widget->dapm, kcontrol, enable, update);
@@ -880,18 +877,19 @@ static int va_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 	struct va_macro *va = snd_soc_component_get_drvdata(component);
 	u16 tx_vol_ctl_reg, decimator;
 
-	decimator = va->active_decimator[dai->id];
-
-	tx_vol_ctl_reg = CDC_VA_TX0_TX_PATH_CTL +
-				VA_MACRO_TX_PATH_OFFSET * decimator;
-	if (mute)
-		snd_soc_component_update_bits(component, tx_vol_ctl_reg,
-					      CDC_VA_TX_PATH_PGA_MUTE_EN_MASK,
-					      CDC_VA_TX_PATH_PGA_MUTE_EN);
-	else
-		snd_soc_component_update_bits(component, tx_vol_ctl_reg,
-					      CDC_VA_TX_PATH_PGA_MUTE_EN_MASK,
-					      CDC_VA_TX_PATH_PGA_MUTE_DISABLE);
+	for_each_set_bit(decimator, &va->active_ch_mask[dai->id],
+			 VA_MACRO_DEC_MAX) {
+		tx_vol_ctl_reg = CDC_VA_TX0_TX_PATH_CTL +
+					VA_MACRO_TX_PATH_OFFSET * decimator;
+		if (mute)
+			snd_soc_component_update_bits(component, tx_vol_ctl_reg,
+					CDC_VA_TX_PATH_PGA_MUTE_EN_MASK,
+					CDC_VA_TX_PATH_PGA_MUTE_EN);
+		else
+			snd_soc_component_update_bits(component, tx_vol_ctl_reg,
+					CDC_VA_TX_PATH_PGA_MUTE_EN_MASK,
+					CDC_VA_TX_PATH_PGA_MUTE_DISABLE);
+	}
 
 	return 0;
 }
-- 
2.26.1

