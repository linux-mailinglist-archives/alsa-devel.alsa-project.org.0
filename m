Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 561B1227C8F
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 12:09:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED15D16C1;
	Tue, 21 Jul 2020 12:08:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED15D16C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595326159;
	bh=XBVjIPEjPRc4AkpcT1fccbe8bv7oLq0eZKP38gm6rGI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dbCpOUCrzq5Mdel66SFzEZRwF024Hio2UiPgHxk4eo7rccE1NMLUN5GbOxQPEnMUG
	 MQgjauMyGAOgwohJezT9OCM5Z/K2YAwbdj3PqMg3pHv3YLDWFAvbSLIRz9f9v7Bw8K
	 LAK8q/YcjdVLHuy2zwdtBNCGNaRBBWrBtrXvHnf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EA70F80268;
	Tue, 21 Jul 2020 12:07:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 368FBF8024A; Tue, 21 Jul 2020 12:07:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4E34F80117
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 12:07:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4E34F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hH+3Lwqv"
Received: by mail-ej1-x644.google.com with SMTP id o18so21049159eje.7
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 03:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LGnqsfllHoBsZDFa/Yfq/5wnk/bRezL0XxcX7i4+nlo=;
 b=hH+3LwqvkheCncgt3NhutrbrcMDcWSKv49sd+ijNnfI6W65ZZDW4aoCG/zlcPM872/
 N0hrJiSAQ8IvZOjoV+tbL7vWFAU1oqnMx5cdgBsADcgUh0Ej5652KCJ1dObigIcmtqhA
 Rbez8F7n34NMfrs7wHbGUU7o7X/3dm2ETUPL6dFSot2vXdkrjyylmm8PvocGES8snO7b
 ApnjdnoV12f+bHsev3DXDnzBFY4pAPO9jvjFqBW2xTDGD3oH0VgM/TLeIOxT9W3WM5GE
 d+tUEyTx9brr0rlYxtOgY3jnYux35ktBEfTsZkviGcotQBq5Kf29O8NqPiIYI8e+EK85
 mLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LGnqsfllHoBsZDFa/Yfq/5wnk/bRezL0XxcX7i4+nlo=;
 b=d5ogXleZ1ywVxsw35Hzi5NjnAqNNlizbnby3A6Y/d0W31zM+2wNat7N6ctAMXlmJRh
 BaQbcPwsJmrNP4agYJQ2irUIpoZ+3mF4B9URI3k2wgi+0MrRyfstjpuG3M3ufmQrs5mP
 LqnoxSplHdrsjBYIirF2WX7zemwngrkw9y21VYIWQYFU1iabyi6jIYNQ8pZndNQ70qQ9
 uHabWEF9JPQo6EInckdrpqW6CdOQ6QS9q/mQ+x0R3agUgwCCaCwb2npZfURXShKboiaG
 CcT+3WF91yZMkvar4RIIkRGyxgLaKWUnm+uLVqvqUSljVYpvQfPUD79yb44azUKEJVkk
 7EBQ==
X-Gm-Message-State: AOAM531bAjxc/uz5egWzcwP+gUZ4BemtRcsGhuShDyiRQrPqsbhRbnbp
 N7SCkcYoyKhI1hEtrRuKTFY8+/3p8Ncb5A==
X-Google-Smtp-Source: ABdhPJynnYH289Gu7eMFXp7DphClJhRcjlcr+YW4zR5hJZin0Al9Y+0EwIOzMH7923cweaVYJ8i2dA==
X-Received: by 2002:a17:906:1414:: with SMTP id
 p20mr24246343ejc.247.1595326047534; 
 Tue, 21 Jul 2020 03:07:27 -0700 (PDT)
Received: from ?IPv6:2001:1c01:2f03:7200:763c:d807:63d8:4d15?
 (2001-1c01-2f03-7200-763c-d807-63d8-4d15.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:2f03:7200:763c:d807:63d8:4d15])
 by smtp.gmail.com with ESMTPSA id dj22sm17010656edb.54.2020.07.21.03.07.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 03:07:27 -0700 (PDT)
Subject: Re: [PATCH 0/3] snd-usb-6fire: firmware load and pulseaudio assumption
To: Takashi Iwai <tiwai@suse.de>
References: <20200721064853.9516-1-rene.herman@gmail.com>
 <s5hlfjdz46r.wl-tiwai@suse.de>
 <a0684b66-cbe3-de56-1841-3dc10df1fd5c@gmail.com>
 <s5hft9lz2jp.wl-tiwai@suse.de>
From: =?UTF-8?Q?Ren=c3=a9_Herman?= <rene.herman@gmail.com>
Message-ID: <e2098b84-f5ed-278f-7a16-e271a0f8725b@gmail.com>
Date: Tue, 21 Jul 2020 12:07:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5hft9lz2jp.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Torsten Schenk <torsten.schenk@zoho.com>
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

On 21-07-2020 10:37, Takashi Iwai wrote:

> Submit a complete set freshly as a v2 patch set.
> 
>   [PATCH v2 1/3] ...

Done, although now only the first two are left since you were of course
quite right about the third.

> The first return for kmalloc error should remain so, but the rest can
> be replaced with goto out.  That I meant.

I know, but that's exactly what it already did :) I guess it looks a bit
non-generic as a patch due to me also unifying the error path due to
that same change in structure. But any case, v2 is the same as v1
therefore, minus the fixed paths of course.

>> Re: [PATCH 3/3] snd-usb-6fire: Unmark struct snd_pcm_hardware const
>>
>>> This must be superfluous.  usb6fire_pcm_open() changes the field of 
>>> the copied pcm_hw, not the original pcm_hw itself.  Otherwise we
>>> must have got already a compile warning / error.
>>
>> Unfortunately no; it's as mentioned in the cover letter accessed via
>> pointer: usb6fire_pcm_open() sets "alsa_rt->hw = pcm_hw" and then
>> changes pcm_hw as e.g. "alsa_rt->hw.channels_max = OUT_N_CHANNELS;".
>> I.e., not a copy.
> 
> Note that it copies the whole instance, not the pointer.  So the
> current code is correct.

Yap. I blindly assumed that snd_pcm_runtime.hw would be a pointer and
synchronized that with the code without even really thinking about it by
convincing myself that, as in the case of an array, that "pcm_hw" name
would deteriorate to a pointer automatically. As such now keenly aware
that my grasp of C semantics has also taken a bit of a nosedive over the
last 10 years or so, I'll be more careful. Patch dropped.

Thanks.

Rene.
