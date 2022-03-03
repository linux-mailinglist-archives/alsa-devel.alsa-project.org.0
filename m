Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 098304CC2C2
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 17:29:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DC381877;
	Thu,  3 Mar 2022 17:29:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DC381877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646324994;
	bh=CtO+q+db8vVqoYn5hGybpLCePxeBiCv7x6IgL+nEjAU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hyUojSZczmeqXliSyEu2seatJLeOaRaQ67uTzjRj6uQhwfj6g6DqSzlmdFz45Vdne
	 Ucq0eb1LIrMJR/3N5WSVM0QJ4tSeyf15arv/PQwkoKW08Ohg8+5sORgMrCR9gHvLIN
	 B2rp70Cu90H/+4qsTH8r1oSiyBYvDqkUl5HsitGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF1E5F80166;
	Thu,  3 Mar 2022 17:28:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AF2FF80152; Thu,  3 Mar 2022 17:28:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6652AF800F0
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 17:28:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6652AF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Vcev2SFI"
Received: by mail-wr1-x434.google.com with SMTP id m6so8664156wrr.10
 for <alsa-devel@alsa-project.org>; Thu, 03 Mar 2022 08:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=e9uAigxs46BqjYn/NnAb73WG4q/CVGltu1N4Y/zwCMs=;
 b=Vcev2SFIz15CNPNz6TgieU6hpUaPUyb2MiXTR9yTHY32sCp/JeqnNvir2PknyHnDzI
 jJwtHbgTSNp/z0wchPmANaZIrlJdoKv7kQz1OJbLNbX1F0ARrRKmj6RsJBckurzoETnv
 A8CYJP4srXFo+uv8g+fTSD8j6J0/8NSkTADCX2Ds0k6d+yQqZr96K40JIK4uIYUuUUsH
 BOAvBEaqJyAQvG3LObSDzHoHEUYtNzGIERv9dbDQLHMN3jskOFXkehgBlp89UmXhWQk7
 zgzZhKL0CetqGCoRuobLTnyqYqIe2UA59mgDFLo6Vgv+i/qv6fZ7D4iarndZpeFBLXQp
 YSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e9uAigxs46BqjYn/NnAb73WG4q/CVGltu1N4Y/zwCMs=;
 b=CAlWbdP/jQcekv39FdNgSRi2fvOyGOo7X3HPn2y2MIDki5G+j0c9lTrfbmYGTQ/uXh
 cgRFDuK0M7g2VrasVtKq7PiH0TJZk4xKmGtIzRL5/K/uOXGCDZW1faHXTMC5v4VwFpho
 Ox7u+/E3jc5BQLmnU2S7mzsiwre8fTMSjbUfFc/c4tSzPGbGkmcisURBuIUvBZcW5ctM
 EHF9XruzSbjqBC18suZFpERTvMy4AeYBRsrVAk8cut6zvo9MMfJgVfQBOICM9J1APUl7
 41NG6Q0RhZK4h1OpUpt9Amuu8Gg9ZeCFWHUJYPYQHIDY4rzqhDaKXAAzqaBKSuo2gZpd
 A1LA==
X-Gm-Message-State: AOAM53255BV8BT5iCperzme3KT+SuQ/Zw5v1ysV4KJnBjaf3k50ga1nM
 4QoBkKltnub5ntBBk+pewMXngQ==
X-Google-Smtp-Source: ABdhPJw+68OTesX5GBgIs6OHFuXgq005qYLbStO1qwh6vFVRL4WvvzUZwrz7pgV1BM2p92GZLjvDSg==
X-Received: by 2002:adf:f5c3:0:b0:1f0:4b6e:b7e7 with SMTP id
 k3-20020adff5c3000000b001f04b6eb7e7mr3513863wrp.287.1646324918134; 
 Thu, 03 Mar 2022 08:28:38 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 r1-20020a5d4941000000b001ed89dcacbbsm2419346wrs.23.2022.03.03.08.28.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 08:28:37 -0800 (PST)
Message-ID: <cef16c0a-c0a8-3ed2-c35b-09fda2068073@linaro.org>
Date: Thu, 3 Mar 2022 16:28:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] soundwire: qcom: fix build failures if CONFIG_PM=n
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
References: <20220303110321.23666-1-srinivas.kandagatla@linaro.org>
 <YiDlBevX3/BrXmwb@matsya>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <YiDlBevX3/BrXmwb@matsya>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Stephen Rothwell <sfr@canb.auug.org.au>, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 yung-chuan.liao@linux.intel.com, quic_srivasam@quicinc.com
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



On 03/03/2022 15:55, Vinod Koul wrote:
> On 03-03-22, 11:03, Srinivas Kandagatla wrote:
>> Fix below build failure
>> drivers/soundwire/qcom.c:1460:12: error: 'swrm_runtime_resume' defined
>> but not used [-Werror=unused-function]
>> by marking the resume swrm_runtime_resume() with  __maybe_unused attribute.
> 
> A patch title should reflect the change and not the cause. So i have
> taken liberty to fix it as:
> 
> soundwire: qcom: use __maybe_unused for swrm_runtime_resume()
>   
> swrm_runtime_resume() would not be defined when CONFIG_PM=n
>   
> This causes below build failure
> drivers/soundwire/qcom.c:1460:12: error: 'swrm_runtime_resume' defined
> but not used [-Werror=unused-function]
>   
> Mark the resume swrm_runtime_resume() with  __maybe_unused attribute.
> 
> With this i have applied

Thanks Vinod,

--srini
> 
