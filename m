Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 962B268A926
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Feb 2023 10:12:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEBE66C1;
	Sat,  4 Feb 2023 10:11:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEBE66C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675501949;
	bh=7xO0RqND9Dy1lYuIaIMMgs9soW0y24ZZdU5MSt+/fQ0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YmW4NHsWO17ZhEaw58FIx+dJWUhLf5E7SZV0qWWCeyXT5U5kCSO4QcwGAm/2IlItv
	 sm3zmhp2cPwU7cv76v285UVR8EIH6binL8Za1PqjXe7WxvF+sb5pcLlj4wFVit1mIN
	 iL5DT6bkZTQYUgDLVSH+gQV5oMuULGASxbIeyi4c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AE13F8001D;
	Sat,  4 Feb 2023 10:11:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3270BF804C2; Sat,  4 Feb 2023 10:11:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,NICE_REPLY_A,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57170F8001D
 for <alsa-devel@alsa-project.org>; Sat,  4 Feb 2023 10:11:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57170F8001D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=C+LOBijV
Received: by mail-wm1-x32a.google.com with SMTP id n13so5442382wmr.4
 for <alsa-devel@alsa-project.org>; Sat, 04 Feb 2023 01:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z+fyEQJdyZKHk6WP1rXB92TckjDQgAvy5f309oa8ysw=;
 b=C+LOBijVhPzgnj8bGGXvyE+s3Elx7P/B9I2sq1kQ7KT1Cy5QdcrF+/N9SeHw7fz2Vy
 PV7g05mv6fvWf5XstFgkzCf79f0r+UjMjWBhosdZj0zJ/KAuemsawZFCPEs1USOChdJf
 mAhRXOrzGa9Et4+mQtXDDkm2aTDeV+n+2d1lYgzdOzfRqxLH6GbJNfgqqAq3JP96rMnZ
 6dD9yXJBq8UkjQ7QgoQzhHtqz2EGqA6PjLaMyD1pWP3z2d9JjCG5Jcn8OgnWlLiH8pa9
 /wP5wirrCfC8PomTpbImMhu9G+CqY3JPARKRgOO6Qm/o1mzr4DI5bCJplOOTjxrwJ420
 1lwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Z+fyEQJdyZKHk6WP1rXB92TckjDQgAvy5f309oa8ysw=;
 b=wdYPq7ZilJZGaRktq3iO2K6kp+l68BHoc9YVeuO9s/yRQvq3AWrp6fZPxa8CqRE/6M
 hOJgl93epXYcOU4kkj3YTKzRuhqmVQ3UDQHNw7pXxzkCFbsw+a3l66LN7rLziIX70GHO
 h5bulFITUQW8YqLKSrBZWJIyg3easbZSxpVmihL/NmR4MCK6Iu9PURYd4YGiIpZZTBbU
 t3qCE6lFhrt8j3RJ1Dllbmf3UnIT58BFBLyss/8c+Z3H3WZdkS0Wi3x3eo3q39ukfPTF
 MhEl1EU77AWyh8gvZKDqsmn9cMlqAFMYOoAhU7jj1UNxWgNst7JLbr0WscuabSHFuaGY
 2ZgQ==
X-Gm-Message-State: AO0yUKV5GAbuV0T+r4fNaWKtZnWyx3ov8o3hfgXgUHclYKRx3sqQxAZC
 ysN1YooCpogxbcEnXtL721w=
X-Google-Smtp-Source: AK7set9Frs2+3UBvsAzqRMsnS3LyGYs2+5rfFbIAaA9yRhlrRaJNdWyAP/BNOBRLCkN2Brmv51/IEQ==
X-Received: by 2002:a05:600c:3b16:b0:3d3:4f99:bb32 with SMTP id
 m22-20020a05600c3b1600b003d34f99bb32mr11830481wms.36.1675501871362; 
 Sat, 04 Feb 2023 01:11:11 -0800 (PST)
Received: from [192.168.21.204] (surfbythesea.plus.com. [81.174.134.71])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a05600c205100b003dd1bd0b915sm7101585wmg.22.2023.02.04.01.11.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Feb 2023 01:11:10 -0800 (PST)
Message-ID: <e2ab7f52-4fc9-bcff-5051-5590ca4f8496@gmail.com>
Date: Sat, 4 Feb 2023 09:11:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Overflow in calculating audio timestamp
Content-Language: en-GB
To: Jaroslav Kysela <perex@perex.cz>, o-takashi@sakamocchi.jp,
 pierre-louis.bossart@linux.intel.com
References: <70ff4e3a-b171-131c-a039-4fc99aa4bbfc@gmail.com>
 <Y9xWlbhPg3PteH5G@workstation>
 <2598bf64-708c-cf62-e634-44db5a850226@gmail.com>
 <74350bce-a6ea-c3b8-7b00-4deb47f7e623@perex.cz>
From: Alan Young <consult.awy@gmail.com>
In-Reply-To: <74350bce-a6ea-c3b8-7b00-4deb47f7e623@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Cc: alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 03/02/2023 18:02, Jaroslav Kysela wrote:
> Thank you for your suggestion, but I think that the *whole* code for 
> !get_time_info in update_audio_tstamp() should be recoded. The calling 
> of ns_to_timespec64() is not enough to handle the boundary wraps in a 
> decent range (tenths years for 24x7 operation) 

Yes, indeed. My ambition was unnecessarily short.


> and the bellow code is dangerous for 32-bit apps / system:
>
>      if (crossed_boundary) {
>                 snd_BUG_ON(crossed_boundary != 1);
>                 runtime->hw_ptr_wrap += runtime->boundary;
>      }
>
I don't understand why?


> I would probably propose to have just hw_ptr_wrap +1 counter (we can 
> reconstruct the frame position back by multiplication and do range 
> check later), 

Would that really help that much? It would extend the total possible 
duration but perhaps ~1523287 years(below) is sufficient.

> remove snd_BUG_ON

Again, why?


> and improve the timespec64 calculation.
>
> The calculation should be split to two parts (tv_sec / tv_nsec):
>
> 1) calculate seconds: (frames / rate)
> 2) calculate the remainder (ns): ((frames % rate) * NSEC_PER_SEC) / rate
>
> With 64-bit integer range, we should go up to (for 384000Hz rate):
>
> 2**64 / 384000 / 3600 / 24 / 365 = ~1523287 years


Yes indeed. How about this?

static inline void snd_pcm_lib_frames_to_timespec64(u64 frames, unsigned int rate, struct timespec64 *audio_tstamp)
{
	u32 remainder;
	audio_tstamp->tv_sec = div_u64_rem(frames, rate, &remainder);
	audio_tstamp->tv_nsec = div_u64(mul_u32_u32(remainder, NSEC_PER_SEC), rate);
}

Alan.
