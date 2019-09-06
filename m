Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD576AC11D
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 21:59:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55AAB15E2;
	Fri,  6 Sep 2019 21:58:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55AAB15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567799983;
	bh=msRbE+C6P2IJn42SPGzzwEMpBpFtwQbVMw7Trg+ngV0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NlB6rYWAr/bp2hJRFDJO8WK24NzoCFgL40/dwyLJMl4NKwhU/Qe9Y+GYyu2cF5wwk
	 mZwOpqI9hoVX/VcEjtvJh8NQ1FhSmEtnlOG3McXdvviWltLJL/u2suF0RYj17mG0Hm
	 WXJ3w14Uqm+7jFQZcN/u3D3Sg7AF+qW4M/0vSF3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DF14F80760;
	Fri,  6 Sep 2019 21:48:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00359F80720; Fri,  6 Sep 2019 21:48:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D0AEF80713
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 21:48:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D0AEF80713
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="VR5c0Hk9"
Received: by mail-pf1-x444.google.com with SMTP id b13so5199796pfo.8
 for <alsa-devel@alsa-project.org>; Fri, 06 Sep 2019 12:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FHelXmRjjAMyFKQqQPCAX20BQlp6Mvh3GA9PT+l9JFE=;
 b=VR5c0Hk9O79Y7WTUOEB64lcc0fLMari2XneVvolAHuMYrkvW5jhDnkKpZzMGVKLbVT
 Y1F25ro9kf/ceRehAoKZUufJZTa11reKjVX6Fcq6i97OmdqUMuSKOyITy4NWolScCtCe
 nGZ3XwsM7AcW4A08iEe3sgnEvpV+ch09yE/WQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FHelXmRjjAMyFKQqQPCAX20BQlp6Mvh3GA9PT+l9JFE=;
 b=FVyRgLrgJziJ3v4RzD/5EZQ1vNaQbTPsTPJPOWnZ9FJl3R73t6IFxumZVFA1Y04H8E
 vUP/dyesMqr7burJ7L03aMTwPqdLpUuXfrJaCfMpuyuW5NALRd74rfubqjV6GGHWOTJH
 edH4qKRAxW2zSyUHqrmcZQzioNyfBgs7IwzCXDdGqXCnxcm95UAaBUJCsWaTYFJbg7Wk
 167NdfljppT5zVnuRdUJSJMyeBBW4AsQvBQym675mXFJCyjUGz54KSWCcJEU2L0UfWzZ
 qKxkaFd+DyIDIm910YZLTTXgqZVWyDGFrCffBhWGgpxfldAtYqVo7PRAI2wJ0NCxnuiO
 tcsA==
X-Gm-Message-State: APjAAAWszg+n8o+/7GBn1WrfZOQoGtPoGmSOKCWb4e/uS5a2AeeiWWAq
 lkUOIQlYp/GSiYNxLGqkn1Sy/XoihQ==
X-Google-Smtp-Source: APXvYqzd943Uapw3haUtFGonAKR9Ewoj4rqbVOCSUA2pGh6XEaYRVmh66QeBPF6GT6rQP2EZL56FoQ==
X-Received: by 2002:a63:2004:: with SMTP id g4mr9041851pgg.97.1567799311873;
 Fri, 06 Sep 2019 12:48:31 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id o129sm7175686pfg.1.2019.09.06.12.48.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2019 12:48:31 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri,  6 Sep 2019 12:46:37 -0700
Message-Id: <20190906194636.217881-16-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190906194636.217881-1-cujomalainey@chromium.org>
References: <20190906194636.217881-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [RFC 15/15] ASoC: rt5677: Turn on MCLK1 for DSP via
	DAPM
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The RT5677 DSP needs the I2S MCLK1 to run its DSP. Add a dapm route to
SSP0 CODEC IN so the clock is turned on automatically when the DSP is
turned on.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 29233ec8906e..2827a6d00ead 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -4305,6 +4305,8 @@ static const struct snd_soc_dapm_route rt5677_dapm_routes[] = {
 	{ "PDM1R", NULL, "PDM1 R Mux" },
 	{ "PDM2L", NULL, "PDM2 L Mux" },
 	{ "PDM2R", NULL, "PDM2 R Mux" },
+	{ "DSP Buffer", NULL, "SSP0 CODEC IN" },
+	{ "SSP0 CODEC IN", NULL, "DSPTX" },
 };
 
 static const struct snd_soc_dapm_route rt5677_dmic2_clk_1[] = {
-- 
2.23.0.187.g17f5b7556c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
