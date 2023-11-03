Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 964837E03E6
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 14:45:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4BB94E;
	Fri,  3 Nov 2023 14:44:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4BB94E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699019141;
	bh=V/50a013L6523cULgpV02kOzNzBVb9HTAPoG1d0Rc5A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gyJMmfYebCWfgAjhbLL/kZIRPSFP0gEXT5hwH/PB8hhIMt5VQRPfym2iuJrfIvF09
	 PcVpBDmvYrhaKC1kLZ5FdQgp6c1+agFy4FeYdMBFy+JrACmThGTxY683TsFVRTHreL
	 ZPpGC9NN+0ncSdbxkaKAKVABmenM8AYIxzE42W/A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B1A3F80563; Fri,  3 Nov 2023 14:44:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 983D2F8055B;
	Fri,  3 Nov 2023 14:44:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01331F80563; Fri,  3 Nov 2023 14:44:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9EFBCF8055A
	for <alsa-devel@alsa-project.org>; Fri,  3 Nov 2023 14:44:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EFBCF8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=E6HD/Gdh
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6b497c8575aso2269214b3a.1
        for <alsa-devel@alsa-project.org>;
 Fri, 03 Nov 2023 06:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699019049; x=1699623849;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cAwnuNWOqdk8r7RMLFguMdGxoKK8GFPpsUqe+jMzKdA=;
        b=E6HD/GdhXYsS6AUL84tRxKWZqCWFAwdTC7NAXSWneqbfbV+Lij5zm5VvzkyhJgEazS
         zTyiZt2Fx/JRVW31jvl3CHulcGQK+MXSF00h4ISey/rX7mbtYxNuhHysDzm5klE9hnKS
         Hbg9ruouq580zZB4aYFCeJuWP+D8ZkTkhuIOnGEuuT2tn+2S4Zp4EF1zLjgHUZPNfpwh
         OGn0ebgKj7qsyxIkRZKcBE40FyCPtwjassiTU5CRjMtBmzfUtIqkleXEZOjYrIk8ZF0I
         hE0fAadn/9LJTbs9nRj5v3SBWd3uk4h9Y3SGvZOCzb/CJoKk8evHELqijlEwJdS++I8O
         wXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699019049; x=1699623849;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cAwnuNWOqdk8r7RMLFguMdGxoKK8GFPpsUqe+jMzKdA=;
        b=bBK8HRHIRAmQ347H+tOfldvKL6t2wl/B+xQjaQXeTdCILOmzHdGyE6kYIfdN0BHSWX
         ztlWH3oz1rFDOJWmTQYSRihgrEtA98p15BwherpECIHMjGE20Qmg82a1UXGvf++cj7fH
         uDiVCbSEfuPX6yt2ILYQ84sLXvJgkm0iuilSsnARucGutg8H6W6k3tC54qS9ntAU6t0+
         sbjnf0V3XsTyuUdw/H32nGVuEGwUSqU9WcPUlrVvMivVb7KeY95mNm8L8XG136MbPXwh
         Z07ohsc116lgFVeQqAjI591zxaKMRXUc+f7FcwJTjEqT41wRIoCki32ijBdUkgxnB7kJ
         Ntkg==
X-Gm-Message-State: AOJu0YxZCWUy7OhACK03JDPy96/NR7j9whsbGERFDAeIJAkwAJrosPMT
	lCZUMZ9vb8BHqKbJgWSLZxs=
X-Google-Smtp-Source: 
 AGHT+IGt8gFlTfzrJIRGBAC72qQjPlYWGPSABBzTLE9SMs00eMp4wOMMiOVSjuxBEX+fQWfTPHQfvw==
X-Received: by 2002:a05:6a21:7881:b0:17e:2afd:407f with SMTP id
 bf1-20020a056a21788100b0017e2afd407fmr28675924pzc.9.1699019049094;
        Fri, 03 Nov 2023 06:44:09 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id
 s1-20020aa78281000000b006b4a5569694sm1462691pfm.83.2023.11.03.06.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 06:44:08 -0700 (PDT)
Message-ID: <1578a6d3-e2f0-443e-85d1-55c639aa1910@gmail.com>
Date: Fri, 3 Nov 2023 20:43:58 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression apparently caused by commit
 088a40980efbc2c449b72f0f2c7ebd82f71d08e2 "ASoC: amd: acp: add pm ops support
 for acp pci driver"
Content-Language: en-US
To: syed saba kareem <ssabakar@amd.com>, Marian Postevca
 <posteuca@mutex.one>, Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
 Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
References: <87a5v8szhc.fsf@mutex.one> <ZUQssoD2rUHSYQ2v@debian.me>
 <610d562f-0bbc-485c-ad63-9534fa4ba937@amd.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <610d562f-0bbc-485c-ad63-9534fa4ba937@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TSUWBMY7U53HOHJ34AMWRRU626UPZQ7N
X-Message-ID-Hash: TSUWBMY7U53HOHJ34AMWRRU626UPZQ7N
X-MailFrom: bagasdotme@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TSUWBMY7U53HOHJ34AMWRRU626UPZQ7N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03/11/2023 20:30, syed saba kareem wrote:
> 
> On 11/3/23 04:41, Bagas Sanjaya wrote:
>> On Thu, Aug 03, 2023 at 10:22:07PM +0300, Marian Postevca wrote:
>>> I'm trying to develop a sound machine driver based on the acp legacy driver.
>>> The first version of the driver was sent for review on the alsa mailing list this
>>> spring: https://lore.kernel.org/all/20230320203519.20137-1-posteuca@mutex.one
>>>
>>> I'm trying to fix some of the issues that were brought up during the review back then,
>>> but when I ported the patches to the latest commit on the for-next
>>> branch, I noticed a regression where I couldn't hear any sound at all.
>>>
>>> So I started a bisect session and found that the first bad commit is:
>>> ASoC: amd: acp: add pm ops support for acp pci driver
>>> commit 088a40980efbc2c449b72f0f2c7ebd82f71d08e2
>>> https://lore.kernel.org/lkml/20230622152406.3709231-11-Syed.SabaKareem@amd.com
>>>
>>> If I revert this commit sound works as expected. So I started tinkering a little bit
>>> with it and I believe that what happens is that the acp pci driver
>>> enters the autosuspend state and never leaves this state at all.
>>> I noticed this because if I increase the autosuspend delay to a much
>>> larger value, then the sound works until that delay passes.
>>> I added traces and I can see that when the delay expires the suspend callback snd_acp_suspend()
>>> gets called, but the resume callback snd_acp_resume() never gets called.
>>>
>>> I'm no expert in runtime power management (though I did read a bit on it), so I don't understand
>>> all the things that happen underneath, but one thing that is not clear to me is who's supposed
>>> to mark activity on this device and keep it from entering autosuspend if the user wants to play
>>> some sound? Shouldn't there be some counterpart that calls pm_runtime_mark_last_busy() ?
>>> I looked through the code and can't find who's calling pm_runtime_mark_last_busy().
>>>
>>> Some help here would be welcome. Is there something missing in my machine driver code, or
>>> is the runtime pm handling in acp pci driver wrong?
>> Thanks for the regression report. I'm adding it to regzbot:
>>
>> #regzbot ^introduced: 088a40980efbc2
>>
> We were working on some other priority tasks, will upstream the changes
> 
> by next week.
> 

OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara

