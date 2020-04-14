Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADE21A83FC
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 17:59:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC22416A1;
	Tue, 14 Apr 2020 17:58:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC22416A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586879947;
	bh=2wjrB/x6qQtnTgf/VML5hvriIo6PQaXgGH7ht+n7jPw=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LFcXf9PYKoW7YXB9XPA+8Qa+DXnGVgyXGRqDql/h/3u6zs/wt9z5XGke5M60pa7XA
	 ncVD2Mvr7GcetYOA3qX8oI/FnfgFEZ9C5m9M1ehlQSReM7RlxERBRyTJ/4udFT21+L
	 Xwohf4Tcp04scnobQFq0B3NLYwI2rKkv23I/NOMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9991BF8014E;
	Tue, 14 Apr 2020 17:57:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5167BF8013D; Tue, 14 Apr 2020 17:56:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mupuf.org (mupuf.org [167.71.42.210])
 by alsa1.perex.cz (Postfix) with ESMTP id B49FCF80115
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 17:55:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B49FCF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=spliet.org header.i=@spliet.org
 header.b="dpKfjzPK"
Received: from [10.42.0.61] (unknown [131.111.247.158])
 by Neelix.spliet.org (Postfix) with ESMTPSA id B878B60040;
 Tue, 14 Apr 2020 16:55:43 +0100 (BST)
DKIM-Filter: OpenDKIM Filter v2.11.0 Neelix.spliet.org B878B60040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spliet.org;
 s=default; t=1586879743;
 bh=CYqoPW/buZjXXgZojmjfwJnzGO6GV+q/b0vST/0I2/0=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=dpKfjzPKRXrScF4pCeii+hJjwPO47HzWAX3hswLusvNH4pLvQlnt9D+1DHJuI0J+U
 FnB4em/DDF8EmUj38blUgoBZl3/MdTygbEG83/5uZB4Oer7dvXfXKiTdJ2DoUB2Ig8
 vl+KnL+ZwU+yI/RaHKAz0V5Q0gHW0ZTZgZcrAEhU=
Subject: Re: [FRUSTRATED] Missing Sound Codecs for Lenovo ThinkCentre M710e
To: Michael <michael@wizard.ca>, alsa-devel@alsa-project.org
References: <7046b5fa-af79-5221-f54f-3d4be22e879e@wizard.ca>
From: Roy Spliet <nouveau@spliet.org>
Message-ID: <34cfffec-39f7-d0e5-bab6-c4b0eb47943b@spliet.org>
Date: Tue, 14 Apr 2020 16:55:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <7046b5fa-af79-5221-f54f-3d4be22e879e@wizard.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.102.2 at Neelix
X-Virus-Status: Clean
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

The 4.15.0 kernel was released in January 2018. Your computer was first 
sold around May 2018 (at least where I'm from). It's hardly surprising 
that some components in your computer aren't supported. First try 
upgrading to a newer kernel (ideally 5.6) before you try other steps to 
debug your issues.

Roy

Op 14-04-2020 om 15:16 schreef Michael:
> Hi All,
> 
> Technically this probably should go to a support channnel, and not a 
> development list, but at my wits end.
> 
> Kernel:  4.15.0-91-generic #92~16.04.1-Ubuntu SMP
> 
> dmesg | grep snd
> [   12.656843] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops 
> i915_audio_component_bind_ops [i915])
> [   12.807521] snd_hda_intel 0000:00:1f.3: CORB reset timeout#1, CORBRP = 0
> [   12.810429] snd_hda_intel 0000:00:1f.3: no codecs found!
> 
> I have been playing with settings in the modprobe directory for Also 
> with no effect.. current settings are..
> 
> options snd-hda-intel single_cmd=1
> options snd-hda-intel probe_mask=1
> options snd-hda-intel model=thinkpad
> options snd-hda-intel position_fix=3
> 
> Have tried model=generic, and various other suggestions from online, but 
> at a loss.  Don't see anything in:
> 
> https://github.com/torvalds/linux/blob/master/Documentation/sound/hd-audio/models.rst 
> 
> 
> Your ALSA information is located at 
> http://alsa-project.org/db/?f=7898b30139e9a91fecec22f3ee46049f33248b85
> 
> Can anyone point me to how to debug this further, or any way to force 
> detection of a proper codec for this model?
> 
> 00:1f.3 Audio device [0403]: Intel Corporation 200 Series PCH HD Audio 
> [8086:a2f0]
>      Subsystem: Lenovo Device [17aa:313c]
>      Kernel driver in use: snd_hda_intel
> 
> 
>         description: Motherboard
>         product: 313C
>         vendor: LENOVO
>         physical id: 0
>         version: SDK0J40697 WIN 3305181519567
>         slot: Default string
> 
> Booting in legacy OS mode, not EUFI..
> 
> 
> 
