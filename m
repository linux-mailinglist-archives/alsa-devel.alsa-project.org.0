Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E931E4C012A
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 19:23:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B1B017DB;
	Tue, 22 Feb 2022 19:22:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B1B017DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645554184;
	bh=AXgDFsLujzRCirWAaY42/Ts3TNnP5GcZ1a51J/noHxo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qd8CmuYZ/oeA3g7MmNZ7z40RvKmPW2GmEBiXk8PprXLF0D08T39nPOSxy/9SA/mq6
	 PMibQ4ocnfGrXQNgfgEH4naRuOScjtKIAzmSo1ILsnCTFJBByXqOoBjYYKADjMNAOU
	 U/65s5fR+yKKEXg/1Pzbv0WnvSxubaBUwifVBxAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0B0CF801F5;
	Tue, 22 Feb 2022 19:21:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5D8FF801EC; Tue, 22 Feb 2022 19:21:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E9CFF80118
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 19:21:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E9CFF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="KUp9ejm7"
Received: by mail-wm1-x332.google.com with SMTP id
 k3-20020a1ca103000000b0037bdea84f9cso2501188wme.1
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 10:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dSxkVeNACVhXNOyAclYVu585cWApPTR7Lum44hdkYwM=;
 b=KUp9ejm7G/GDzW/HgFDmPcHSUo6BgrU8As2BQ++t4QDBGfqRUPdCJ4EDEsjBairuee
 YDO5THZCMsfIaytQ35sv4VZveVmQQfw+bc8KlBtbYnMgcRvakUuOdAIlIWwVEaETUOvQ
 I33Apnbr3OkKJg7rtXHkFZdJnAjr1RBL6/xzmSay2169bZQHv/rdMdGk50fcefuiS3/X
 ry1Wzeji4n4S4mL3rJCfn/6TIBdjSTqp/h6HjpffDm74faKqBA5ygVfuzVZv8S+Ws8zy
 joQE9cc+2X0KZWzURVkjpragffCG1UUjDX9dGZ/bUccHJzMd9mzBKel4+PtKjrK0nw24
 vntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dSxkVeNACVhXNOyAclYVu585cWApPTR7Lum44hdkYwM=;
 b=aEK11UUM88OmUNbcp1xiabmzIFmQYlHSjSs7x2B3Jr9GB1D6XdpcB4dpaMEaYl6si+
 ynJOLu6uEcONm7BEj9j0pL7sh6Nvo4ln45Hhag9LDbDqV5PHskZUU1RDzvH//AoA8RiP
 sLS0xCgIjslMZAkR98QVV4dk4rKPhSpfeLCxC0SYLP//Q2D/8mVnRM8iTGoajo9lXpj6
 4MCF1vCwKIUb0LOd7omRWfN09g1uvSopLvZnkInkeCk1rW8j965tLXM9865ozBlEULte
 67ISGbrqJtrkbcVFB5bvPzI7E4hebLt1HwcAdTGl5vdLZeddjRm2kpb/jWdzvEaXKx0v
 E8Rw==
X-Gm-Message-State: AOAM531dCaFvnysPhUgYrN7hVnqJBrLC7KHdCvlGUR/5QFfskXDtfsB4
 Ju2FLJI6+246lEUclLkcYYQFQw==
X-Google-Smtp-Source: ABdhPJwRUV2AEHrfZaJhwuqauojIOkr7b975DSxtTUzdw9CR8yoOTabV2gW7611r27lHdCT6Q93MiQ==
X-Received: by 2002:a7b:c143:0:b0:37b:dacd:bf2f with SMTP id
 z3-20020a7bc143000000b0037bdacdbf2fmr4337818wmi.16.1645554108175; 
 Tue, 22 Feb 2022 10:21:48 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id f3sm20861563wri.6.2022.02.22.10.21.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 10:21:47 -0800 (PST)
Message-ID: <9919c5f2-6c7c-b041-e5c5-fe7488de3a8a@linaro.org>
Date: Tue, 22 Feb 2022 18:21:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 10/16] ASoC: codecs: rx-macro: fix tlv min max range
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
 <20220222115933.9114-11-srinivas.kandagatla@linaro.org>
 <YhUlxX461J9bskg3@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <YhUlxX461J9bskg3@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, quic_srivasam@quicinc.com
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



On 22/02/2022 18:04, Mark Brown wrote:
> On Tue, Feb 22, 2022 at 11:59:27AM +0000, Srinivas Kandagatla wrote:
>> on Qualcomm codecs gain tlv control specifies min max range as both
>> negative to positive numbers like
>>
>> SOC_SINGLE_S8_TLV("... Volume", ..,  -84, 40, gain)
>>
>> However with recent boundary checks added in commit 817f7c9335ec0
>> ("ASoC: ops: Reject out of bounds values in snd_soc_put_volsw())
>> setting a value above 40 gain will fail.
>>
>> So fix this min max range correctly to
>> SOC_SINGLE_S8_TLV("... Volume", ..,  0, 124, gain)
>> so that users can now set gain correctly
> 
> Are you sure this isn't a bug in the core?  -84..40 should be a valid
> range for a signed control.  See Marek's fix in 9bdd10d57a ("ASoC: ops:
> Shift tested values in snd_soc_put_volsw() by +min") though that onlyNice, This works for me. Will drop all he tlv patches.

--srini

> kicks in for systems with a platform_max.  I can't immediately spot any
> other issues for S8 but I could be missing something.
