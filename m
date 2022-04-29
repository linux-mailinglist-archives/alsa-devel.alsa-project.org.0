Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEFB514A14
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 14:58:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1396FE11;
	Fri, 29 Apr 2022 14:57:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1396FE11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651237103;
	bh=6BgciFoTNu0ccxYFjpm9MUMpH08+BBr85DN9TYNtN9U=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Txxl18XHGTmnAgvwF6F/aypKy4O/8JWv9gkRfm7FpuY+BMfjFNoVIb4rz9Ae0aBpe
	 VFAw9AdHBzBqeE1+cNUgeTis5qANWXH0Qt55ZE8O1t0DjG2s67u9QuZFKccW51BLYR
	 65de9bB6sYobEFFsppeOlIa3Jghb/AXD1IbzH0V8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 610F4F80269;
	Fri, 29 Apr 2022 14:57:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BE19F8025D; Fri, 29 Apr 2022 14:57:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05847F8012B
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 14:57:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05847F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UhDeT+7O"
Received: by mail-wr1-x42b.google.com with SMTP id k2so10693660wrd.5
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 05:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ePG6wKCbyk/Ae1arQi0XeTIwAd5LTspuTNbaM+4UP34=;
 b=UhDeT+7OtGdUNKYaRyYzF4YBjNiqiG5cYbp0NWSnSrluhsGjG6xPIOa/eMOslCx/VC
 t5MHMquFHD0iip2929xPOiKtfcZ7f7Kqyne/BGIHZtW0+1IXEEnNWPhHLQuKrUfZm56I
 9MWvhTeIbw3HTkCcUtk4saxKmzHFZqX3ZCB+WWrtNtRnHsgon3MF5RqJ9xvGQws7/0mS
 b+KAA0MqsPPuKd+MsdTJD2DsZatnp/1g7cxsoG0dVaw4lhJmg2PfwCrWeXpcHA3xyvHa
 1U/RSSLyuPWacNUUqAFTW/EiOcufG4eM4aUy+7Ho0cBqUS68URBRmHKyevMB67igwyIh
 HVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ePG6wKCbyk/Ae1arQi0XeTIwAd5LTspuTNbaM+4UP34=;
 b=I1VpJzeweorNrqp1OSMmhUSBP3Y6kdlZjq4AGx6vmJgtgzi0VaTKKt46fj9kKo1I4I
 iie8GjkgqNC1p4QVV/guBuG8w1cMXj+IZDK04MZ13MAY/u3mzf8+lVTNw8roNP9EgSzw
 F8VCUrDgsvX3pxZB20DFZCzBLnHlKY1mBr6x3Z9sPTs1srYk+hGx83gkzmbz7LonQYJY
 2vIlR38OEeyIpjJnbtUbUs1AZb/ZBnfjRZGHGjIH/M926kp9xhS+hNEaEzufM0TL1PJm
 iPvRBjGh5oC8IPRHPTP0WYf+Z6WobIYhpkgb/lNZUicg8W320DfdoUgaxfKOPx/Xkrxw
 R9RQ==
X-Gm-Message-State: AOAM5314oDuyDOerSROMx0AWByk0iiMbYa6GYqtS536K+qqJO6UmQU4t
 TGaqdDA95uqpv1J27qjtNM8DtpO2L3lR4g==
X-Google-Smtp-Source: ABdhPJx9iOmaDdFy/exNMf07wrNEg2EtThd5KGiPKJ773aQXEiQRCBTb7PUS/mCPw+1r7dSeJNOlxg==
X-Received: by 2002:adf:ec92:0:b0:20a:d261:2cf2 with SMTP id
 z18-20020adfec92000000b0020ad2612cf2mr25223015wrn.296.1651237034054; 
 Fri, 29 Apr 2022 05:57:14 -0700 (PDT)
Received: from [192.168.0.43] (static-35-180-85-188.ipcom.comunitel.net.
 [188.85.180.35]) by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c350900b00393f01c8f00sm6986212wmq.47.2022.04.29.05.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 05:57:13 -0700 (PDT)
Message-ID: <cf9b425e-84ff-af12-72a7-4056b8cbf90d@gmail.com>
Date: Fri, 29 Apr 2022 14:57:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4] dt-bindings: dsp: mediatek: add mt8195 dsp document
Content-Language: en-US
To: YC Hung <yc.hung@mediatek.com>, Rob Herring <robh@kernel.org>,
 broonie@kernel.org
References: <20220106064847.15588-1-yc.hung@mediatek.com>
 <Yd4yNkeGlzdULNlv@robh.at.kernel.org>
 <68895a40-559b-13ce-d433-f9b32c648323@gmail.com>
 <9965188904de2e89bc5390fa6c71d9fb243f9d12.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <9965188904de2e89bc5390fa6c71d9fb243f9d12.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 allen-kh.cheng@mediatek.com, cezary.rojewski@intel.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 daniel.baluta@nxp.com, linux-arm-kernel@lists.infradead.org
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

Hi,

On 29/04/2022 07:59, YC Hung wrote:
> Hi Mattias/Rob,
> 
> Sorry I miss this mail.
> Could you please help to check this patch? Thanks.
> 

Rob gave his reviewed-by. I just saw that the driver maintainer is Mark, so I 
expect him to take the patch through his tree. Didn't realized this beforehand.

Regards,
Matthias

> On Fri, 2022-01-14 at 13:56 +0100, Matthias Brugger wrote:
>>
>> On 12/01/2022 02:43, Rob Herring wrote:
>>> On Thu, 06 Jan 2022 14:48:48 +0800, YC Hung wrote:
>>>> From: "YC Hung" <yc.hung@mediatek.com>
>>>>
>>>> This patch adds mt8195 dsp document. The dsp is used for Sound
>>>> Open
>>>> Firmware driver node. It includes registers,  clocks, memory
>>>> regions,
>>>> and mailbox for dsp.
>>>>
>>>> Signed-off-by: yc.hung <yc.hung@mediatek.com>
>>>> ---
>>>> Changes since v3:
>>>>     Fix patch v3 error : v3 only provide difference between v3 and
>>>> v2.
>>>>
>>>> Changes since v2:
>>>>     Remove useless watchdog interrupt.
>>>>     Add commit message more detail description.
>>>>
>>>> Changes since v1:
>>>>     Rename yaml file name as mediatek,mt8195-dsp.yaml
>>>>     Refine descriptions for mailbox, memory-region and drop unused
>>>> labels
>>>>     in examples.
>>>> ---
>>>>    .../bindings/dsp/mediatek,mt8195-dsp.yaml     | 105
>>>> ++++++++++++++++++
>>>>    1 file changed, 105 insertions(+)
>>>>    create mode 100644
>>>> Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
>>>>
>>>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>
>>
>> Rob, it seems we don't have a maintainer for this bindings. Shall I
>> as MediaTek
>> SoC maintainer take them through my branch?
>>
>> Regards,
>> Matthias
> 
