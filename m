Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2A93CCC37
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jul 2021 04:24:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFDBD1658;
	Mon, 19 Jul 2021 04:23:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFDBD1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626661462;
	bh=RdphLGYfx/8TjQmUFHQ5/ES+aj7G7OYuNxv66rDMRK0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ctLX3ipAB5ggWP6MNEDl4ctgejsb9XbwNOZTdbJa44g+A0h5GrxeT73h6RauVqQv7
	 mFrk1ZRfcukobTEWamqM5iAlk+Aioho/HNZ/4ddrKBtL0bJIK96GZjXHvJwQHEZg+R
	 s7MNmgbjbQhZMQ1iouz90RQ8jQOs/8CztOKO3/bk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56EECF80256;
	Mon, 19 Jul 2021 04:22:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 251ECF80227; Mon, 19 Jul 2021 04:22:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96E9EF800DA
 for <alsa-devel@alsa-project.org>; Mon, 19 Jul 2021 04:22:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96E9EF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="j6x7161Q"
Received: by mail-pf1-x42c.google.com with SMTP id a127so15093124pfa.10
 for <alsa-devel@alsa-project.org>; Sun, 18 Jul 2021 19:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=vBKXyvVxdCKu3OqvyqumajmYvsEUys0czY+E4eDZup4=;
 b=j6x7161Qw3k5DqjiWIfNYy2Pej3jSENkrNqMx1espZ54hH9Jfz/622pZg7shSXaMT7
 OJ9Ezo/A00F3Ik0dniPx5rj59aGdtCBpRcaSoLSWZnTD05cZ54stkrWPJgdg83DNdQvj
 G2MBHhq1clNLhl2/H1dEzvNj68XjmR8yY44QkZdnNCDLxtre1m2FjUB8lqxD0oqKtAoX
 8Mbz1cfDW/UCwXpf8SthUzKIGRKVYjXNs7A9IjmxYt/LxM2/Y9+1W9YcWwB9mYaQwlQY
 5Oy1UMG2ge53B4wCau45oepnYaDr5dL3PBPLPDC1lmqS+d+5A9ccoS0vxxEXcftVdIT9
 fyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=vBKXyvVxdCKu3OqvyqumajmYvsEUys0czY+E4eDZup4=;
 b=T+6fGM5PlY1jN0KDFSzjnYBm7Ez7V/RILDr1OXva6oJYCFYPy1Tujd+4QvtNK7ixas
 T1pS4SXucaWaX1JeokRcnUUOMZf0EOqRyXi/QjKFoVP5f99IApfWIerFMVeU9+3a6C7s
 db1pm0SCObpJc8IfPM87n40VYXrc7Lp1P/D3GTYLXP0B1sUbV1pEY/u7CNSJ+4BiB90V
 3O7zCUQfTuV92cyu+0En9EGMRsLl9S+VPSWLUVKvz1QUqQ4qQ+M6UUw3Dr55X8rXfxuZ
 eRtFCBFBN06kKYLJW6vPDjmP38sCcdmgRQKh30sbBXACeskJkST5aSGTvg2BjmP0KuAi
 rMVQ==
X-Gm-Message-State: AOAM531YHGenQ0fPi/UWbUbj+Lx1v/nWPlsgzGTYs55v0Wlso7a/44Sw
 QE7olidcw5XGTtzRslaNIl0=
X-Google-Smtp-Source: ABdhPJzcYKL/xyFFp2W4/EVyqouIpcvkOiDD8SALBl18eeQiQ6JqQJ2+HaX44T7HejoyIa6RSpP/8w==
X-Received: by 2002:a65:5343:: with SMTP id w3mr23150557pgr.51.1626661363320; 
 Sun, 18 Jul 2021 19:22:43 -0700 (PDT)
Received: from [10.29.0.130] ([45.135.186.118])
 by smtp.gmail.com with ESMTPSA id f17sm17711971pjj.21.2021.07.18.19.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jul 2021 19:22:42 -0700 (PDT)
Subject: Re: [BUG] ALSA: sb16: possible ABBA deadlock in snd_sb_csp_stop() and
 snd_sb_csp_load()
To: Takashi Iwai <tiwai@suse.de>
References: <7b0fcdaf-cd4f-4728-2eae-48c151a92e10@gmail.com>
 <s5ho8b3x3wu.wl-tiwai@suse.de>
