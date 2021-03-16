Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 878F833CCB6
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Mar 2021 05:49:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0868F192A;
	Tue, 16 Mar 2021 05:48:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0868F192A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615870181;
	bh=Q2HjsEhm+ixLPFJEM81Xmk2ifzUjObIk3WuVUkW8W8M=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J7tlSrRj4iwhNHTlymodgYvJH8s5mSk8TDfX6imq+4xCrpKFoVk1JNnCPWeqvTCfY
	 a7qJX0akccZJYyCxe0jw9aP2YqBNTJNwUY/NfYGd4Cr+9EmnBrAyNFelpBWpofSITj
	 2KL3ly98DUGFD0nOLMJi8YZmeCFys+XowfQxVUps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF6C4F80148;
	Tue, 16 Mar 2021 05:48:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40A7FF80163; Tue, 16 Mar 2021 05:48:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32F55F8013F
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 05:47:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32F55F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gPGFwJW5"
Received: by mail-wm1-x333.google.com with SMTP id
 124-20020a1c00820000b029010b871409cfso628612wma.4
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 21:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=bnPpVXaLscM27wTokrDJR9G2HI9GQPRS/ppbeiLkaZw=;
 b=gPGFwJW5AnV0dCmQgli5emrJ6OQL9FbXS4Kadwyk2UDn2O7XgmUkeSL2C6cFghZ1EB
 GLrBK8DJs1LNI/PpN9bSWNmqxsC3qanjxa+8EjUtvvMhCd1Aa2UxZWd0DFTUKkAup4sM
 chiLVIu+dCu1RtgXvCUGoV8RlAtFxx2lK8ndJhd7RLyEb+Q9I49uf3+fmPx7uqjwVnb5
 ARG+2DdrwXbXNukXIE3kitoGQwUJ73GkLsMjnLF3n/t7snnVrZOlSsOgZc/Gt0zqr0EK
 VkmhBdRwX7zT+/M0nABcWzpiA1B7jnWdyUjJnF2Mg129eEE43Sm/8rGtrthYJatkVroT
 m45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=bnPpVXaLscM27wTokrDJR9G2HI9GQPRS/ppbeiLkaZw=;
 b=RK8P4eRVYzhucH2ZXrzOgmD/8+CVgl21ko3UzMXjTCYusDDm91sPyphKh6jPf2CDKB
 7zLCSFy89oNjMoHX496XixPKSH/u7ElckxMPPPsrKQBAItmS5SM8ZRz43dA+Wd4RGQyh
 EwDq/qEKHiQZ3cqmTI1LaRuGdXNj5gr5htjYxi/8HCcju0juE6r5EnD5dcfWbyIoVOFn
 LbJKrEp495ZWoJMnZabyuwXg4HpZUMYKw8Wg7kH57Udyn1KL+LAVdh7St/Wu3CQhWqnV
 D7hlbzdqzJRg+ePzrxGuBkftBeWC2jX90vzwpp76KQFmljdys4+EGcNNC2gfwPnu2WW/
 nRlg==
X-Gm-Message-State: AOAM532VXkbv28+k51kikXcTYvCunYnxhrBLjbYRI/r3DnfmPobkY3gP
 AidrxtXsGj4hFZxHVaJRZintkT5wdH+r8SUh
X-Google-Smtp-Source: ABdhPJxawLqw/v4Hie6io2h+XeFMSLKKW8bTX7tbjjP0+AXdtdqMe9NlrWSN7RGbwLV6pZdYjUTwTg==
X-Received: by 2002:a7b:c096:: with SMTP id r22mr2677626wmh.102.1615870077775; 
 Mon, 15 Mar 2021 21:47:57 -0700 (PDT)
Received: from rum-mikhail-dt.world.mentorg.com (nat-rum.mentorg.com.
 [139.181.33.34])
 by smtp.gmail.com with ESMTPSA id m132sm1792477wmf.45.2021.03.15.21.47.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Mar 2021 21:47:57 -0700 (PDT)
From: mdurnev@gmail.com
X-Google-Original-From: mikhail_durnev@mentor.com
To: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, broonie@kernel.org, mdurnev@gmail.com,
 mikhail_durnev@mentor.com
