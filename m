Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F93A99261
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 13:42:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E104E167E;
	Thu, 22 Aug 2019 13:41:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E104E167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566474127;
	bh=SV/FAAo2oEQLtHka0XwhYbIq5pfSbexrkp0JG8K0gws=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VVaqaCuo5yFWvfSkZIstMvlbGBXIsPAtLW4k+1S8Ez7k/kYhxouQx6XoFH/psL9it
	 qreaE/nUADK8/YEdtOG6VFt6uu7pmIqCYsQm0NJin4IIziRkEpdeXa89/xl20VOKzS
	 NLG59P7l2j2FMQKzezL2J61+qX5mnSwO+pV+xVpc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 099EAF803D5;
	Thu, 22 Aug 2019 13:39:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8282F80391; Thu, 22 Aug 2019 13:39:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E25ECF800BF
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 13:39:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E25ECF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Nxq7R1Qg"
Received: by mail-wr1-x443.google.com with SMTP id b16so5076554wrq.9
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 04:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YYxhK4tmZbhyjMnt/y1lwTBDE/zNgacAepBTpnIf8Uc=;
 b=Nxq7R1QgdvfedWqDUHsKr0WuYiavoarilWtg9TTnsXoGd6xnhfDq+pl0vQJf1JHi1v
 VSZ01SOsYm/kZYvZJBYszRfGcR3PWC3QQ+yz6tt5SdGi0YdvOkLGyvsUJEqdbLifmH8T
 vMnMWvceVNFrYynalfmfiw6nI9fSkjcxv1R3BzIefusIJb02pvRfZuOzEs+eXDNop4ap
 y8RE9QOQdcBSBxBmIvk6Kfcb+oKy4325IkloL4X3HEhGUdvAw8Od+M+1WueQIsKsXoJ4
 U+r3sPCd9ZLg/M2W0BTZunOo8iNTCKT1qHMWMsO+Rm+duWrHPdZuRBU/0tYVX+/kddR1
 +vUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YYxhK4tmZbhyjMnt/y1lwTBDE/zNgacAepBTpnIf8Uc=;
 b=JFOsSbR3q0X0bg661cObQZNqAVeQFf/ZgjfzSMLRiracd0B/334iieuWcgJYlW8R6e
 gE74lqi9AryIi1z6HsZG5umKG9Yl0kDZTRpcPUc+u1ioVxKeGMAOIVTc1tLt17NOpfx9
 knvwaU93jZN9ibN1rjm4vRXEWGBCCzBxmTrMDyflhBsdeBliabQVtbdRe+LmMOhzFeF3
 YKdpNBjpUmbdDliJwLqhPz8gfRKxS/khu13gTEXkXPekJLmjjI2EBFfuMbWLSlkp+inx
 erSVyLG1Zhb/7qzu5EgoZSt5TtBgkjTCf0pIgoSrYxNuduXTXtVeVuCqUhIzglpfIQ1E
 oPDA==
X-Gm-Message-State: APjAAAX5WB1TyFV7T8m7lB0qnKpRKMZkxVmaFH47ffyBmKYkSpS7Mswu
 i3aA8ItVh/QhkFNwtg1QO89HMQ==
X-Google-Smtp-Source: APXvYqxRZ0KMwV1W16oEuDyxJS9Tbb96AW5nxUCH4UelQ2zLFQPZXZOPW/9+I0ic21HJIA5akDkdmQ==
X-Received: by 2002:adf:a55d:: with SMTP id j29mr4561053wrb.275.1566473970887; 
 Thu, 22 Aug 2019 04:39:30 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id d16sm35791918wrj.47.2019.08.22.04.39.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Aug 2019 04:39:30 -0700 (PDT)
To: Takashi Iwai <tiwai@suse.de>
References: <20190821100225.9254-1-srinivas.kandagatla@linaro.org>
 <s5h7e7678le.wl-tiwai@suse.de>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <292a1950-3f2a-0099-eb37-bad202c47c23@linaro.org>
Date: Thu, 22 Aug 2019 12:39:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <s5h7e7678le.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 Deepa Madiregama <dmadireg@codeaurora.org>, Meng Wang <mwang@codeaurora.org>
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: Fix the mixer control
 range limiting issue
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 21/08/2019 18:05, Takashi Iwai wrote:
> On Wed, 21 Aug 2019 12:02:25 +0200,
> Srinivas Kandagatla wrote:
>>
>> From: Deepa Madiregama <dmadireg@codeaurora.org>
>>
>> - mixer_ctl_set() function is limiting the volume level
>>    to particular range. This results in incorrect initial
>>    volume setting for that device.
>> - In USB mixer while calculating the dBmin/dBmax values
>>    resolution factor is hardcoded to 256 which results in
>>    populating the wrong values for dBmin/dBmax.
>> - Fix is to use appropriate resolution factor while
>>    calculating the dBmin/dBmax values.
> 
> This change doesn't sound right.  Basically the values returned from
> USB-audio FEATURE UNIT or MIXER UNIT are always in 1/256 dB unit, per
> definition.  And we pass dB min/max to user-space as TLV_DB_MINMAX(),
> i.e. TLV points just both min and max, no matter what scale is.  I
> believe that the current code is correct in this regard.
> 
> So, it's either a firmware bug that gives the wrong values back, or
> the case we still don't cover, e.g. multiple RANGE values for
> UAC2/UAC3.
> 
> Please check what exactly doesn't work as expected.  Which value is
> returned from the USB-audio device and what is wrongly interpreted.
> 

Thanks for the detailed review.

I see https://www.usb.org/sites/default/files/audio10.pdf clearly 
specifies Mixer unit is always 1/256dB units.

This patch has been carried in Qcom downstream kernels for past many 
years to fix very low Initial volume setting on some USB headsets like 
Logitech S-150 USB Speakers and Nokia HS-82 USB headset.

Its highly likely that its a firmware bug!, but I will try to get it 
retested on latest kernel and collect some logs!

Thanks,
srini


> 
> thanks,
> 
> Takashi
> 
> 
>> Signed-off-by: Deepa Madiregama <dmadireg@codeaurora.org>
>> Signed-off-by: Banajit Goswami <bgoswami@codeaurora.org>
>> Signed-off-by: Meng Wang <mwang@codeaurora.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/usb/mixer.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
>> index 5070a6a76ab3..a67448327d07 100644
>> --- a/sound/usb/mixer.c
>> +++ b/sound/usb/mixer.c
>> @@ -1248,8 +1248,10 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
>>   	/* USB descriptions contain the dB scale in 1/256 dB unit
>>   	 * while ALSA TLV contains in 1/100 dB unit
>>   	 */
>> -	cval->dBmin = (convert_signed_value(cval, cval->min) * 100) / 256;
>> -	cval->dBmax = (convert_signed_value(cval, cval->max) * 100) / 256;
>> +	cval->dBmin =
>> +		(convert_signed_value(cval, cval->min) * 100) / (cval->res);
>> +	cval->dBmax =
>> +		(convert_signed_value(cval, cval->max) * 100) / (cval->res);
>>   	if (cval->dBmin > cval->dBmax) {
>>   		/* something is wrong; assume it's either from/to 0dB */
>>   		if (cval->dBmin < 0)
>> -- 
>> 2.21.0
>>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
