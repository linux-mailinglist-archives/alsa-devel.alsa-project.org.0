Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B3448F2CC
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jan 2022 00:04:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 008331F1C;
	Sat, 15 Jan 2022 00:03:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 008331F1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642201485;
	bh=aytbo4bgMM3OvPlirR4k/cyjksjenBzFJjK3XZAf7Us=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=APpy8vR/bJ5/Lrd7sndveLH7NjRaK4Oh/KIwIsE/ZlwfO7+kcf51AlRoeTT7levTv
	 T0W50i7GI3LS/728tV2BP7sSpUQRJOJniz/TVCN4euU+3r1nF8WuCypz8zyuuEpa2i
	 JvptveUOaJEuJZ/kIJGn7T2sJgF9m9Pqwt8BRRCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2873F80515;
	Sat, 15 Jan 2022 00:02:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27311F80511; Sat, 15 Jan 2022 00:02:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F51CF8049C
 for <alsa-devel@alsa-project.org>; Sat, 15 Jan 2022 00:02:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F51CF8049C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="VoKx/O+R"
Received: by mail-pg1-x52e.google.com with SMTP id i8so3901884pgt.13
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 15:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K2v+tf3/coBADjHlh/X456ouYdTDi9mxyKcdvb4sAww=;
 b=VoKx/O+RdQ97dNYCMkBu/pvrz+/Fne9QTD5/ufOzQc2tIbl2VwuKirYICxRUmOaxU7
 bzMP9wvZcj0rii2XVRaGz2CB77+ByOkbDWFdmqSt03chP8478o1isqsZ72dK5ERh1qCg
 ZD1l5mA8b+oYH1T/dEcNRmhZAhXZfQvq12+jI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K2v+tf3/coBADjHlh/X456ouYdTDi9mxyKcdvb4sAww=;
 b=57XGX/47ga5KwaE59FevgGaU7HuLhh055DH3ReXXdmwyk0GHD+LKoJ4bjtuTcxTXZV
 sHu9MnpBgEuCuaApMHFDb/arRD/gN2XXjytZZ3kJ5xP4E+xtM6xMobiYGlrSx3f0SXwY
 tdGwQ6HrZZ1PP8LUdw7GO/+fIkTjZqBWCX/mp1Pe3b/TOLikhJ23cPnGZabFR9eOFhdt
 Mkmq4p3JrZv1klh1dXHLvFHljoX4UCWJxCahAGf1F+cAj6PkgFY2y8MHn2qU1u3BQVCu
 Artm0rfwxf75JKkfYAfnEZy10f8tqDWB2mPYRfhaeIKnDElKXmdNwrvoPGQKYpOc7eOE
 cknQ==
X-Gm-Message-State: AOAM531QakP5xuMnkBPInd8as7sCyNNupawvLdvIxr2H8G4ZrxDw+nKX
 Uf9iWl2/zK35vkYZLYh2J30afg==
X-Google-Smtp-Source: ABdhPJyJxad9FH/It6rpaHOKDPCSlkdbKW/X7HtmB2tbRUwLIpcP+QTk8BQyjl2RIOc9OttHVlG6qw==
X-Received: by 2002:a05:6a00:1413:b0:4bf:a0d7:1f55 with SMTP id
 l19-20020a056a00141300b004bfa0d71f55mr10925475pfu.13.1642201353019; 
 Fri, 14 Jan 2022 15:02:33 -0800 (PST)
Received: from localhost ([2620:15c:202:201:76ab:ede1:503d:1c39])
 by smtp.gmail.com with UTF8SMTPSA id l27sm5307598pgb.0.2022.01.14.15.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 15:02:32 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 3/3] ASoC: rk3399_gru_sound: Wire up DP jack detection
Date: Fri, 14 Jan 2022 15:02:09 -0800
Message-Id: <20220114150129.v2.3.I3c79b1466c14b02980071221e5b99283cd26ec77@changeid>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114230209.4091727-1-briannorris@chromium.org>
References: <20220114230209.4091727-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lin Huang <hl@rock-chips.com>, Brian Norris <briannorris@chromium.org>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
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

Now that the cdn-dp driver supports plug-change callbacks, let's wire it
up.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

(no changes since v1)

 sound/soc/rockchip/rk3399_gru_sound.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
index e2d52d8d0ff9..eeef3ed70037 100644
--- a/sound/soc/rockchip/rk3399_gru_sound.c
+++ b/sound/soc/rockchip/rk3399_gru_sound.c
@@ -164,6 +164,25 @@ static int rockchip_sound_da7219_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static struct snd_soc_jack cdn_dp_card_jack;
+
+static int rockchip_sound_cdndp_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	/* Enable jack detection. */
+	ret = snd_soc_card_jack_new(card, "DP Jack", SND_JACK_LINEOUT,
+				    &cdn_dp_card_jack, NULL, 0);
+	if (ret) {
+		dev_err(card->dev, "Can't create DP Jack %d\n", ret);
+		return ret;
+	}
+
+	return snd_soc_component_set_jack(component, &cdn_dp_card_jack, NULL);
+}
+
 static int rockchip_sound_da7219_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
@@ -315,6 +334,7 @@ static const struct snd_soc_dai_link rockchip_dais[] = {
 	[DAILINK_CDNDP] = {
 		.name = "DP",
 		.stream_name = "DP PCM",
+		.init = rockchip_sound_cdndp_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
 		SND_SOC_DAILINK_REG(cdndp),
-- 
2.34.1.703.g22d0c6ccf7-goog

