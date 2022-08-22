Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C67559CB8C
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 00:36:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA677839;
	Tue, 23 Aug 2022 00:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA677839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661207804;
	bh=N0jfqHtADpLm/1g3Ick20uNnmq3vvocMH4aZl6wyyik=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LipoofkkAK876NjFz/zWkieakCxnlwm2Uwc+wP7LP0eAOJO2lGw2pSEE3wkFKhOi8
	 kTDIBS/tn5FkW3CusJaokRxgrnFGlwUMk65/POgCes7wx45URnX4XyqIhup5kdIBcX
	 jIGQfJXp2Z+6xM0rl19d3NTCl+1YwMMyNXrybmcI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 354C4F800A7;
	Tue, 23 Aug 2022 00:35:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CA11F8026A; Tue, 23 Aug 2022 00:35:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A2D1F800ED
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 00:35:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A2D1F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=flatmax-com.20210112.gappssmtp.com
 header.i=@flatmax-com.20210112.gappssmtp.com header.b="SYIxBE2r"
Received: by mail-pl1-x62a.google.com with SMTP id p18so11200126plr.8
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 15:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flatmax-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=jEuLhzJLSTk5CufgkvPiCkW+mlDKBcKSUTF8OkYisvc=;
 b=SYIxBE2rosAR/GAp4nMjnyKF81I+qBEKUZpzJsIxsQl9fpWAmPl88aJNxE7DM3qAkb
 t49LfzyqsMsORWG6DSp7IzGyY7azYsmh2kySlQC8hS1zwi71Yber9qS8oujA1jG0Gqik
 mhtYCdbM/T348ZrTyknqpMu00DxO4LZ5yXDLCiJ45G1EVOSmflSUlofu0oqOYL4x95KZ
 rccl+jGR/5/7fb8yxOONYXM2PeBHZy/brtBPj23wuc8hCwKqf2SFpBI3/AxnX5SH9X0c
 C9Nlo6Q5Y+o5EM6VwbYLImvJhaRXmx1em4qW3k+039Mb3jTr6qRiIQ80/N6FSaL5eCr3
 HxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=jEuLhzJLSTk5CufgkvPiCkW+mlDKBcKSUTF8OkYisvc=;
 b=eShDGFa4KyHKQP9Z9j6/UvUvsTVoDOT5wJhOYl1tObbQaSsPntto4tNRIx+ylW9QiO
 oyi60EklA0k4Njf44oYm/oY8Tnq1+7zXcyBnlRH/RB6EMiiMA+sX3KRLBFeErzjDHDdA
 3jNidxyZ21nFA7gFZkdU81wYZa710ByA4WwnhjOKY3wYhGBcXwmZ9wZrOygZTu8g4pc6
 uWCvqQcwB+dH8B9+ynjFQBFex0eLwuzX3iwDqVlJAnLqy1D9hf1Aax+8yZzySvwE3zAm
 C9GpjLKCRV6CtJxi8sWow3CPCIB7wYBCl1c5RRkT+XoH+/Ka1ZEuZXIn+C5CunGO2r25
 guJQ==
X-Gm-Message-State: ACgBeo1jM0WBL/bd2tFYl32UKaQb8wOJF6ApS0MZIcXS6Yr6nNPxzkL2
 vpKf3kgN/FhZuMoDITH9s4y/oQ==
X-Google-Smtp-Source: AA6agR6YtxMR78C4m5EhtbfUJBy+PKaZepoTxqsQ+ro2j2FBPWOeEUsFy2BpbS4rJUKi1UTFOA1Wmw==
X-Received: by 2002:a17:90b:1e4e:b0:1fa:bab4:d24f with SMTP id
 pi14-20020a17090b1e4e00b001fabab4d24fmr428445pjb.185.1661207733771; 
 Mon, 22 Aug 2022 15:35:33 -0700 (PDT)
Received: from ?IPV6:2406:3400:213:70c0:73b4:2cc5:1ada:53cd?
 ([2406:3400:213:70c0:73b4:2cc5:1ada:53cd])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a170902eb8400b0016c9e5f291bsm8812572plg.111.2022.08.22.15.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 15:35:32 -0700 (PDT)
Message-ID: <99a54f9c-519e-1ccb-8ceb-391a0aeb359d@flatmax.com>
Date: Tue, 23 Aug 2022 08:35:26 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ASoC: codes: src4xxx: Avoid clang
 -Wsometimes-uninitialized in src4xxx_hw_params()
Content-Language: en-AU
To: Nathan Chancellor <nathan@kernel.org>
References: <20220822183101.1115095-1-nathan@kernel.org>
 <72de09df-5dee-8bd0-5c91-359e4bc36ca8@flatmax.com>
 <YwQEDyk17Q06mIVR@dev-arch.thelio-3990X>
