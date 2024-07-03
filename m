Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2921E9258DB
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 12:37:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83718F54;
	Wed,  3 Jul 2024 12:37:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83718F54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720003063;
	bh=spgt4+9qxflitv4UZ9Bu05Oaf5uCcTTFwks7tVlyyyk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cz/ACKNrgoINwX0y58CYJQG17bqsJeffQtmMd1sIQetUs+KlvQJszrcnX8BEcW1dD
	 +X0T8h8+1J5IyBJuCLFbzpJEsKwgtzHTmGjyV82pDkyMPg60KaBEEmZGpPFzmcvwrZ
	 icOw6G9Cuq9fO1xXaL8PCLtAqMZgdGqczOHKwDRY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE778F80272; Wed,  3 Jul 2024 12:36:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99CD5F8061E;
	Wed,  3 Jul 2024 12:36:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1C44F8014C; Wed,  3 Jul 2024 12:28:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 151FBF80587
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 12:18:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 151FBF80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=K+PTQuUk
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a729d9d7086so87463266b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 03:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720001773; x=1720606573;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aNI2ho20l/ka7Xx+ilkgiXagRPnJI8t8zqq0ZnfN4sg=;
        b=K+PTQuUkpn5wrr1Ig17/bWTrZyqfJdLe1COwTrDsBEvqYGeUs3sDFHKqB5sqoCwJfp
         ESweC0I2cbTanGimUPNS01Sy49A+6EfyLTGLShxc5+DgiI+tza+9aUFS0LiAwzPbVuF3
         8+hvyZwx+WjnSzlD7jY+pcdu5krUnL7RuAeFTxcTLX7Wo08k3uVGRzB7nffY1/GpW/fL
         ObdEpSVVjmrUhkCBYi5Gz687y151X9bSp7ZNJXmYZIGGJ5w7Q1d7tSZ83FCUH7mNhymF
         PZjwGHh9GyodU/y0RMyd5DjwJrrWkn1MXOhg7IqG4P2GqdeNLaQJyMm3xbna72DXSd2+
         SbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720001773; x=1720606573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNI2ho20l/ka7Xx+ilkgiXagRPnJI8t8zqq0ZnfN4sg=;
        b=WWDjCsqRvh5L2hTHTh+wbjcjRC34/eXtPxIduWOa7gP7zNwh0qaGDSuVdVtBoKoOX3
         HjPlGdo1WyRp/X/BlL2t6z+ItCBOx7Ao5r7+pJ+Zs3DBKx33PHsHCl6umfsdRrnFJMyt
         dF5uYr3zQx0TePTWoYIBwVHhQngM1sTe6DCBBaTS0L3zhC+Wh/PA2z1YDPZtIsoJc4CT
         Udwp0tqilCf4OI3JnyWmccYQW9Z8r0E1171bVuTPbsLznPED0+esjYZHwLxBccZzhGnb
         uDNtaKtKPgKiuc309ipkY769Tbew2BmizJ1YremsNVmo/GVDIcVdcB7P/4ENjNzS/oVD
         EW9w==
X-Gm-Message-State: AOJu0Yxhx7NgdM2VQdqrDJKNHDZ7cb0z0iqmlFEFFbLZD6dO7PyoxaCJ
	/i4yGBXF0c+H/1ueeClg4zX9SNIa/kgtLdQpszt5n30fsYl64NJrT5i/AjwZf9I4xRiM6QTMG9s
	52G4=
X-Google-Smtp-Source: 
 AGHT+IFwvHMeiG1PusuzlYb/BFpwlNvMyLpyqwyCsLc+99Ds2Xl5m1ldYJi49+/zg/u8Ua72v8fKPg==
X-Received: by 2002:a17:906:4755:b0:a6e:f869:d718 with SMTP id
 a640c23a62f3a-a77a244253fmr95689866b.21.1720001772744;
        Wed, 03 Jul 2024 03:16:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab06565csm494291466b.103.2024.07.03.03.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:16:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 12:15:53 +0200
Subject: [PATCH 1/9] soundwire: amd: simplify return path in hw_params
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-soundwire-cleanup-h-v1-1-24fa0dbb948f@linaro.org>
References: <20240703-soundwire-cleanup-h-v1-0-24fa0dbb948f@linaro.org>
In-Reply-To: <20240703-soundwire-cleanup-h-v1-0-24fa0dbb948f@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1011;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=spgt4+9qxflitv4UZ9Bu05Oaf5uCcTTFwks7tVlyyyk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhSTizydiWsNiK1lACRmuFWUvFUfjVVfPft6QQ
 GqZjW9cjMWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoUk4gAKCRDBN2bmhouD
 1+OyEACYUGyGkiAqfA3VhOQNjJGbNBY3zshL3OR4Dp0zNhFrvG213/9aF09o5CoUJdjL9OVYlT8
 cULDGKCXWhkP7sj//ZtO64dP/cCN7IHWvboimzJjdyzFIRmOU0F8yPJLpWT+5H94tqeYscQXZbk
 hVZKYfKfY2UIDtdTU3fvoyve0UovB+45qay3vJoU++UFxKYkOG1dsDn7QrkCSfe8NQWs7SEO45B
 fp84f6O8pyMo/Ukj+yHj9r0y7LneFQsDHpGjBkq6dzYbnWKmc9CVzFXiuzBLL585b/PX7BQqr3u
 cD5tJDKSDoe4vF+JIN4JgMDoTKvw7Yud5ryMhjMN7EIhSVBkmLET0UIeOkwB//YGBRdev4rE8lV
 yHSuBZQF72sQfk/GOwl//j74lQbIjoGJbXz1JqaV9PXJWm34wz9saXzWcd8fddpmfo4eQk8gCwE
 7Ak8qXCX1cN8I23mA9Qm9aEV7WXzaNa3uou/yEyRMIeKIPjqsKslRBpYzViomKA2L2SzCA4FMgr
 bE6y04hLFzcFwlVJA5JtNirAuQMwiY5TZaCY62upQRXUPWa+YOAILvBCYA7AaL04W0dO4kDH9+4
 C8py4dpNKxikSvBMwPx0Isnori7dK3OWCOqjQp56TGnQYDbSuiy+rdNfJ2zqWBHl2T5PNWrPr/j
 54nNNwjTZSABXGA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: 76BEDNRDVVKO7URFSDBO7REGP6UALM2S
X-Message-ID-Hash: 76BEDNRDVVKO7URFSDBO7REGP6UALM2S
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/76BEDNRDVVKO7URFSDBO7REGP6UALM2S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove unused error path (label+goto) to make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/amd_manager.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 795e223f7e5c..4470fda83c5c 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -627,10 +627,8 @@ static int amd_sdw_hw_params(struct snd_pcm_substream *substream,
 
 	/* Port configuration */
 	pconfig = kzalloc(sizeof(*pconfig), GFP_KERNEL);
-	if (!pconfig) {
-		ret =  -ENOMEM;
-		goto error;
-	}
+	if (!pconfig)
+		return -ENOMEM;
 
 	pconfig->num = dai->id;
 	pconfig->ch_mask = (1 << ch) - 1;
@@ -640,7 +638,7 @@ static int amd_sdw_hw_params(struct snd_pcm_substream *substream,
 		dev_err(amd_manager->dev, "add manager to stream failed:%d\n", ret);
 
 	kfree(pconfig);
-error:
+
 	return ret;
 }
 

-- 
2.43.0

