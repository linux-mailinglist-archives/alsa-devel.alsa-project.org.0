Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD52E6D9EF0
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 19:37:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB781F58;
	Thu,  6 Apr 2023 19:36:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB781F58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680802642;
	bh=Gvqyjto9FSIpPAtt5NaMqRegI1krvu4m1PR4Q1dKSMo=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D+IOYEYM/oEgFeazmg74dP4WqSG3K3cqqI8P5sX+HGFnU9fC8xtEsWGwUDnHql0Dg
	 VJRq10sTZMqcrwFwXbmNbQ3ndKXrSRzNQz/M5ppVgr+J5zVii7DHTtZh/BmynqO6bw
	 ZLNool9pvCL7Bns16OiErLktaE9H500VTej13UJs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 412D2F80448;
	Thu,  6 Apr 2023 19:36:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A039BF8051F; Thu,  6 Apr 2023 19:35:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51572F8026A
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 19:35:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51572F8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MKm4AOGT
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-50463de91a4so431707a12.0
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Apr 2023 10:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680802554;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7i2QvlEeq0f8Kho6kUdltNVYvBrgLW2E9JiTuEKxfZs=;
        b=MKm4AOGTLwGlueANVENIn0nR2wtg7L+v1hQStFlZ73HNy3pdp8EZJ3l0VpdlgHjFU4
         tUy7NC3EO+4uoLwrQBuLq37mvrVwSE14kXEyQpq2HNX5VfC+AZyhPJCquSaBE77Z8jQr
         9VskwtzCdp+XyI6o/Wco77i9zoUiHchTZ44SiYssvAPzD5/n7gtNG0c8k07l2dEPno1d
         29c7g807nT7aHKuXoEpkJvjDg00A6bIyzvEQoQ2wbC6FmBCemLnkw1yVjtMX2nl++akl
         lZQ/QuUV0dzrVy5lOUNcfJaHyzQER+JC2qeZia2f5mG6bl42UVIdeZ9K1Pm66FAEhwbn
         zC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680802554;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7i2QvlEeq0f8Kho6kUdltNVYvBrgLW2E9JiTuEKxfZs=;
        b=Py1nvw4ZVpjV+VwZkgOTD2SAQGKrmoGe1Wfj2TVzifS7hYQ0cGRWTzcQbyWNSor41v
         mexXwHopVs/4jAhaUJUIkIsCORhfb44GxnmB3E4IEn7QVVc5zCLwN27Edm0E2KL1r45c
         B9PE7SLhtveKnVWGVafI9qES8JMcCpPOY6OMmhNv932F5H9Ri65NCZBKIuB/WsCA72Dm
         DiuAKht4Ih0WiS9M+eE0wWSYqLazz7fsV77ynJcnJ6NakFRBSQ6PFw/bd7vMLdz8zVz1
         FvAWY8YtbhA5AWVzi0/b1RrIAxUOKPpkice1B6U80pYxsxQPiQQ08yuopU4zx+vb2mI3
         kLiA==
X-Gm-Message-State: AAQBX9ctOLuEGgchtdI+SlyeGZfkb4dqlB+HQ4T1jO6X94FUKfipDg68
	WvKxmOrsn5LJs7dTgcjRkDiN1g==
X-Google-Smtp-Source: 
 AKy350a/aaAm6K8iM1M3qFFIDK/O2RjN3j1Iys5Fs7jThyWFk+KSAKIAAhYPpj/eddvmy0nrVdohkQ==
X-Received: by 2002:a05:6402:1857:b0:502:24a4:b0ad with SMTP id
 v23-20020a056402185700b0050224a4b0admr306047edy.4.1680802554378;
        Thu, 06 Apr 2023 10:35:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed?
 ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id
 v30-20020a50a45e000000b004bc15a440f1sm983935edb.78.2023.04.06.10.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 10:35:54 -0700 (PDT)
Message-ID: <7c1d4762-469f-0bf9-3482-ff99bc5840b0@linaro.org>
Date: Thu, 6 Apr 2023 19:35:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: dt-bindings: wm8580: Convert to dtschema
Content-Language: en-US
To: Saalim Quadri <danascape@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 daniel.baluta@nxp.com
References: <20230405205025.6448-1-danascape@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230405205025.6448-1-danascape@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GYDCZBG5YR2V2TXXHPFGIH7X7DFH35G2
X-Message-ID-Hash: GYDCZBG5YR2V2TXXHPFGIH7X7DFH35G2
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GYDCZBG5YR2V2TXXHPFGIH7X7DFH35G2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 05/04/2023 22:50, Saalim Quadri wrote:
> Convert the WM8580 and WM8581 audio CODEC bindings to DT schema
> 
> Signed-off-by: Saalim Quadri <danascape@gmail.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

