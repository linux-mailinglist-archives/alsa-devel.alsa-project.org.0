Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2C345314D
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 12:51:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9441616C7;
	Tue, 16 Nov 2021 12:50:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9441616C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637063486;
	bh=6vQsJTE2Ht1itaFxWoHH5VZflrytJUbmmb21DvQSsbE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hNFeDsFm+8CvkeblL0IMhszQ+hlUTc+xm2frg/ifTN2XHer7dbmR8NsN+/LZ9K4Ke
	 eMQg2OJilGMzTxwT19EaAiRRP/5Y5+jh4GQF9yOoyRlkrPuRhx36DI0uGsdVJVNDEj
	 57t9aMCydoGfmpHH5ZEiDGmhVfcZfVokBRk7KKk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A7EAF804BC;
	Tue, 16 Nov 2021 12:50:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3F89F800FA; Tue, 16 Nov 2021 12:50:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE796F800FA
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 12:50:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE796F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mF9iqJBh"
Received: by mail-wm1-x331.google.com with SMTP id
 az33-20020a05600c602100b00333472fef04so1693826wmb.5
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 03:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YqhuwHNxm7z2yboLK3WpqR4Y4LFQ6CPMaK61Ve4wq0Q=;
 b=mF9iqJBhZ2+3lU2ljVFIGxW5v67PqTcMT1NPsEPuzx+T+tVzPW+0bMY0aLGohljptU
 vumHlIWSTf+mfM4PqPkPw0OqR0eiDX1QkNq+3m/H876Lq02kYDBGkv/wes857sTBPUHV
 rwmoWbRIKavv6HL3G+5baCUBoe8Cz8dI26KI/fesHGvI522NS6Bg2Bd8vc77btoqiRTd
 +gix7ZDVmwqqjDPYYdDr/yTEOM0Ar76SpT/O6uS5ijx6Mo0wz8pOBHD1d+UVk5FZvJz8
 I/1C2GeqTtHpkLPuOQ2MReZ5c3wyC/Fj/VQVitIb1WFMEe4c4wKpkvpJvOwCC+5F467W
 ZHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YqhuwHNxm7z2yboLK3WpqR4Y4LFQ6CPMaK61Ve4wq0Q=;
 b=LnGG9I3e5WQUdmd9/Cf/y45zeEl3aGM4hS5cdMLCB+TTewXd+xaKf5CBT2HS3iG1IZ
 XvSjSdJnEt2sYjMHBPy0bHBxEWrNcz/dHPe3zo2piwWn+GWRrh1Dg+lthvIJJtOBv+GX
 0Yyoq8KByMqNejh4csjLJpaBdB9VPVl0jhs0J715l8ZJKLqoJJRLFbEc4Oxc/8JgGZvG
 Cl5tvuY4pgUvQ6/cvXufZfLa8wPNgYoJ+Tfz9XRV1h/wtrcnekNlhwdUtkD+AA/SilGB
 Z0kdYqQyN2HlTzxLpWWCXj1si5cnncZt/6ktwUweUVWmAjVqrQKCDJ7jZqkdIucCy8Ly
 a1Mg==
X-Gm-Message-State: AOAM531UjQL4iJjT/3Xqnl7e5dbjB/ND5romJTlSEumozhZ++/QJGsh1
 2Pz/jDq3a5vOwBQFRYa7yIm4iQ==
X-Google-Smtp-Source: ABdhPJzRU3oGNEgu0PJAQbnwa1+iKoPx4e3I0NVt+Ubpw7Kci1Y/sVALjqisSHRLYFLECOde+K/dMg==
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr68795075wmg.87.1637063425752; 
 Tue, 16 Nov 2021 03:50:25 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id t127sm2351065wma.9.2021.11.16.03.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 03:50:24 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: qcom: sdm845: only setup slim ports once
Date: Tue, 16 Nov 2021 11:50:21 +0000
Message-Id: <20211116115021.14213-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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

Currently same slim channel map setup for every dai link, which is redundant.
Fix this by adding a flag and conditionally setting these channel maps.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/sdm845.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 0adfc5708949..a1d5d96744b5 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -33,6 +33,7 @@
 struct sdm845_snd_data {
 	struct snd_soc_jack jack;
 	bool jack_setup;
+	bool slim_port_setup;
 	bool stream_prepared[AFE_PORT_MAX];
 	struct snd_soc_card *card;
 	uint32_t pri_mi2s_clk_count;
@@ -224,6 +225,7 @@ static int sdm845_dai_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct sdm845_snd_data *pdata = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai_link *link = rtd->dai_link;
 	struct snd_jack *jack;
 	/*
 	 * Codec SLIMBUS configuration
@@ -276,6 +278,10 @@ static int sdm845_dai_init(struct snd_soc_pcm_runtime *rtd)
 		}
 		break;
 	case SLIMBUS_0_RX...SLIMBUS_6_TX:
+		/* setting up wcd multiple times for slim port is redundant */
+		if (pdata->slim_port_setup || !link->no_pcm)
+			return 0;
+
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
 			rval = snd_soc_dai_set_channel_map(codec_dai,
 							  ARRAY_SIZE(tx_ch),
@@ -295,8 +301,10 @@ static int sdm845_dai_init(struct snd_soc_pcm_runtime *rtd)
 				dev_warn(card->dev, "Failed to set jack: %d\n", rval);
 				return rval;
 			}
-
 		}
+
+		pdata->slim_port_setup = true;
+
 		break;
 	default:
 		break;
-- 
2.21.0