Subject: [PATCH v0] ASoC: rsnd: core: Check convert rate in rsnd_hw_params
Date: Tue, 16 Mar 2021 14:47:35 +1000
Message-Id: <1615870055-13954-1-git-send-email-mikhail_durnev@mentor.com>
X-Mailer: git-send-email 2.7.4
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

From: Mikhail Durnev <mikhail_durnev@mentor.com>

snd_pcm_hw_params_set_rate_near can return incorrect sample rate in
some cases, e.g. when the backend output rate is set to some value higher
than 48000 Hz and the input rate is 8000 Hz. So passing the value returned
by snd_pcm_hw_params_set_rate_near to snd_pcm_hw_params will result in
"FSO/FSI ratio error" and playing no audio at all while the userland
is not properly notified about the issue.

If SRC is unable to convert the requested sample rate to the sample rate
the backend is using, then the requested sample rate should be adjusted in
rsnd_hw_params. The userland will be notified about that change in the
returned hw_params structure.

Signed-off-by: Mikhail Durnev <mikhail_durnev@mentor.com>
---
 sound/soc/sh/rcar/core.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 68 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index d1612d3..8696a99 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1424,8 +1424,75 @@ static int rsnd_hw_params(struct snd_soc_component *component,
 		}
 		if (io->converted_chan)
 			dev_dbg(dev, "convert channels = %d\n", io->converted_chan);
-		if (io->converted_rate)
+		if (io->converted_rate) {
+			/*
+			 * SRC supports convert rates from params_rate(hw_params)/k_down
+			 * to params_rate(hw_params)*k_up, where k_up is always 6, and
+			 * k_down depends on number of channels and SRC unit.
+			 * So all SRC units can upsample audio up to 6 times regardless
+			 * its number of channels. And all SRC units can downsample
+			 * 2 channel audio up to 6 times too.
+			 */
+			int k_up = 6;
+			int k_down = 6;
+			int channel;
+			struct rsnd_mod *src_mod = rsnd_io_to_mod_src(io);
+
 			dev_dbg(dev, "convert rate     = %d\n", io->converted_rate);
+
+			channel = io->converted_chan ? io->converted_chan :
+				  params_channels(hw_params);
+
+			switch (rsnd_mod_id(src_mod)) {
+			/*
+			 * SRC0 can downsample 4, 6 and 8 channel audio up to 4 times.
+			 * SRC1, SRC3 and SRC4 can downsample 4 channel audio
+			 * up to 4 times.
+			 * SRC1, SRC3 and SRC4 can downsample 6 and 8 channel audio
+			 * no more than twice.
+			 */
+			case 1:
+			case 3:
+			case 4:
+				if (channel > 4) {
+					k_down = 2;
+					break;
+				}
+				fallthrough;
+			case 0:
+				if (channel > 2)
+					k_down = 4;
+				break;
+
+			/* Other SRC units do not support more than 2 channels */
+			default:
+				if (channel > 2)
+					return -EINVAL;
+			}
+
+			if (params_rate(hw_params) > io->converted_rate * k_down) {
+				hw_param_interval(hw_params, SNDRV_PCM_HW_PARAM_RATE)->min =
+					io->converted_rate * k_down;
+				hw_param_interval(hw_params, SNDRV_PCM_HW_PARAM_RATE)->max =
+					io->converted_rate * k_down;
+				hw_params->cmask |= SNDRV_PCM_HW_PARAM_RATE;
+			} else if (params_rate(hw_params) * k_up < io->converted_rate) {
+				hw_param_interval(hw_params, SNDRV_PCM_HW_PARAM_RATE)->min =
+					(io->converted_rate + k_up - 1) / k_up;
+				hw_param_interval(hw_params, SNDRV_PCM_HW_PARAM_RATE)->max =
+					(io->converted_rate + k_up - 1) / k_up;
+				hw_params->cmask |= SNDRV_PCM_HW_PARAM_RATE;
+			}
+
+			/*
+			 * TBD: Max SRC input and output rates also depend on number
+			 * of channels and SRC unit:
+			 * SRC1, SRC3 and SRC4 do not support more than 128kHz
+			 * for 6 channel and 96kHz for 8 channel audio.
+			 * Perhaps this function should return EINVAL if the input or
+			 * the output rate exceeds the limitation.
+			 */
+		}
 	}
 
 	return rsnd_dai_call(hw_params, io, substream, hw_params);
-- 
2.7.4

