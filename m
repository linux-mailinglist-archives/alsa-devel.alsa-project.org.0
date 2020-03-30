Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE14E197E10
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 16:12:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78FD3166D;
	Mon, 30 Mar 2020 16:12:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78FD3166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585577574;
	bh=anBe4HSnplBq6iOkKCW1DX0XyZPx6WMYMICbdAI1NPo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vDozsJt4Ld1zl0WA1vMaedamxPfuzfC87y7E6P3VIwYLs0KhZTIS7Xgs3ttJBgIvn
	 xPAT5ab8inpfJqeyc1k5dFHM9RWYios2/IGITwm4SUUn6WpMcppliHllIGRfIiSw4w
	 DPNdBugZ6y9eR8daAiz/pAlU6VuBUco79fGBe480=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A70FF8014A;
	Mon, 30 Mar 2020 16:11:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23BC3F80148; Mon, 30 Mar 2020 16:11:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 353FAF8010C
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 16:11:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 353FAF8010C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="S5QnltPO"
Received: by mail-wm1-x343.google.com with SMTP id z18so20116059wmk.2
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 07:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nCC8QxCRCAPjjtdh1OxIIV6ZKJAeKRT0F38l31/29MI=;
 b=S5QnltPOe3p2IRLF8WuaY4GpGZSvgDk5/4sU1BgjkTXdWNk0LXaOK2Oxz1xkyVxjD5
 M0/uzFmGI1MoRPLyMRqehTGeE7Vy4d5AHLWpf01szjt1r+sh4tNckq43ZIm8kU8BI99p
 OdMwWEDN3qGbfNILIifaeitYAVk54tG7w5UIFhQUblBcRxf9XDPz54Vnb0CfePbA5HJw
 p3Vi9RUaasO990248CvtTl8ChiwutSPAjp9w3e7HdVjvnyZS2dvil4TAevUOFjag7bAC
 TsyxBIHgiO3cZbqy1SZydcQHCXHkjpU1j9kE0KxgBKXLQxLrzf4FBkHmvbvbEI7TSOwN
 U94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nCC8QxCRCAPjjtdh1OxIIV6ZKJAeKRT0F38l31/29MI=;
 b=Nk7/zkIMoNS7tvmE1/gFWaJDlidSlRVi6WLdTtTFNGFjvDKL8zCKkWQZCcs4fCkWRB
 9tpU/VSA0S2n6o31EHp85m/tSrlCjdr2NLzgacYkZFuDXxoSOMhX7dSHP0MZoQqSW9cI
 DsXmKVRxvOpx7XUKZe2Mfqm1b8P8G6b9O+gGQo062xKRWD+To4ld8xqsq+lfXqtiHac/
 W70Pm8S0EYYI7rQKmQ3nEGCNSwEzCd0igPoPUBfRWQKs8MG2GnMEc1PAd639VCNKXgOW
 CH9k2Nj8ioYmxpxzHI11zwDedFARaO323GLtT5HAFmNMjDCKl4ujL+lXiEqEC9YIpt28
 dJyQ==
X-Gm-Message-State: ANhLgQ1fVXg1UWG43O6Pr5L1H0FFzT5lVbEJaC9t106G0DH7QMtwt4it
 QIzwoa11AgZ7qAEnzAf9xnNjBiaaAcs=
X-Google-Smtp-Source: ADFU+vupRxVgB2876BAJ+7IQOOjlvcJ1N7EcNrp9crd3LuBQ10zUL6S9GpRaE5EgcPDTlkTirC8XDw==
X-Received: by 2002:a1c:4805:: with SMTP id v5mr12955536wma.98.1585577456617; 
 Mon, 30 Mar 2020 07:10:56 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id o9sm22584500wrx.48.2020.03.30.07.10.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Mar 2020 07:10:56 -0700 (PDT)
Subject: Re: [PATCH 0/4] ucm2: Add support to SDM845 based platforms
To: perex@perex.cz
References: <20200305134404.7690-1-srinivas.kandagatla@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <41e83744-5164-7cbb-98e6-fb8504c6b44e@linaro.org>
Date: Mon, 30 Mar 2020 15:10:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200305134404.7690-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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

