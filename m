Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFFB906ECD
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 14:13:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C530E76;
	Thu, 13 Jun 2024 14:13:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C530E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718280836;
	bh=1yK9eI1MQbvCCxjWD8QAM9mmf5vjMBn5EqEjdIFsiv8=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Rph0TAMUrmj/ShHiK/PZZIIT5dXE2YVHSB9izeIVBNP8jLkHb83l7l6tcVyeJFBEe
	 PLJOt4troTVOy8m0oBrKP6NRFiHE/TBVxShEBjJPM35Zd0eSophnpJLOEE1tC0fqgs
	 1RdAmEHEMNLCq/Z09Q7C2KF0ja3nTeV4aPwZ6Vnw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92BBDF805C1; Thu, 13 Jun 2024 14:13:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7983F80587;
	Thu, 13 Jun 2024 14:13:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44271F8057A; Thu, 13 Jun 2024 14:13:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C837F80578
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 14:13:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C837F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=l2yHSERb
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a6f1da33826so146822066b.0
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Jun 2024 05:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718280797; x=1718885597;
 darn=alsa-project.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pXbNy8kHfEp0b79ontwosVP2eSf4cO0jv7KHuOVa8LI=;
        b=l2yHSERbEJc6B+sxEogKry+SZ+wIQoXHms8gvbTV8OeiyHvkeAgsqotrwC35UbnHoG
         QQLCjY1oR7eiJJ3MfeyJL9WETfKE0ey2O2VarE1iBeO+qwmxiF2/h4NTVDZJe2KjLauX
         WD5CPlktduINv3vElyJzowSxYmKN0ZfJpe+Y3FIeV81uDdX/sa45dJfhVk/ik+qtJwQB
         m+fRyNg5D6VpB89f0qshchMIueUjWWxiEJc6MzWNkFuvrhZMK0mc6DkyhkYnB4hdjxdE
         rJR00z/TbruWyvTu5KTVnfs7pOVgSjDlEr2TCJn938unsRx7LY7uoPuSjYyrZ6sEFvsU
         iiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718280797; x=1718885597;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXbNy8kHfEp0b79ontwosVP2eSf4cO0jv7KHuOVa8LI=;
        b=PBiFe6EprF/5eeGGbdc5bKmnoZxb6B/dypXNczImyaHcg1F1oCPIj722H3FmPoKZj3
         p9aP465hu7Vqxp+jtm3nmmz91AyF4+Z55adsSotOLCaKRwS14zLtUniRArPlw2B5ZC4R
         EjaRqeKrzhQDz+vJyiCjOHZkCh4mP0W6RtZl+Xvkfm33qDLF4LMWbHGi6BvNnkezhnax
         P8HZh209CFKDwPxqK4vPuETwtdla+kfXRzZEYCGXggxANJivG6O/rvRCh345oV6vp+Cd
         5XWBMJ2afiVY7kqu98wsrBtW2G0ng/bDKt+hI6bB0Qe2cj4tZ1JouhfqEQWtjarTkxGI
         ABkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/6dcYFKZ7tNaEwe3YN4J9l33Tk/InhKdZ/ci5wQUm835FaTR5lw3XNhUp5zeuSFS9y/y9ui3rZm8IEgI7/vAsMeeYxACkPWNpNMQ=
X-Gm-Message-State: AOJu0YxldkB59v1xlFJdqYBUHS2hHwLgauLuEM9ZNmQg3DRZ9hLZuWde
	3xi5bUJ38r7OYOPVXcvpbkIqhey1dw6aTPKTu70oz0H4jA15RfrIuwOybeNj5Ls=
X-Google-Smtp-Source: 
 AGHT+IFabj44+6/AUOqc3ytd5ytWDpFi1xvXmXHvZaxmZgT9uxNGhLzwBao1fjRJml9g9YwbWcn8Ew==
X-Received: by 2002:a17:906:fe0b:b0:a6f:4f26:fe80 with SMTP id
 a640c23a62f3a-a6f4f270012mr298512566b.41.1718280797113;
        Thu, 13 Jun 2024 05:13:17 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f985dfsm65535166b.192.2024.06.13.05.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 05:13:16 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 13 Jun 2024 13:13:05 +0100
Subject: [PATCH] ASoC: q6apm-lpass-dai: close graph on prepare errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-q6apm-fixes-v1-1-d88953675ab3@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFDiamYC/x3LQQ6DMAxE0asgr2uJBJrSXgWxMKkBL0ipjRAS4
 u4NXf4ZvQOMVdjgVRygvInJJ+VwtwLiRGlklHdu8KWvy+Aq/AZaZhxkZ8NAz9jUzd0/XAVZ9GS
 MvVKK02VmspX1Ohblv8hr253nD2nhM3d2AAAA
