Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D00B5449E0
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 13:20:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 828EC1F5E;
	Thu,  9 Jun 2022 13:19:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 828EC1F5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654773615;
	bh=/epniUhUp7WinZQteRsRkPLofu4G5oOc7t7Asra2waQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IRQTUkWkrVJXR4VS0c83o8nyHyCv1NMsDm/fv0AT3Jhcb2J8gTRLxNGSJnX29oDON
	 D4iSqBKBSNoSOCXF4D9m8k29kN3QjbbgPEwLH7RqhGkSTfwjgDQYMQ/op2qSCc7nZX
	 +M8iUEKiKGn4FGiTumKC2ESmFRGlyqqgB3RMxduo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C65D1F80240;
	Thu,  9 Jun 2022 13:19:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75529F8019D; Thu,  9 Jun 2022 13:19:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 040AFF800E9
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 13:19:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 040AFF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="v7+74RRA"
Received: by mail-wm1-x32c.google.com with SMTP id
 m39-20020a05600c3b2700b0039c511ebbacso5737227wms.3
 for <alsa-devel@alsa-project.org>; Thu, 09 Jun 2022 04:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PqMs3a5YintB0gVdU2B3xyiVVe9JXV55Eno0UBh+s+0=;
 b=v7+74RRAbyju487rK4ntR27tiHtCsewTc/zp5hlgHR3kJcOJnCNRWY5VFBd9G/K6Wz
 D1TjizVKFmdemSS28zrviDlHkf4azNLJjsrHE9wOsKtrneN11Qpca/bFltFZLSzBMMrm
 TREmJFHSjwRwbFSQfpKIFI7SjddVQOWjpMWFe9pBsZWVQbg+kGWFDyGGghEotOKt2P4Y
 SAYviRvOAWEZddl5Cha1N4GCPKN372GcbKgCiau2Ai2A80QfwJdgR2OdD93STz3DwgH+
 NGDocMYB/8afYFTP3XQJms6YL4ADQfQ1digdSdAYi/wPbZ/G6OZjETxOM+iaS33aXteF
 osHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PqMs3a5YintB0gVdU2B3xyiVVe9JXV55Eno0UBh+s+0=;
 b=ieKMVPDAyj07TYgbK4U5FGpmdUwJJkSKByNQ4sqEPQ4p0pD26tAr/S4+SSRqsofq1V
 FLbmm/R2fAD9naq6V9g0JW4M68nPxBRG0JjUmJxc0IqQpT9pYiXaUmVYfLyDCCSeXZbm
 EOBkTr2m9+/t0wFnTcqe0giIw0XQAxjBAwsT5E+1Ln2B8Sa3hWDh4GhX8U4jrr2oJE4L
 22pLtQVfN1i6odKiJAB9+AT6RSC/gyWvEskVpmq2VKLRgrBZOVRlj6IaZNNpZGheX9Hn
 biPZ5nqkpZ2QrFI3ZlVPuuxMpEXqzdBQ8cop/80Pi2+B7cSonBknqKuuSbg2dSsl8DoA
 RFcQ==
X-Gm-Message-State: AOAM533P1CPhxVRlBSTOsTOisV6xoCiuaClmss3QFIZmGcGz704Ao0zA
 sO0/zUlOChBpcS9D2gJhY4dS5w==
X-Google-Smtp-Source: ABdhPJxeAaHpJ6zWscdJmwG7nQ9B4mr0a9rMgXVUoFV3ix4rZgEznulAJ6Mf1aChGhdcn90NgSZDvg==
X-Received: by 2002:a05:600c:3386:b0:39c:5b81:af9e with SMTP id
 o6-20020a05600c338600b0039c5b81af9emr2826341wmp.2.1654773549938; 
 Thu, 09 Jun 2022 04:19:09 -0700 (PDT)
Received: from srini-hackbase.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a1c7516000000b003942a244ed1sm26477850wmc.22.2022.06.09.04.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 04:19:09 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 0/2] ASoC: codecs: qualcomm move gain to S8_TLV
Date: Thu,  9 Jun 2022 12:18:59 +0100
Message-Id: <20220609111901.318047-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Move all the digital and IIR gains form using SX_TLV to S8_TLV,
these gains are actually 8 bit gains with 7th signed bit and
ranges from -84dB to +40dB

Tested on DB410c with Headset playback

Thanks,
Srini

Srinivas Kandagatla (2):
  ASoC: codecs: msm8916-wcd-digital: move gains from SX_TLV to S8_TLV
  ASoC: codecs: wcd9335: move gains from SX_TLV to S8_TLV

 sound/soc/codecs/msm8916-wcd-digital.c | 46 +++++++--------
 sound/soc/codecs/wcd9335.c             | 81 ++++++++++++--------------
 2 files changed, 59 insertions(+), 68 deletions(-)

-- 
2.25.1