From: Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <a160198b-19c6-5f50-329a-3f54fd464168@gmail.com>
Date: Mon, 19 Jul 2021 10:22:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <s5ho8b3x3wu.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: "linux-kernel@vger.kernel.org >> linux-kernel"
 <linux-kernel@vger.kernel.org>, alsa-devel@alsa-project.org, tiwai@suse.com
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



On 2021/7/15 18:33, Takashi Iwai wrote:
> On Thu, 15 Jul 2021 12:20:36 +0200,
> Jia-Ju Bai wrote:
>> Hello,
>>
>> I find there is a possible ABBA deadlock in the SB16 driver in Linux 5.10:
>>
>> In snd_sb_csp_stop():
>> 876:     spin_lock_irqsave(&p->chip->mixer_lock, flags);
>> 882:     spin_lock(&p->chip->reg_lock);
>>
>> In snd_sb_csp_load():
>> 614:     spin_lock_irqsave(&p->chip->reg_lock, flags);
>> 653:     spin_lock(&p->chip->mixer_lock);
>>
>> When snd_sb_csp_stop() and snd_sb_csp_load() are concurrently
>> executed, the deadlock can occur.
>>
>> I check the code and find a possible case of such concurrent execution:
>>
>> #CPU1:
>> snd_sb16_playback_close
>>    snd_sb16_csp_playback_close (csp->ops.csp_stop(csp))
>>      snd_sb_csp_stop
>>
>> #CPU2:
>> snd_sb_csp_ioctl
>>    snd_sb_csp_riff_load
>>      snd_sb_csp_load_user
>>        snd_sb_csp_load
>>
>> I am not quite sure whether this possible deadlock is real and how to
>> fix it if it is real.
>> Any feedback would be appreciated, thanks
> The impact must be quite low, as both functions run in different
> state (running or stopped), so those are basically exclusive.
> And, above all, there is no VM supporting this chip, hence it's only
> for the real hardware and it's about very old ISA boards that maybe
> only less than handful people in the world can run now.
>
> About the fix: just split the locks in snb_sb_csp_stop() (also
> snd_sb_csp_start()) like below should suffice.

Thanks for the feedback and explanation :)
The patch looks good to me.

>
> --- a/sound/isa/sb/sb16_csp.c
> +++ b/sound/isa/sb/sb16_csp.c
> @@ -816,6 +816,7 @@ static int snd_sb_csp_start(struct snd_sb_csp * p, int sample_width, int channel
>   	mixR = snd_sbmixer_read(p->chip, SB_DSP4_PCM_DEV + 1);
>   	snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV, mixL & 0x7);
>   	snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV + 1, mixR & 0x7);
> +	spin_unlock_irqrestore(&p->chip->mixer_lock, flags);
>   
>   	spin_lock(&p->chip->reg_lock);
>   	set_mode_register(p->chip, 0xc0);	/* c0 = STOP */
> @@ -855,6 +856,7 @@ static int snd_sb_csp_start(struct snd_sb_csp * p, int sample_width, int channel
>   	spin_unlock(&p->chip->reg_lock);
>   
>   	/* restore PCM volume */
> +	spin_lock_irqsave(&p->chip->mixer_lock, flags);
>   	snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV, mixL);
>   	snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV + 1, mixR);
>   	spin_unlock_irqrestore(&p->chip->mixer_lock, flags);
> @@ -880,6 +882,7 @@ static int snd_sb_csp_stop(struct snd_sb_csp * p)
>   	mixR = snd_sbmixer_read(p->chip, SB_DSP4_PCM_DEV + 1);
>   	snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV, mixL & 0x7);
>   	snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV + 1, mixR & 0x7);
> +	spin_unlock_irqrestore(&p->chip->mixer_lock, flags);
>   
>   	spin_lock(&p->chip->reg_lock);
>   	if (p->running & SNDRV_SB_CSP_ST_QSOUND) {
> @@ -894,6 +897,7 @@ static int snd_sb_csp_stop(struct snd_sb_csp * p)
>   	spin_unlock(&p->chip->reg_lock);
>   
>   	/* restore PCM volume */
> +	spin_lock_irqsave(&p->chip->mixer_lock, flags);
>   	snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV, mixL);
>   	snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV + 1, mixR);
>   	spin_unlock_irqrestore(&p->chip->mixer_lock, flags);