To: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: dmitry.baryshkov@linaro.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3465;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=1yK9eI1MQbvCCxjWD8QAM9mmf5vjMBn5EqEjdIFsiv8=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmauJbajWD5SFP302Qlyf+2BL5UONgysacwGM99
 PIDRaDoYVyJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmriWwAKCRB6of1ZxzRV
 N9MBB/0ZfAaWAL/u+zAa+VrxVkvWJ9/5N7h4ERWABTmonxDvhxOdcMDe1kqqMax9yr1KI5YZzJ0
 p9Vl1Q5YVVATNzkCPaKZpOlHVJ5Zo40dNt+9gtiegZaM4NHj9uCiAtdRxdCyvSBkUCnLJnFRraP
 yylqeBw8Yv2FPVHzHtfhx4yMj9pzLtcTp7AN1Hn3DHzF4xxe+omC1syBWtAAcr8MaxAehTLxscp
 5XwuHxd5Z+PcbxWHhTOw/0WmMrt7/Zqxzr1O2zzHbzdXTsczNUoWpgBSCpgWISQu2pEhthogUmz
 oGJRMEWpuh3RxZsuf51owwT6sOkHgrDgvKZ7CQvGYLZSUXLV
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: 6QB4RCGO3QJ3M4AF7NDWLRFJBGU7RTM7
X-Message-ID-Hash: 6QB4RCGO3QJ3M4AF7NDWLRFJBGU7RTM7
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6QB4RCGO3QJ3M4AF7NDWLRFJBGU7RTM7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is an issue around with error handling and graph management with
the exising code, none of the error paths close the graph, which result in
leaving the loaded graph in dsp, however the driver thinks otherwise.

This can have a nasty side effect specially when we try to load the same
graph to dsp, dsp returns error which leaves the board with no sound and
requires restart.

Fix this by properly closing the graph when we hit errors between
open and close.

Fixes: 30ad723b93ad ("ASoC: qdsp6: audioreach: add q6apm lpass dai support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 68a38f63a2db..66b911b49e3f 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -141,14 +141,17 @@ static void q6apm_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct
 	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
 	int rc;
 
-	if (!dai_data->is_port_started[dai->id])
-		return;
-	rc = q6apm_graph_stop(dai_data->graph[dai->id]);
-	if (rc < 0)
-		dev_err(dai->dev, "fail to close APM port (%d)\n", rc);
+	if (dai_data->is_port_started[dai->id]) {
+		rc = q6apm_graph_stop(dai_data->graph[dai->id]);
+		dai_data->is_port_started[dai->id] = false;
+		if (rc < 0)
+			dev_err(dai->dev, "fail to close APM port (%d)\n", rc);
+	}
 
-	q6apm_graph_close(dai_data->graph[dai->id]);
-	dai_data->is_port_started[dai->id] = false;
+	if (dai_data->graph[dai->id]) {
+		q6apm_graph_close(dai_data->graph[dai->id]);
+		dai_data->graph[dai->id] = NULL;
+	}
 }
 
 static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
@@ -163,8 +166,10 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 		q6apm_graph_stop(dai_data->graph[dai->id]);
 		dai_data->is_port_started[dai->id] = false;
 
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 			q6apm_graph_close(dai_data->graph[dai->id]);
+			dai_data->graph[dai->id] = NULL;
+		}
 	}
 
 	/**
@@ -183,26 +188,29 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 
 	cfg->direction = substream->stream;
 	rc = q6apm_graph_media_format_pcm(dai_data->graph[dai->id], cfg);
-
 	if (rc) {
 		dev_err(dai->dev, "Failed to set media format %d\n", rc);
-		return rc;
+		goto err;
 	}
 
 	rc = q6apm_graph_prepare(dai_data->graph[dai->id]);
 	if (rc) {
 		dev_err(dai->dev, "Failed to prepare Graph %d\n", rc);
-		return rc;
+		goto err;
 	}
 
 	rc = q6apm_graph_start(dai_data->graph[dai->id]);
 	if (rc < 0) {
 		dev_err(dai->dev, "fail to start APM port %x\n", dai->id);
-		return rc;
+		goto err;
 	}
 	dai_data->is_port_started[dai->id] = true;
 
 	return 0;
+err:
+	q6apm_graph_close(dai_data->graph[dai->id]);
+	dai_data->graph[dai->id] = NULL;
+	return rc;
 }
 
 static int q6apm_lpass_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)

---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240613-q6apm-fixes-6a9c84852713

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

