Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3544A01BF
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 21:14:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7B0A1720;
	Fri, 28 Jan 2022 21:14:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7B0A1720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643400892;
	bh=5UlMFTKfBMqwXUOgCIXBjrOSY3nqfTOEUp1pML0/64Y=;
	h=Date:To:References:From:Subject:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ETAc0hHV7I7WtH2DEIC3wxOkuq7U068B2b/QHAbK6COF5URKHhFHPp2Tzhdl7ubGH
	 xsZ+dbikG/ec6uBYNt9ANjiN3zuJBsJ1LkjhVzXzyK/IFjgpAFVtxT7910hrr9jkxz
	 KpqgTXwyc8z3Pfb5VLGdsWJZlHU+MzepYL3vJ7mE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F8A0F80246;
	Fri, 28 Jan 2022 21:13:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09D00F80240; Fri, 28 Jan 2022 21:13:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 423BCF800C0
 for <alsa-devel@alsa-project.org>; Fri, 28 Jan 2022 21:13:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 423BCF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="D6NcriFn"
Received: by mail-lj1-x22f.google.com with SMTP id e17so10611962ljk.5
 for <alsa-devel@alsa-project.org>; Fri, 28 Jan 2022 12:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=oyubvIRPcf+wBpgIYExVWJ5YZhIrxzImt8AH+1iC93g=;
 b=D6NcriFnSEXRpif13YgafQO4ysVvmzYWAjmcnbkbVuchgEfLRzQ7Zx4HulzSVWb0uW
 pENSBuQnNaHqioOntSjh0R+DdszzzVVyqlWht0A6t8n+XKlbR2kqWDhbtQcvW4QjGOHl
 A76gS8uOoUtliXRB2yPDg/mK5LK9bgVrQ+ayY65uJeVAT2UzPm+EI61JzZ3rL2b/DRNq
 EYfsFBUrab/NZX0vZblw9YoTDIzQAQkI0Utz1gAdUPa38F1ndakp6Kdq9oKWkUqbFI/R
 s3O1CF2b2oxn9V7oOHwoJ3lx+ynds8YLDv1J9A5yv5D5IhDBP2Im9KFUueShIwG9uZK4
 ExNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=oyubvIRPcf+wBpgIYExVWJ5YZhIrxzImt8AH+1iC93g=;
 b=Jmynm9WIwiPUx0SMjowSb7Mzbfn4mSI/PPw9CZXZrJsxRgBzsXmiALbVXM/BqEwFIO
 u5xjY66W4n1yu4zE6C0buxEgr237wVr6uvyWwJJ5HcOsYbXZqflGKWZOASQEOjfBT0B8
 5wpFElLfnVA4ZNg4jRDOOsMnhEQJiYjj3ZIhomSbm1U854eFwMXGXXKscCuqWdLFLGKK
 Gy/aWlM8ARhEMN7iTwQAuMzd9RZEAZBWEKAoE9kY1d00ugtqRtInmANJo9962kcI9bq+
 54tmamPwxzhoBUQS5QP50YxmOR2+SFwIBJFR4hZ9vCLssH8oNkTqlMKER4gAQBvxHNS+
 V0Uw==
X-Gm-Message-State: AOAM530ZsTc6uPc35zcptX9lR6L3eajsZx1UZj8CrjUq8H1ty0XY19WP
 QIRWbd6SFUezlhw+F9XpNMg=
X-Google-Smtp-Source: ABdhPJzMVe/R5oHvZyV12m3N7NRIsQaaGH2zXBqERJV1ovuYz/yUqPpmy0PXU7hBmMVHmYcu4hIOHA==
X-Received: by 2002:a05:651c:a12:: with SMTP id
 k18mr4995935ljq.429.1643400815747; 
 Fri, 28 Jan 2022 12:13:35 -0800 (PST)
Received: from [10.0.0.42] (91-153-170-164.elisa-laajakaista.fi.
 [91.153.170.164])
 by smtp.gmail.com with ESMTPSA id d20sm1755606ljl.25.2022.01.28.12.13.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 12:13:34 -0800 (PST)
Message-ID: <609b03e1-66e0-9bfd-cbe1-810d816df659@gmail.com>
Date: Fri, 28 Jan 2022 22:18:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To: Jayesh Choudhary <j-choudhary@ti.com>, robh+dt@kernel.org
References: <20220103074427.4233-1-j-choudhary@ti.com>
 <2cf3c89c-169f-3421-25d4-c80a6c9737ae@gmail.com>
 <83c51ee4-ac10-0e44-d1cc-f69cebcbf0b8@gmail.com>
 <f2bf4959-af15-04ad-78c3-aca883173d65@ti.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH v5] ASoC: dt-bindings: davinci-mcasp: convert McASP
 bindings to yaml schema
In-Reply-To: <f2bf4959-af15-04ad-78c3-aca883173d65@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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


On 1/17/22 12:07, Jayesh Choudhary wrote:

>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - ti,dm646x-mcasp-audio
>>>> +      - ti,da830-mcasp-audio
>>>> +      - ti,am33xx-mcasp-audio
>>>> +      - ti,dra7-mcasp-audio
>>>> +      - ti,omap4-mcasp-audio
>>
>> This is the only thing which bugs me: the pointless '-audio' postfix for
>> the compatible string...
>>
> 
> Removing the postfix would also require a lot of dts changes which might
> be backward incompatible. So it is probably not a good idea.

My plan was to not convert the ti,*-mcasp-audio txt file to yaml in the
first place, but do it right with as ti,*-mcasp

One of the outstanding issue is the multiple serializer support. It
should be in core as things are just working by luck atm when more than
one serializer is in use (via the card node).

> Should we still consider this?

Since we are officially documenting the -mcasp-audio, I don't think it
would be a good idea to introduce different binding for the very same IP
just for the sake of it.

The new (and imho correct) binding would require quite a bit of work in
the driver and in the core level (plus the simple-card family), but I'm
afraid, I will not have time for it.

-- 
Péter
