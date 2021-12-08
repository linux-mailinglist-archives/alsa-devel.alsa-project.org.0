Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7F246DD7A
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 22:16:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99CD7264B;
	Wed,  8 Dec 2021 22:15:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99CD7264B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638998168;
	bh=qsWPlaDKGrX1SyvB69hlTaXYqHbm7YjYXcHP19xgs50=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u5dItx4ZntaqrrcYLQMeir/domcr8tooLc2yYdaH0iuiVZ7du2JrVc3+T5hi8n3Tp
	 w/Aaf0iDWkzWWl1hOK80xSA6A/W53J6xNiGFHgHBpX+AbyW3uaarJ0Ro5b8tQUq6yW
	 5YDsDXf6eEpSAagK+FBPIVtEsEDf956Rw75FLj5g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3EBAF804EC;
	Wed,  8 Dec 2021 22:14:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82F46F804E5; Wed,  8 Dec 2021 22:14:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 174D0F80103
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 22:14:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 174D0F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="EVNwBxgQ"
Received: by mail-il1-x129.google.com with SMTP id j21so3445935ila.5
 for <alsa-devel@alsa-project.org>; Wed, 08 Dec 2021 13:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8ryZ1w0c8Aj/WW7+0em9KmWOSOY1s/jaKp4hTYC9QsQ=;
 b=EVNwBxgQOuoMQUYnwj5gMOldcJnqQfZ6TrJpizobhcirfVHLG6WyblU28pYX+Stdt+
 At95sZd4WdUxBPuIC0lZiTRR8+mwQU4Yqzvn5ML5ZKXyZG1V7cJ0XLbmoeoelJxYmOoR
 2iw4w9HTlYQLAySsjRd2DceDDMq3tW3zJAqkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8ryZ1w0c8Aj/WW7+0em9KmWOSOY1s/jaKp4hTYC9QsQ=;
 b=8EzG6QxZs+BLIIcnh7pw37/wXidCfAxToLQd11Iz/2X3hKiIASgP14z1NYA76eKUU4
 PuhnDVxmNMIgNg2EKOwk5jzzcSctF6zFz/Uix5KaDs22QXhnC8r7c25D4CmVnH4DyQTl
 hJ7hCNE/40M6Hs5N3V0dBxhxwGVyZcc4EzApU7bADqBsvtd+GA+8FShpy+91WaVxcUXP
 /Et7JMcsPQgK5jMxTdPAhyRazUMKOqaT9eOVhKrCrRZu+WgjwABzG4uVqTwbEz7okTgp
 BbpI90slzMpAdiTe1GwJPksYWHKZ6W/6g1dhHrU/H0DsyWm1rs7gYhynJ6U0p1J7xxr8
 6+6Q==
X-Gm-Message-State: AOAM531aIceUDVwT0KvlQiOvh2Q1F/5te6pQtS2JetJARN/zVsuBi0nq
 +gj/GcXyxJIbrXsq9oiubkuV4w==
X-Google-Smtp-Source: ABdhPJzqBvRkuxbtSleJynpQuoNdEXo758C/5IbACtreWQ+T5Hr+sGPcYbPH1rQ0f00rRkCM0f1tTw==
X-Received: by 2002:a05:6e02:154c:: with SMTP id
 j12mr9719269ilu.51.1638998080338; 
 Wed, 08 Dec 2021 13:14:40 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id b3sm2612084ile.26.2021.12.08.13.14.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 13:14:39 -0800 (PST)
Subject: Re: [PATCH v2] kselftest: alsa: Add simplistic test for ALSA mixer
 controls kselftest
To: Mark Brown <broonie@kernel.org>
References: <20211206160305.194011-1-broonie@kernel.org>
 <de0c5677-c2cf-d1ab-68c5-2f410d17b66c@linuxfoundation.org>
 <YbD7+C74DFlZEokt@sirena.org.uk>
 <37f87d39-b5a9-46f6-2667-c0b7aafb731a@linuxfoundation.org>
 <YbERo5FxA6Rm3bhd@sirena.org.uk>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <f18f28f8-fb78-3ddd-153e-40675e5e6e8e@linuxfoundation.org>
Date: Wed, 8 Dec 2021 14:14:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YbERo5FxA6Rm3bhd@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 Shuah Khan <shuah@kernel.org>
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

On 12/8/21 1:12 PM, Mark Brown wrote:
> On Wed, Dec 08, 2021 at 11:59:18AM -0700, Shuah Khan wrote:
>> On 12/8/21 11:39 AM, Mark Brown wrote:
>>> On Wed, Dec 08, 2021 at 10:42:35AM -0700, Shuah Khan wrote:
> 
>>>>> +	snd_ctl_elem_value_alloca(&val);
> 
>>> This is idiomatic for alsa-lib code.
> 
>> This is kernel code that is going into kernel sources. Why follow
>> alsa-lib convention?
> 
> Well, the kernel doesn't generally use alloca() as a pattern given the
> relatively small stack sizes we have and doesn't define helpers like
> these for it...  it's a toss up here between the conventions for use of
> the library we're using and the conventions of the kernel.
> 
>>>>> +	ksft_print_header();
> 
>>>> Add a check for root and skil the test.
> 
>>> There is no need for this test to run as root in most configurations,
>>> it is common to provide direct access to the sound cards to some or all
>>> users - for example with desktop distros the entire userspace audio
>>> subsystem normally runs as the logged in user by default.  alsa-lib's
> 
>> On my system, I don't see any output if run as root. Are there some tests
>> that work as non-root?
> 
> All of them work as non-root if the user they're running as has access
> to a card, if they do or not is system dependent - there may not be any
> cards at all in a given system to find.  Running as root will punch
> through most permission problems but it's not a requirement and a system
> could use a security module like SELinux to restrict what root can do.
> The sound devices are usually in /dev/snd, though userspace can place
> them where it wants - if run as a user that can access the relevant
> devices for the mixer interface (usually /dev/snd/controlC* though again
> userspace can rename them) then the tests will run on those devices.
> 

Sounds good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
