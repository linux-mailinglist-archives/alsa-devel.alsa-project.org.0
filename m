Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1451182060
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 19:06:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 736C01673;
	Wed, 11 Mar 2020 19:05:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 736C01673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583949990;
	bh=qNurTMPC8PWr0BcgKD2a4f9yE6iL5Busk0QPdltjBgQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j6rCwbBZ3Gs6e73t16exhujxVbK+ACv1jL67qCTCzI43RmfV0Gfmj13G2ddcIBLOt
	 2jUoORFXQcGBXBj096QQlaSLYjeeKqbH9TNmEglfgsQHMGwURhEV6s6sDvTtRutb0X
	 kx07/87B2SvB8o4APrt04MiV13ANiFVxRBXV2nUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E408F801F8;
	Wed, 11 Mar 2020 19:04:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6014AF801F7; Wed, 11 Mar 2020 19:04:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A12D8F800B5
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 19:04:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A12D8F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="M3bjxGks"
Received: by mail-wr1-x442.google.com with SMTP id v11so3836392wrm.9
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 11:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uSWL2FmY7zpKu733UysN5ObefdtHGdo1xnjVfRmXsfs=;
 b=M3bjxGksxSB2uD4exfypPyvoUCoNhuYHVu0Z7MqkcbU24JUr39s/S5w2HTfIBfk8Gt
 qvyGcxu9THPrvu/aO9SGE5ImXArh3scmpeWqi7SwDUsnUKyiSePi2qxnIhWu2eR0N40D
 jP9cTxfo/cMkuwroo9gS3LZzbkIEzd3rU8wGYX0ygDWBuKI6fwLXlz/xtgJ/aQqFt+Q1
 wdkU4M+LdGcUDA4KdxkDA4pt48DMP7F0FLVJLgJ/doKJcBQ4rVy8quGpLLbWnyFM5viI
 HtLbFbgQb9/ku1o3OmTW6d4p76eqt/6x1eO/WjPqZ4DCDHjVdvyxmQSAFxJVp5a2W+S+
 sMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uSWL2FmY7zpKu733UysN5ObefdtHGdo1xnjVfRmXsfs=;
 b=hFZvjCUWoOS/APH6vPTosP0Z4bbvLiiGsbFxi3Kl13JWGYV9he7aDSYjd2m78YFILJ
 4u2xGytNID/fCnth085ulBb8gAsLz1DZRJcBwGP1vIz0xB2rbXqO1nhWTwsx/Yo+FjX8
 te9oGXhBTKNtOGCNsiTm7ClKqm/9ginsUjdIcJMn6xlindU5fH6uPkAVsYBzDkhe2QmS
 b0g0mwQdLRxeMo/Zmh4f66YpcF2o1uPRWkXxpIGtpDUc5EsR6Bp9xYeTlVJBDgturWsG
 5dhGW4zPFVIq/P+xmtJ/Cco0CIxFM226OGMFwbc11TZo6Oqi2VPOAS7G090IUynjeSiT
 67JA==
X-Gm-Message-State: ANhLgQ2unsLwDi8bGetOaJM4gLNhtVZbzWGxeR/S+nI2gdCelowOGPpE
 6j+OzcLh2hL89cIcNgUVSHhaag==
X-Google-Smtp-Source: ADFU+vvWK8hKheKVDZ1BgJb12Z0r9+RePhfmT1iLPBixkKd5N5IR5u2BasLAy4m4UbOiD5vTW3YbfQ==
X-Received: by 2002:adf:f044:: with SMTP id t4mr5493484wro.287.1583949882618; 
 Wed, 11 Mar 2020 11:04:42 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id z11sm8997840wmd.47.2020.03.11.11.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 11:04:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 0/2] ASoC: qdsp6: fix default FE dais and routings.
Date: Wed, 11 Mar 2020 18:04:20 +0000
Message-Id: <20200311180422.28363-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, lgirdwood@gmail.com
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

QDSP6 Frontend dais can be configured to work in rx or tx or both rx/tx mode,
however the default routing do not honour this DT configuration making sound
card fail to probe. FE dais are also not fully honouring device tree configuration.
Fix both of them.

Originally  issue was reported by Vinod Koul

Srinivas Kandagatla (2):
  ASoC: qdsp6: q6asm-dai: only enable dais from device tree
  ASoC: qdsp6: q6routing: remove default routing

 sound/soc/qcom/qdsp6/q6asm-dai.c | 30 +++++++++++++++++++++++-------
 sound/soc/qcom/qdsp6/q6routing.c | 19 -------------------
 2 files changed, 23 insertions(+), 26 deletions(-)

-- 
2.21.0

