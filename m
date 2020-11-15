Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A645F2B34E7
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Nov 2020 13:22:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 263E71779;
	Sun, 15 Nov 2020 13:21:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 263E71779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605442968;
	bh=eieDwfifQyapgY87/LV4pAv6cvMw3lpnQp8OVJ2w+Ug=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lp4tWQ5N+Tuctq2VG7INw8+p3aV8MlRNegDmZea5Pde+sS2lnxYYuY987w3SmjGno
	 INdwmjen+k8Ug86b0g46V9YcAgblOkdho9Y6PTkXRryWEEHTPAQV6LzTjq0dQ8/z37
	 bHkCjSge6G2dqrCT6MVdrQPvCiMhLfGVbQOHOwHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 781BBF8029B;
	Sun, 15 Nov 2020 13:21:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FF4BF8025E; Sun, 15 Nov 2020 13:21:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from host.euro-space.net (host.euro-space.net [87.117.239.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB6B6F801F9
 for <alsa-devel@alsa-project.org>; Sun, 15 Nov 2020 13:21:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB6B6F801F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=birdec.com header.i=@birdec.com
 header.b="FafAszm2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=birdec.com; 
 s=default;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gHA57QLWRniebV0IVxN5zC7NkxqPuhNOMypv2sGN2S0=; b=FafAszm2y2xPMHGLoUXWHmjWNU
 q+JxowlSj/D2b91bnOiFi8AqDNjhxLuDwHN3hSH/nIr41AbN+tvFtzNHwtg4S4Ltcf1uIkwrkBrTb
 JNtIK72rk59nOXnB0R3eJL2lvEN+VrgaeITIWhlDHu7b4MsvEZqAfrtTFO6CopNDI1hAMc6xwZfH1
 h4g5cenWNeB9hDDnKkCYDSn7qNdRqex+DdvGDMjulqB9TiRB9byCpW8/mdEtuMT0GvBvwWcQEZdci
 DrEFNltseH4Wr59AC6fSRGGhV7jWhEoiPqXuuCpBYJY14NYXB8redD6LpKhCN1Apa0qiSIubg5sm7
 5eKOl7Tw==;
Received: from dynamic-078-054-118-130.78.54.pool.telefonica.de
 ([78.54.118.130]:55232 helo=gentoo0.localdomain)
 by host.euro-space.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <kmarinushkin@birdec.com>)
 id 1keH1j-000338-1T; Sun, 15 Nov 2020 12:21:03 +0000
From: Kirill Marinushkin <kmarinushkin@birdec.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH v3 1/4] ASoC: pcm512x: Fix not setting word length if
 DAIFMT_CBS_CFS
Date: Sun, 15 Nov 2020 13:23:03 +0100
Message-Id: <20201115122306.18164-2-kmarinushkin@birdec.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20201115122306.18164-1-kmarinushkin@birdec.com>
References: <20201115122306.18164-1-kmarinushkin@birdec.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - host.euro-space.net
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - birdec.com
X-Get-Message-Sender-Via: host.euro-space.net: authenticated_id:
 kmarinushkin@birdec.com
X-Authenticated-Sender: host.euro-space.net: kmarinushkin@birdec.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: Matthias Reichl <hias@horus.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.com>
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

In `pcm512x_hw_params()`, the following switch-case:

~~~~
	switch (pcm512x->fmt & SND_SOC_DAIFMT_MASTER_MASK) {
	case SND_SOC_DAIFMT_CBS_CFS:
~~~~

returns 0, which was preventing word length from being written into codecs
register.

Fixed by writing it into register before checking
`SND_SOC_DAIFMT_MASTER_MASK`.
Tested with Raspberry Pi + sound card `hifiberry_dacplus` in CBS_CFS format

Signed-off-by: Kirill Marinushkin <kmarinushkin@birdec.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Matthias Reichl <hias@horus.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
---
 sound/soc/codecs/pcm512x.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index 8153d3d01654..db3dc6a40feb 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -1195,6 +1195,13 @@ static int pcm512x_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
+	ret = regmap_update_bits(pcm512x->regmap, PCM512x_I2S_1,
+				 PCM512x_ALEN, alen);
+	if (ret != 0) {
+		dev_err(component->dev, "Failed to set frame size: %d\n", ret);
+		return ret;
+	}
+
 	switch (pcm512x->fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBS_CFS:
 		ret = regmap_update_bits(pcm512x->regmap,
@@ -1229,13 +1236,6 @@ static int pcm512x_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	ret = regmap_update_bits(pcm512x->regmap, PCM512x_I2S_1,
-				 PCM512x_ALEN, alen);
-	if (ret != 0) {
-		dev_err(component->dev, "Failed to set frame size: %d\n", ret);
-		return ret;
-	}
-
 	if (pcm512x->pll_out) {
 		ret = regmap_write(pcm512x->regmap, PCM512x_FLEX_A, 0x11);
 		if (ret != 0) {
-- 
2.13.6

