Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAD1463BA9
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 17:23:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07A352300;
	Tue, 30 Nov 2021 17:23:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07A352300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638289434;
	bh=zV9sY6TE7ql/VBXP4sdhXWhC5DdW/yjH1pUTX7vkq8E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cy44/AANfCRcnGa9JVsAV3i4rbyxrHrLluL2qat14imsOy+RnvN12fBmx575yXg5b
	 x/be6Rd5lVycRNvo9bFb+FsRTlg+A1L7CjzoSgtjQ3y/5y53C22VnSXWYflZzg44OV
	 rOU8f3JukzKI1t9Ck/NRnkpXGCScjK1g3i0pT1Uk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DE65F8020D;
	Tue, 30 Nov 2021 17:22:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A022F80290; Tue, 30 Nov 2021 17:22:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8291F8020D
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 17:22:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8291F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="U7yVGOdq"
Received: by mail-wm1-x332.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so15205012wmb.0
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 08:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b6a6PLyF+M7wwZ1FDN/UTeFdO9+p7QSJdzSxXo0nQ6w=;
 b=U7yVGOdqpzRq412biVH6h4R9wrDhW/Cw4WDky3rZrAYQyvrJiTYAh3ZfQVcKrwZ8Ud
 O7MFHnJga29Yhrf4pZEfZQ95tXiVSgtMSpvV2xosWhpDmaqgsPOHRIxN0sbXD1GaC3p6
 cQUvOQtAtzoavUjpNSm7PN9uXsg1JQhkzNtIaCa1ZPlN+wifCO+1OEehUN3eLWE/UAmC
 mQS0qCYu2KGBxmC4HaXTejkNfRGpYT8+lVX+/3RCPI4pguqDv7fT3DLCLglba3pG+gk8
 h4aAe95hTF5TWBl8LhioJuVoa7OeZ7e3RZQZrBkxtpjHMQ+WBMJCJ0m5nCBk0r7RaOJH
 2B2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b6a6PLyF+M7wwZ1FDN/UTeFdO9+p7QSJdzSxXo0nQ6w=;
 b=k2h7TPLOs00CwlJMD/hjv6dyD93obkX9XVbdkJy2Oa0oX96DBHhyhca48cuWH2awQR
 gOHlJH3ehtyX3CfPJiIpBso0R6QjYa/y2M76eHrCT4Fg3vf04iO1RLiAPahCO3IDmbuk
 j6uXE0y05+WhbXo19FFwv+yywFYsTqaJrka9jU7P1h/7JyTRwuefQmDLbwq0SeF0AsoU
 bvkf36qBLTK6JIRzVjSLDsy9C4rgkYcGpcnciF/khe7tyto01LhzhUHhIOY137m/wiIw
 FnNbj5vL7OymJ4sWBy+QWCc9HpTL0YAQZYDbjBpiYnDo39ElwD9opxCJV7DTUXgKC1Ch
 l3cw==
X-Gm-Message-State: AOAM531OFGewsbTskTcqHFWx3UrX0Y3Xvw1GY2mFDkc+pSycILy2tfSk
 VbIrbUEK8qG9ygvJzSxrPYzl5Q==
X-Google-Smtp-Source: ABdhPJwOIBYOKR3hSaNFiEBsqZLhO8lZTu4Kh9Wv9+SiBlvi7awXIKHajW0vvKtRvI5aaU1uoAI51g==
X-Received: by 2002:a1c:1f94:: with SMTP id f142mr517714wmf.192.1638289350935; 
 Tue, 30 Nov 2021 08:22:30 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id j18sm3278314wmq.44.2021.11.30.08.22.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 08:22:30 -0800 (PST)
Subject: Re: [PATCH] ASoC: qdsp6: q6routing: Fix return value from
 msm_routing_put_audio_mixer
To: Mark Brown <broonie@kernel.org>
References: <20211130160414.21616-1-srinivas.kandagatla@linaro.org>
 <YaZOnJIrl2bO98mL@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <b663a16e-e503-3f74-6d16-1b59df41e619@linaro.org>
Date: Tue, 30 Nov 2021 16:22:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaZOnJIrl2bO98mL@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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



On 30/11/2021 16:17, Mark Brown wrote:
> On Tue, Nov 30, 2021 at 04:04:14PM +0000, Srinivas Kandagatla wrote:
>> msm_routing_put_audio_mixer() can return incorrect value in various scenarios.
>> Fix this, so that change notifications are sent correctly.
> 
> This really isn't a good commit message - I can't tell what the change
> is supposed to fix or how it fixes it.  Which values in which scenarios
> are incorrect in what way?

I agree,

the cases that get incorrect return values are:

scenario 1:
amixer cset iface=MIXER,name='SLIMBUS_0_RX Audio Mixer MultiMedia1' 1
amixer cset iface=MIXER,name='SLIMBUS_0_RX Audio Mixer MultiMedia1' 0

return value is  0 instead of 1

scenario 2:
amixer cset iface=MIXER,name='SLIMBUS_0_RX Audio Mixer MultiMedia1' 1
amixer cset iface=MIXER,name='SLIMBUS_0_RX Audio Mixer MultiMedia1' 1

return value is  1 instead of 0


I will add these details in next spin commit log.

--srini
> 

