Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C5B492E5B
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jan 2022 20:21:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7F372DC3;
	Tue, 18 Jan 2022 20:20:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7F372DC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642533673;
	bh=jOpojd0mgAkjmzJrEO+NDBmnd0ILTUqZvJZakLfD5Io=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ypk6YgJDba/OEU7x4FJvqneiVEgmQUN+SI5mDariO5QbR7V0TV9djGXB+YrqB4Rkw
	 D8tTu78IRkDZ5dcg861ZYjDZVw4TGWS9bBLAotadygN7uOi2dmqIVQxRNU3RDTS6Cu
	 /POtELK6TSWMdRSvN2nvKW/4uZpWfw8Kls5WQxpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BEF3F80240;
	Tue, 18 Jan 2022 20:20:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8085F8023B; Tue, 18 Jan 2022 20:20:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C3BFF800D8
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 20:20:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C3BFF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Mu2zb2nQ"
Received: by mail-ot1-x32e.google.com with SMTP id
 g1-20020a9d6481000000b00592d01f2b6eso21594729otl.5
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 11:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BvmlvJqHTAtiyO3Rnq+Cdde2R9GjFRIjLYRFc4d/bEM=;
 b=Mu2zb2nQPs587kAoUz0spMWFm6XIQ7h/BboyryQcn3BZr6yCKKYTCykpcssxif7InB
 aQJGQwjlqzNxXWaJy9VYYWmzOUAbHfxrVGtinSSgNc73NNjypVL8NYSMqZYzj/evnaQl
 ZhF5FLGcaZDahdmbUgBA7CJQcGyW83OQ8d3kv8nEbOAeWifMufjMXKKjYyrfXyquBMFN
 ICVJ7giElonL4dnKtr/s7L+b0rbzj1ejVfhu8Q8DQ0G9ITtWX9hpkhkB4dBAPHeWjZfI
 0L6X6N9h5cPy4aMj/Rxr7NlreU1u/80M/0o+NjccR7ZX8LM1Q0aD6rP0l5T4TMukRjPY
 9WcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BvmlvJqHTAtiyO3Rnq+Cdde2R9GjFRIjLYRFc4d/bEM=;
 b=zaFR+Dj9lShCImfAzx8pgxzxLHd5eZY3KIVNlwEvl83h+wZzGCzMTKQSsBGw1L34PN
 FdjUbtAryx8Ndb1g+ede9/j5wZ5XagT1Lj/I/aapgBIM2n5omf5EO/xfSUHMgPWPWW5E
 sAgxMxg0mCIaCHRkZIJBl98dQKM0SRjfioPa/q4YCW1K5WAmXoqumsibNEUKVR/KS9do
 aucDLmyEyF4jlX6TFcTXP+YIWGkUxFy5WpsPCARs7mEHzrCaCZVR6MARF+z6H9UJ2TU8
 ei+h687rbd/FaHYTz1DyMW5uH6zX4TmzHd6NOl181jleWrMAfGszXvQFUQsUolv+u3CN
 1kWQ==
X-Gm-Message-State: AOAM530xdnIhl2WYj+2SU5tJZadXl6uJjrpzVJA3agtv1rEt75Rky8/7
 s5Sy/mIxSPg3vWBRremKSro=
X-Google-Smtp-Source: ABdhPJwJk7CsbWV6X10gQBoTtCrlC4eHsLjeXKJWvuYHB8eoXq0oJ+s3iPJMZO0N+IdCwZ6zpQYZPQ==
X-Received: by 2002:a05:6830:110d:: with SMTP id
 w13mr20991875otq.353.1642533598666; 
 Tue, 18 Jan 2022 11:19:58 -0800 (PST)
Received: from geday ([2804:7f2:8006:2ed4:dd1b:ebb9:4bfc:fcb3])
 by smtp.gmail.com with ESMTPSA id y5sm443773oix.30.2022.01.18.11.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 11:19:58 -0800 (PST)
