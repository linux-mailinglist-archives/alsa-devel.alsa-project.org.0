Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBCE6827D5
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 09:59:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9E711CF;
	Tue, 31 Jan 2023 09:58:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9E711CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675155555;
	bh=3cSmVu482f82EtoAicegu+MUZP4XXo6h224Iv0uXFH0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Cn203Gp9woP3qqEzet/FhsrrUFaGoM70YEBMdJvYJVWCpDKjymIvaoG8jQ73DwQVy
	 Zzffhd59xJyeraEEGr6AYxzRAR9LtQaVbWqsunZ5xRvqemT6A0kcBjG0XR/VVQrPrk
	 Kvoph3BvIH3oWUtAd3q8qEoJpEvg0cQlv4dozhMU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11A49F804DF;
	Tue, 31 Jan 2023 09:58:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90EA5F804C2; Tue, 31 Jan 2023 09:58:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DEEAF800A7
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 09:58:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DEEAF800A7
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=p5zhfMKy
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id BD2E6400;
 Tue, 31 Jan 2023 09:58:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz BD2E6400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1675155491; bh=Df32d9+tBJt+l1gaOLtCLqs8ZAu+lNOocFzZQxUlWQ8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=p5zhfMKyp2/yiAjgHlUjIKyS36sk93B1yvGXNfoQM2ekmc+n0XNzoFXX+7neKK0g2
 rUx8o5RMqW7cw8H262p1aaDJWXghzoHp4E1R0yTY2/5kiZbUCA3+eWr4QybgmH2RqX
 DkjPrIblfjMHPeDFas+OfxbelhfCZSYqSVknmm0Q=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 31 Jan 2023 09:58:09 +0100 (CET)
Message-ID: <eec11ba9-009e-a93e-3c1c-403bfa8f37c1@perex.cz>
Date: Tue, 31 Jan 2023 09:58:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] [RFC] ALSA: hda: Fix the control element identification
 for multiple codecs
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20230130082118.3267980-1-perex@perex.cz>
 <87mt5zp02f.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <87mt5zp02f.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: ALSA development <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 31. 01. 23 9:42, Takashi Iwai wrote:
> On Mon, 30 Jan 2023 09:21:18 +0100,
> Jaroslav Kysela wrote:
>>
>> [This is a RFC for the discussion]
>>
>> Some motherboards have multiple HDA codecs connected to the serial bus.
>> The current code may create multiple mixer controls with the almost
>> identical identification.
>>
>> The current code use id.device field from the control element structure
>> to store the codec address to avoid such clashes for multiple codecs.
>> Unfortunately, the user space do not handle this correctly. For mixer
>> controls, only name and index are used for the identifiers.
>>
>> This patch fixes this problem to compose the index using the codec
>> address as an offset in case, when the control already exists. It is
>> really unlikely that one codec will create 10 similar controls.
>>
>> This patch adds new kernel module parameter 'ctl_dev_id' to allow
>> select the old behaviour, too.
>>
>> BugLink: https://github.com/alsa-project/alsa-lib/issues/294
>> BugLink: https://github.com/alsa-project/alsa-lib/issues/205
>> Fixes: 54d174031576 ("[ALSA] hda-codec - Fix connection list parsing")
>> Fixes: 1afe206ab699 ("ALSA: hda - Try to find an empty control index when it's occupied")
>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
>>
>> --
>>
>> Discussion:
>>
>> There are several possibilities to handle the old behaviour - a kernel
>> module parameter (proposed), a kernel configuration option or drop
>> the old behaviour completely.
> 
> Dropping is likely no-go, as we don't even know whether it really
> breaks or is safe, I suppose.  The module option sounds like a
> feasible workaround, maybe with the default behavior defined by
> kconfig.  And we can put some message for the old behavior to mention
> it'll be deprecated, for example.  Then after some time, we can really
> drop the old behavior, too.

OK. I'll add a Kconfig default to my patch. I assume that the default preset 
will be the new behaviour.

> One more question is which driver provides the option.  Does this
> problem happen with SOF HDA driver, too?

I think that this hardware is rare and I've not seen this combination of HDA 
codecs with SOF yet. From the googling and the alsa-info database analysis, 
it's an old issue touching some "hi-end" ATX motherboards. Basically, 
pulseaudio nor pipewire can work with this hardware properly, because the 
mixer cannot be initialized.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

