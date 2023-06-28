Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D860740CA4
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 11:25:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E90387F1;
	Wed, 28 Jun 2023 11:24:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E90387F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687944338;
	bh=NHP8ZVNDVUrF7HNZQ6gA572Iap4jljiRyaG+DKznGd0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bEMKOPq4X5Zw6XQwjwChJ6WzWDkNFgyP7Hd3Sl62bZMmmNpTEeG0a4vbvP2kYiyFh
	 Ce4Urt00nd7Gfv6grJNElBdiet/a1Xn9mKb9LCeWG/tLp0fK9HS3uBJQetQsRsO44R
	 Cx3EZf4D+2JyxKVYpH510/rLq522jph7IJE/fMhI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACFEEF80246; Wed, 28 Jun 2023 11:24:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 389E5F80212;
	Wed, 28 Jun 2023 11:24:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E51A0F80246; Wed, 28 Jun 2023 11:24:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CC8BF80169
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 11:24:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CC8BF80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=fueU1DUL
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fba9daf043so14326365e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 28 Jun 2023 02:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687944269; x=1690536269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wzKXpMccA6UrwHtXvOGSFvI/x46V/z1bpRu3rF0Fgs0=;
        b=fueU1DULpIywX2DaDQQk0rGXg3PtSBos/iW8JpD9Vgn8gH+xHWp/h0QRyukEI7O19n
         zm6aK/HjiOtVtDnYJOaFMUvOhdbBp42M8K0RL1WMTCaWgLu7TuX6X0HSUl8E5ohHg/cJ
         7hOyN1YGptCx7M2Kg9BpiVSukjKpVpaQeT/dqBlFAqG01ISxfbd1sS3ab+mmme8B95r/
         Fw7lYhPsitYBBrKLtJwiFm4MJV1MGMWOxKVo1KPOV6rKYvO0eq7GQgA1vRUPQ/3ZKX4I
         PGIgGxKgUefcJQV08RH9cHKNJP6V8+ERX2wOcQIQhtZjeSbSgLcDzuGTv91NBllPb1ss
         DWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687944269; x=1690536269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzKXpMccA6UrwHtXvOGSFvI/x46V/z1bpRu3rF0Fgs0=;
        b=BMB6+ZcTMdemf1nIFEYU1Zp1KOHIFDrztQ96JgPMEMvCmMq/6AvXGWhOVI01tIHRZE
         9e7ZsAT5N7ywoF9mpGXmI0J+o4xtP/Awrxzs7wn1tj61/+4MOwA3rXYZInooGEn1BPva
         7GPSirTOyHkQX3kPYd7zdLNoaU8XHN4NlWVZMEb4TiGelWVEwdIpgxCaqDHlw37Lxnbk
         fZEi/1OuryVMgQxoBCsq11buIAnhtwOgveyWUuR/YHRe39OymbnMqLLmNOgv7yC6GEEI
         8F/7HwX8KSXjnqA+dFBFLT4LIcb0sS+ySztWNne0sx8UEK0frcQbDB6iDRdxzIrC7G8G
         o1Kw==
X-Gm-Message-State: AC+VfDxxaXJvmaXu02OT9G7Il4wvzOL3DICn+JZlFLJpkYh+Yrv2wKJA
	bBBYUDdgl4eMS8DP1+3696O7vg==
X-Google-Smtp-Source: 
 ACHHUZ54XNFWh70xItwrsXJjQNsNfbm1HM+SarGY7nLeMvIhA+uyrvqHtA6D65tWQXSWo7WG4YGACA==
X-Received: by 2002:a5d:4e50:0:b0:313:eb47:b7b3 with SMTP id
 r16-20020a5d4e50000000b00313eb47b7b3mr9446659wrt.66.1687944269482;
        Wed, 28 Jun 2023 02:24:29 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 o18-20020a056000011200b00313f9085119sm5500091wrx.113.2023.06.28.02.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 02:24:28 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Cc: johan+linaro@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Stable@vger.kernel.org
Subject: [PATCH] ASoC: qdsp6: q6apm: use dai link pcm id as pcm device number
Date: Wed, 28 Jun 2023 10:24:04 +0100
Message-Id: <20230628092404.13927-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: G3GP5EPN3SK7BCCMIK3IQMIGZNM3IK7J
X-Message-ID-Hash: G3GP5EPN3SK7BCCMIK3IQMIGZNM3IK7J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G3GP5EPN3SK7BCCMIK3IQMIGZNM3IK7J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For some reason we ended up with a setup without this flag.
This resulted in inconsistent sound card devices numbers which
 are also not starting as expected at dai_link->id.
 (Ex: MultiMedia1 pcm ended up with device number 4 instead of 0)

With this patch patch now the MultiMedia1 PCM ends up with device number 0
as expected.

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 5eb0b864c740..c90db6daabbd 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -840,6 +840,7 @@ static const struct snd_soc_component_driver q6apm_fe_dai_component = {
 	.pointer	= q6apm_dai_pointer,
 	.trigger	= q6apm_dai_trigger,
 	.compress_ops	= &q6apm_dai_compress_ops,
+	.use_dai_pcm_id = true,
 };
 
 static int q6apm_dai_probe(struct platform_device *pdev)
-- 
2.21.0

