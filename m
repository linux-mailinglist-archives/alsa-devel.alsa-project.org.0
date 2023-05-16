Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6327042EE
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 03:32:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3ABF741;
	Tue, 16 May 2023 03:32:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3ABF741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684200771;
	bh=P8C4hO4gnGPwckHRtWXLRR1q1YsItG66hSsEnDwaX1g=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=nC4APOajne9kWtsFL1Sscby7lE1X0my07k7XrWGpaJbt9Kua6zUeIoWO2BPQwjCq3
	 Ab52KwJy8FyldjKxiF6zwL5hHxX83UPCliB5PuY/LYrrUdb5kd3cJl3HRJ0wCqyEjH
	 jUzSJINdKbBWYMR05jAPfwOyHGUg4YVWRuIzAhcI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7098F8016D; Tue, 16 May 2023 03:31:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 998B9F8025A;
	Tue, 16 May 2023 03:31:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36C62F80272; Tue, 16 May 2023 03:31:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0CC75F8016D
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 03:31:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CC75F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=zKnXAmMf
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f1fe1208a4so12596012e87.2
        for <alsa-devel@alsa-project.org>;
 Mon, 15 May 2023 18:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684200706; x=1686792706;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OcXwAN+isoQ/mFzkihbW/wozjleZFihqA4ZCS2Bjuo4=;
        b=zKnXAmMfvexSrZm7W8TMgsPtCn5QEHM5aBJoXPKD4qrX72JMnv2T9AOFwf0aFc7K9C
         gSEauFpNJFoWR6hXeYqQVacHaOLQ4+tFoqQJIasrEvmRJQoWPfRlsJ6afyGsQ8XSPcK/
         /0UuoIlcekhAY6kKVnoQoOKTsJdVXPpcKQ4snBB6RZfk+rkgDKzK4Fga5rCSybB+8G0P
         TOIA+n+O39JO67Dpj5gqEUbMWxeOsFGnrat1jWpKTZiDC5n+LUgME8qDR2SZSuld/ouh
         pdTFhqNhErSuXg8yvjcalR2iKOLHNPQkaExdz6F5InCuETDVtqQt+082+N9hjT+YAD+H
         HyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684200706; x=1686792706;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OcXwAN+isoQ/mFzkihbW/wozjleZFihqA4ZCS2Bjuo4=;
        b=bxXMP6JfF+MSnyknqbkm8bJgTlJq6dj+UEP0x+I7ngvrRZPNBduVFSBhI19njYkyqn
         FumUdzHXBRGvSAGSOVnzjlZ68x/XyCS+hxC0pfA4Xwzn+JlTRGXiWAERgwKePmDChtC+
         h9E7GcPuRzWjkT+9OeXhCBGzg0jWgLUS69mW4gsvGIqggcKP39jqTd3MGf5pRXE66ghr
         K+1C4pKZZV77hoCgNLXr0K7MfaUi95RZebssVnf0iX/7V0MQ2c/ezyUIIa7oOnPxPDBq
         ZjvfQwM9EGnYxkROq0AHty0bH3mu+VhiRC6kvQRQ1gJp10omV4OxcEncgoXmuqpKaZf2
         lDUQ==
X-Gm-Message-State: AC+VfDwHGhzHe6nwt46ddQzQ2I+IySt/bSc4ZCIptuSSuG/lI6GlIViZ
	Z2qUz0ah7AYrnGmfRPOp0srXkg==
X-Google-Smtp-Source: 
 ACHHUZ4yNX4QWy0thWooKiccgAyqi3lrT98efHiZrzU8iVjPCnQrM5Xx71XXDYz3DeXa5St6j6kQJg==
X-Received: by 2002:a19:550d:0:b0:4ec:a4b4:4731 with SMTP id
 n13-20020a19550d000000b004eca4b44731mr6949601lfe.68.1684200705829;
        Mon, 15 May 2023 18:31:45 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id
 b7-20020ac24107000000b004f253f6d4d0sm2813502lfi.223.2023.05.15.18.31.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 18:31:45 -0700 (PDT)
Message-ID: <de735250-5661-0011-0650-a925b528463b@linaro.org>
Date: Tue, 16 May 2023 03:31:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RESEND PATCH] soundwire: qcom: drop unused struct qcom_swrm_ctrl
 members
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20230515132000.399745-1-krzysztof.kozlowski@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230515132000.399745-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TCMWHJSOQDENIL66LCPGFVYIMEOWNDRD
X-Message-ID-Hash: TCMWHJSOQDENIL66LCPGFVYIMEOWNDRD
X-MailFrom: konrad.dybcio@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TCMWHJSOQDENIL66LCPGFVYIMEOWNDRD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 15.05.2023 15:20, Krzysztof Kozlowski wrote:
> Drop unused members from the driver state container: struct qcom_swrm_ctrl.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/soundwire/qcom.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index aad5942e5980..ab1098ec56e6 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -187,12 +187,9 @@ struct qcom_swrm_ctrl {
>  #endif
>  	struct completion broadcast;
>  	struct completion enumeration;
> -	struct work_struct slave_work;
>  	/* Port alloc/free lock */
>  	struct mutex port_lock;
>  	struct clk *hclk;
> -	u8 wr_cmd_id;
> -	u8 rd_cmd_id;
>  	int irq;
>  	unsigned int version;
>  	int wake_irq;
