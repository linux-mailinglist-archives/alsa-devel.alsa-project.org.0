Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AD9A10267
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2025 09:53:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCF46602A0;
	Tue, 14 Jan 2025 09:52:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCF46602A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736844773;
	bh=ePLveDncFA1QceFyajNbMHSnrnDlVu90kYwV5VWjDXw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WbZ9wQqi0Jw240nPPPeBeXKA0WrcykeJWJfWdN8BJ1jljBNS8ewWaVmjJgR5qLCHb
	 mkZhLJ12N3E82OScjhY9LnQqK9cdFCKMhkN2GeQ6cYAriEtRmtLCTXbXqgKyEAZbGb
	 Un9OkRu3CqhPGob3JwZsl1Wp0XYEHiPaJL4uIDcc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC174F805B3; Tue, 14 Jan 2025 09:52:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3CF2F805B6;
	Tue, 14 Jan 2025 09:52:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34D40F8024C; Mon, 13 Jan 2025 22:38:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE68DF80169
	for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2025 22:38:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE68DF80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Mw9/9pq2
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aaf3c3c104fso836008666b.1
        for <alsa-devel@alsa-project.org>;
 Mon, 13 Jan 2025 13:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736804282; x=1737409082;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rIr/EX3/hI6u58j1cw15fQTC3hhjJsctEXKNiZBULH4=;
        b=Mw9/9pq28IuG3IeQq8RYxk1lpkmDxsoSA7DO/d5McdxD3KLKnE1EUvDmsmUgqqAHgr
         Tbh86nUt3L6mXjeKYcWbDhwybk9sEIUaIwn/iChlWRoyBZ2QI6mlj3YOF7/kcVng6J6a
         agwl1aRB4aKNkzxoJtA3DJIFstDYVr1/QYVgjE715Pv1xMaU7qMAM81u79L7GaNRqp8a
         fiPX9HyN4Cs68geH49uSsXmkvTgQV7lf8xUSDEa1S26E+VpqH9iQW1V/7L+NPBWrmIK3
         Hzq32qLK8nuE9TRifotTIkMYN1L8US4CcotG07gGq4SOK15apQPwrRMCJtljli7JY5DO
         nemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736804282; x=1737409082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rIr/EX3/hI6u58j1cw15fQTC3hhjJsctEXKNiZBULH4=;
        b=Sf4PGPtnnVSLRPxr0Wq6jmHse2ApbYsGEN+zsP0qFaeYoZrHSQzDkKNE+5gVUueRJ9
         5dQLjWoqJ37mMwj/9ljX16OweVCBFU+CjuSpVl5K0CedSKYZ7J1uSk4HkzQrV6SZK7OT
         RouUiXtwgtMOsQnMeIjjgM2bFkECAFVFEQUPqL/DPZe7kgS30scVJNR2YOIWO12fI8xP
         wLdA1U0rDKonkZCMjKKiv86h9OYaJgJmlRWNLuvpI9eIImKFQp/n79uJagqkxVj+B1tc
         aFTs3crfFLv2XQnvokb8fVT6FaIZl9dsYRwwctah5868SqVLjO5zEWSI2wr5UgNW4Ryn
         KrTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxjySNyNol4rTrRJk/EmMTOEXTUCW3tRe3UJjhjd/M+HYk+wVfDpYjYnqWPYmgrQXqBRGn1xy8ppOv@alsa-project.org
X-Gm-Message-State: AOJu0YxNT10TkaHiazUhw5pv4ItdvlRomShyyjJ9zKn2I6KhjUJu3FAM
	IGKQs/A0R/d2iKMGEeIluqCcJM35hmVN8YGJSBcB5d1rMNWuXllj
X-Gm-Gg: ASbGncs754KVKzeyZqtBykU3vPRpAonNq4UI5OTZqL9G5gdnLBgwN9zO3VDXNkzLmlZ
	bziq0HD9dFalqA5XOJaAcqBck6Dxw3F20rGkvITaJiWlhm40k17n+5mQC80QiJyN1MH/YyZ0KJh
	L48NEApzfJb3Ciz+/IoJbsUotzKFWogLp9swLUM3Nvia/xTtC3TSQchS6DAvSUUt2R8VphqctWl
	ODNsM01digSUQ6pmB3c2+8P1H67RS45xEAqKQ9fXgOLHWXiVc6LH2h2DfiD0KGeZWkDww==
X-Google-Smtp-Source: 
 AGHT+IEtumf6KZWBG7fEiqjaY9M5AhLT40xlsS9Y4Rizcwa+OIRQuS030NjAtIg5v4qc5rFGXMVmAg==
X-Received: by 2002:a17:906:7950:b0:aa6:7933:8b2f with SMTP id
 a640c23a62f3a-ab2ab16a302mr1798158866b.9.1736804281754;
        Mon, 13 Jan 2025 13:38:01 -0800 (PST)
