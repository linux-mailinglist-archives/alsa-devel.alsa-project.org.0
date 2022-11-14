Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D198627D5F
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 13:09:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07E67166C;
	Mon, 14 Nov 2022 13:08:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07E67166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668427760;
	bh=yd1af80mxxLmKRv4puSPs+aNXCGy01Bu0fwBEO/vXYw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d6SmMYjFJEaa3Y4AjPMA7VuVJQHQFFM1mP8phb4gHFKOU9NoENOyfTlR4BGsx4o8S
	 J9BZovRHg7Oe8VrgS7NRUU68Cq0F8jVCqjH9RBiDHzZZBb5v3k7yyGIiMFdiGZMndp
	 uN2/ChOYVAVjgocPYcmwGaw1wsludarMCSprIQdM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7915EF800B6;
	Mon, 14 Nov 2022 13:08:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C52B7F80431; Mon, 14 Nov 2022 13:08:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79CF4F800B6
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 13:08:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79CF4F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Sv/Ijmsw"
Received: by mail-lj1-x22a.google.com with SMTP id x21so12870003ljg.10
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 04:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UcgVzNNuvApB1tHFUDQ2YdnueyTykrC4lbR1LLNadUo=;
 b=Sv/Ijmsw3p5EPyzH21o4JoCbwhLqukVHHl52JjWYEMbnQCroLkF+xo4RTmyUi0HlV0
 fSTzYPiKy91DjCenKG/CBLbw7crgBOA/qCpn1agh4ACMe2MF92K8ozv1T2j2mhylToEQ
 WGBr3z+VMoThBd8Tal9GnyFkGK9DvIZDogd5GwEO3pd8rHm2aFTJQdz8lRN9n2N7/VDI
 b5isFpkPbjzj0J+uhDD+wmngMQOhdBLhUxIpehPR/jjy2S6e7oJK5035r7a2Bv/gz+eu
 Ga49PnJh+OzTA+4H1Tyf9dT96O8O8WsCKONajeq2Ghyzi4vx/0/rbRiLdrUdAf9MNeG9
 PCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UcgVzNNuvApB1tHFUDQ2YdnueyTykrC4lbR1LLNadUo=;
 b=nAJdGBjhoJQOw2VHC1ccnpogD43g1RgGAh6K24q/19dECb7Tj6Cy6gizoyZt1GeQcI
 ikwpA+CQaYyf3wCKQMCZDDt+EssK6h4QXw411TeT2ObjtIp9OGpDPDcdaiQNZcloehT2
 otu4Icrx0OXiDbJEt/adPGlgCRjQm9KzYctZAJe4Lm/wPa6/zwiCN4DjmONFppFS7yA0
 nkCNLTsJ7dEAJp0RuLBK9aLZsfbfhg2uQOZs3E27JTFcY1+oKlHaC8Ysbd8dlSSv0iMy
 IOvOU9shI8V2BU4dpQTdMDpPgMvslFHbmlwrYNpI/B61IVv0sRqES36J3fg+RD4cu6Cv
 uo0A==
X-Gm-Message-State: ANoB5pnPzkCOEtat3aCT4HfEQycOZvWviCXEfFKnicEpuX84bm3c1/L9
 pZgU19y6Tbs7mBKc4jA85LiIHA==
X-Google-Smtp-Source: AA0mqf5FiVxTLlfr5dE+/I1zUYvRmbOurrtiYQu+QcrvL066NEuXUGiKTuuxZ62qyDsdFY2dHX6Ung==
X-Received: by 2002:a2e:3e05:0:b0:277:31c3:ca17 with SMTP id
 l5-20020a2e3e05000000b0027731c3ca17mr3885380lja.523.1668427694295; 
 Mon, 14 Nov 2022 04:08:14 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a056512110a00b004948b667d95sm1800206lfg.265.2022.11.14.04.08.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 04:08:13 -0800 (PST)
Message-ID: <cf3b8355-a9db-9a4b-e554-43e829e49a4a@linaro.org>
Date: Mon, 14 Nov 2022 13:08:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 10/10] ASoC: dt-bindings: qcom,q6apm: Add SM8450 bedais
 node
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221111113547.100442-1-krzysztof.kozlowski@linaro.org>
 <20221111113547.100442-11-krzysztof.kozlowski@linaro.org>
 <cf66aa8f-4bf7-d9c0-e2ae-b6fced7e4948@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <cf66aa8f-4bf7-d9c0-e2ae-b6fced7e4948@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Patrick Lai <plai@qti.qualcomm.com>,
 Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>
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

On 14/11/2022 12:40, Srinivas Kandagatla wrote:
> 
> 
> On 11/11/2022 11:35, Krzysztof Kozlowski wrote:
>> On SM8450 and SC8280XP, the Q6APM is a bit different:
> 
> This is not specific to SM8450 or SC8280XP its part of AudioReach apm 
> which deals with both backends and pcm.
> 
> In old Elite architecture we had a dedicated service AFE to deal with 
> Backend dais, now APM does all.

Sure, I'll add it to commit msg.

Best regards,
Krzysztof

