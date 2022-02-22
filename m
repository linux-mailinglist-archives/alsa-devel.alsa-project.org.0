Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F294C016F
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 19:35:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6256C17EB;
	Tue, 22 Feb 2022 19:34:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6256C17EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645554902;
	bh=aNZE0Y/F8UaM+ejJZaz1WIDV2bKxWhaVCVXxuaDVL2M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eLGQUSxkvpdq1xZufljS5LW+FxoFT2YVPQ78qWQfZAdcXMhmVhjD+Nf3JUNeaCIAG
	 ThV4L8CsTFLe1YQYTZosoQFfex69NTS7rRgDKjz4PkkUd48T5FRBluWSfNcjj+2YTW
	 5Obz2+c5UcGJMNYPS22fkPyBVQ7zZs+ZNPLAXiJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E2B1F80525;
	Tue, 22 Feb 2022 19:32:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EE68F8051E; Tue, 22 Feb 2022 19:32:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 398C2F80238
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 19:32:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 398C2F80238
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="aSdNImbO"
Received: by mail-wm1-x32f.google.com with SMTP id
 d14-20020a05600c34ce00b0037bf4d14dc7so2523979wmq.3
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 10:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AUoqmx1Ywbc+tqd2GvIO663zQffqPunv+0z/Zs4V7Gs=;
 b=aSdNImbOjNhtLdxQBITj50ZagnfribzgmqnjcSU+5VA32tXHznQ0f6KsVc3i7B84L3
 BXF0c5YRa4/QvyygttsC+cm5BfIU77kwq2VedJCBG/Qg3Sd1FGo0KA3TC3MHUk7vrXpV
 LxuvL3T2Y+d1LOY39dDWjAXponQL8x4ALTe6Rqob/m7c9zySZ2t5L5KOroeH3WmHKeyw
 CEFCjPKHrVkmEs8SvqRMycmIdYwQWhrcmgFRc6vd9Py+OI5SXqo4AeaIdzSUP2YbOG29
 U95yQXtC2fxWPEehrUNhUek5TA06g+qGzT0sS/vZltX8QdDU9pD9ZridBAJN0Aww2v2B
 BZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AUoqmx1Ywbc+tqd2GvIO663zQffqPunv+0z/Zs4V7Gs=;
 b=yIfeT6MUs+6Rq5fw6XB493bBoXLDQ8JkmnR4dlMRF6FJNWfnLhn81Z/4jIMm9pMJGw
 73b8lVNLH7vUJnDUgicZI4emzfixLlnc4IMncOrbhIcpa4k+LqxNcfh8vGspVhnlwWre
 tAnRDdYAVh6t2zF/z2otbBY+/nAyCBhl5QcjbP/OHqhV8Oj2vSwhCRbHgphx60Im2k4W
 Oz1r1kPzfM+fS4mTwGiwwurdlry8YkfOOgYSHsfw9J6NPZt1uE8k7/iJWPAAGSQ7vM5R
 B+4U6ujXN9NBLWY6NojgIQXR/DyjO24tc0Dgu7XUrCM+aUTYRoDKkWhXN+m9YAAV1z62
 URDg==
X-Gm-Message-State: AOAM533gIFLkBdRBCIkjvxggh8IhQVcK+6yoOAKZaQLo/JWqDKIvQpmD
 wdiYc2y2xtDgOvmBTNI1qmDgEw==
X-Google-Smtp-Source: ABdhPJxBe9KWmKY4uNCJTcsJ69pn0Df4nH0t+gILLI62HOXElU6N4yV8HIXFDDF5ISzjRAHqXemhAg==
X-Received: by 2002:a05:600c:290:b0:37f:a999:e9a6 with SMTP id
 16-20020a05600c029000b0037fa999e9a6mr4286281wmk.9.1645554749357; 
 Tue, 22 Feb 2022 10:32:29 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id l28sm57642165wrz.90.2022.02.22.10.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 10:32:28 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 3/9] ASoC: codecs: tx-macro: fix accessing array out of
 bounds for enum type
Date: Tue, 22 Feb 2022 18:32:06 +0000
Message-Id: <20220222183212.11580-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220222183212.11580-1-srinivas.kandagatla@linaro.org>
References: <20220222183212.11580-1-srinivas.kandagatla@linaro.org>
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

Also few return value of put functions, so that change notifications are
sent correctly.

Fixes: c39667ddcfc5 ("ASoC: codecs: lpass-tx-macro: add support for lpass tx macro")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 9c96ab1bf84f..7347d79a6329 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -997,7 +997,7 @@ static int tx_macro_dec_mode_get(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	int path = e->shift_l;
 
-	ucontrol->value.integer.value[0] = tx->dec_mode[path];
+	ucontrol->value.enumerated.item[0] = tx->dec_mode[path];
 
 	return 0;
 }
@@ -1006,14 +1006,14 @@ static int tx_macro_dec_mode_put(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
-	int value = ucontrol->value.integer.value[0];
+	int value = ucontrol->value.enumerated.item[0];
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	int path = e->shift_l;
 	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
 
 	tx->dec_mode[path] = value;
 
-	return 0;
+	return 1;
 }
 
 static int tx_macro_get_bcs(struct snd_kcontrol *kcontrol,
@@ -1036,7 +1036,7 @@ static int tx_macro_set_bcs(struct snd_kcontrol *kcontrol,
 
 	tx->bcs_enable = value;
 
-	return 0;
+	return 1;
 }
 
 static int tx_macro_hw_params(struct snd_pcm_substream *substream,
-- 
2.21.0

