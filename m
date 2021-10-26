Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0524D43B0C1
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 13:06:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FCAE16BF;
	Tue, 26 Oct 2021 13:05:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FCAE16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635246363;
	bh=PwETHLPViagLlEUm7+r8gVR2JEBGbBquQL6MbYSCEQU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kB0wpNYnxXMnY2fbMNtGYAEQhhzNzMPls4m1ZMnaTJjiTduPkemkNpj6FQPLL7PGc
	 OLoRWvbHT9iltuoA4cnQFvqwcLSdBPricbbgbgf94Luebd+bJmLNPwt3nykzFi1ipI
	 vPuiM6mKmHx4As9NvPgJNeNM9UOVtAptxioWBTcM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 185B0F802E7;
	Tue, 26 Oct 2021 13:04:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D417EF802C8; Tue, 26 Oct 2021 13:04:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B894F8010A
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 13:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B894F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cPl3XSlg"
Received: by mail-wr1-x432.google.com with SMTP id m22so15139947wrb.0
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 04:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jfvQnuhKbXt7YtX8eoaStZrN5VerRP6PTu1u4SMxs0c=;
 b=cPl3XSlgRASgTDx9IBjLB3YvfcWSFRU92mFLVHJushj/lqCZnAb0Dnc8Trv5qZ8JbA
 UsGbdNuqx88LlCzvEPsDhPR5pp2FuE7TGuVZsuVZJFw9pEuYAkF+vemupM7MG+BPhBMq
 trCu9e5+E3LJNNC5ktaofwPJqR31UcQXdPREfxCILIXbCEdyOJakOVukaijqKlvrqHEj
 G5qCvfmskbgtSmIE9l40sNlSfEMizL+92DTS4UHy6AOYRWkaGPfWkSSWSWqqJaxIyu/l
 hk6nw5NG1Y9xABgzIAEovuez8PK951IEX8IKdlxOqn3SwZrPtQX4wQYnlIM1FyLffrux
 jDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jfvQnuhKbXt7YtX8eoaStZrN5VerRP6PTu1u4SMxs0c=;
 b=sVxcVCZs0uk95XkktHhmHnPGDR7ReblVVygypbIQDGhLIXN7ZDfC7wWPxf23OHkrNg
 SAQg7RxVCxMxPxiFE7zYjLUew9biCL82+v45TRGPHlEGOnDGD0Ltv83dVdzUvbSTTu3c
 9Zpx7y6VF93ln956rrNdxeY62KQu0XRXtU0KbDbMzlr1BLqxIdO5a0+ltNLx7MNVxB1l
 xn0w8i2Uffcc2SJgohNwIgGmNVoTH1pF3ACsW/eQw8SQZErmFdil0alhYEjfTzgbhCsA
 0iyRkngHbRNgK2jrWHvUt+dcJMxS3Ww8I6rwNmnHvsxPGZ4u+B1C6GnOE++qFO+0pObY
 /7fQ==
X-Gm-Message-State: AOAM530/D73Y3raCVmmnAbe1E276RNPx9DKS2MN7vCkf4LrbQkncCIhp
 Iq8CmmXkbxywcwO1D30fu9nQvA==
X-Google-Smtp-Source: ABdhPJwD4M3FdtlhxEFtuF6FwSBzrYztx6STdz/MWgViKrE7sBQsinPn11B4TmvA67KfdD/S4Tn5eg==
X-Received: by 2002:a05:6000:1866:: with SMTP id
 d6mr10110852wri.226.1635246279902; 
 Tue, 26 Oct 2021 04:04:39 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id s11sm10717663wrt.60.2021.10.26.04.04.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 04:04:39 -0700 (PDT)
Subject: Re: [RESEND PATCH v10 00/17] ASoC: qcom: Add AudioReach support
To: Mark Brown <broonie@kernel.org>
References: <20211026103815.19468-1-srinivas.kandagatla@linaro.org>
 <YXfc18+fqBNajHX8@sirena.org.uk>
 <ef6377b1-5cd4-dde2-b2ec-a7c0ccc17dd0@linaro.org>
 <YXffedeNCJCDiI88@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <56855ce6-4c5b-7093-0d75-11472f0b792f@linaro.org>
Date: Tue, 26 Oct 2021 12:04:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YXffedeNCJCDiI88@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, tiwai@suse.de, lgirdwood@gmail.com,
 plai@codeaurora.org, pierre-louis.bossart@linux.intel.com,
 bjorn.andersson@linaro.org
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



On 26/10/2021 11:59, Mark Brown wrote:
> On Tue, Oct 26, 2021 at 11:55:37AM +0100, Srinivas Kandagatla wrote:
> 
>> No, this is not different to v10 which I send out Yesterday, v10 is meant to
>> address the arm64 build error that you reported.
> 
>> For some reasons yesterday's patches did not reflect the changes that I
>> wanted, so I RESEND v10 again.
> 
> OK, but that means that this v10 is different to the v10 that went out
> yesterday, right/

Yes it is. I see your point.

I will send out this as V11.

--srini


> 
