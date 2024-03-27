Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE897894BD7
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:51:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42651299C;
	Tue,  2 Apr 2024 08:51:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42651299C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712040711;
	bh=vlAURbsX5wpvGXqFwL0Rpdj7KYf37DTQ2Jtnu3oSU2o=;
	h=Date:Subject:From:To:Cc:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=tSqb7/neoRx6+A3PxH2GQ8FCrG3mty8zSdrkr+IXCS4mHvAxb9Xav3PmzmYZcVmxb
	 UuJpZrbSYxRSsx9FMlwwwYJWeOK4cHoquudaj3t0ipLFmz3S2iErHCCn0HcLBnc2gu
	 8TCKodZrjLsLMOcXFoKeNZ1gfZodXqhWej/J9vJM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BF7AF806AA; Tue,  2 Apr 2024 08:48:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 838C3F807B6;
	Tue,  2 Apr 2024 08:48:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE974F8025F; Wed, 27 Mar 2024 02:15:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by alsa1.perex.cz (Postfix) with SMTP id A82A9F80074
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 02:15:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A82A9F80074
Received: from [172.30.11.106] (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 3E1AC6019C949;
	Wed, 27 Mar 2024 09:15:19 +0800 (CST)
Message-ID: <a9bc4138-df79-112a-6470-90c86ba5bc95@nfschina.com>
Date: Wed, 27 Mar 2024 09:15:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] ASoC: sti: uniperif: fix the undefined bitwise shift
 behavior problem
Content-Language: en-US
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: arnaud.pouliquen@foss.st.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, nathan@kernel.org, ndesaulniers@google.com,
 morbo@google.com, justinstitt@google.com, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
In-Reply-To: <e70c65b0-2e0d-613f-4f05-bda61377fc01@nfschina.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: suhui@nfschina.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: H64POT22BMFCBZZDH3ZQFWBN4WY3TP47
X-Message-ID-Hash: H64POT22BMFCBZZDH3ZQFWBN4WY3TP47
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:47:48 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is a kindly resend email.
Sorry for the error style of last email :(
On 2024/3/26 13:30, Su Hui wrote:
> Hi,
> On 2024/3/25 22:25, Dan Carpenter wrote:
>> On Mon, Mar 25, 2024 at 11:40:33AM +0800, Su Hui wrote:
>>> --- a/sound/soc/sti/uniperif.h
>>> +++ b/sound/soc/sti/uniperif.h
>>> @@ -12,17 +12,28 @@
>>>   
>>>   #include <sound/dmaengine_pcm.h>
>>>   
>>> +#define SR_SHIFT(a, b)		({unsigned long __a = (a); \
>>> +				unsigned int __b = (b); \
>>> +				__b < BITS_PER_LONG ? \
>>> +				__a >> __b : 0; })
>> The code definitely looks buggy, but how do you know your solution is
>> correct without testing it?
> I only test some cases like SR_SHIFT(1, -1),SR_SHIFT(8,1), it seems have a right result.
> Oh, maybe I understand it. When 'a' is a negative value like '(int)-1', SR_SHIFT(a, b) will
> have some bugs.
>> I don't like this solution at all.  This is basically a really
>> complicated way of writing "if (b != -1)".  Instead of checking for -1,
>> the better solution is to just stop passing -1.  If you review that
>> file, every time it uses "-1" that's either dead code or a bug...
> Agreed，some are dead codes which can be removed, but what should we do with the
> following error codes like this one?
> sound/soc/sti/uniperif.h
>   415 #define UNIPERIF_CONFIG_BACK_STALL_REQ_SHIFT(ip) \
>   416         ((ip)->ver < SND_ST_UNIPERIF_VERSION_UNI_PLR_TOP_1_0 ? 7 : -1)
>   ...
>   423 #define SET_UNIPERIF_CONFIG_BACK_STALL_REQ_DISABLE(ip) \
>   424         SET_UNIPERIF_REG(ip, \
>   425                 UNIPERIF_CONFIG_OFFSET(ip), \
>   426                 UNIPERIF_CONFIG_BACK_STALL_REQ_SHIFT(ip), \
>                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> How about this solution? If the condition is false, just skip it.
>
> @@ -412,8 +412,7 @@
>                  UNIPERIF_CONFIG_REPEAT_CHL_STS_MASK(ip), 1)
>   
>   /* BACK_STALL_REQ */
> -#define UNIPERIF_CONFIG_BACK_STALL_REQ_SHIFT(ip) \
> -       ((ip)->ver < SND_ST_UNIPERIF_VERSION_UNI_PLR_TOP_1_0 ? 7 : -1)
> +#define UNIPERIF_CONFIG_BACK_STALL_REQ_SHIFT(ip) 7
>   #define UNIPERIF_CONFIG_BACK_STALL_REQ_MASK(ip) 0x1
>   #define GET_UNIPERIF_CONFIG_BACK_STALL_REQ(ip) \
>          GET_UNIPERIF_REG(ip, \
> @@ -421,10 +420,11 @@
>                  UNIPERIF_CONFIG_BACK_STALL_REQ_SHIFT(ip), \
>                  UNIPERIF_CONFIG_BACK_STALL_REQ_MASK(ip))
>   #define SET_UNIPERIF_CONFIG_BACK_STALL_REQ_DISABLE(ip) \
> +       ((ip)->ver < SND_ST_UNIPERIF_VERSION_UNI_PLR_TOP_1_0 ? -1 : \
>          SET_UNIPERIF_REG(ip, \
>                  UNIPERIF_CONFIG_OFFSET(ip), \
>                  UNIPERIF_CONFIG_BACK_STALL_REQ_SHIFT(ip), \
> -               UNIPERIF_CONFIG_BACK_STALL_REQ_MASK(ip), 0)
> +               UNIPERIF_CONFIG_BACK_STALL_REQ_MASK(ip), 0))
>   #define SET_UNIPERIF_CONFIG_BACK_STALL_REQ_ENABLE(ip) \
>
> Maybe should print some error log here.
> I'm not sure about the safety of skipping SET_UNIPERIF_REG when the condition is false,
>
> Would it be better to make the result of undefined shift equal to zero?
>
> regards,
> Su Hui
>   
>
