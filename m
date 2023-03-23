Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 859C66C6E12
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 17:46:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CB85ECD;
	Thu, 23 Mar 2023 17:46:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CB85ECD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679590016;
	bh=k/nBt9BcNetiA5WNTIRYwtPGuZUtxqlhDa1YecEFAeI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J4ip/tzqJ/cLPjlZjWF0dg+Rgw+56LJSO5Z2oMEt5YZVX5vkY9HSvFJN8g62eFghu
	 MA06HmF7k88pJNxg8syMLQKY0qhJG4z1gZ4Ka2jXiw8nqOklQ5y/fLp4z3G3daQzRz
	 VRyKf9jv1nWjQn2+fvBPgpNUkAwX+cUMyD0yW98U=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48C62F80553;
	Thu, 23 Mar 2023 17:44:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5E1BF8051B; Thu, 23 Mar 2023 17:44:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06780F80093
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 17:44:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06780F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hsU07gcm
Received: by mail-ed1-x52b.google.com with SMTP id cn12so43857188edb.4
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Mar 2023 09:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679589855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9hR2ta52bACZknOtBgzAtIQixsM2cnIaeXyomXOX0M=;
        b=hsU07gcm4byF9ZYlXK1WlYHz20he7E5os8F7BoiRYFqBoQ2LrF2tAJIR9eVB89B8Uy
         HJA8JeTi7FwzRJ9QxYCsEuIBXYiMTMb1rDVSxF4Q/n0XMr/M4RFU6tkGTphQfVx4uG71
         l5UlNqW7RwV16UokCSfFHyRmu8oAgTKWjS8tWQtIe5h/PGz52NnEbauFdC0hY47EMOgS
         SOTX0YK+AtNfFB4fQyOEqxMCyZHkHGoA+mSLPFbuU4KUzJ7iT2zGM9o8cDWy0W066NRI
         FquE+gLVNO9wbeZ7aJh0yrRbmLCExY1uQ7JeyDp7ZrXtcJ+GS4EGqeX6jb6AUxU2ZUqV
         I1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679589855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9hR2ta52bACZknOtBgzAtIQixsM2cnIaeXyomXOX0M=;
        b=h6U6WJx6+f9jNM2p+VaCwwI0h6VXg3wl0VDq9qzSH70rr2RnSRd8E4uDGa9aCdM6qE
         0vNJAbWGo+0ipMnsIZqaUxhFi3j5kgeY6E3QKsG44TvhEwbyn6D4epvCTvbwde1CTh60
         ycSdfCdySYTbW1HBmx/wlfC8kXFWeYPZbp6dMufIghJcM4LUEOXwdXoo2MWbSFeTnR3i
         4Xtt61O87rU2dPTOY3jOycLoeqZh2Q0g3alewrmgzxWDmlZ5bxZ8vnn3xu82Ij0W47kM
         AvpXR2Zls5VmNayh5iMkzcnlw+RWau2eHtCACzcNw/6Vdl4zGxX0ThjHWjRFn/v8UWue
         MQiw==
X-Gm-Message-State: AO0yUKXbpSFZC2AOLxvjHZfbiORwEsEoNmu6rSvFT/jcomyi4TpsHnox
	b6NwgZMb9E6pW0GrHS5hwMu/nbtnIYLdl+wHkI0=
X-Google-Smtp-Source: 
 AK7set9SrJMpkEy99egze/q3burIKmKgQxPwfncKKS5udbZI/dH1Vt0lijTuLG5/wJEWwSEzEDNPxw==
X-Received: by 2002:a50:e619:0:b0:4fd:298a:62cb with SMTP id
 y25-20020a50e619000000b004fd298a62cbmr6183375edm.21.1679589854783;
        Thu, 23 Mar 2023 09:44:14 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 m10-20020a50998a000000b004e48f8df7e2sm9542187edb.72.2023.03.23.09.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 09:44:13 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/4] ASoC: qcom: q6apm-lpass-dai: close graphs before opening
 a new one
Date: Thu, 23 Mar 2023 16:44:00 +0000
Message-Id: <20230323164403.6654-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230323164403.6654-1-srinivas.kandagatla@linaro.org>
References: <20230323164403.6654-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 47VCBCU2OQIAA3NH6KXM6GGPLLVJCMA7
X-Message-ID-Hash: 47VCBCU2OQIAA3NH6KXM6GGPLLVJCMA7
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, johan+linaro@kernel.org, steev@kali.org,
 dmitry.baryshkov@linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/47VCBCU2OQIAA3NH6KXM6GGPLLVJCMA7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On multiple prepare calls, its possible that the playback graphs are
not unloaded from the DSP, which can have some wierd side-effects,
one of them is that the data not consumed without any errors.

Fixes: c2ac3aec474d("ASoC: qcom: q6apm-lpass-dai: unprepare stream if its already prepared")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 23d23bc6fbaa..420e8aa11f42 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -130,6 +130,9 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 	if (dai_data->is_port_started[dai->id]) {
 		q6apm_graph_stop(dai_data->graph[dai->id]);
 		dai_data->is_port_started[dai->id] = false;
+
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			q6apm_graph_close(dai_data->graph[dai->id]);
 	}
 
 	/**
-- 
2.21.0

