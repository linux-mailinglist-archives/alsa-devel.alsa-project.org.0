Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E861B07FD
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 13:47:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 667571687;
	Mon, 20 Apr 2020 13:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 667571687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587383272;
	bh=1bNepT7XTcOm4PrRft/orNjym/cwBbL4f7l1CcDOwuw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eZhqooJq1+07FUo04dSl9GXLDymFc4VfevRibWNY5iKPMO0uoJTgafmvR/EZQ9R9k
	 A17I73U5FKw827D08URwa99TDHHb1aazn0LZGJH9U/gLtJvmAMafcXCe0ZXyqrUVWB
	 0fMzrdGPLoWLa8t+gsJRc9OFpKLOQmvYZJpSO+OA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E14BF8013E;
	Mon, 20 Apr 2020 13:45:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 529E9F80276; Mon, 20 Apr 2020 13:45:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52998F8013E
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 13:45:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52998F8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="H63+etA+"
Received: by mail-wr1-x441.google.com with SMTP id f13so11708455wrm.13
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 04:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ncP3J/qEg/xypRpjtJqFD+RT7/yjhZOFPm/IKzFyAyk=;
 b=H63+etA+aBJlMVl9xXpa86QHXb9a5dX32vkn2AEsYOB2Lr39BmuXB9GZNtuMJLMEio
 F53gZCaOUDJ9+0KKUFKultag1E9Pa9jDIFNz1e7t1UJu3JLjq24zZripnzQjBRDGmSF9
 Tz5s/Ougfco1mti4PclNrUptOOMomFy+9D52yQI+aAlnCNA9VO9iMMbcShgbNWy1jH1w
 tvb5CpgD4H2+MLjYLlhSdpDX/DFYnzbVpndTRT5ipifwYaB9crfOlT8QUByVkQ1STmqu
 /FbzVWAhCaKUXnZCaJUQml4fQ8rRIY8Rzlc1Ky/A3LuYEKp8jS16VQjRt+cIcgZ3obsq
 HyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ncP3J/qEg/xypRpjtJqFD+RT7/yjhZOFPm/IKzFyAyk=;
 b=XzAM7CE5HN10Kl9ffz83e5dxDNUkvtw+O7F6mUYy4U6ppATk4YofcVM/qSjdkLSqY0
 53LXHr2B2nTuUd4yttFGDRGf+PawoMMDqr54TfMTub6nlBDVZxUpXv/YztRjFGgvfG86
 XtksUY7Osp9SNmgoCYEQfIdVtH9xgRW9NNGkPkFmWFJ8r6aQ8xj4+3dHxBRkcTZpNdd8
 iUaa5PzHvsqluYnEQwA6GAqaguoXZPSRZGvcYp8MUq8pIoRfesvUlz5Xt54c30KjTdGI
 nm+0BviXT2IpnfNjpHo4W2mJ9V4TlNb/Y/ArIcS4RnOGI5Xw0nDL1PidKcNpimz6X2bR
 mGtQ==
X-Gm-Message-State: AGi0PuZ2cpkFGGHlaSaQOSnCsW14vppsMfUeZng9AtpDfHKPk3y+N6ck
 lH2nwNeYts9Q6jKz3kGZ7j8uaQ==
X-Google-Smtp-Source: APiQypJtZQCS5Jcc+6Wrcet51tOZw+iTZukm4wlAyWIuiJnqxjolLoYFCVIQCmLUUeNj3EDTq5gHsg==
X-Received: by 2002:adf:bb0d:: with SMTP id r13mr19633300wrg.251.1587383118410; 
 Mon, 20 Apr 2020 04:45:18 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id k6sm1079182wma.19.2020.04.20.04.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 04:45:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 2/2] ASoC: meson: gx-card: fix codec-to-codec link setup
Date: Mon, 20 Apr 2020 13:45:11 +0200
Message-Id: <20200420114511.450560-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200420114511.450560-1-jbrunet@baylibre.com>
References: <20200420114511.450560-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
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

Since the addition of commit 9b5db059366a ("ASoC: soc-pcm: dpcm: Only allow
playback/capture if supported"), meson-axg cards which have codec-to-codec
links fail to init and Oops.

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000128
  Internal error: Oops: 96000044 [#1] PREEMPT SMP
  CPU: 3 PID: 1582 Comm: arecord Not tainted 5.7.0-rc1
  pc : invalidate_paths_ep+0x30/0xe0
  lr : snd_soc_dapm_dai_get_connected_widgets+0x170/0x1a8
  Call trace:
   invalidate_paths_ep+0x30/0xe0
   snd_soc_dapm_dai_get_connected_widgets+0x170/0x1a8
   dpcm_path_get+0x38/0xd0
   dpcm_fe_dai_open+0x70/0x920
   snd_pcm_open_substream+0x564/0x840
   snd_pcm_open+0xfc/0x228
   snd_pcm_capture_open+0x4c/0x78
   snd_open+0xac/0x1a8
   ...

While this error was initially reported the axg-card type, it also applies
to the gx-card type.

While initiliazing the links, ASoC treats the codec-to-codec links of this
card type as a DPCM backend. This error eventually leads to the Oops.

Most of the card driver code is shared between DPCM backends and
codec-to-codec links. The property "no_pcm" marking DCPM BE was left set on
codec-to-codec links, leading to this problem. This commit fixes that.

Fixes: e37a0c313a0f ("ASoC: meson: gx: add sound card support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/gx-card.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index 7b01dcb73e5e..4abf7efb7eac 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -108,8 +108,10 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 		ret = gx_card_parse_i2s(card, np, index);
 
 	/* Or apply codec to codec params if necessary */
-	else if (gx_card_cpu_identify(dai_link->cpus, "CODEC CTRL"))
+	else if (gx_card_cpu_identify(dai_link->cpus, "CODEC CTRL")) {
 		dai_link->params = &codec_params;
+		dai_link->no_pcm = 0; /* link is not a DPCM BE */
+	}
 
 	return ret;
 }
-- 
2.25.2

