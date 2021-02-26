Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9AD3267F4
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 21:18:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D705B1698;
	Fri, 26 Feb 2021 21:17:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D705B1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614370704;
	bh=t4ghiALG4rXGPMd23s4NN8dBVbYdsiZ2NYok4/dbsm0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JnwQrchDqeGHYzw0+sivjZogaUx3ztTep7bvZTVax2VI0xwuoMiPHcydTtamxzhbq
	 Zv6dUVuHFQMALHxxM/3BO2HHgYEb8OECElSEqi/KduqoaEFgKTdBekwPQWDzFxx8Ya
	 ylk5qNhakk4T3B7RcfDlvF+YJoreLfaTW0iLGjjQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D5F9F8022B;
	Fri, 26 Feb 2021 21:16:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45DBEF8016C; Fri, 26 Feb 2021 21:16:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EEAEF80159
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 21:16:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EEAEF80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="l9OojtCd"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id 6E31BA16ED;
 Fri, 26 Feb 2021 21:16:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=QFjGStjIzh6J
 7frNT2LEqGS+oMJPYJeHt/N3AzMgBWQ=; b=l9OojtCdVaM6d0+MvAfQmteavjL4
 X1lEvn6/iVjdMQz8DQ6zTmmYEOqRgBJrg4aLFv9eSeKtjNzf5zSbqA/WTrpQ1nX+
 2WbMpxMH7CIj8P2uoE5SDtuev90SsA1qNMDQ1x8wK8EXc+qj7eKsAy66iScVi8z4
 EIZlf0TKkNS2eRjH1rUnTdA9AnXKidJw8RG1cCUTqJdvpKynVNKHGVlpBe+L7SLp
 QcceqhEmbk/SKyAkbxUieHG6SWOGHtUofAFqQxjlylEkxNzuXdvJ2AY4zUwH+Dr8
 gW3Hij5eESFSxpLqaLGfYcDw/OFV+jkw5NMd5Ftzi6TDBwCX5EWrWNYj8Q==
Subject: Re: [PATCH v5 6/9] ALSA: virtio: PCM substream operators
To: Takashi Iwai <tiwai@suse.de>
References: <20210222153444.348390-1-anton.yakovlev@opensynergy.com>
 <20210222153444.348390-7-anton.yakovlev@opensynergy.com>
 <s5h35xkquvj.wl-tiwai@suse.de>
 <d9b6e8fa-7356-1cbf-029b-6f7c8bad4994@opensynergy.com>
 <s5hlfbcpayj.wl-tiwai@suse.de>
 <20210225135951-mutt-send-email-mst@kernel.org>
 <s5hblc7opok.wl-tiwai@suse.de>
 <0a9f6dea-ed75-16eb-9fc2-84148fa820be@opensynergy.com>
 <s5ha6rqnc0m.wl-tiwai@suse.de>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Message-ID: <8243d984-0482-b9b5-e779-9f3f723d48ed@opensynergy.com>
Date: Fri, 26 Feb 2021 21:16:41 +0100
MIME-Version: 1.0
In-Reply-To: <s5ha6rqnc0m.wl-tiwai@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SR-MAIL-02.open-synergy.com (10.26.10.22) To
 SR-MAIL-02.open-synergy.com (10.26.10.22)
Cc: virtio-dev@lists.oasis-open.org, alsa-devel@alsa-project.org,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, virtualization@lists.linux-foundation.org
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

On 26.02.2021 15:23, Takashi Iwai wrote:
> On Thu, 25 Feb 2021 23:19:31 +0100,
> Anton Yakovlev wrote:
>>
>> On 25.02.2021 21:30, Takashi Iwai wrote:> On Thu, 25 Feb 2021 20:02:50
>> +0100,
>>> Michael S. Tsirkin wrote:
>>>>
>>>> On Thu, Feb 25, 2021 at 01:51:16PM +0100, Takashi Iwai wrote:
>>>>> On Thu, 25 Feb 2021 13:14:37 +0100,
>>>>> Anton Yakovlev wrote:
>>
>>
>> [snip]
>>
>>
>>>> Takashi given I was in my tree for a while and I planned to merge
>>>> it this merge window.
>>>
>>> Hmm, that's too quick, I'm afraid.  I see still a few rough edges in
>>> the code.  e.g. the reset work should be canceled at the driver
>>> removal, but it's missing right now.  And that'll become tricky
>>> because the reset work itself unbinds the device, hence it'll get
>>> stuck if calling cancel_work_sync() at remove callback.
>>
>> Yes, you made a good point here! In this case, we need some external
>> mutex for synchronization. This is just a rough idea, but maybe
>> something like this might work:
>>
>> struct reset_work {
>>      struct mutex mutex;
>>      struct work_struct work;
>>      struct virtio_snd *snd;
>>      bool resetting;
>> };
>>
>> static struct reset_work reset_works[SNDRV_CARDS];
>>
>> init()
>>      // init mutexes and workers
>>
>>
>> virtsnd_probe()
>>      snd_card_new(snd->card)
>>      reset_works[snd->card->number].snd = snd;
>>
>>
>> virtsnd_remove()
>>      mutex_lock(reset_works[snd->card->number].mutex)
>>      reset_works[snd->card->number].snd = NULL;
>>      resetting = reset_works[snd->card->number].resetting;
>>      mutex_unlock(reset_works[snd->card->number].mutex)
>>
>>      if (!resetting)
>>          // cancel worker reset_works[snd->card->number].work
>>      // remove device
>>
>>
>> virtsnd_reset_fn(work)
>>      mutex_lock(work->mutex)
>>      if (!work->snd)
>>          // do nothing and take an exit path
>>      work->resetting = true;
>>      mutex_unlock(work->mutex)
>>
>>      device_reprobe()
>>
>>      work->resetting = false;
>>
>>
>> interrupt_handler()
>>      schedule_work(reset_works[snd->card->number].work);
>>
>>
>> What do you think?
> 
> I think it's still somehow racy.  Suppose that the reset_work is
> already running right before entering virtsnd_remove(): it sets
> reset_works[].resetting flag, virtsnd_remove() skips canceling, and
> both reset work and virtsnd_remove() perform at the very same time.
> (I don't know whether this may happen, but I assume it's possible.)
> 
> In that case, maybe a better check is to check current_work(), and
> perform cancel_work_sync() unless it's &reset_works[].work itself.
> Then the recursive cancel call can be avoided.
> 
> After that point, the reset must be completed, and we can (again)
> process the rest release procedure.  (But also snd object itself might
> have been changed again, so it needs to be re-evaluated.)
> 
> One remaining concern is that the card number of the sound instance
> may change after reprobe.  That is, we may want to another persistent
> object instead of accessing via an array index of sound card number.
> So, we might need reset_works[] associated with virtio_snd object
> instead.
> 
> In anyway, this is damn complex.  I sincerely hope that we can avoid
> this kind of things.  Wouldn't it be better to shift the reset stuff
> up to the virtio core layer?  Or drop the feature in the first
> version.  Shooting itself (and revival) is a dangerous magic spell,
> after all.

Yes, I also got an impression, that without some assistance somewhere
from the bus it will hardly be possible to find a suitable solution.
Ok, then I will postpone this feature at the moment.


> 
> thanks,
> 
> Takashi
> 

-- 
Anton Yakovlev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