Received: from [192.168.1.10] ([95.43.220.235])
        by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-ab321168be8sm140707366b.121.2025.01.13.13.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 13:38:01 -0800 (PST)
Message-ID: <30a066e0-08d8-4ad3-a0ba-e44f4379427e@gmail.com>
Date: Mon, 13 Jan 2025 23:38:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] soc: audio-graph-card2: use correct endpoint when
 getting link parameters
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, tony@atomide.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Merlijn Wajer <merlijn@wizzup.org>
References: <20241220071126.1066691-1-ivo.g.dimitrov.75@gmail.com>
 <db8321e3-e9c8-4f1e-8ebd-78d286320d55@gmail.com>
 <f4a65ffc-7f0d-4d45-83b9-2377cb00f3b1@sirena.org.uk>
 <9cc6c2ad-0811-482d-91c8-d162bd7f09f4@gmail.com>
 <dd64e1f4-1f58-4760-a664-04fa6723e531@sirena.org.uk>
Content-Language: en-GB
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
In-Reply-To: <dd64e1f4-1f58-4760-a664-04fa6723e531@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: ivo.g.dimitrov.75@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AW2OW4MU4OWWZFEAB5YDDSTQZMODNXKY
X-Message-ID-Hash: AW2OW4MU4OWWZFEAB5YDDSTQZMODNXKY
X-Mailman-Approved-At: Tue, 14 Jan 2025 08:51:49 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AW2OW4MU4OWWZFEAB5YDDSTQZMODNXKY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 13.01.25 г. 19:01 ч., Mark Brown wrote:
> On Mon, Jan 13, 2025 at 06:24:18PM +0200, Ivaylo Dimitrov wrote:
> 
>> I understand people are busy, but I also see community sent patches being
>> treated with low priority, or being silently ignored too often lately, but
>> lets not go into that.
> 
>> I sent that RFC patch on 20.12.2024, today is 13.10.2025 - if this is not a
>> reasonable time, well, what is? By the same time I sent 2 other patches and
>> they are already in -next. In the meanwhile I see patches sent in the
>> morning to be reviewed till the end of the day - not critical bugfixes
>> patches but new functionality.
> 
> Well, you've used a subject line for a different subsystem so there's a
> good chance that I simply didn't look at the mail beyond that (many of
> us get a lot of random CCs).  You also don't seem to have CCed the ALSA
> list, nor for that matter Morimoto-san who maintains the generic card so
> perhaps I was just waiting for his review.  I honestly can't remember.
> I'll also note that there's only been a week of work time for me so far
> this year, and you sent this on the last day I worked last year.
> 

Honestly, I was surprised Morimoto-san was missing, but see:

ivo@ivo-H81M-S2PV:/mnt/VM/home/user/linux/droid4-linux$ 
./scripts/get_maintainer.pl 
0001-soc-audio-graph-card2-use-correct-endpoint-when-gett.patch
Liam Girdwood <lgirdwood@gmail.com> (supporter:SOUND - SOC LAYER / 
DYNAMIC AUDIO POWER MANAGEM...)
Mark Brown <broonie@kernel.org> (supporter:SOUND - SOC LAYER / DYNAMIC 
AUDIO POWER MANAGEM...)
Jaroslav Kysela <perex@perex.cz> (maintainer:SOUND)
Takashi Iwai <tiwai@suse.com> (maintainer:SOUND)
Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com> 
(commit_signer:1/1=100%,authored:1/1=100%,added_lines:28/28=100%,removed_lines:31/31=100%)
alsa-devel@alsa-project.org (moderated list:SOUND - SOC LAYER / DYNAMIC 
AUDIO POWER MANAGEM...)
linux-kernel@vger.kernel.org (open list)

this is on 6.6.y, against which the RFC patch is. Perhaps I should have 
called get_maintainer.pl in -next tree, my bad, will note for the future.

>> Also, I don't understand how the ping was content free, given that it was on
>> top of the original patch, unless I don't get what "content free" is
>> supposed to mean, possible, I am not native English speaker.
> 
> Your mail added the single word "ping".  That is not saying anything
> meaningful so adds nothing, and as the form letter I sent indicated
> results in a mail that's not directly actionable.  As it says:
> 
> | all) which is often the problem and since they can't be reviewed
> | directly if something has gone wrong you'll have to resend the patches
> | anyway, so sending again is generally a better approach though there are
> | some other maintainers who like them - if in doubt look at how patches
> | for the subsystem are normally handled.
> 
> Blub for the subject letter thing:
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

oh, yeah, sorry, that should have been ASoC:, not soc:

Ok, I think both of us wasted lots of cycles in vain, please, just 
confirm if I shall do anything else but wait.

Thanks and regards,
Ivo
