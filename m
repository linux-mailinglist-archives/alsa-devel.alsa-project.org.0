Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 251F91888D1
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 16:15:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8713C17EB;
	Tue, 17 Mar 2020 16:14:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8713C17EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584458126;
	bh=k5m11VeUGGV5JiGvFWUWuaQdMGchkrx1R9+nugyltg8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W/VD3o3iuZH6QqoMh2r/fmqjg3M6s+qN4KO5/emC4ny7U/LS5LUDuVUR3P2h34COs
	 iMMoWC3mQ7q3abgud64aWZSBW8FY5ejPN6mSdT4KIK9Tr4yapxrnyRLUMzbg9/A8ED
	 h/z8o5SUpm44uV85LxqriN7I+K9uZuQqQODY7WLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B842F80254;
	Tue, 17 Mar 2020 16:13:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BCD2F80232; Tue, 17 Mar 2020 16:12:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 572E1F800C0
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 16:12:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 572E1F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="h+nS41fF"
Received: by mail-wm1-x343.google.com with SMTP id f7so22418929wml.4
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 08:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=To+ZBrVO7etOV/SjBRId9Z6wmLhx8Z2t4f3TOlZx1jE=;
 b=h+nS41fFI/j+hpYD0FJ9Cffsw1aWAfZSbfSVYU2TvNSeoAWY098CmiFLLRoqfKfMXB
 0bIhtn+MEZO2FygfvnzyGful+JsMHWK1rtGczPo/tpVUNY77WbOMNdELQlyMTkYGqgGo
 xBPUP80QF92zGW87sPiOS8z3Mx4tlf5MFGkJuYUYAuRJ1yzSasfMAwc4zS9J316hOqEA
 X4yipCiYmQcoWK7T1qUSQGLEUUHRrxrK98MNJKnmjo8XW47PVCHo1Q0d06ids/Q2plLq
 BUz3sm0a9a6AW5UQglkxr4f0ZE14ax9X9cCDt7jNwkoFeRTYcvg9BAmcG4QtvNi/dXs1
 KtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=To+ZBrVO7etOV/SjBRId9Z6wmLhx8Z2t4f3TOlZx1jE=;
 b=FjgZLMd35Qf1Scv3WJLB9fqE5qceXir4Cvt7tZL8xPhtq3TR4egQAUaEbBejttm9zP
 mH2EXgbMLKWzbGyFSu/sHeVs+81dmKGwmXBeZHXQghL0OFoLTvdH5QrKmb05HPk9uSfq
 7kZDs8If14mqpLv0aKqv9Re1GKKMiFZivlwqdKNyZ8rK+gqbNIvwhUT0ZWUu6tD1MvZZ
 havf5UxWiDUwkzENBQ1GAAoTgQ/qC6mxdmEO3Dd+YO8bFSSQOZZvRdSSbNL/8x4yjlx1
 /gbMA1UGiJ7NvWuk2T2bfdAXcAgZwkMOGlw0lryM5AX+QxXKdxp6dDWXpdYk6GyeIZOc
 i2ig==
X-Gm-Message-State: ANhLgQ0hqmB6LsVULn6Ux/Qz6HnESnRlEvqKqVuQEI4HKJ92lAkXbCdF
 WuAYcy6t7lMQwaO0CgpBd/qNVQ==
X-Google-Smtp-Source: ADFU+vtPm4u2akxIoRVa2g4Wb70tmucXIbnpVUxO5369gZNB38g9SBFZmRu3Amtdirg/GIpusE1B9A==
X-Received: by 2002:a1c:1d4d:: with SMTP id d74mr5706207wmd.123.1584457974485; 
 Tue, 17 Mar 2020 08:12:54 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id u8sm4711089wrn.69.2020.03.17.08.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 08:12:53 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 2/2] ASoC: codecs: wsa881x: remove soundwire stream handling
Date: Tue, 17 Mar 2020 15:12:33 +0000
Message-Id: <20200317151233.8763-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200317151233.8763-1-srinivas.kandagatla@linaro.org>
References: <20200317151233.8763-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 vkoul@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

There could be multiple instances of this codec on any platform,
so handling stream directly in this codec driver can lead to
multiple calls to prepare/enable/disable on the same SoundWire stream.
Move this stream handling to machine driver to fix this issue.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 44 +-------------------------------------
 1 file changed, 1 insertion(+), 43 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 1810e0775efe..d39d479e2378 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -680,7 +680,6 @@ struct wsa881x_priv {
 	int active_ports;
 	bool port_prepared[WSA881X_MAX_SWR_PORTS];
 	bool port_enable[WSA881X_MAX_SWR_PORTS];
-	bool stream_prepared;
 };
 
 static void wsa881x_init(struct wsa881x_priv *wsa881x)
@@ -958,41 +957,6 @@ static const struct snd_soc_dapm_widget wsa881x_dapm_widgets[] = {
 	SND_SOC_DAPM_OUTPUT("SPKR"),
 };
 
-static int wsa881x_prepare(struct snd_pcm_substream *substream,
-			   struct snd_soc_dai *dai)
-{
-	struct wsa881x_priv *wsa881x = dev_get_drvdata(dai->dev);
-	int ret;
-
-	if (wsa881x->stream_prepared) {
-		sdw_disable_stream(wsa881x->sruntime);
-		sdw_deprepare_stream(wsa881x->sruntime);
-		wsa881x->stream_prepared = false;
-	}
-
-
-	ret = sdw_prepare_stream(wsa881x->sruntime);
-	if (ret)
-		return ret;
-
-	/**
-	 * NOTE: there is a strict hw requirement about the ordering of port
-	 * enables and actual PA enable. PA enable should only happen after
-	 * soundwire ports are enabled if not DC on the line is accumulated
-	 * resulting in Click/Pop Noise
-	 * PA enable/mute are handled as part of DAPM and digital mute.
-	 */
-
-	ret = sdw_enable_stream(wsa881x->sruntime);
-	if (ret) {
-		sdw_deprepare_stream(wsa881x->sruntime);
-		return ret;
-	}
-	wsa881x->stream_prepared = true;
-
-	return ret;
-}
-
 static int wsa881x_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params,
 			     struct snd_soc_dai *dai)
@@ -1020,12 +984,7 @@ static int wsa881x_hw_free(struct snd_pcm_substream *substream,
 {
 	struct wsa881x_priv *wsa881x = dev_get_drvdata(dai->dev);
 
-	if (wsa881x->stream_prepared) {
-		sdw_disable_stream(wsa881x->sruntime);
-		sdw_deprepare_stream(wsa881x->sruntime);
-		sdw_stream_remove_slave(wsa881x->slave, wsa881x->sruntime);
-		wsa881x->stream_prepared = false;
-	}
+	sdw_stream_remove_slave(wsa881x->slave, wsa881x->sruntime);
 
 	return 0;
 }
@@ -1056,7 +1015,6 @@ static int wsa881x_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 
 static struct snd_soc_dai_ops wsa881x_dai_ops = {
 	.hw_params = wsa881x_hw_params,
-	.prepare = wsa881x_prepare,
 	.hw_free = wsa881x_hw_free,
 	.mute_stream = wsa881x_digital_mute,
 	.set_sdw_stream = wsa881x_set_sdw_stream,
-- 
2.21.0