Date: Tue, 18 Jan 2022 16:20:07 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Nandakumar Edamana <nandakumar@nandakumar.co.in>
Subject: Re: Behringer UMC202HD issues and a partial solution
Message-ID: <YecS5xgtI4Kzbmav@geday>
References: <YeB2zEnPlwVEKbTI@geday>
 <e1a7d67d-9862-3085-4e01-091ca443d2df@nandakumar.co.in>
 <YeDw89KZOh4yG7c8@geday>
 <e30962b0-931c-83b4-12fb-aa5e377b4f4d@nandakumar.co.in>
 <YeEp5xUjf1DAeGTY@geday>
 <2137c7e3-805b-7371-6042-1c2d5f61e302@nandakumar.co.in>
 <YeH5FlQzM9PNm6s0@geday>
 <5fba3e63-6fd2-de1c-1564-ac6b8870e730@nandakumar.co.in>
 <YeNuSip2RcH4DlV+@geday>
 <7a505959-3111-ffaa-7e03-3d9edcf03a4d@nandakumar.co.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a505959-3111-ffaa-7e03-3d9edcf03a4d@nandakumar.co.in>
Cc: alsa-devel@alsa-project.org
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

On Tue, Jan 18, 2022 at 04:50:12PM +0530, Nandakumar Edamana wrote:
> I feel like I'm doing something wrong with the build and install 
> process. Maybe it's been the case for the last couple of days, in which 
> case I'm terribly sorry for the incorrect test results.
> 
> The problem is, I don't get any printk() outputs at all. I'd given `echo 
> "7" > /proc/sys/kernel/printk`, and I even added a usb_audio_dbg() line, 
> which didn't get printed either.
> 
> Then I saw this:
> 
> $ find /lib/modules/ -name 'snd-usb-audio.ko'|xargs ls
> ...
> /lib/modules/5.15.13/extra/usb/snd-usb-audio.ko
> /lib/modules/5.15.13/kernel/sound/usb/snd-usb-audio.ko
> ...
> 
> modprobe is using the kernel/ version while my commands were installing 
> the extra/ version.
> 
> Then I used the following, which also installed the extra/ version:
> sudo make -C /lib/modules/5.15.13/build M=sound modules_install
> 
> Are these two versions supposed to exist? What is the solution? Telling 
> the kernel build system to choose the correct location or configuring 
> modprobe or depmod or something? I tried to look it up, but didn't find 
> any official recommendation.

Yes, it will install on extra/ if you are building with the M=sound/usb
option. I guess the 'official' solution is to use the INSTALL_MOD_PATH
environment variable.

But what I do instead is I overwrite
/lib/modules/<kernel_version>/kernel/sound/usb/snd-usb-audio.ko with the newly
built one, and then I run depmod.

> 
> Anyway, I ran this:
> 
> # Because I have space constraints
> # find /lib/modules/5.15.13/ -name '*.ko' -exec strip --strip-unneeded {} +
> # update-initramfs -u -k 5.15.13
> 
> That updated the extra/ version of snd-usb-audio. But even after a 
> reboot, this is what I get:
> 
> # modprobe -r -v snd-usb-audio
> rmmod snd_usb_audio
> rmmod snd_usbmidi_lib
> # modprobe -v snd_usb_audio dyndbg==p
> insmod /lib/modules/5.15.13/kernel/sound/usb/snd-usbmidi-lib.ko
> insmod /lib/modules/5.15.13/kernel/sound/usb/snd-usb-audio.ko index=-2
> index=-2 index=-2 dyndbg==p
> # dmesg |grep 'implicit:'
> 
> Another thing is, even though I'd commented out my clock workaround, I'm 
> not getting any clock-related warning at all (I'm sure those went away 
> after I edited clock.c, and then performed a build+install).

I noticed that on your dmesg logs, that the warning was nowhere to be
found.

Thank you,
Geraldo Nascimento

> 
> -- 
> Nandakumar Edamana
> https://nandakumar.org
> 
