Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6012C4BF7A4
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 13:02:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF57A17DD;
	Tue, 22 Feb 2022 13:01:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF57A17DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645531354;
	bh=dyKyvWtXMdWEUtKwENfHZO2WbXgW6qFiov2rOODx+pU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BVkNfZWK1/h2i80mj/bT6aIumAlRzIV0L0UpFt3gQTaAv5XzMHGhNLdfWb0axOR1D
	 40iaJJbLIGdldFbiJz+su1dst3wFO7noYm4jFppNB3psyB+R5u4Puza0ZOiayJ9+ns
	 Nes3Hkp28v8GM7yzNqiNoPVQvCQJZ9pMEQ4Y6YFQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C994AF80527;
	Tue, 22 Feb 2022 13:00:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19571F80516; Tue, 22 Feb 2022 13:00:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10E81F801F5
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 12:59:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10E81F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="SanxqFiR"
Received: by mail-wm1-x336.google.com with SMTP id i19so11368013wmq.5
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 03:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b/RMewZRNdO9Wc+5bCNqy1Hhh9vonM3PUYPjxzgWe6c=;
 b=SanxqFiRWVCfz2tMk6aRuN8EEWVdZcWBZqQ/p98luZkdfvMRIOd/tTpvxbWWTEU53M
 +K2TVExVtW+/JyRFknezKVtcO5x12s/Yn17Y9baJmceusyiSFROq1sIowVFwhAXaQjre
 J/bQdVKvT3CfbuacjV/caOuz/9GQLYDwX4q3y4G4KTC7uVgy29Bt5TEv41mAKt1uV0bD
 bu8hEpEzxqK5v0nBIJfN3ilaTQ+3BGT49GMN7JYKt76nx3cJViR9l+yyEIWABmRTFw9e
 lHwVf1OhEGAGt+5qkdF0ggw+czKMt2L7rJZvogJtHTRbqr5DM8A0aPvizAnMNJi9TJxz
 ztEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b/RMewZRNdO9Wc+5bCNqy1Hhh9vonM3PUYPjxzgWe6c=;
 b=hMFh2AuNEgnNqO6I2d6wfDyOv49hIKrMtw7o97d7kAgEVA4woS0PSDIlAGCaIO/wuH
 QCDqDN2nT9mucD7jaPr6FCp98VE7YOzDaZJl+c8dq07FOvsn6TVNeFktWWTDtP390PIX
 rHEfTrPodE3aM/vaZhsn0JAM7EmsJkEcj8EIx+SMCfUJCTzu20p0h12rtJOuV95FNDRZ
 kbqJoBYuF5r+mzgnJ8hOu3vtxW5uBdeJcYqzREit1SovD+lKJvm7ymOfbwrO8Xi6hb4q
 PgFeuXwbmEccu7jH8mG1XGLXv0n/F3Anh7f93RYuqblZBKdI4AVvIZny7fMg/cAEqJzr
 3UVw==
X-Gm-Message-State: AOAM530rTV0s/kI0al4M3Kb7Ln01vzXiXyfPAQ2RiRAqc1UvB92JxB+h
 ptA/zysNNr7sERZA+lXZ5/p77w==
X-Google-Smtp-Source: ABdhPJxzgULSLUP2pqn4tukUw2n0gKmU+1hjzQ8HM08B5i+0uUMqJIsF0uL6zc5my2JKVFxfGP6fJQ==
X-Received: by 2002:a05:600c:354c:b0:380:dec4:10ac with SMTP id
 i12-20020a05600c354c00b00380dec410acmr1382242wmq.62.1645531191766; 
 Tue, 22 Feb 2022 03:59:51 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id a18sm50014661wrg.13.2022.02.22.03.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 03:59:51 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 04/16] ASoC: codecs: va-macro: fix accessing array out of
 bounds for enum type
Date: Tue, 22 Feb 2022 11:59:21 +0000
Message-Id: <20220222115933.9114-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
References: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
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

Accessing enums using integer would result in array out of bounds access
on platforms like aarch64 where sizeof(long) is 8 compared to enum size
which is 4 bytes.

Fixes: 908e6b1df26e ("ASoC: codecs: lpass-va-macro: Add support to VA Macro")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-va-macro.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 803e4dca0538..0fd0139e8229 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -781,7 +781,7 @@ static int va_macro_dec_mode_get(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	int path = e->shift_l;
 
-	ucontrol->value.integer.value[0] = va->dec_mode[path];
+	ucontrol->value.enumerated.item[0] = va->dec_mode[path];
 
 	return 0;
 }
@@ -790,7 +790,7 @@ static int va_macro_dec_mode_put(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
-	int value = ucontrol->value.integer.value[0];
+	int value = ucontrol->value.enumerated.item[0];
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	int path = e->shift_l;
 	struct va_macro *va = snd_soc_component_get_drvdata(comp);
-- 
2.21.0

