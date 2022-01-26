Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B17449C8C8
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 12:37:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2A321F2D;
	Wed, 26 Jan 2022 12:36:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2A321F2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643197066;
	bh=hPeFZYJ+dBsprUlM4Ze8PJGPlAV9jIJG8JovELbE2sI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dyh/DRE/a3Bc6Lc+QfobRDGnhQkr3sq6M9meoYjy685jeuop4dLm6uv6KHMhwxSA3
	 BNHGw5EjvydUg6eZORPHNyocXQYqHi8oomPj1iXNqBYXzdUiJJstCZpGQSDaHo2WA2
	 rWw7hPfRAd1ZeK786uCRtAdEow1TaYxPZc2Lz9UM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EECA7F80506;
	Wed, 26 Jan 2022 12:36:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5173EF800C8; Wed, 26 Jan 2022 12:36:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C480F800C8
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 12:36:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C480F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="OVAIp1Nv"
Received: by mail-wm1-x333.google.com with SMTP id c192so2145092wma.4
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 03:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aniun3FP07/lm5WG5tDXe1tN8Nb0Xcv5gX8sytXFnHQ=;
 b=OVAIp1Nvla6MOTka4KhoRHptBE1bSiVkdUmm34BZZCZs9pCMjk7WFqRd2PcNoYz5i2
 qz++CHRUqs0Hc1Jjy2ZwyZdyvBL/5M7hK8K96SRgIBRA0mDOOX2R/eFf/Nd17+rmoIaL
 ZOUU7k9Z1bboObbL8LMgK7mFs+G2m2O3hf/7sddakD/OS0etWyU/MMRWgJH2AuJNqIYy
 KpNSTxkq1cluZHgj9g2ig05xAVNj+ooydvh2bXGk3mcJP/GjjRc9dsjlqVIy2QWjRlLp
 akowBvkd7Rfvnq56SwnmJvGZpPTIeWQClm0hHPSGKzjSp0fVunF7P0Fq8Ra/8R+xj96s
 InTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aniun3FP07/lm5WG5tDXe1tN8Nb0Xcv5gX8sytXFnHQ=;
 b=spkgfPWSaCVL8B+2Z1C8c3IQrYQD/MUCR1pVTUtY7hRT+ukIHwHZ0+5iJz82t98ZfR
 7/ZPxOjfKreb3uCrkDHAxZ1Awlxjk5uYDYZfZIIwcRJ8RKV2ge40GcMehDRpPu6nj0Yf
 lXrqKejQn2T0SoBPgfDq4CiotFTZgDeK9DbLIU/6AhxEpJIaA2aEX0M3l6xDguBQuUzp
 TEO+z7yMcFpXqebOkFuyhCba6ZtJJ84Qo9FZzG0dZ1u+h2jwNbltL1SWCkyBRmC7cKc0
 xsCLdOidPgisEuBDHyiFd2DpIdQplqgm6LBLig/rj1GAqevD5Y54S7kk1uGvIUDK0FHB
 yS8w==
X-Gm-Message-State: AOAM533+LIMyDLb1eDN9RHNFZqr2uAgAuue9KGBUDcH5upx8GG0YtDQQ
 /QsWlpEpQtI85ORPz2hj++H9Gg==
X-Google-Smtp-Source: ABdhPJxVyM8l27hJP0QIDKsw9OQz0F2CEok4J4VqFVcvD191PyElZ8pHn1FtNv1K7u/ZM7SeuzaRng==
X-Received: by 2002:a05:600c:19c8:: with SMTP id
 u8mr6955120wmq.92.1643196959897; 
 Wed, 26 Jan 2022 03:35:59 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id n14sm11999188wri.75.2022.01.26.03.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 03:35:59 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/4] ASoC: codecs: wcd938x: fix incorrect used of portid
Date: Wed, 26 Jan 2022 11:35:46 +0000
Message-Id: <20220126113549.8853-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220126113549.8853-1-srinivas.kandagatla@linaro.org>
References: <20220126113549.8853-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
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

Mixer controls have the channel id in mixer->reg, which is not same
as port id. port id should be derived from chan_info array.
So fix this. Without this, its possible that we could corrupt
struct wcd938x_sdw_priv by accessing port_map array out of range
with channel id instead of port id.

Fixes: e8ba1e05bdc0 ("ASoC: codecs: wcd938x: add basic controls")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index eff200a07d9f..5994644c8702 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -1432,14 +1432,10 @@ static int wcd938x_sdw_connect_port(struct wcd938x_sdw_ch_info *ch_info,
 	return 0;
 }
 
-static int wcd938x_connect_port(struct wcd938x_sdw_priv *wcd, u8 ch_id, u8 enable)
+static int wcd938x_connect_port(struct wcd938x_sdw_priv *wcd, u8 port_num, u8 ch_id, u8 enable)
 {
-	u8 port_num;
-
-	port_num = wcd->ch_info[ch_id].port_num;
-
 	return wcd938x_sdw_connect_port(&wcd->ch_info[ch_id],
-					&wcd->port_config[port_num],
+					&wcd->port_config[port_num - 1],
 					enable);
 }
 
@@ -2593,6 +2589,7 @@ static int wcd938x_set_compander(struct snd_kcontrol *kcontrol,
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
 	struct wcd938x_sdw_priv *wcd;
 	int value = ucontrol->value.integer.value[0];
+	int portidx;
 	struct soc_mixer_control *mc;
 	bool hphr;
 
@@ -2606,10 +2603,12 @@ static int wcd938x_set_compander(struct snd_kcontrol *kcontrol,
 	else
 		wcd938x->comp1_enable = value;
 
+	portidx = wcd->ch_info[mc->reg].port_num;
+
 	if (value)
-		wcd938x_connect_port(wcd, mc->reg, true);
+		wcd938x_connect_port(wcd, portidx, mc->reg, true);
 	else
-		wcd938x_connect_port(wcd, mc->reg, false);
+		wcd938x_connect_port(wcd, portidx, mc->reg, false);
 
 	return 0;
 }
@@ -2882,9 +2881,11 @@ static int wcd938x_get_swr_port(struct snd_kcontrol *kcontrol,
 	struct wcd938x_sdw_priv *wcd;
 	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
 	int dai_id = mixer->shift;
-	int portidx = mixer->reg;
+	int portidx, ch_idx = mixer->reg;
+
 
 	wcd = wcd938x->sdw_priv[dai_id];
+	portidx = wcd->ch_info[ch_idx].port_num;
 
 	ucontrol->value.integer.value[0] = wcd->port_enable[portidx];
 
@@ -2899,12 +2900,14 @@ static int wcd938x_set_swr_port(struct snd_kcontrol *kcontrol,
 	struct wcd938x_sdw_priv *wcd;
 	struct soc_mixer_control *mixer =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	int portidx = mixer->reg;
+	int ch_idx = mixer->reg;
+	int portidx;
 	int dai_id = mixer->shift;
 	bool enable;
 
 	wcd = wcd938x->sdw_priv[dai_id];
 
+	portidx = wcd->ch_info[ch_idx].port_num;
 	if (ucontrol->value.integer.value[0])
 		enable = true;
 	else
@@ -2912,7 +2915,7 @@ static int wcd938x_set_swr_port(struct snd_kcontrol *kcontrol,
 
 	wcd->port_enable[portidx] = enable;
 
-	wcd938x_connect_port(wcd, portidx, enable);
+	wcd938x_connect_port(wcd, portidx, ch_idx, enable);
 
 	return 0;
 
-- 
2.21.0

