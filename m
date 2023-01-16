Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7C966B908
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 09:26:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC9AA3A31;
	Mon, 16 Jan 2023 09:25:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC9AA3A31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673857582;
	bh=GGD42bbUlLM+7Cx150f0f+2JSV0MWP9UCuV7Hzzlg9s=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ma9Y2yar/noredYOM+9jLtrXdy3B5uQHUAyntRqjq+gcp7+mijq+zl0JoGpVAjRQ3
	 NUGcNm9K/oo6Em4TSh0e679V3iYQTS1rXcUNZzeZBAsyNZFQqdk+YROfpANPe+hrX9
	 hfKNczudcPow03CaEuWUXBy2b8vDUUs7jM0rpNyI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63008F80083;
	Mon, 16 Jan 2023 09:25:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58C05F8024C; Mon, 16 Jan 2023 09:25:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28168F8023A
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 09:25:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28168F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EAFnmAHx
Received: by mail-ej1-x635.google.com with SMTP id hw16so54382001ejc.10
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 00:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OfP1JHVNCS0456IKpFjP3Pk6rA3+kqXNfrlqK3NTP2c=;
 b=EAFnmAHxopufnDRyld6mMSGnVXq7tLGQjPUkWv8dQkTgZ1iCU2HprHG9Lw4V5Oyuwf
 mjAazPXrNSK3LHuU46ieemv+MUD150SQ+zvR7wkc1owkKzxD6U41SaNNEPtqOSj/INrD
 ZMxKCfSSp+KTvKTNET+hJ8InvsOeUcBRFXubFoRmP/PfiFLwtxT5+eR84jy0q3hpwB40
 vi80rDpEVj1Cj0BbXeDBYKdMCh1fmBFW9H06wLnSHgC0WrL4ODBRvPc/VThnmCIEnZWN
 uOPxU9asfyQzG6iVrOD7MmtADw/qRh0qrPbFwemSW9vfQwUkGE0JmktwkfrZ+hAnLV3N
 i/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OfP1JHVNCS0456IKpFjP3Pk6rA3+kqXNfrlqK3NTP2c=;
 b=xMGZif6MAiwR96nc+bH0WzpwNUkM8O65BsJKerZXMvCO6iGJQ2HLqmDf4L0wyEpjM2
 ueAExc349hNih4rtVh6IVIfGximLmVjB2qfjMOSk29zoGSn627+F4RW3z3S6YnHeRGSX
 tH6jCPv19FyKK86NtUMyWcnDgVgsj5VQIIMcHXIusr6RQpOtQqXAlKdM1XbFt0ashDVN
 UAPUYvTgTiJWtsgN9HbXn+/upb7kJsQk4rsJuAwLhJ8g+FUx4ScOs457UrIWkh/+Fp+m
 kvdpMalE8hTWzOpKrtVVAMBgzJYBuSRtWDfaKu6MWWyBWTLSih2BM84fydPXavDtvwqF
 RhyQ==
X-Gm-Message-State: AFqh2kp/55Ad+du9mrniEKzsQ8EfuLUvXD7GUeplV2CCMLf5AdyUetN2
 DGW6fRP89+eBaZzElWisIVtTzQ==
X-Google-Smtp-Source: AMrXdXsB9ZY2cNrkIqpaNiwD/X2L9RgJZq0EdxaDNRXBHa5Ps/DuZO7VgdxqCnmXBaNG0BOErYxjQA==
X-Received: by 2002:a17:907:6d93:b0:86f:356e:ba43 with SMTP id
 sb19-20020a1709076d9300b0086f356eba43mr6447262ejc.18.1673857519341; 
 Mon, 16 Jan 2023 00:25:19 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a50fb07000000b0049cbd334b13sm3318412edq.29.2023.01.16.00.25.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 00:25:18 -0800 (PST)
Message-ID: <ec92be6e-8e3f-cdbb-cd6b-51224ea47e76@linaro.org>
Date: Mon, 16 Jan 2023 09:25:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 4/4] ASoC: dt-bindings: add entry for TAS5720A-Q1 driver
Content-Language: en-US
To: Alexandru Ardelean <alex@shruggie.ro>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20230115193347.24190-1-alex@shruggie.ro>
 <20230115193347.24190-4-alex@shruggie.ro>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230115193347.24190-4-alex@shruggie.ro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: steffen.aschbacher@stihl.de, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 15/01/2023 20:33, Alexandru Ardelean wrote:
> From: Steffen Aschbacher <steffen.aschbacher@stihl.de>
> 
> Add entry for the TAS5720A-Q1 driver in the dt-bindings doc.
> 
> Signed-off-by: Steffen Aschbacher <steffen.aschbacher@stihl.de>
> Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

