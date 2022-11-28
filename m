Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FD163B4B0
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 23:13:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B12391676;
	Mon, 28 Nov 2022 23:12:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B12391676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669673585;
	bh=P8/VpZkKG9CCB/Otb8xzBAvztqFP4hUqCHH12NyTPuA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rKpkKQ99YUHrTl7vYjz/E16VnDn/8NTR1nulx8/iGhekRAfOL9bZz4W9IEDVIUIhs
	 lHZv1J+IdjNT/SyWsl2LyiHOPVe4J1y5mWyOBHn+zL98IQDy8Lgp936E4NDerXWIVJ
	 Wwjl8lL+aOcWt5DKuJ5ZDj3a+0yK5PJfZD4dRQ3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F0E2F80166;
	Mon, 28 Nov 2022 23:12:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E9DEF8027D; Mon, 28 Nov 2022 23:12:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B18AF801D8
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 23:12:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B18AF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="LX1I5X2T"
Received: by mail-io1-xd2b.google.com with SMTP id q21so8734620iod.4
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 14:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sqj31xD4hPaFJyMRspnZtLV/GdibyQshhKJftkXPTVY=;
 b=LX1I5X2Tqi3H4osOssCuWhQxDxiOSlkZYdf+xSNNQ5ROewNwQQhCSV6qRABxIV2Bks
 oYRqoJPX71/O7LWeXlCZXMdXOJYPsyjuD4LOYDUmiqHaJXS34kSPYV3r0aSd22RTBcvD
 HpGsQZUSAGnCIdx7iCLmqGl1ZVN/RS78RxSwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sqj31xD4hPaFJyMRspnZtLV/GdibyQshhKJftkXPTVY=;
 b=luA2PDZuXks1blK53TnQJAIJaWGCcMscbaGGdXdgW/qvjQjxD3hX2+zF6bS/jPQjE5
 EPC1GRVE0MVex6ND3VOTgRR6myoYXUPBywvmAwRdoZJou/LkOt1VkzjlNZoL3RYoATyc
 cqKZRJsx64h1EIn0+1gSkvzD05n/umM8+WUR+PABEFebM+XPWp+mDodd0SQ/N/Pvy73J
 2IxMNp1Wxd6lzpHboh+X5bSDDmAml3dJog2q4DWjBtMVqWNNzxn1mPsgX6uYCBG4i3Yg
 DtCB2SB0Z2GXMBie0T69n/3abyKKaUVRJp7uuc53Pu3bvly0GEQwXx0BWelEENw5EorA
 nPQQ==
X-Gm-Message-State: ANoB5pnMcAWdMD4cWKRaZ5LIQ5GX/3XxnNoY/E/FLHgu555sO/KVenqR
 aTMQF4q9m6NOxDfdF8mhLvABlg==
X-Google-Smtp-Source: AA0mqf77dcDF5VbAESm+8p/Wms6Z+hD0jVYwI2+aCwtztLs7FD6Hhnbu5FCGv+vyB+kuFVJq+DEo4A==
X-Received: by 2002:a05:6602:21c2:b0:6c3:168a:a25e with SMTP id
 c2-20020a05660221c200b006c3168aa25emr17433231ioc.174.1669673518761; 
 Mon, 28 Nov 2022 14:11:58 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
 by smtp.gmail.com with UTF8SMTPSA id
 a15-20020a92ce4f000000b00302bcbad239sm3827937ilr.77.2022.11.28.14.11.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 14:11:58 -0800 (PST)
From: Matthias Kaehlcke <mka@chromium.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/2] ASoC: qcom: lpass-sc7180: Return 0 instead of 'ret' at
 the end of _resume()
Date: Mon, 28 Nov 2022 22:11:55 +0000
Message-Id: <20221128221152.2.I8d1993f41f0da1eac0ecba321678ac489f9c0b9b@changeid>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221128221152.1.Ia805c688ee968fbbec7b93dc10742876fdef8024@changeid>
References: <20221128221152.1.Ia805c688ee968fbbec7b93dc10742876fdef8024@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Judy Hsiao <judyhsiao@google.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>,
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

sc7180_lpass_dev_resume() returns 'ret' at the end of the function,
where 'ret' is always 0. Just return 0 to make it plain obvious that
this is always the success path.

Also add an empty line between the error handling path and the
return.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 sound/soc/qcom/lpass-sc7180.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
index 7a81e609727c..30a28e3152cb 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -173,7 +173,8 @@ static int sc7180_lpass_dev_resume(struct device *dev)
 		dev_err(dev, "sc7180 clk prepare and enable failed\n");
 		return ret;
 	}
-	return ret;
+
+	return 0;
 }
 
 static int sc7180_lpass_dev_suspend(struct device *dev)
-- 
2.38.1.584.g0f3c55d4c2-goog

