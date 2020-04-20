Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F261B0800
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 13:48:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EB9B1676;
	Mon, 20 Apr 2020 13:47:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EB9B1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587383287;
	bh=X9wiZ2+KyP2lyYptE1yNTeVRG9Ea8yXyjko0usqZzj0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gKDznErEBC/f0R7Hk6hQgChaXaLozvtsvUsmMgS7UoSDlYHPqTOdek2M53ynLy0ct
	 xvcxJWebXWQ0WVJlKLEX/1/fgCY+h/VBmqQtfyId6AyCm4TLtjXa0xCJDVcm/MuujT
	 9BbG/Yq/KuitsIwYFMtpM5ulWppLppN1T6gf4EaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AD3FF8028C;
	Mon, 20 Apr 2020 13:45:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85446F8025E; Mon, 20 Apr 2020 13:45:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99A39F800C8
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 13:45:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99A39F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="1SIVE6W4"
Received: by mail-wm1-x343.google.com with SMTP id h2so10634291wmb.4
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 04:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Eo7z/bW/75JbK01dAXq1seEbWg98VkTUnan0t5hkQw=;
 b=1SIVE6W4mcJTTZWKBGYOHiT3uHXcmVOkHZQEgxjGTgee8IoV3FNLpqrFJnZH923Fbc
 O39HPbopLAKYTRR45NG3vTPnxj5NHjj8qR2uA+BkBQj7XtBehqKHLrfwwLN7f+/st2WD
 fbmTHYA24mggSSRuPIZwNruyXT4eWW+uMBp2QCLJ05Ap7oFG8pcGGCEZ1duH0RK3cDr7
 UTuoV9A8YjhkemvD0Ex9zHzyjnoM5DW9pegWP7m3SOic/0r97TfutOjBBdrHU1zi/cyk
 nyebTDYjUvVUl/iTOyJ0Fcg+K7pnhJpb/4JoVs+q0Cg4QXq/DEhIl6IVNC1z2LV3HU84
 E4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Eo7z/bW/75JbK01dAXq1seEbWg98VkTUnan0t5hkQw=;
 b=ZOzwl+J1Li0VTLBAE4xvsQKgmLqFlNosBZR65U8PSptKRQZ9KF4RKNrkP+419LTmo+
 3wkxEYPOmRwrlrXNojSwtYwk8scpFYzmOELl2+vyvkUDRkYbz8OS3CY8Ox89LTi/PGV9
 nyKKA0Xa834o6en4oY/DeZktsFeifUmNBDhCZihCH1VC8KiOJJbZkKhzccXSjDk2gjoO
 Dppovcpk4JPQJ71cJz/0AU9k2k9OYnjM2GirS8n259NCGWJFO3qK/c/LZBqdNpEtxsJ6
 SxNAXpnZNTafsd64wPKUgmnf2Dcg8AMk9zDyOZ92FMUuC2/g2v91Njm8d0npgZoHCyJR
 fqLA==
X-Gm-Message-State: AGi0PubeBSiQlE9ZP5pOEmvqFWOJC4EwfWQNHwbIOujvOFfcmJ9+5soG
 slFRfXNhSMkI3wxhj81CZv70GbRQzfg=
X-Google-Smtp-Source: APiQypIXImpuNN70wYFRkSp5hlI7aYph/2B0xZyzWhfHsi7Idg5iyDUi1yNEDGrbmDiFOIN9oJI1fQ==
X-Received: by 2002:a05:600c:29c2:: with SMTP id
 s2mr17145704wmd.111.1587383117186; 
 Mon, 20 Apr 2020 04:45:17 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id k6sm1079182wma.19.2020.04.20.04.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 04:45:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 1/2] ASoC: meson: axg-card: fix codec-to-codec link setup
Date: Mon, 20 Apr 2020 13:45:10 +0200
Message-Id: <20200420114511.450560-2-jbrunet@baylibre.com>
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
links fail to init and Oops:

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

While initiliazing the links, ASoC treats the codec-to-codec links of this
card type as a DPCM backend. This error eventually leads to the Oops.

Most of the card driver code is shared between DPCM backends and
codec-to-codec links. The property "no_pcm" marking DCPM BE was left set on
codec-to-codec links, leading to this problem. This commit fixes that.

Fixes: 0a8f1117a680 ("ASoC: meson: axg-card: add basic codec-to-codec link support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-card.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index af46845f4ef2..89f7f64747cd 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -338,8 +338,10 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 
 	if (axg_card_cpu_is_tdm_iface(dai_link->cpus->of_node))
 		ret = axg_card_parse_tdm(card, np, index);
-	else if (axg_card_cpu_is_codec(dai_link->cpus->of_node))
+	else if (axg_card_cpu_is_codec(dai_link->cpus->of_node)) {
 		dai_link->params = &codec_params;
+		dai_link->no_pcm = 0; /* link is not a DPCM BE */
+	}
 
 	return ret;
 }
-- 
2.25.2

