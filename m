Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB5A5468CB
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 16:49:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 917AD1AA9;
	Fri, 10 Jun 2022 16:48:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 917AD1AA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654872572;
	bh=ktoYggIgOADZFGUTDTFpQrUEz+y4qRUO/+npNaFgmac=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nF+YBCLWQnZjOBJHh2vE6uUbUtfPd8+co//BWaYmvbyijydQEXQeP0fPQBFOxroAM
	 2eiQ4NFVZTls2UYfyAcgr2+5/yWM2QR7XOjDAKgsIV9VBBrLB3wCieN1iJMaW5TP3z
	 fSnhxghPa2EX6v2ZJF2Rhf6w2WSwccLzu7dORdnc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19038F800E5;
	Fri, 10 Jun 2022 16:48:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD856F804D2; Fri, 10 Jun 2022 16:48:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A88B3F800E5
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 16:48:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A88B3F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="G+cIdmS8"
Received: by mail-wr1-x42d.google.com with SMTP id x17so36848292wrg.6
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 07:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dASImwNQ4lKnjqAZylKMyljkWPUewrzG4+oBeRN/mDc=;
 b=G+cIdmS8P0uX6K17wjNEk8gIw4CPGyMbc1Vy7LEPlgztd6qDiUMW08DkEQjsDqbJ28
 LVWqoWg7nksaLKwJgJ5/xal4EvO21pdjfiHcl6eXcp9CrE7loaFrxmqV+VEZ7uaz6y+d
 hRC7gtUQJBkuFR2WlkHLh/JFwrxlg8xev2EosiExx/O2/GpSqz9cLih4hqpmrgXNRi1g
 fT34CbHd9lcn6kclIdpG5vnTHWyvXztwR4yc7x8QWVi7sPTd4sc8k/F1XfX/Om6uTiwG
 50zHG0fCLJ4vly4DUCC9V4/i94fkuMbvl7rv+I5D1NO70xmGEQ/OygcWXcSMGDqLQIe5
 9kMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dASImwNQ4lKnjqAZylKMyljkWPUewrzG4+oBeRN/mDc=;
 b=GHm/PbtpO+CgYVVXEI43o98lmFCMEHzfhzS70tBTrseI4AdV6F75Mi9H+jJdrCYWqs
 e4anUP3nyfQlKnK3ijfXxYMRrTs6ygLYA41ezBbti0ylaJbdR8t1U3pSLWA4pCSgLLbG
 6IbSmBDj+ASgN9idfxgp5mu7LNTHrPF40U4zDAHmYTj/H/Ewx/ionKZLPq6Q9bTL9emi
 deKVJXScmCxxc0YYegLc8N2wI4EJ9jeYmygC9Aa5IViy+JnkdWq4Gq69cX7vCUTTi9aa
 CUCIS+fZhvXaFHe7FENLhnARwOUJe5ahVvkDI5MZLyOWidS8kaOqLhgNDWTjKaIpSJRm
 sdTw==
X-Gm-Message-State: AOAM530oYrgA+ZoNdn/E5CutZcfx9jBlozL0k5/Qb7zfdwtU80hZvVu1
 2AilBQcpUIyPMrlgsvlbHkYEXA==
X-Google-Smtp-Source: ABdhPJwwor12U+NJ1Y3A97V4xBrTDNSS2pCfrcUD+2ZelNq8m/l02RTsCwtRkBE0U0SK1UFNnjqSvw==
X-Received: by 2002:a05:6000:1567:b0:217:abea:6a67 with SMTP id
 7-20020a056000156700b00217abea6a67mr31203490wrz.305.1654872502733; 
 Fri, 10 Jun 2022 07:48:22 -0700 (PDT)
Received: from srini-hackbase.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 bp3-20020a5d5a83000000b0020cff559b1dsm27212085wrb.47.2022.06.10.07.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 07:48:21 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: qdsp6: q6apm-dai: unprepare stream if its already
 prepared
Date: Fri, 10 Jun 2022 15:48:18 +0100
Message-Id: <20220610144818.511797-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

prepare callback can be called multiple times, so unprepare the stream
if its already prepared.

Without this DSP is not happy to setting the params on a already
prepared graph.

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Reported-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 19c4a90ec1ea..ee59ef36b85a 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -147,6 +147,12 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 	cfg.num_channels = runtime->channels;
 	cfg.bit_width = prtd->bits_per_sample;
 
+	if (prtd->state) {
+		/* clear the previous setup if any  */
+		q6apm_graph_stop(prtd->graph);
+		q6apm_unmap_memory_regions(prtd->graph, substream->stream);
+	}
+
 	prtd->pcm_count = snd_pcm_lib_period_bytes(substream);
 	prtd->pos = 0;
 	/* rate and channels are sent to audio driver */
-- 
2.25.1