From: Matt Flax <flatmax@flatmax.com>
In-Reply-To: <YwQEDyk17Q06mIVR@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, patches@lists.linux.dev,
 "Sudip Mukherjee \(Codethink\)" <sudipm.mukherjee@gmail.com>
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

That solution looks good.

Matt

On 23/8/22 08:32, Nathan Chancellor wrote:
> Hi Matt,
>
> On Tue, Aug 23, 2022 at 08:00:07AM +1000, Matt Flax wrote:
>> Hi Nathan,
>>
>> On 23/8/22 04:31, Nathan Chancellor wrote:
>>> Clang warns:
>>>
>>>     sound/soc/codecs/src4xxx.c:280:3: error: variable 'd' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
>>>                     default:
>>>                     ^~~~~~~
>>>     sound/soc/codecs/src4xxx.c:298:59: note: uninitialized use occurs here
>>>                     ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_11, d);
>>>                                                                             ^
>>>     sound/soc/codecs/src4xxx.c:223:20: note: initialize the variable 'd' to silence this warning
>>>             int val, pj, jd, d;
>>>                               ^
>>>                               = 0
>>
>> If you really want to get rid of these warnings, you can use this default
>> for the variables :
>>
>> pj = 0x0;
>> jd=0xff;
>>
>> d = 0xff;
>>
>> It doesn't really make sense why we would choose to initialise these
>> variables, but if you want to silence the preprocessor, then perhaps those
>> values. Put a message that defaults are not known nor specified in the data
>> sheet and these values are chosen to be unlikely matches of real world
>> values - which ensures regmap updates later from an initial unknown chip
>> state after refresh.
> Okay, I could do something like this?
>
> diff --git a/sound/soc/codecs/src4xxx.c b/sound/soc/codecs/src4xxx.c
> index a8f143057b41..db4e280dd055 100644
> --- a/sound/soc/codecs/src4xxx.c
> +++ b/sound/soc/codecs/src4xxx.c
> @@ -280,9 +280,14 @@ static int src4xxx_hw_params(struct snd_pcm_substream *substream,
>   		default:
>   			/* don't error out here,
>   			 * other parts of the chip are still functional
> +			 * Dummy initialize variables to avoid
> +			 * -Wsometimes-uninitialized from clang.
>   			 */
>   			dev_info(component->dev,
> -				"Couldn't set the RCV PLL as this master clock rate is unknown\n");
> +				"Couldn't set the RCV PLL as this master clock rate is unknown. Chosen regmap values may not match real world values.\n");
> +			pj = 0x0;
> +			jd = 0xff;
> +			d = 0xff;
>   			break;
>   		}
>   		ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_0F, pj);
>
> These warnings need to be eliminated because Linus requires a clean
> build as much as possible [1] [2], which has been codified by
> CONFIG_WERROR, which is enabled by default with allmodconfig. As a
> result, clang allmodconfig builds are broken [3], which you might have
> already seen. If there is another way this could be written without
> potentially uninitialized variables, I am open to it.
>
> [1]: https://lore.kernel.org/CAHk-=wg-mH-_GYpkhz_psjBWG6ZcjKnPo83fg7YMj_by+-LRTQ@mail.gmail.com/
> [2]: https://lore.kernel.org/CAHk-=wi4wyvuXs0SUq-2x=XHxWmJ6jVKRD-WpE0kWgWiqVJNbg@mail.gmail.com/
> [3]: https://lore.kernel.org/YwNMUlAmu%2FqCjuva@debian/
>
>> All a bit messy really.
> Indeed :/
>
>>> According to the comment in the default case, other parts of the chip
>>> are still functional without these values so just return 0 in the
>>> default case to avoid using these variables uninitialized.
>>>
>>> Link: https://github.com/ClangBuiltLinux/linux/issues/1691
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Reported-by: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
>>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>>> ---
>>>    sound/soc/codecs/src4xxx.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/sound/soc/codecs/src4xxx.c b/sound/soc/codecs/src4xxx.c
>>> index a8f143057b41..cf45caa4bf7f 100644
>>> --- a/sound/soc/codecs/src4xxx.c
>>> +++ b/sound/soc/codecs/src4xxx.c
>>> @@ -283,7 +283,7 @@ static int src4xxx_hw_params(struct snd_pcm_substream *substream,
>>>    			 */
>>>    			dev_info(component->dev,
>>>    				"Couldn't set the RCV PLL as this master clock rate is unknown\n");
>>> -			break;
>>> +			return 0;
>>
>> Don't return here, the rest of the chip is still functional and probably in
>> use. Print the dev_info and continue.
> I'll send a v2 tomorrow morning (for me at least) if there are no other
> comments.
>
> Cheers,
> Nathan
