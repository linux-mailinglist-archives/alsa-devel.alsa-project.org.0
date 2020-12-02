Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D1D2CFA75
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Dec 2020 09:06:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E585918F6;
	Sat,  5 Dec 2020 09:05:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E585918F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607155609;
	bh=GwEZCh0YK/C/BUnPFUV47guQJiQ/KK28GkXWrSSoEko=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CQadoLXwvaOhbYRxI2NO5zV6HSOaHPjQoQSFWEPmHQfRAmEa0NRYItFDgxYIZZskt
	 I3v5QaXiHZ3bLKshjwlRwQI3mWNs8e52cbIvemRWwOgxTwztbQFF4sudCPZWIFl8kX
	 GZiNFvTnWl7ivBQ1Fxnz9Df8U3Ify/snA4UauBHM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C0FDF804E3;
	Sat,  5 Dec 2020 09:03:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C4D4F80158; Wed,  2 Dec 2020 12:09:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B014F80158
 for <alsa-devel@alsa-project.org>; Wed,  2 Dec 2020 12:08:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B014F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oe+cFmFN"
Received: by mail-wr1-x443.google.com with SMTP id u12so3387693wrt.0
 for <alsa-devel@alsa-project.org>; Wed, 02 Dec 2020 03:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=AhN8VnnxsPwYIhG0xpPOPolapNC7nTNchT/tIDEYUxQ=;
 b=oe+cFmFNydVXspmjL1nXuukXUFbWFk0kDJNytpICL0M6T+gAzaI4DuJlFoDWwXODVL
 QrcNL4KbvS0WqFr6QM+1RN0vNxYV7Lmx6x2DGHIgIaJN5n72mmaSGyUbImWJ26iJH92u
 jzqYefHOyH59dqoSgm3SkvqhAtE6+GMOMjudFbmH+9bhAkU/frY857t2ndcefEXxmS71
 BQ/ASrlpd2p5o6J34FsL3PjYGQgHLXwv4YCbH/BsK81ioehv9/XhvBOXh4orsRaOIXxk
 ycWwuSme05XYQqgQfD1k3rpjujTLsS7JSkftAgbwu9fh8/YQt4u0eYfzgi1OVTedpSoP
 LgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=AhN8VnnxsPwYIhG0xpPOPolapNC7nTNchT/tIDEYUxQ=;
 b=Lm9J5oL1sTEyn1veeEvWpNPoicc1IwuyNq/MsJSB3tLL2ArhM/+Nb+RnwutWq4ZY2U
 jC7CFP6A80fJclZJ02tUnV/jINCqvvVw3SpBfsdzXupXxJMijJpKM867WtLtyFetkyLN
 QSHWtszrDYf72HJsYiEJisjxDTp66yjIK2cGZwW1gZmt5qao9Lh56/046CAYJE99szLs
 2d1xqjjT+oq+iR/9K5QubwD1Qsco3syTAn+bSD4o8dmheEAnutKfp4PmMXQbhQAmR8Lc
 30VlNQbtEugil56ICXOhcxytdooMfXDnEsIIPmtcwXkQyx5tnC+TLBMvcBbWlY4eE30S
 zSCw==
X-Gm-Message-State: AOAM530+vOml7Uspl7CMlrdUcXk8KDbLXPH3Dkn04GhnvG1JSmEw8AlC
 aMg7OeEaigPS/ufTNwG28Aw=
X-Google-Smtp-Source: ABdhPJzpyOSGbx+vWZ8DCFxAOkX0Ba9skJHgohXvL+KIseVKFJdLFXD7kdwaxe723gihUJtGewXjCA==
X-Received: by 2002:a5d:69d1:: with SMTP id s17mr2813008wrw.104.1606907330456; 
 Wed, 02 Dec 2020 03:08:50 -0800 (PST)
Received: from rum-mikhail-dt.world.mentorg.com (nat-rum.mentorg.com.
 [139.181.33.34])
 by smtp.gmail.com with ESMTPSA id 35sm1639225wro.71.2020.12.02.03.08.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Dec 2020 03:08:49 -0800 (PST)
From: mdurnev@gmail.com
X-Google-Original-From: mikhail_durnev@mentor.com
To: kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v0] ASoC: rsnd: core: Check convert rate in rsnd_hw_params
Date: Wed,  2 Dec 2020 21:08:06 +1000
Message-Id: <1606907286-32104-1-git-send-email-mikhail_durnev@mentor.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Sat, 05 Dec 2020 09:03:14 +0100
Cc: mikhail_durnev@mentor.com
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
 sound/soc/sh/rcar/core.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 6e670b3..8ca3fb7 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1428,8 +1428,73 @@ static int rsnd_hw_params(struct snd_soc_component *component,
 		}
 		if (io->converted_chan)
 			dev_dbg(dev, "convert channels = %d\n", io->converted_chan);
-		if (io->converted_rate)
+		if (io->converted_rate) {
 			dev_dbg(dev, "convert rate     = %d\n", io->converted_rate);
+
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
+			channel = io->converted_chan ? io->converted_chan : fe_channel;
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

