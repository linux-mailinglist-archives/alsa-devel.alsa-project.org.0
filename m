Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EAF35BE3A
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 10:57:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8763015F9;
	Mon, 12 Apr 2021 10:56:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8763015F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618217856;
	bh=WkaTW1C20k2shJoRhpuSBF0Gwi2dFK3SAcd21D52GGk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vdf5CEeSPyQ7qU4KH9G5EvD3LFCT37n8s/LiYzLER3XLnrab1sIEB60akC8/mJ8JY
	 wGbxJ2uG3eBbRZ713BnRSzizb1ckvAoc4ZGEf3zhucOyzyA03yIzdPiKHQes8zPm5M
	 Oj9p7dFosRdRgMGNjvMWoI0jEpOLrD66ZHFLdi2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCFF2F8025B;
	Mon, 12 Apr 2021 10:56:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C965FF80269; Mon, 12 Apr 2021 10:56:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A9C4F800FF
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 10:55:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A9C4F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="Vepq7YKZ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DADBF60241;
 Mon, 12 Apr 2021 08:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1618217750;
 bh=WkaTW1C20k2shJoRhpuSBF0Gwi2dFK3SAcd21D52GGk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vepq7YKZ/XZ+fVLDEGt/hujFMsjZiB8xy7Fux96OnBw+0rvkjBIl7diMVVkzYWXzM
 bd5azMkt60sTSroFNVVH5Tk7nkUEMWDXuc+EuKqtqlGp3fN+JLyxNojLN7LTXEoTTK
 HWqvvtEeIQCy6rCxRwg74NbUkf2oGArX5wMJ7REM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.10 130/188] ASoC: sunxi: sun4i-codec: fill ASoC card owner
Date: Mon, 12 Apr 2021 10:40:44 +0200
Message-Id: <20210412084017.966657384@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412084013.643370347@linuxfoundation.org>
References: <20210412084013.643370347@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Bastian Germann <bage@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
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

From: Bastian Germann <bage@linutronix.de>

[ Upstream commit 7c0d6e482062eb5c06ecccfab340abc523bdca00 ]

card->owner is a required property and since commit 81033c6b584b ("ALSA:
core: Warn on empty module") a warning is issued if it is empty. Add it.
This fixes following warning observed on Lamobo R1:

WARNING: CPU: 1 PID: 190 at sound/core/init.c:207 snd_card_new+0x430/0x480 [snd]
Modules linked in: sun4i_codec(E+) sun4i_backend(E+) snd_soc_core(E) ...
CPU: 1 PID: 190 Comm: systemd-udevd Tainted: G         C  E     5.10.0-1-armmp #1 Debian 5.10.4-1
Hardware name: Allwinner sun7i (A20) Family
Call trace:
 (snd_card_new [snd])
 (snd_soc_bind_card [snd_soc_core])
 (snd_soc_register_card [snd_soc_core])
 (sun4i_codec_probe [sun4i_codec])

Fixes: 45fb6b6f2aa3 ("ASoC: sunxi: add support for the on-chip codec on early Allwinner SoCs")
Related: commit 3c27ea23ffb4 ("ASoC: qcom: Set card->owner to avoid warnings")
Related: commit ec653df2a0cb ("drm/vc4/vc4_hdmi: fill ASoC card owner")
Cc: linux-arm-kernel@lists.infradead.org
Cc: alsa-devel@alsa-project.org
Signed-off-by: Bastian Germann <bage@linutronix.de>
Link: https://lore.kernel.org/r/20210331151843.30583-1-bage@linutronix.de
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sunxi/sun4i-codec.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 6c13cc84b3fb..2173991c13db 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1364,6 +1364,7 @@ static struct snd_soc_card *sun4i_codec_create_card(struct device *dev)
 		return ERR_PTR(-ENOMEM);
 
 	card->dev		= dev;
+	card->owner		= THIS_MODULE;
 	card->name		= "sun4i-codec";
 	card->dapm_widgets	= sun4i_codec_card_dapm_widgets;
 	card->num_dapm_widgets	= ARRAY_SIZE(sun4i_codec_card_dapm_widgets);
@@ -1396,6 +1397,7 @@ static struct snd_soc_card *sun6i_codec_create_card(struct device *dev)
 		return ERR_PTR(-ENOMEM);
 
 	card->dev		= dev;
+	card->owner		= THIS_MODULE;
 	card->name		= "A31 Audio Codec";
 	card->dapm_widgets	= sun6i_codec_card_dapm_widgets;
 	card->num_dapm_widgets	= ARRAY_SIZE(sun6i_codec_card_dapm_widgets);
@@ -1449,6 +1451,7 @@ static struct snd_soc_card *sun8i_a23_codec_create_card(struct device *dev)
 		return ERR_PTR(-ENOMEM);
 
 	card->dev		= dev;
+	card->owner		= THIS_MODULE;
 	card->name		= "A23 Audio Codec";
 	card->dapm_widgets	= sun6i_codec_card_dapm_widgets;
 	card->num_dapm_widgets	= ARRAY_SIZE(sun6i_codec_card_dapm_widgets);
@@ -1487,6 +1490,7 @@ static struct snd_soc_card *sun8i_h3_codec_create_card(struct device *dev)
 		return ERR_PTR(-ENOMEM);
 
 	card->dev		= dev;
+	card->owner		= THIS_MODULE;
 	card->name		= "H3 Audio Codec";
 	card->dapm_widgets	= sun6i_codec_card_dapm_widgets;
 	card->num_dapm_widgets	= ARRAY_SIZE(sun6i_codec_card_dapm_widgets);
@@ -1525,6 +1529,7 @@ static struct snd_soc_card *sun8i_v3s_codec_create_card(struct device *dev)
 		return ERR_PTR(-ENOMEM);
 
 	card->dev		= dev;
+	card->owner		= THIS_MODULE;
 	card->name		= "V3s Audio Codec";
 	card->dapm_widgets	= sun6i_codec_card_dapm_widgets;
 	card->num_dapm_widgets	= ARRAY_SIZE(sun6i_codec_card_dapm_widgets);
-- 
2.30.2



