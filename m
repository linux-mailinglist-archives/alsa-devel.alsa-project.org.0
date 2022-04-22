Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B1F50B85F
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:22:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E2421FA;
	Fri, 22 Apr 2022 15:22:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E2421FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650633775;
	bh=pSgKuRNtUjdUrc7k3qU7YBSgmQqrwVDc/0bea0CkmFM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jSPnltqh7KvZJ5W0zDLoUJyO5lY/tutaNIZh6VQ5JV/41J/6Zq0RD1sIA675498Gk
	 yg1XJi8AN/2kKewZDWDyFCOct7T6aYAYCFqzRuMZ8qvGldmjLKAgzWjCItypstuZwk
	 c40cNCfPin5j1y79MR8INjuimPHO1ESgKVCLX/s4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15623F80134;
	Fri, 22 Apr 2022 15:21:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20ABCF80245; Fri, 22 Apr 2022 15:21:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF2E4F800D1
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 15:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF2E4F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="k7roInPu"
Received: by mail-oi1-x235.google.com with SMTP id r8so9010432oib.5
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 06:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7aCJ6t8SgZYdEwlnucEu+pZm8mQbtsAro1WNiwJ9vuI=;
 b=k7roInPus6pPDCGk1sxnqBwqBmNJE7n7TqbvjeMqY3e4uZOM/+wlK59D0KGnQ0CN2a
 Ium0N/POAmW/CE6RblanmIzSxi0liwCOOHsBzjbtXi3qTblwuOyvcc5W5l13wutaEODy
 Dysx1CKPl8GkMu6stsQ3gdeFv4bFhDAoWGxsPrt0hSxC90gmbvqAMqDho5bG3BVhtD5W
 zLlp3Z5K5IKeDl+7J1sZoyAyfGIHS2a12vmaRp4BeVIt24i6dBcJf8gqTEeNaWjjUT9S
 3YtuVBZzf0GfmTtHkFSnZ3YCEu1nNzs/nf7LWJMBZWt/6ipJvx5D8loD/Nmw+V3bfh+N
 ki4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7aCJ6t8SgZYdEwlnucEu+pZm8mQbtsAro1WNiwJ9vuI=;
 b=ba30vcua3x5dYFLqQCmqPbVV0vhiMiSCuCAUc0rCndw5KsL3DNcZ+jtfbu75Ey0dbf
 jFprmLkzmfBDfrXUINbEiXYY6knR2LhIGGdxgcnOpOf2EWEhqjN/0z9llwv+nIqdpiSJ
 WhcZV0ytUeAANRRcF46YcYNapRrmxG6/2WuhhRMFkFvzGRlN6ZTKYJM8E/8VNezb5PX2
 kwBk0aZ/njgugMi/V+C7VhD9evpIMvPZWPFlYwcdl7zKe1AAOZyeCMQRqMNGbp/WqeJV
 jnGb7Raw7TWF5My0qh5kZObFmkONJ92tdje3LNsxync5LESqEgrLFimvk1YtIbKT7NM7
 nlgA==
X-Gm-Message-State: AOAM531oZkkFP/r3/ASoPJIMNt5JW1+E4IgwDvF4Ypxv6EHWSziRinf9
 klYZMqQic2G9vYiyvXzz77A=
X-Google-Smtp-Source: ABdhPJyHWFJFL9c6RU3aU/InVBWhbPm2UefWzUz1pk+i/iyqp0erbjndOOUjGgCh5FtaIHxY5j8e4w==
X-Received: by 2002:a05:6808:1a13:b0:322:9a10:2ae8 with SMTP id
 bk19-20020a0568081a1300b003229a102ae8mr2172967oib.14.1650633706877; 
 Fri, 22 Apr 2022 06:21:46 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:9f29:454f:1c77:1b6b])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a4a3052000000b0035d16480acfsm777836ooz.39.2022.04.22.06.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 06:21:46 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH] ASoC: wm8524: remove constraint for FE-BE
Date: Fri, 22 Apr 2022 10:21:25 -0300
Message-Id: <20220422132125.1595729-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Fabio Estevam <festevam@denx.de>,
 patches@opensource.cirrus.com, shengjiu.wang@nxp.com,
 Viorel Suman <viorel.suman@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
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

From: Shengjiu Wang <shengjiu.wang@nxp.com>

The constraint is not needed for back end bistream since
the sample rate is fixed by dts and the constraint
is propagated to front end bistream as they share the same
snd_soc_pcm_runtime.

Fixes: 007b6a54c305 ("ASoC: codecs: add wm8524 codec driver")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Viorel Suman <viorel.suman@nxp.com>
Tested-by: Fabio Estevam <festevam@denx.de>
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 sound/soc/codecs/wm8524.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

(limited to 'sound/soc/codecs/wm8524.c')

diff --git a/sound/soc/codecs/wm8524.c b/sound/soc/codecs/wm8524.c
index 81f858f..442a598 100644
--- a/sound/soc/codecs/wm8524.c
+++ b/sound/soc/codecs/wm8524.c
@@ -61,6 +61,7 @@ static int wm8524_startup(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct wm8524_priv *wm8524 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 
 	/* The set of sample rates that can be supported depends on the
 	 * MCLK supplied to the CODEC - enforce this.
@@ -71,9 +72,10 @@ static int wm8524_startup(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
-				   SNDRV_PCM_HW_PARAM_RATE,
-				   &wm8524->rate_constraint);
+	if (!rtd->dai_link->be_hw_params_fixup)
+		snd_pcm_hw_constraint_list(substream->runtime, 0,
+					   SNDRV_PCM_HW_PARAM_RATE,
+					   &wm8524->rate_constraint);
 
 	gpiod_set_value_cansleep(wm8524->mute, 1);
 
-- 
cgit v1.1
