Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B0763DFFC
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Nov 2022 19:52:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 845E516E7;
	Wed, 30 Nov 2022 19:51:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 845E516E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669834361;
	bh=8Amv3BiRIQsJsuMKSJUB87S4sbytnWriFe8iKtcfyQY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jewtlmTYL4Oh2BLfkSMs3MNphEzZNLNA6wbXCdjN1k/NMqnp39qMmH1KXdv4mWaTL
	 /NtbK4CyFEu5DOh2gHUYgFRtu/G8Q44A2eT0GuJgGizQed+Sg0fQCbkncHeyf8qXMx
	 g8U5GzAYl1HNefNqY+hSwvflX8j/5Y1OE6vkspMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5155DF80558;
	Wed, 30 Nov 2022 19:51:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C2E6F800B6; Wed, 30 Nov 2022 19:51:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A33EFF800B6
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 19:50:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A33EFF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jLaZjh5e"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3FDF1B81C9F;
 Wed, 30 Nov 2022 18:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3515C4347C;
 Wed, 30 Nov 2022 18:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669834253;
 bh=8Amv3BiRIQsJsuMKSJUB87S4sbytnWriFe8iKtcfyQY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jLaZjh5eCUYh0b0ZToCLumJmUMQBkyHRF0gycvcMAdKAyvuMWbRcPUukscJZjS/xT
 kGjZN3L7/NvnBrNEKuM1RHGOxTferqXvrYvlmB2X837zM/kj5DcekUMC0RwNx2gcvT
 reKvNBu1WowJ11gAv0KVvWhqYwICgdjjqidFAvp0YnmYThT4v+7J5kj5xXEmAgo9R6
 1rKVMgcUrxZRISLhANJtm10z6RHVXiywcTpdXdv6b8FhMknq/AQexO8Pgbg+zCqJ44
 17tuD6QnjBKaUxSEClv62wX/m1sOk5aDoCnvFrZg1CYBp+/YFfmmfIB9jid9PaNU1S
 0+km9nbWlUGxA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Russell King <linux@armlinux.org.uk>
Subject: [PATCH v1 1/2] ASoC: hdmi-codec: Allow playback and capture to be
 disabled
Date: Wed, 30 Nov 2022 18:46:43 +0000
Message-Id: <20221130184644.464820-2-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221130184644.464820-1-broonie@kernel.org>
References: <20221130184644.464820-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2841; i=broonie@kernel.org;
 h=from:subject; bh=8Amv3BiRIQsJsuMKSJUB87S4sbytnWriFe8iKtcfyQY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjh6USRCj27LG4VK4AFBuBIpYwKB1RilyDcu0MDylK
 j0uFVtKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY4elEgAKCRAk1otyXVSH0C0ZB/
 4+u+qN1SxBo/UNM+zwkkwx34xgWF5H1siTs0CKcCDjQJvKdKqhMh+neU8MD+pPe//cbEJEBvnw1m6L
 OtoJHvSDm37VcAa1UWebxDcAV9Go1OK/ruLtFtDRdDY34AT1hoDxZp6NGBFz9PBF9mw1OOn6hAC7uS
 Xb/5aAhvtpeunV64mHi5omxbc+rqFnSREG+5S3lCGzhdDBmkOji7+IB+JKiegbKZhbuP0CReVp2AIr
 6PgE4UqRFHapZ3rRA0WBtcvuvvOJIL9LjCt1YKva+JCXfD/9LY/2mKj3xHDE6lR3Qp1rpRZ5kMuj7Z
 Ju48p5PUYtXqE1TsV9SuGnDkyY5gAj
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org
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

Currently the hdmi-codec driver always registers both playback and capture
capabilities but for most systems there's no actual capture capability,
usually HDMI is transmit only. Provide platform data which allows the users
to indicate what is supported so that we don't end up advertising things
to userspace that we can't actually support.

In order to avoid breaking existing users the flags in platform data are
a bit awkward and specify what should be disabled rather than doing the
perhaps more expected thing and defaulting to not supporting capture.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/hdmi-codec.h    |  4 ++++
 sound/soc/codecs/hdmi-codec.c | 30 +++++++++++++++++++++++++-----
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index 48ad33aba393..9b162ac1e08e 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -124,7 +124,11 @@ struct hdmi_codec_ops {
 struct hdmi_codec_pdata {
 	const struct hdmi_codec_ops *ops;
 	uint i2s:1;
+	uint no_i2s_playback:1;
+	uint no_i2s_capture:1;
 	uint spdif:1;
+	uint no_spdif_playback:1;
+	uint no_spdif_capture:1;
 	int max_i2s_channels;
 	void *data;
 };
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 0b1cdb2d6049..74cbbe16f9ae 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -816,12 +816,19 @@ static int hdmi_dai_probe(struct snd_soc_dai *dai)
 			.source = "RX",
 		},
 	};
-	int ret;
+	int ret, i;
 
 	dapm = snd_soc_component_get_dapm(dai->component);
-	ret = snd_soc_dapm_add_routes(dapm, route, 2);
-	if (ret)
-		return ret;
+
+	/* One of the directions might be omitted for unidirectional DAIs */
+	for (i = 0; i < ARRAY_SIZE(route); i++) {
+		if (!route[i].source || !route[i].sink)
+			continue;
+
+		ret = snd_soc_dapm_add_routes(dapm, &route[i], 1);
+		if (ret)
+			return ret;
+	}
 
 	daifmt = devm_kzalloc(dai->dev, sizeof(*daifmt), GFP_KERNEL);
 	if (!daifmt)
@@ -1009,11 +1016,24 @@ static int hdmi_codec_probe(struct platform_device *pdev)
 	if (hcd->i2s) {
 		daidrv[i] = hdmi_i2s_dai;
 		daidrv[i].playback.channels_max = hcd->max_i2s_channels;
+		if (hcd->no_i2s_playback)
+			memset(&daidrv[i].playback, 0,
+			       sizeof(daidrv[i].playback));
+		if (hcd->no_i2s_capture)
+			memset(&daidrv[i].capture, 0,
+			       sizeof(daidrv[i].capture));
 		i++;
 	}
 
-	if (hcd->spdif)
+	if (hcd->spdif) {
 		daidrv[i] = hdmi_spdif_dai;
+		if (hcd->no_spdif_playback)
+			memset(&daidrv[i].playback, 0,
+			       sizeof(daidrv[i].playback));
+		if (hcd->no_spdif_capture)
+			memset(&daidrv[i].capture, 0,
+			       sizeof(daidrv[i].capture));
+	}
 
 	dev_set_drvdata(dev, hcp);
 
-- 
2.30.2

