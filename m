Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F888ACE9E
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Apr 2024 15:45:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E827B105F;
	Mon, 22 Apr 2024 15:45:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E827B105F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713793551;
	bh=bLGXgpxnbSKLkCQguZ5XOqrsE1dxN3y9EhIB6LMNF4g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rFYAJvF+UpLjY/IvuDvSPGZW+lZNXGT+HsO8URJyhUodJ7KwQrxvLIwManZg1kPVI
	 Q10Zi5UyKcUaf6Lx/h+moYpLpP+e6XWye9HFbFDjXvi7Cq08cZCxo8E3SMsEXZQyfp
	 JSoPxtexxSkuRFlz4FchehgSW465tEnkbHH1YnAk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B71D5F80632; Mon, 22 Apr 2024 15:44:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADF80F8062D;
	Mon, 22 Apr 2024 15:44:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 524B2F805D3; Mon, 22 Apr 2024 15:44:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF770F80579
	for <alsa-devel@alsa-project.org>; Mon, 22 Apr 2024 15:44:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF770F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ssT6d2rc
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41a0979b999so9792345e9.0
        for <alsa-devel@alsa-project.org>;
 Mon, 22 Apr 2024 06:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713793445; x=1714398245;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kwADMk5cdAVshWhjo8kiL5c8AnuAMycon0bxlwOriw=;
        b=ssT6d2rccFCGNKMmqMurRV3JwMqCJwq3Q1NFEb4YjsQZKrip9Q5jljTzdE1XcN6zej
         JKxF3VPgC5buN5xm2VDFPxlL5UTYdfuhXLI6yFJ4DjrDQIQ3/83ThXvCiBO/VhPdA/+/
         LZGOvp6322nrLHAKivOnzQGVfYN+NTbcUyughqPrhNF2L9NHNBVjn3FE6mBy1UXmHvxd
         jdnQwtanDyiX3/sL5d0q83Pe3pF4QYl1trvRhgUvxd7uFsWqfFGIG9vcVY6OMHcry/Ok
         Mg+AmyRuKaI3Q7IMjkckT2jaL6wvplxIdjDt6iEF3KQ+WRMG8icZ3z6HgvK0GmbJA7i3
         d7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713793445; x=1714398245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7kwADMk5cdAVshWhjo8kiL5c8AnuAMycon0bxlwOriw=;
        b=JAoKRsBk3Oo2sc/yXLpCXCjK6vIfUuvF4anwXPSNoYza2fAoOB1grLCYmNKbXwHUYw
         iAi+JZDpmTQaMeUyKf/hjNxbBrrTyEZOS88hlkY3g8Ymjyp3UKxCMbcYfC6sA+czxJC9
         IpeoEBuYzrhp0XggD29HSz5s7rZXgBY470+IUyYrKq2Bu7DsW+ZkKITkhxpDyMZ7mrH9
         AAC564gpEqkj73mrOI1VRGUzjFoNGVygjtd3Sd7gBaWsBB7mUIOC4fmH7XWd3alngIKQ
         gYHCNhKtkyTZj3dZ8jV8Drs3oNlcIospa//mk+3ODns2BMgUzLtMDAX678BOnbQlzeEa
         b5Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhPpz8+Z1Y2596oaF8ZZlye10qYpvZAubKyQyLk8RbJG6V37P0sRaNWZMnkObNg1cSIzZ41RXR1sM9WZ8N0d6TlmYYhYi4ICX5+E4=
X-Gm-Message-State: AOJu0Yzgt7SCyYKkPTyql0FFRDy5Nd53nGo8DJTJSERXxRW7WHhOMrPe
	cnNfjoJ2ZIHzyGgFU7LdNBRTtKaUzjidDUsgPBRxJ2CPZt5MXkmXxxxz5VFPblU=
X-Google-Smtp-Source: 
 AGHT+IG4kwKfyMpRuWXlxFeKbxQWHJY+DwiUbTneZBOl7/zDE6gyAXrGAyk7QNgJ9pYfFQ1pPWWLuA==
X-Received: by 2002:a05:600c:4688:b0:418:a2ce:77ae with SMTP id
 p8-20020a05600c468800b00418a2ce77aemr7466632wmo.27.1713793445132;
        Mon, 22 Apr 2024 06:44:05 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 g18-20020a05600c4ed200b00417d624cffbsm20731069wmq.6.2024.04.22.06.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 06:44:04 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 4/4] ASoC: qcom: sm8250: fix a typo in function name
Date: Mon, 22 Apr 2024 14:43:54 +0100
Message-Id: <20240422134354.89291-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
References: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XWBH65UOJSM54YFEIID6DGCSUUGT5WIQ
X-Message-ID-Hash: XWBH65UOJSM54YFEIID6DGCSUUGT5WIQ
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XWBH65UOJSM54YFEIID6DGCSUUGT5WIQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Fix a small type in the function name as its confusing to see a SoC name
that does not exist.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/sm8250.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index d70df72c0160..9bd159b81d69 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -70,7 +70,7 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 	return qcom_snd_sdw_startup(substream);
 }
 
-static void sm2450_snd_shutdown(struct snd_pcm_substream *substream)
+static void sm8250_snd_shutdown(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
@@ -115,7 +115,7 @@ static int sm8250_snd_hw_free(struct snd_pcm_substream *substream)
 
 static const struct snd_soc_ops sm8250_be_ops = {
 	.startup = sm8250_snd_startup,
-	.shutdown = sm2450_snd_shutdown,
+	.shutdown = sm8250_snd_shutdown,
 	.hw_params = sm8250_snd_hw_params,
 	.hw_free = sm8250_snd_hw_free,
 	.prepare = sm8250_snd_prepare,
-- 
2.25.1