Hi Jaroslav,

On 05/03/2020 13:44, Srinivas Kandagatla wrote:
> This patchset adds UCM support for WSA881x, WCD934x codec and two platforms,
> DB845c DragonBoard and Lenovo YOGA C360 Laptop that use these codecs.
> 
> Tested on Ubuntu 20.04 with pulseaudio 13 along with
> with this fix
>   https://github.com/pulseaudio/pulseaudio/commit/cabd387e26b5fe03661f4b894826c7c6b58d7efa
> 

Are you okay to pick these ucm2 patches?


thanks,
srini


> Thanks,
> srini
> 
> Srinivas Kandagatla (4):
>    ucm2: codecs: wcd934x: Add Codec sequences.
>    ucm2: codecs: wsa881x: add codec sequences
>    ucm2: DB845c: Add ucm for DB845c board
>    ucm2: Add ucm for Lenovo-YOGA-C630-13Q50 laptop
> 
>   ucm2/DB845c/DB845c.conf                       | 11 +++
>   ucm2/DB845c/HDMI.conf                         | 33 +++++++
>   ucm2/DB845c/HiFi.conf                         | 46 +++++++++
>   ucm2/Lenovo-YOGA-C630-13Q50/HiFi.conf         | 98 +++++++++++++++++++
>   .../Lenovo-YOGA-C630-13Q50.conf               |  6 ++
>   ucm2/codecs/wcd934x/DefaultDisableSeq.conf    |  5 +
>   ucm2/codecs/wcd934x/DefaultEnableSeq.conf     | 14 +++
>   ucm2/codecs/wcd934x/HeadphoneDisableSeq.conf  |  6 ++
>   ucm2/codecs/wcd934x/HeadphoneEnableSeq.conf   |  6 ++
>   .../wcd934x/HeadphoneMicDisableSeq.conf       |  2 +
>   .../codecs/wcd934x/HeadphoneMicEnableSeq.conf |  3 +
>   ucm2/codecs/wcd934x/SpeakerDisableSeq.conf    |  4 +
>   ucm2/codecs/wcd934x/SpeakerEnableSeq.conf     |  4 +
>   ucm2/codecs/wsa881x/DefaultEnableSeq.conf     |  8 ++
>   ucm2/codecs/wsa881x/SpeakerDisableSeq.conf    |  8 ++
>   ucm2/codecs/wsa881x/SpeakerEnableSeq.conf     |  8 ++
>   16 files changed, 262 insertions(+)
>   create mode 100644 ucm2/DB845c/DB845c.conf
>   create mode 100644 ucm2/DB845c/HDMI.conf
>   create mode 100644 ucm2/DB845c/HiFi.conf
>   create mode 100644 ucm2/Lenovo-YOGA-C630-13Q50/HiFi.conf
>   create mode 100644 ucm2/Lenovo-YOGA-C630-13Q50/Lenovo-YOGA-C630-13Q50.conf
>   create mode 100644 ucm2/codecs/wcd934x/DefaultDisableSeq.conf
>   create mode 100644 ucm2/codecs/wcd934x/DefaultEnableSeq.conf
>   create mode 100644 ucm2/codecs/wcd934x/HeadphoneDisableSeq.conf
>   create mode 100644 ucm2/codecs/wcd934x/HeadphoneEnableSeq.conf
>   create mode 100644 ucm2/codecs/wcd934x/HeadphoneMicDisableSeq.conf
>   create mode 100644 ucm2/codecs/wcd934x/HeadphoneMicEnableSeq.conf
>   create mode 100644 ucm2/codecs/wcd934x/SpeakerDisableSeq.conf
>   create mode 100644 ucm2/codecs/wcd934x/SpeakerEnableSeq.conf
>   create mode 100644 ucm2/codecs/wsa881x/DefaultEnableSeq.conf
>   create mode 100644 ucm2/codecs/wsa881x/SpeakerDisableSeq.conf
>   create mode 100644 ucm2/codecs/wsa881x/SpeakerEnableSeq.conf
> 
