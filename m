Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8B889FF29
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Apr 2024 19:53:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6391C227E;
	Wed, 10 Apr 2024 19:52:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6391C227E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712771583;
	bh=Lfmagm0VU/ENSbzyTlDC4+jjVBPt67IIy9krA8RAvHk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=IcjSzbmzfn7WujW/+hrHIa4kqTOFpJRvlisEY+cPaP7ZLHlUvR2kwsy2xh73itl2U
	 6V/zmu+yaoo3GHNWtA2OfyUXjv7sVfiBRQpkr9bJdi6tQc2NhO9m1bCeLVdeTkel5/
	 DJ6cfALGerez8ovFuKdV1lHaUqZ4sHd6AIFcRZec=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CB90F805A1; Wed, 10 Apr 2024 19:52:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DBBB8F805A0;
	Wed, 10 Apr 2024 19:52:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EB25F8026D; Wed, 10 Apr 2024 19:52:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 521FDF800C9
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 19:52:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 521FDF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qB4guByp
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-516d536f6f2so5973928e87.2
        for <alsa-devel@alsa-project.org>;
 Wed, 10 Apr 2024 10:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712771538; x=1713376338;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/JL57b8mZR+eGT4B7pLnLps2t76k3zBdlXlsnrQHptw=;
        b=qB4guBypddOaB+xSHt+Kleq0NdBT8WYoOCfYttsCxXGVsvThRH/6c0B1MNdkqkRO+L
         dkigKycR4qFdnqo65VBSw/sUnMr70wQkmRy2hy9fSp6/fsxpmap/+oMXYiL94H1jDYPB
         QzjhJQLYCpJhUJzBQ2XzAnEBUKy9Gx6Lg76DTNlTDlRNDpS9KOTWfEhmOPS3IhlUCAX2
         gOMBF1yFJufqjikWEAg+PY0Zbxf6NiPE9JDu+WoMJddgyEidqajLj1SZyPQpfWRTudhD
         6aItweJAtnFbz6BXO0BlxkndPgm+Rum9Sd/6RkfhCoHowA7cx5XLDhVteIjNe6u+8IFN
         QUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712771538; x=1713376338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/JL57b8mZR+eGT4B7pLnLps2t76k3zBdlXlsnrQHptw=;
        b=nYw3Vu+2p1Fj0K6cYgEiqK/0ikAMqUVE7sP5YYdBLjkY7jzvDV3dNHFCCrxz8PnQDW
         rLDioevPi6PTUWRPVhSwtiKO/jO7IjXJvlH7z8+J3sk11/e4VcoUekMqp5A8QHBc84zK
         K7hFQk0xht9tHK+v9/mb5ffPBHKHkej9h3Ah0CM6byzFEr+HbQ3vrjqwm5T2qKFBStiT
         1exlkviwxAKxee688S4aNM08radvvez02mX66w4gTELkxrIiqAqSCABLsbckKtJ2YEyf
         47QTLvvw4dsmDzYV47rEjlJ+KVOfGAnlljaANqyj7q5FxINfu5/QV0o94TQeB1MrTKyK
         erKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyCw8NC4n0orUUs9SDOtN4ClMh19cI8i0g21t2cVpwFsEkY5M7TPuHAwoWCLGtqyoFodcFpVjPD5qLUSuLKmJKIWCtyU1f2bD8+vo=
X-Gm-Message-State: AOJu0YzjoRqw552+m0YuRvxY+MifmHZKqTEGoi7Vi8bt21mRo89m72A9
	z7SehPk047xjFtpsNDuLFh7J5ulykq1zGf5gdI/R7GwiypzK8QbPZRPgYSWQ+Z0=
X-Google-Smtp-Source: 
 AGHT+IGyvTFRBvbpgzMy5Z3pW9YsMbWGdgBzXAu6U2+ci9OErZcBCoTcJlAyYiknD6FJK5MgHZOmpw==
X-Received: by 2002:ac2:5a09:0:b0:516:9f03:6a9b with SMTP id
 q9-20020ac25a09000000b005169f036a9bmr2225221lfn.4.1712771537783;
        Wed, 10 Apr 2024 10:52:17 -0700 (PDT)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id
 t18-20020ac24c12000000b005158558022bsm1909780lfq.288.2024.04.10.10.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 10:52:17 -0700 (PDT)
Message-ID: <66a122ae-0a5e-45f3-b572-c741c828cca3@linaro.org>
Date: Wed, 10 Apr 2024 19:52:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] slimbus: qcom-ctrl: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20240410170129.248361-1-krzk@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240410170129.248361-1-krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SNH2L7O4NXOZCLLG3TMA7HCRYC33FMP3
X-Message-ID-Hash: SNH2L7O4NXOZCLLG3TMA7HCRYC33FMP3
X-MailFrom: konrad.dybcio@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SNH2L7O4NXOZCLLG3TMA7HCRYC33FMP3/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/10/24 19:01, Krzysztof Kozlowski wrote:
> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.  Pin controllers are
> considered core components, so usually they are built-in, however these
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
