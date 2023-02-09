Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 234CD6908D8
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 13:31:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B692E8B;
	Thu,  9 Feb 2023 13:30:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B692E8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675945894;
	bh=qOsSHZNBDQ1YoRgx0/aTwcAO7uF24uQ0GIM4s5B4VOg=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D3Sw+ahg3pjf1GEbkJ/jWIfXlvEG6bTrxiv+vU4rSLhIcZVwnwSGjyIgccjMeYb3Y
	 Y+8fdMgXxAzW0qxBjZU/ouiMTO/p+veT7tCNYLpUCe/X5Hb26oLVHoQ4hMs1a9wqlx
	 8+Jp9nqMmMdQTYEXE+zCI2DnUVc7ccchPYcuCalQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51E7CF80564;
	Thu,  9 Feb 2023 13:29:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48981F80551; Thu,  9 Feb 2023 13:28:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DEE4EF8018A
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 13:28:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEE4EF8018A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Ro8BWxNH
Received: by mail-wr1-x42a.google.com with SMTP id m14so1560586wrg.13
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 04:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DEzXaR05SusPPC1DvCjjsQFeMd90WYnfj1cUKYhegZE=;
        b=Ro8BWxNHoJAvx5SGpTR7yXMmlpv09d9Nj0eJZjJSW3/ZEazepb0uXgN9ztasMc+Cll
         dVA3pJPtNyAV8yMVsPb1/TtSYV000KqkVbzrwx5tu0Q0nqTqgcGh2iHU07/c5xTFUmBy
         0svc7agcaOFDVVa7bbpvCq9uugf0iFY7YMvlWhCk73OJx4Wm7GVU2U8hyKeNKg6qXqYk
         G+Zt+bZVSrnmatVQNw02P5i7Mhfk+BYH2ekpfHjDxoJ6U2csb921an3zMk1NGtAa9ImR
         Lbft66T1ISERPELJc1zb4cC/QzgDS9y9Do+HZCFR/bk4kWbwzvzjUw0DJQ2jq2DNQkOf
         MHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DEzXaR05SusPPC1DvCjjsQFeMd90WYnfj1cUKYhegZE=;
        b=b5K3x/npjshxScV78Q7tqyfHTthh992vsBuFe+2WBWtJriCPOQywzZLP4dWUsDtjqM
         nh2lkm/VR7p0++QKjRwPJPQ/lsFwkSoQJo+l/q+BcdU8HrEKiSDbfiY4KpxUQR0w/VmZ
         rg51E1m/L8lqFsVZpC6fY2YKeGc/4SHhGI2dep8jKXK3Wx/TckFA1NvMDXTi4IokvMXM
         62KnI9zGomF4SkWkoRqb54PBcd8fPz375vJizLEPTKQm7BOQRqWOPlDmxV31GABuwQyP
         xT/4G1S80+Z9TgPpCeajDy7hKXn8H0X05g02UDzdxXpYynLApdSKU9gtwQlDqdZyJ0/u
         +Asg==
X-Gm-Message-State: AO0yUKXL7g7t+JrSsx7+4jzg19frCjC923VD6ZBfhbMZo8eFadQjb9Oz
	U+wMILH2vl7VpfiNULTaih1QuA==
X-Google-Smtp-Source: 
 AK7set/w5TMutzbY7TMwqS2Sdy2AZrf0aaxC5Vh9Ec926w/x34Wooj0jRJGk5yU9H7y61AKa3/HnVA==
X-Received: by 2002:a5d:6dd2:0:b0:2c4:b152:9ae with SMTP id
 d18-20020a5d6dd2000000b002c4b15209aemr1704298wrz.31.1675945696476;
        Thu, 09 Feb 2023 04:28:16 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 o8-20020a5d58c8000000b002c3f0a4ce98sm1134763wrf.98.2023.02.09.04.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 04:28:15 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/8] ASoC: qcom: q6apm-lpass-dai: unprepare stream if its
 already prepared
Date: Thu,  9 Feb 2023 12:27:59 +0000
Message-Id: <20230209122806.18923-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230209122806.18923-1-srinivas.kandagatla@linaro.org>
References: <20230209122806.18923-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5QPJKAWXOZWZJVLMMHGXKDI7RU5KFQIC
X-Message-ID-Hash: 5QPJKAWXOZWZJVLMMHGXKDI7RU5KFQIC
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, steev@kali.org, johan+linaro@kernel.org,
 quic_bjorande@quicinc.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5QPJKAWXOZWZJVLMMHGXKDI7RU5KFQIC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

prepare callback can be called multiple times, so unprepare the stream
if its already prepared.

Without this DSP is not happy to setting the params on a already
prepared graph.

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index ce9e5646d8f3..23d23bc6fbaa 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -127,6 +127,11 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 	int graph_id = dai->id;
 	int rc;
 
+	if (dai_data->is_port_started[dai->id]) {
+		q6apm_graph_stop(dai_data->graph[dai->id]);
+		dai_data->is_port_started[dai->id] = false;
+	}
+
 	/**
 	 * It is recommend to load DSP with source graph first and then sink
 	 * graph, so sequence for playback and capture will be different
-- 
2.21.0

