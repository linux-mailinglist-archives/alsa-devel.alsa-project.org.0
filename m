Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AA84082E0
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 04:38:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA9D61658;
	Mon, 13 Sep 2021 04:37:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA9D61658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631500680;
	bh=n77Pjwm/zDjtmqTIHFFXnVEuRifbsKjJF+2HGulDMZs=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j95CApXWiEJAtivSpmyGZbelJpdghPjxY6pdkNvdSVVo2TUvMV8/naWcryP5YRalB
	 hbCsT6lFMttzYfGllpdrK8IboYS6aCZ+ajOVjhI78gZ/LqPX+F8iqcfkKZX/46PT5E
	 APYhkL+fydD7vJi3aap98irK6xG5X6ZbQ3t8kGxo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34088F802E8;
	Mon, 13 Sep 2021 04:36:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 085BAF8027C; Mon, 13 Sep 2021 04:36:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74DF3F80132
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 04:36:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74DF3F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com
 header.i=@kernel-dk.20150623.gappssmtp.com header.b="Xvlg1zw5"
Received: by mail-io1-xd2f.google.com with SMTP id f6so10216026iox.0
 for <alsa-devel@alsa-project.org>; Sun, 12 Sep 2021 19:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=LOKzdG7FJ6Wiqi/NapOelxZqi44s+sbtLyGjvCvSg3M=;
 b=Xvlg1zw5ji16ATQhcjvU1AINQhjQV1EYCrP45e5DrYUluuPLJ/r3C3HtU2Q4B0/fIf
 t1spJ5Xct2fFwvdIuEdVTKSX3npHxJpgYcKlHyxZMP1ROkUtOu29+7E7o0ZacVVmgrcX
 bdincoEPdIfhViV+K7Jxm+sLcgyuuV+G8u53GLEFbV/tAev7eJONALoy97UpSoRfmzR2
 Oj5QV9bdRBKEbwkk481g4e+P3xz87stDYQ9CNCIS36uYJXriZgv0Sb6AiITlhdeWl4FM
 CGoExzIolQkJ4v8xSkFTudeeddZGbQ1hcIVFrBNCkDBKm729zmt1QO5BsbVrHBFeNN1S
 gl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LOKzdG7FJ6Wiqi/NapOelxZqi44s+sbtLyGjvCvSg3M=;
 b=K+zWOQ8mAQf/VU4JPeCS74yMMUEzVoN43N2i8SWuU+DQwd5NqvjvpsCENDujXJkIoE
 jPGP1OMmLOwLtjfA/Sw/9akXslBbciDt8ykp4K1uy2misEi2XHE+lYlgFLJYNGGfXbiS
 Oh5ocMLerFKg9jJ9wGBF0XnT5INwlT64scR/lOYfaqIYDQ24/VD+S8zDZz/6jQ3m3EsU
 HhQ2cL8Mw7q12mH76O55t9qtVk5obqliqnyjs/vNE427b0RVzfvyRG71oIo4aiFFKEQB
 iXkLZ2mJaEyOXEQOlvsvESH/VR1kwOzjinbleTiDWAAunA8vfKj6mUy8JFBXHcm2f8wj
 69VA==
X-Gm-Message-State: AOAM531x43VOMxtlNSpDGkjLxNHjZ0UuxJ6ibPUQSK5Kfj0ZzNPESsMj
 U7XXpsbAAZ8BicDeG4O2/+MryCDbAz+ozA==
X-Google-Smtp-Source: ABdhPJxg4awaPoMg7hqLMOy9LHpw44wFZinJ3RPSuPUeiQzmaSArjn992SV27NDMXX9kzFFFkkZyQg==
X-Received: by 2002:a5e:8349:: with SMTP id y9mr6916870iom.34.1631500592640;
 Sun, 12 Sep 2021 19:36:32 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
 by smtp.gmail.com with ESMTPSA id z6sm3924942ill.61.2021.09.12.19.36.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 19:36:32 -0700 (PDT)
Subject: Re: [PATCH] ALSA: hda: Reduce udelay() at SKL+ position reporting
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20210910141002.32749-1-tiwai@suse.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <a6a45e09-6044-3e67-e493-98ba7775a709@kernel.dk>
Date: Sun, 12 Sep 2021 20:36:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210910141002.32749-1-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 9/10/21 8:10 AM, Takashi Iwai wrote:
> The position reporting on Intel Skylake and later chips via
> azx_get_pos_skl() contains a udelay(20) call for the capture streams.
> A call for this alone doesn't sound too harmful.  However, as the
> pointer PCM ops is one of the hottest path in the PCM operations --
> especially for the timer-scheduled operations like PulseAudio -- such
> a delay hogs CPU usage significantly in the total performance.
> 
> The function there was taken from the original code in ASoC SST
> Skylake driver blindly.  The udelay() is a workaround for the case
> where the reported position is behind the period boundary at the
> timing triggered from interrupts; applications often expect that the
> full data is available for the whole period when returned (and also
> that's the definition of the ALSA PCM period).
> 
> OTOH, HD-audio (legacy) driver has already some workarounds for the
> delayed position reporting due to its relatively large FIFO, such as
> the BDL position adjustment and the delayed period-elapsed call in the
> work.  That said, the udelay() is almost superfluous for HD-audio
> driver unlike SST, and we can drop the udelay().
> 
> Though, the current code doesn't guarantee the full period readiness
> as mentioned in the above, but rather it checks the wallclock and
> detects the unexpected jump.  That's one missing piece, and the drop
> of udelay() needs a bit more sanity checks for the delayed handling.
> 
> This patch implements those: the drop of udelay() call in
> azx_get_pos_skl() and the more proper check of hwptr in
> azx_position_ok().  The latter change is applied only for the case
> where the stream is running in the normal mode without
> no_period_wakeup flag.  When no_period_wakeup is set, it essentially
> ignores the period handling and rather concentrates only on the
> current position; which implies that we don't need to care about the
> period boundary at all.

I tested this on top of 5.15-rc1, and it seems like a massive
improvement. No longer have stalled or slowed down nestopia, seems
smooth all the time. I'll report back in a few days, just in case.

-- 
Jens Axboe

