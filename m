Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4D44F1DF3
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Apr 2022 23:55:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BBE01692;
	Mon,  4 Apr 2022 23:54:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BBE01692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649109303;
	bh=mMumu2ZetFz0Sa0k6kt0FzuJE0EAVYj3Rp5eusG2wxI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ndfIu8DX/9ucgyrJ9vyevbrZKQ7VCD1TAPkCd+3/RnDEqOyxDAoIRhgos+vyY5Q5T
	 2qADr3kbYcA5AwLQvIiJt4N4qFflcivMPVUP0Vlu894jKSBLyMrwn8GRd9U+CHEeFW
	 VPL9DyMk3IZEJbx7DURJyOxkw73c0nSaKPy1UUMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C77FCF800D1;
	Mon,  4 Apr 2022 23:54:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 553B5F80162; Mon,  4 Apr 2022 23:54:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46A95F8010B
 for <alsa-devel@alsa-project.org>; Mon,  4 Apr 2022 23:53:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46A95F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="hxBa3lsW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=MoHK6CDLxM8OKokZRtLof+OJ17ZVmNTtNJ4h0pYEAC0=; b=hxBa3lsW/sg50L70Js2RoegUKA
 jhhISe0FgFbpAk5zn77bHe7IqUj4mo3REKHjGWMVKNGZ+bil/ldB3mIL7iyaGiFxjSeA6eCAouyRV
 ASpHWa9mnncA2d0Hs9F4SJc87dBaSmqUCBF71B8I6ghocsvH+FLhIsHbkkruaU+whE97RcsbBQLvg
 8ihE9Y1YDZDbS0va11SrJgKn/+IDijiqALqL9LQQ++mRwpVTvCAwmpsYQC3bJ/6fP5GKfTPCQsRR3
 EpKe2rd3gAumTqvfVYD8g1w3JAHBz6bYIlMIj6wGd6jyJHp7Ji/d7VZphhej6Z2j5fPl2x3ClJOnQ
 NSkaScGg==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbUdg-00658B-SP; Mon, 04 Apr 2022 21:53:35 +0000
Message-ID: <d5c831f3-91db-4ba7-fa30-51847588c305@infradead.org>
Date: Mon, 4 Apr 2022 14:53:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] sound/oss/dmasound: fix build when drivers are mixed
 =y/=m
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220403222510.12670-1-rdunlap@infradead.org>
 <CAMuHMdUCdGKE04U4yMqv7TPUztwfih7aLwoTfEP5vcATW=CCxw@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAMuHMdUCdGKE04U4yMqv7TPUztwfih7aLwoTfEP5vcATW=CCxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>
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

Hi Geert,

On 4/4/22 06:57, Geert Uytterhoeven wrote:
> Hi Randy,
> 
> On Mon, Apr 4, 2022 at 12:25 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>> When CONFIG_DMASOUND_ATARI=m and CONFIG_DMASOUND_Q40=y (or vice versa),
>> dmasound_core.o can be built without dmasound_deinit() being defined,
>> causing a build error:
>>
>> ERROR: modpost: "dmasound_deinit" [sound/oss/dmasound/dmasound_atari.ko] undefined!
>>
>> Modify dmasound_core.c so that dmasound_deinit() is always available.
>>
>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Thanks for spending more time on this ;-)

Well that bot keeps reporting this problem, although I suppose
that we could ask for it to be ignored...

>> --- linux-next-20220401.orig/sound/oss/dmasound/dmasound_core.c
>> +++ linux-next-20220401/sound/oss/dmasound/dmasound_core.c
>> @@ -1424,27 +1424,29 @@ int dmasound_init(void)
>>         return 0;
>>  }
>>
>> -#ifdef MODULE
>> -
>>  void dmasound_deinit(void)
>>  {
>> +#ifdef MODULE
> 
> I think this #ifdef must not be added: if the modular subdriver
> calls dmasound_deinit(), the resources should be freed, else a subsequent
> reload of the subdriver will not work.  This does mean all variables
> protected by "#ifdef MODULE" must exist unconditionally.

OK, I like that simplification.

> Alternatively, the test can be replaced by "#ifdef CONFIG_MODULES".
> 
> One big caveat below...
> 
>>         if (irq_installed) {
>>                 sound_silence();
>>                 dmasound.mach.irqcleanup();
>>                 irq_installed = 0;
>>         }
>> +#endif
>>
>>         write_sq_release_buffers();
>>
>> +#ifdef MODULE
> 
> Likewise.
> 
>>         if (mixer_unit >= 0)
>>                 unregister_sound_mixer(mixer_unit);
>>         if (state_unit >= 0)
>>                 unregister_sound_special(state_unit);
>>         if (sq_unit >= 0)
>>                 unregister_sound_dsp(sq_unit);
>> +#endif
>>  }
>>
>> -#else /* !MODULE */
>> +#ifndef MODULE
>>
>>  static int dmasound_setup(char *str)
>>  {
> 
>> --- linux-next-20220401.orig/sound/oss/dmasound/dmasound.h
>> +++ linux-next-20220401/sound/oss/dmasound/dmasound.h
>> @@ -88,11 +88,7 @@ static inline int ioctl_return(int __use
>>       */
>>
>>  extern int dmasound_init(void);
>> -#ifdef MODULE
>>  extern void dmasound_deinit(void);
>> -#else
>> -#define dmasound_deinit()      do { } while (0)
>> -#endif
>>
>>  /* description of the set-up applies to either hard or soft settings */
> 
> ... Below, there is:
> 
>     typedef struct {
>         [...]
>     #ifdef MODULE
>         void (*irqcleanup)(void);
>     #endif
>         [...]
>     } MACHINE;
> 
> This means the MACHINE struct is not compatible between builtin
> and modular code :-(  Hence the "#ifdef MODULE" should be removed,
> or replaced by "#ifdef CONFIG_MODULES", too.

ditto

> P.S. I think the younger myself is responsible for this mess.
>      Please accept my apologies, after +25 years...

:)

I'll see how it goes.  Thanks.

-- 
~Randy
