Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C9A756E2A
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 22:25:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84A2BBC0;
	Mon, 17 Jul 2023 22:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84A2BBC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689625516;
	bh=RzlAtXeTP2DByvra2ai81HQL226V9xT/WyWThWxv+MA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eWyB00BSfU/5523vbFt4/xk0+bQyi7VHZp915pD8cc+e0MmpUaweZu+AOSMnk2+e3
	 lZYqdw7NxgCI4b2l3b17Mb3nwCT7R76khSPXwrsvtPTbDFokw+gnE6JxZRyCvue2d+
	 8g1xCA1WMAVm47FkdE8Iur/LA30xlHgPpiDp9kts=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7C32F8032D; Mon, 17 Jul 2023 22:24:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 118FDF8032D;
	Mon, 17 Jul 2023 22:24:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84B42F8047D; Mon, 17 Jul 2023 22:24:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87353F8007E
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 22:24:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87353F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Q8fqmZj/
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fa16c6a85cso7787695e87.3
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jul 2023 13:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689625443; x=1692217443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WPmxEAn98qat39xVVQIKzAUFqZtNFTpShvS5B+Il20g=;
        b=Q8fqmZj/nwim2uqP9c4Pq+vL0vXAHQcvTm9SN8fMiI2W7vtxtSmYu5UyI1msnJ/ybM
         eAGpk94XUc2OZv6QdcBatakQRuq6Pfg+j7YdglFlux67eJeBgGGLX6zxgzBxnQ9mtULz
         g7egOxbpkMRADaYHVqLg5mbGgGSZG27jnrhwdwRuCE3gTL5Rc+2vxOb/zn8FQxY9ySSK
         cwHaQd3v+m5N/siROLzDjA5fwLj8w4yZCx6gj4ZWv63SlfLa5bTNSqfgVGjjgIHcM9ea
         VMJmC4K7i2cnKRyF7FLWu3e+TmiC7ozwYIsiIlzY/rf+ecDJs4rLj1cz4UixFw/0j5zr
         yhog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689625443; x=1692217443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WPmxEAn98qat39xVVQIKzAUFqZtNFTpShvS5B+Il20g=;
        b=WjtERMSvHpxfDjvtLjJHbaQQNOoVafCaGU1qQ/nVhLMvuLYxYX8KGb5DzDQeczn5CA
         QiVaJBoHaZ+QV0yJicKnB8m4cGItzS/gErtE3+dtwMQgwmIL7n7HfdMqoUuewVS6Bba2
         0qmK6vJ0/LDA8wU/rgNbpVIlzjGo5WunVGMBkhDANUwxPEfIUQKlZjVAudtvWYVuoSy5
         6C6GkEJjYnRhNWpoP02l7DwXKv4evQxVcDpdxgyXcp/CTQs8D3Hn5vYY0dDL6W4ltcsX
         hsMSehIbii84oi/24xFQJ+mCc0F8zTMccbXXZHZkSghDnYvwu1aNxmPZZ9wDvnZ498TJ
         bnEg==
X-Gm-Message-State: ABy/qLaONm6pp9xRJCn2B6gq95wnmQEkdc+Ows3tNHunBeMvx2xTJdeW
	bQO82TjQ41jppf9qMUhi8TS4Ug==
X-Google-Smtp-Source: 
 APBJJlEtcmakKntg4CRzzMflCj8rCNgTL3VCRsDKprRKPbcDg7cEv/oMh5h8oGw8JyePosIHuY7FSQ==
X-Received: by 2002:ac2:4f12:0:b0:4fd:c78d:5419 with SMTP id
 k18-20020ac24f12000000b004fdc78d5419mr1637394lfr.8.1689625443174;
        Mon, 17 Jul 2023 13:24:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id
 v16-20020a056402185000b0051bfc85afaasm87535edy.86.2023.07.17.13.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 13:24:02 -0700 (PDT)
Message-ID: <192fa604-5fe6-c5c2-7fca-10f3a271b640@linaro.org>
Date: Mon, 17 Jul 2023 22:23:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V1 5/5] ASoC: dt-bindings: Add schema for "awinic,aw88261"
To: wangweidong.a@awinic.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 perex@perex.cz, tiwai@suse.com, rf@opensource.cirrus.co,
 shumingf@realtek.com, herve.codina@bootlin.com, flatmax@flatmax.com,
 ckeepax@opensource.cirrus.com, doug@schmorgal.com, fido_max@inbox.ru,
 pierre-louis.bossart@linux.intel.com, kiseok.jo@irondevice.com,
 liweilei@awinic.com, colin.i.king@gmail.com, trix@redhat.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: yijiangtao@awinic.com, zhangjianming@awinic.com
References: <20230717115845.297991-1-wangweidong.a@awinic.com>
 <20230717115845.297991-6-wangweidong.a@awinic.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230717115845.297991-6-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: EK7P3PJXHNIJQVRPIEBW26MYLDMKBSKC
X-Message-ID-Hash: EK7P3PJXHNIJQVRPIEBW26MYLDMKBSKC
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EK7P3PJXHNIJQVRPIEBW26MYLDMKBSKC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 17/07/2023 13:58, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> Add a DT schema for describing Awinic aw88261 audio amplifiers. They are
> controlled using I2C.
> 
> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>

...

> +  compatible:
> +    const: awinic,aw88261
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#sound-dai-cells'
> +  - reset-gpios

I don't see any differences against AW88395. Add the compatible to that
schema.

Best regards,
Krzysztof

