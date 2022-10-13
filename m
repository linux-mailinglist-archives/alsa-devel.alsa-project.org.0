Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E54E5FDC31
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Oct 2022 16:14:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D94C15BA1;
	Thu, 13 Oct 2022 16:13:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D94C15BA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665670479;
	bh=Zc3cTbyv++LDvc0SGvOcdnfd4hm40X6P4RFRyJZQjcg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tHlaOHmA7WN90Nfw/nQZTHJJDLEaGHl/Tov94ZkLARv07EyqCuizM5KTnN3BLpr0V
	 qf5CZds3T743amnkRqaykmlxEAtZ3GMEc5QIBttiJqvw0dGBwzzwIaQu8dLb0ZbfzO
	 9aEav8fhr72q//ILwIJgu+UJkJQWhPDI67MxIPXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 594DEF80431;
	Thu, 13 Oct 2022 16:13:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64599F80269; Thu, 13 Oct 2022 16:13:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D75AF800A7
 for <alsa-devel@alsa-project.org>; Thu, 13 Oct 2022 16:13:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D75AF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="agzuYPwq"
Received: by mail-qt1-x833.google.com with SMTP id c23so1184510qtw.8
 for <alsa-devel@alsa-project.org>; Thu, 13 Oct 2022 07:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=31uffpNRwdyYprzTa+ufVXiBmknEXuHQwvr5vQ+4CNs=;
 b=agzuYPwqrSRLKKVtoE5+KTZncK1sZujB9xHGFcWd8jdxLowy+i9fiZBegxrE6cTRuA
 Wt4RDnYd+9+axBcBB7ZwtxOqYmidty380r9BoEkpfxP5EFiHCIUCB0hp6gWchOS/2jLQ
 Qa01qfQ4RJ/33T5FmHZ4y/zJIQ3M2oOYEZHocvTsJ5E6DJvFx36OLH2H6T0d5ISuys6t
 8j6c5GptFwSJW04FG3J0QPH01tDN2SkcMgYOnNFzFb8MOj1lZSmcksWuPSc4Q1VN2sKc
 FktDgrejceY7dvyvY88XDThg5wRyJUx5ozTkiLGr+W7C5vikzjKpE/cX6XKa4w67G56Y
 3jhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=31uffpNRwdyYprzTa+ufVXiBmknEXuHQwvr5vQ+4CNs=;
 b=7kox0figc3ayRMHHPIyr4y694U56DGeGwwfPqbXPkQdZ0vHXocFc7oPnvUExWUGU+3
 zJ9pskrce/XsFv9S81BpCtTMHo4lXN0ZoMbn622xStzQPf2QQyja+C7Dl9CQ/ar4SEsu
 htmQcjvyE+3PMstTbT0OlbPJZmxo/1Y/LD68fFU9UeCqgcgPmrS0CM52eRhYi3tW1rbP
 zyOkKuAZlUbYB1gSII1avp0JPqqSSPv2Np6psI3GIGQqWJJ1KWKPu6J2090vhH6A8g1T
 bo3winEERJGzPBlKOIPt4rJNGx59mW4KZYI8+ykNSl1b4QTPIvItyHRntdrcUdHO/GAX
 Ka1g==
X-Gm-Message-State: ACrzQf2uJ3E1GSAZkzc5Rvq1JTynZWR+HK0FHEW27UTgVe0G7b6/nNG/
 o1WPj5fWl/kSE/erByo1yHF6IA==
X-Google-Smtp-Source: AMsMyM5/a5SlZepFUrzT+rzNGyi1GbWiSQitwIlqhkYdtjGrwIB0/557uIVoDvpjWJq1aGHWujEVbw==
X-Received: by 2002:a05:622a:1a85:b0:39b:d3cc:4714 with SMTP id
 s5-20020a05622a1a8500b0039bd3cc4714mr3142qtc.310.1665670414574; 
 Thu, 13 Oct 2022 07:13:34 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com.
 [72.225.192.120]) by smtp.gmail.com with ESMTPSA id
 bk19-20020a05620a1a1300b006ec771d8f89sm12214940qkb.112.2022.10.13.07.13.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 07:13:33 -0700 (PDT)
Message-ID: <d3d2ecab-179a-dbff-4dd5-0785e49b45fa@linaro.org>
Date: Thu, 13 Oct 2022 10:13:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] ASoC: Add Richtek RT5512 Speaker Amp Driver
Content-Language: en-US
To: Jeff Chang <richtek.jeff.chang@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, jeff_chang@ricthek.com
References: <20221013080643.6509-1-richtek.jeff.chang@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221013080643.6509-1-richtek.jeff.chang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Jeff <jeff_chang@richtek.com>
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

On 13/10/2022 04:06, Jeff Chang wrote:
> From: Jeff <jeff_chang@richtek.com>
> 
> The RT5512 is a boosted class-D amplifier with V/I sensing.
> A built-in DC-DC step-up converter is used to provide efficient power for
> class-D amplifier with multi-level class-H operation. The digital audio
> interface supports I2S, left-justified, right-justified and TDM format for
> audio in with a data out used for chip information like voltage sense and
> current sense, which are able to be monitored via DATAO pin through proper
> register setting.
> 
> Signed-off-by: SHIH CHIA CHANG <jeff_chang@richtek.com>
> ---
>  .../bindings/sound/richtek,rt5512.yaml        |  50 +

Bindings are separate patches.

Best regards,
Krzysztof

