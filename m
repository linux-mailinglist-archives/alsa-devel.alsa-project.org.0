Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5533049C8CC
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 12:38:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1FC81F40;
	Wed, 26 Jan 2022 12:37:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1FC81F40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643197096;
	bh=P9lLvPmm/S8wX9jlxO9fKTl4fXZWd8h3bgNemwB/PRs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uMDcKJESBewbC2BHR6cu5MMveICCujvy8mt7fR1GLfwY8puUId2t4IWgxNf9oyz2O
	 SlKctWLq2NwSiRGFc/ORfcERCUgwrNYC3Ou4bvInW/dw57EmuTPi8ZLpIjaHDmBkyh
	 OjwLzxSPOF6S1NvIqux4XtcdrsUZU+5HhTjj/luQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28DE2F80510;
	Wed, 26 Jan 2022 12:36:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D491F804C3; Wed, 26 Jan 2022 12:36:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9746F8049C
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 12:36:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9746F8049C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jte/6bj9"
Received: by mail-wm1-x329.google.com with SMTP id c192so2145192wma.4
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 03:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wTvnkKEb+4UL86WLI4y9ZHDzYIRRSQJF903Pn2y7+HU=;
 b=jte/6bj9Lu4Bn2k+uHE6Nlb3BHk5VedwUaNZG2hSiwCE7TR4bBfsTigqHAcN3aXB1Q
 3dgOb9H4cRMzlz9RYKQWB9+xtrcxyz/kWLe/9yrdAD3gEcPnR8eKaF4UbzvipPkBdCfW
 pCoYATosVlFVnGSArIihhOrsDJFkYvI7ZxCgMs5m899RVlIJM++jFILUgkLX82FYA0O+
 6xZqTmsmGEV6PMGTX5lziQUM/jYrg6g7+3U72oFv8wtKruHpslTaroqVL6847EWsBxP8
 XblL5KZKFVBkJb8SvhZgxL8hYjK9WMrd7ugCzgR0swA+c+zg6TBvc35nE6BA+FF6SGZM
 vt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wTvnkKEb+4UL86WLI4y9ZHDzYIRRSQJF903Pn2y7+HU=;
 b=yc0YNxVmyjbsEC92FDccO/wip/xpWdmI4cEl783j3O4mD/6ITaRWQzB7yaRKHhVXa/
 GnoYc8drtL/PeUAwBLowMSuz9uYZyzLXrQMukNwIWXNUuKMUeoPg9ilDSoNjxJSZiNoO
 QpYKEjI+UATTbNxVdVksFnCDysLUqfz/tFJjDl+vCDkeiySij3/69O3TiPtlj5EdUTC/
 SL8Ig7aa6IhNclWS6S3neOKcQJEaEjg/sAeRRtnwDJw18yWi/t6yiJAJTmNPcMcf+P4H
 J5Pi3PdJF581PfASz4CgkwdndkphpSiqc8bUkCv501Ca+AD1vgBppLcgLAUU2tCyp82v
 WX+A==
X-Gm-Message-State: AOAM532rXtrLMNR+RA35VqCHC2SyUgbKrzBLAeHjbdUVVF/jQXnIidaD
 qkdGe0pKZPJcZuujOOOaF9wLUw==
X-Google-Smtp-Source: ABdhPJxNol80N6KgPVyzOBjJcP+P3qPnV0rBGrzx5NQUKiryTqB/K9m2g9NoTimj/hv+KNyRbSBHhw==
X-Received: by 2002:a7b:cd14:: with SMTP id f20mr7156768wmj.110.1643196962831; 
 Wed, 26 Jan 2022 03:36:02 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id n14sm11999188wri.75.2022.01.26.03.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 03:36:02 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 4/4] ASoC: qdsp6: q6apm-dai: only stop graphs that are started
Date: Wed, 26 Jan 2022 11:35:49 +0000
Message-Id: <20220126113549.8853-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220126113549.8853-1-srinivas.kandagatla@linaro.org>
References: <20220126113549.8853-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
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

Its possible that the sound card is just opened and closed without actually
playing stream, ex: if the audio file itself is missing.

Even in such cases we do call stop on graphs that are not yet started.
DSP can throw errors in such cases, so add a check to see if the graph
was started before stopping it.

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index eb1c3aec479b..19c4a90ec1ea 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -308,8 +308,11 @@ static int q6apm_dai_close(struct snd_soc_component *component,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
 
-	q6apm_graph_stop(prtd->graph);
-	q6apm_unmap_memory_regions(prtd->graph, substream->stream);
+	if (prtd->state) { /* only stop graph that is started */
+		q6apm_graph_stop(prtd->graph);
+		q6apm_unmap_memory_regions(prtd->graph, substream->stream);
+	}
+
 	q6apm_graph_close(prtd->graph);
 	prtd->graph = NULL;
 	kfree(prtd);
-- 
2.21.0

