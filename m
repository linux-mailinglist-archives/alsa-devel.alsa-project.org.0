Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4BF5B452
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2019 07:47:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB9511681;
	Mon,  1 Jul 2019 07:47:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB9511681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561960078;
	bh=rFAzYgpItNO+cem57KjD6vXF/I6bvj/CXhEaqp29m4o=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HnuKE3Kol6DhTgi7kWXo1iJcNmUEo0upbZvsluWhYR0vx5w/UcGdyJrTmP0dvF8Cz
	 dm+UTAM2N0yBKw2bbru0R7RbihvECkoUws+Gz92bq2m9JyFWWzXAC4u9iAwCabFRAV
	 +SWwuthJXEZP++dtiTUeY96t/82PiCIlJDKnsFsw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39807F89707;
	Mon,  1 Jul 2019 07:46:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29877F89674; Mon,  1 Jul 2019 07:46:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7F2BF80C13
 for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2019 07:46:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7F2BF80C13
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kfh5vicc"
Received: by mail-lj1-x242.google.com with SMTP id v24so11697202ljg.13
 for <alsa-devel@alsa-project.org>; Sun, 30 Jun 2019 22:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=8yYaeGYH1lk4dhqKXsvPRW0fUGxbl4jEGeDfKa2Ty6Y=;
 b=kfh5vicc77Conm69He5+G8+PaZuy/aFnTfW7eGf/0g7by8v+gTDKKa3E0WWlj69uu5
 xcSMYJhYj+K+94FeYJGSkPWVpC4WMpWgxUmu+NyOxZYY1+dfW9U4Mi4l+CGMbzF4Jctb
 3iBKTJAGhcDfRwEwkkp0m9jC1QQf1O0Q40g5kLxOvAS52UpwPlVOiwZ9Z82ZGbLISm/J
 i7/lBRwJkWMYEESXHHM3il3VcBySiIlyxHLJYq4Z2iE9sdgBueKyM3Rt6c0E3ac2HSSN
 2juMxi+rr3EHPPfx/X1onWMfWZmBfYyr9c4njFBxxIkLofQwY5uKm5hTiIyLfZef6KKB
 ox7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=8yYaeGYH1lk4dhqKXsvPRW0fUGxbl4jEGeDfKa2Ty6Y=;
 b=mCuKgnIERJmG/rCGm4o0f/T7kotPYLPWS9h+Mb2M8z5k2O84ES5Qdxpw3fBW+nkKas
 UuXxb+OHMfBSqgD7SFJXYQ43w8CD8MfI9VFwDkcbqzWZ3Z6v9O5mNb0ud0WGUpqIR6FX
 NYYwqPc8yDo2xop/2HA6gxZMloXaueF1IPU3RLwssKvk/Shj+l1U1h/9z2ET7MkCoTAr
 s/CVJDav+tcXwR15lCpO/xJSJfiNC9oYj8GzwuwxymuLXwaU8vjQ+Vquu96fUGz7L7M2
 6HjwuyLcfawOOLGU+chnBZuWT6XqVGWyylmBreuEQ53qfDEfO5AAlciiGwHVVHp7uYxi
 iFjQ==
X-Gm-Message-State: APjAAAVrAoCmEluMogf3ke975Wx2NvQYUxYzg8Iy4bJgZaGh1nhxde36
 0TN7Vl3VwUrlbfVLGl6f7UI=
X-Google-Smtp-Source: APXvYqz6tnhd9uDkTCwEyyQMlwXFBa/szeO/kbZD0HykwS+epBivubnP5CszJLpw3z7J7a1pcp4Jgg==
X-Received: by 2002:a2e:89ca:: with SMTP id c10mr12904311ljk.106.1561959965169; 
 Sun, 30 Jun 2019 22:46:05 -0700 (PDT)
Received: from [10.17.182.20] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 w15sm3395418ljh.0.2019.06.30.22.46.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 30 Jun 2019 22:46:04 -0700 (PDT)
To: Takashi Iwai <tiwai@suse.de>, Colin King <colin.king@canonical.com>
References: <20190627165853.21864-1-colin.king@canonical.com>
 <s5hv9wq6qrg.wl-tiwai@suse.de>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <de93db15-c85f-3108-22c3-75b89a3a2e59@gmail.com>
Date: Mon, 1 Jul 2019 08:46:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <s5hv9wq6qrg.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [alsa-devel] [Xen-devel] [PATCH] ALSA: xen-front: fix
 unintention integer overflow on left shifts
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

On 6/28/19 11:46 AM, Takashi Iwai wrote:
> On Thu, 27 Jun 2019 18:58:53 +0200,
> Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Shifting the integer value 1 is evaluated using 32-bit
>> arithmetic and then used in an expression that expects a 64-bit
>> value, so there is potentially an integer overflow. Fix this
>> by using the BIT_ULL macro to perform the shift.
>>
>> Addresses-Coverity: ("Unintentional integer overflow")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Thank you for you patch,
Oleksandr
> The fix is correct, but luckily we didn't hit the integer overflow, as
> all passed values are less than 32bit.
>
> In anyway, applied now.  Thanks.
>
>
> Takashi
>
>> ---
>>   sound/xen/xen_snd_front_alsa.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/xen/xen_snd_front_alsa.c b/sound/xen/xen_snd_front_alsa.c
>> index b14ab512c2ce..e01631959ed8 100644
>> --- a/sound/xen/xen_snd_front_alsa.c
>> +++ b/sound/xen/xen_snd_front_alsa.c
>> @@ -196,7 +196,7 @@ static u64 to_sndif_formats_mask(u64 alsa_formats)
>>   	mask = 0;
>>   	for (i = 0; i < ARRAY_SIZE(ALSA_SNDIF_FORMATS); i++)
>>   		if (pcm_format_to_bits(ALSA_SNDIF_FORMATS[i].alsa) & alsa_formats)
>> -			mask |= 1 << ALSA_SNDIF_FORMATS[i].sndif;
>> +			mask |= BIT_ULL(ALSA_SNDIF_FORMATS[i].sndif);
>>   
>>   	return mask;
>>   }
>> @@ -208,7 +208,7 @@ static u64 to_alsa_formats_mask(u64 sndif_formats)
>>   
>>   	mask = 0;
>>   	for (i = 0; i < ARRAY_SIZE(ALSA_SNDIF_FORMATS); i++)
>> -		if (1 << ALSA_SNDIF_FORMATS[i].sndif & sndif_formats)
>> +		if (BIT_ULL(ALSA_SNDIF_FORMATS[i].sndif) & sndif_formats)
>>   			mask |= pcm_format_to_bits(ALSA_SNDIF_FORMATS[i].alsa);
>>   
>>   	return mask;
>> -- 
>> 2.20.1
>>
>>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
