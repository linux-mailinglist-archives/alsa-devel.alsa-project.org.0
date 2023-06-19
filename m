Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8517351D1
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jun 2023 12:18:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F56D83B;
	Mon, 19 Jun 2023 12:17:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F56D83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687169879;
	bh=q/uJzb+PVm9sDqRPDgFYZWvl+JxwgWOn+cLrqks7LNY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aNktqG5cl5/Yi516E1uJ30jqjC78M91R8/yp/ecPrICoWoQuBHic/0bRFyNMoJT5G
	 FtcmKmyfJfg2pUku2aC423CC507imASjq2DNIz9Xrr5ibJ/3OeUjSL5HiKQfrrQVHE
	 Lip85gGfPh0OujWiWfK8MV19h/rMdXvGDm6uUsOo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 851A0F8052E; Mon, 19 Jun 2023 12:17:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC731F80217;
	Mon, 19 Jun 2023 12:17:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C4B9F80448; Mon, 19 Jun 2023 12:17:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80DE7F800BA
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 12:16:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80DE7F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dLj1MVLX
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3112f256941so1368685f8f.1
        for <alsa-devel@alsa-project.org>;
 Mon, 19 Jun 2023 03:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687169816; x=1689761816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gSYLEp+YdUxldV8igLt5BFNVK72bviFN+/4CDtA3Mh8=;
        b=dLj1MVLXyF0FrCD8KYvoc9fQGbRxY6I7GSzXo3cjom6O7tGC188XsxGeJIc7XT63Jb
         3yPOs8Hqypd9Bi6B8IQxGCjq3U1MFE/SUsMK4UG0jLtgbCGqNRc4dwBiVksSyNUqY3Ne
         gEx+DKEqXiDIG7o/hH1cl9pZBFcRKhdNWatv9gpj4zE2evMz2XkxdT5xB76oRAcXIDC0
         AzHJc1lgC26H1gRvizZGMT8orYL8aFcvrL89DaOxa0AHS7lxy2aWyvftE6HInU/SPe6t
         XLhiyyGpeqwm7p4GAFj0wemaS81PXkEyRH5tkTEDqm9gdJfo2EdYWH5z3UBHqFLwqC2j
         8aXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687169816; x=1689761816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gSYLEp+YdUxldV8igLt5BFNVK72bviFN+/4CDtA3Mh8=;
        b=cSYZIXIXeahzTfEO++wAm8brqe5eee3kkmb+zw8lngvp4nk+M97AvvYnF26WYWdtBH
         3UGw2XvqqaRkLhY2tw84xKFY5zYCe/xQVMkinwU9Fj50SwqNTPldCr7wwGqcXxOQqgNn
         T2tT7+LjE3dpyt0ZzCVNYTrg6GO0kmRSONe+BpAs6FrHEaZ0Y9qhit1aGdQww47zbiFE
         SlTQm1ddmXjUL5+d/S/42LB5IJj7NZXN8AgfLl2v/TMGj/ySD4NqtrLuYDykN473o5F0
         rjwTmAf5qnT8j+m0vm73L0eMbDWH5DFC0PRuo2pBKOTMEaWUgSeb/fJVeG7ldtftKie9
         y/GA==
X-Gm-Message-State: AC+VfDw7P+DDwIlvgB4ywbtp1w7zOHURJlscqWsEKJeSVrhGJpFAgT3y
	0Xfz1kBwTqu9QHfKpRdzd3EYKg==
X-Google-Smtp-Source: 
 ACHHUZ4B9JQC1lZJ8vlWh4TNeD8qz6y9HFsakUA3OeGPoGiIknnJ1wgidU3nd85ZRFDQcLB8DrwBzA==
X-Received: by 2002:adf:e849:0:b0:311:27bf:f9ec with SMTP id
 d9-20020adfe849000000b0031127bff9ecmr4601602wrn.21.1687169816492;
        Mon, 19 Jun 2023 03:16:56 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 c2-20020a5d5282000000b002fae7408544sm31146922wrv.108.2023.06.19.03.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 03:16:55 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 00/11] ASoC: qcom: audioreach: add compress offload support
Date: Mon, 19 Jun 2023 11:16:42 +0100
Message-Id: <20230619101653.9750-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2ZHFQ6UDB6DINIPJ5SYOIJFB5HIPS3NA
X-Message-ID-Hash: 2ZHFQ6UDB6DINIPJ5SYOIJFB5HIPS3NA
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2ZHFQ6UDB6DINIPJ5SYOIJFB5HIPS3NA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset adds compressed offload support to Qualcomm audioreach drivers.
Currently it supports AAC, MP3 and FALC along with gapless.

Tested this on SM8450 and sc7280.

thanks,
srini

Changes since v2:
	- fixed order of sign-off
	- added placeholder decoder and encoder to audioreach_set_media_format

Mohammad Rafi Shaik (4):
  ASoC: qcom: SC7280: audioreach: Add sc7280 hardware param fixup
    callback
  ASoC: q6dsp: q6apm: add end of stream events
  ASoC: q6dsp: audioreach: Add support to set compress format params
  ASoC: q6dsp: audioreach: Add gapless feature support

Srinivas Kandagatla (7):
  ASoC: q6dsp: audioreach: add helper function to set u32 param
  ASoC: q6dsp: audioreach: Add placeholder decoder for compress playback
  ASoC: q6dsp: q6apm-dai: Add open/free compress DAI callbacks
  ASoC: q6dsp: q6apm-dai: Add compress DAI and codec caps get callbacks
  ASoC: q6dsp: q6apm-dai: Add trigger/pointer compress DAI callbacks
  ASoC: q6dsp: q6apm-dai: Add compress set params and metadata DAI
    callbacks
  ASoC: q6dsp: q6apm-dai: Add mmap and copy compress DAI callbacks

 sound/soc/qcom/qdsp6/audioreach.c | 250 ++++++++++-------
 sound/soc/qcom/qdsp6/audioreach.h |  51 ++++
 sound/soc/qcom/qdsp6/q6apm-dai.c  | 445 ++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6apm.c      |  68 +++++
 sound/soc/qcom/qdsp6/q6apm.h      |   6 +
 sound/soc/qcom/sc7280.c           |  23 +-
 6 files changed, 747 insertions(+), 96 deletions(-)

-- 
2.21.0

