Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3B16C6E01
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 17:45:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BF29ECC;
	Thu, 23 Mar 2023 17:44:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BF29ECC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679589917;
	bh=j1+rjliOoMwpOo6oBxWTV8LTlVszSnP2Ss4RNNsBvZg=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=c1rOZ6WX5R0nERJ3nWnSwG8CNpmJfthM7r0goB+mvgyiyfifuhIvT0Ax5qDDU1kJj
	 hsRX3pt9svwrgqEAKGgUUXhDqBuLu5KTTvG/SdMbLw2sWktIPNJEjehsX/CDKdW4hu
	 lhK4xFnEhUVa6DFqOD9mxsYxK94S5fof3+T8z25A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47425F802E8;
	Thu, 23 Mar 2023 17:44:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71BA6F804FE; Thu, 23 Mar 2023 17:44:21 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 18E6BF80254
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 17:44:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18E6BF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=i8j2uvRh
Received: by mail-ed1-x52b.google.com with SMTP id ew6so26502393edb.7
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Mar 2023 09:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679589853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aq8I2aQyBQpQohRa/OmaNRySLUW3o0D8LtVSY1bY2Uk=;
        b=i8j2uvRhu/5srg+g6xmmwsESyfuQnVDMI5KyBWiLslaiqQL7dU9DU84/TdN0Q+eLzw
         6taTI13nhfp2y2YEGn0Hrr4kFVGXb78eIEcExnJVzfYHGz/ZmXYZL020gxxZu8OA7Ocq
         Sv4XUZJ4SOq1DcAZj7aWgqq1kE6aQX8NQJ3mav4r9NEvrgZ/eY5b1OkgT/1Dl+f4QSfM
         f/VmnMVblSBhhO9mU28hArJ6fqDOLiGNGTfyVgy9ZK/jFg/ee3YNTUPwHJUgBWAESz67
         z49b5h51zWrldIzaGa1AuFx+MI1hQWXSo5yu4yjbndx8fmGpJCt4yuwekJkiQowWtGUO
         Mfng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679589853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aq8I2aQyBQpQohRa/OmaNRySLUW3o0D8LtVSY1bY2Uk=;
        b=Pll8WioqMAe5+re9eTiifhDWAZnXc5+GwBaemnfSRnZzIwKcDsHqpI3iHUm0NyJj6u
         R2K5p/bV9ST67MwWzYFrq7InbOJxOKlRYzzQn7op0vj4ubbFvMihWPkikOnRBQQAeEdv
         9TN3dotv4Lf3dQeLRlS6cVSCVF9ARASScQMP01qQMLH3oWbfPkm4JjrwwUQK2u11NoHQ
         BGOclk2vKSJEYi3q22WKslR5O68Y0nrJsPrIpNb4OYLVHkkdu8p98RkOCoRIewiAZhtF
         RD+7wdc/bbKWSorJxdAPw7LaAT+DKzwHwYepN6WjQ8t/KlqkDTOkCvl71SE7GNukCSEb
         fw0w==
X-Gm-Message-State: AO0yUKVqBwdTttBGdjb7LZtGJQnkBBwJXq/gp/m1fk8KflZrZjrOFfjh
	rKJSTK03WK0d/H866HepOdAvJQ==
X-Google-Smtp-Source: 
 AK7set969B/opsIF2lkPrgqWd55/tFs4Pt60GbdmFaX5Rle7aj7sZbfopjrhzqmZAx1xHx5JbfZGVQ==
X-Received: by 2002:aa7:d34a:0:b0:4fd:2b05:aa2 with SMTP id
 m10-20020aa7d34a000000b004fd2b050aa2mr10877110edr.42.1679589853009;
        Thu, 23 Mar 2023 09:44:13 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 m10-20020a50998a000000b004e48f8df7e2sm9542187edb.72.2023.03.23.09.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 09:44:12 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 0/4] ASoC: qcom: fixes for Click/Pop Noise
Date: Thu, 23 Mar 2023 16:43:59 +0000
Message-Id: <20230323164403.6654-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TZG3DMLO26HDSFUFUY653USLGNEXSKD6
X-Message-ID-Hash: TZG3DMLO26HDSFUFUY653USLGNEXSKD6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TZG3DMLO26HDSFUFUY653USLGNEXSKD6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Click/Pop Noise was a long pending issue with WSA Codecs which are prone
to accumlate DC when ports are active but without any data streams.
There are multiple places in the current setup, where this could happen
in both startup as well as shutdown path.

This patches help fix those issues by making sure the PA is Muted/Unmuted
inline with the stream start/stop events.

Other than this there is a patch to fix DSP graph saturation issue as we never unload
playback graph before loading same graph.

Srinivas Kandagatla (4):
  ASoC: qcom: q6apm-lpass-dai: close graphs before opening a new one
  ASoC: qcom: sdw: do not restart soundwire ports for every prepare
  ASoC: codecs: wsa883x: mute/unmute PA in correct sequence
  ASoC: codecs: wsa881x: mute/unmute PA in correct sequence

 sound/soc/codecs/wsa881x.c              | 30 ++++++++++++++++++++-
 sound/soc/codecs/wsa883x.c              | 36 ++++++++++++++++++++-----
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c |  3 +++
 sound/soc/qcom/sdw.c                    |  7 ++---
 4 files changed, 63 insertions(+), 13 deletions(-)

-- 
2.21.0

