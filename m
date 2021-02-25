Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E36325989
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 23:21:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97D3B1665;
	Thu, 25 Feb 2021 23:20:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97D3B1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614291668;
	bh=0mwmZpvqe74gMVPcpLAgpmvAvR60fK6WP6wNRGAXAAs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MlRBqUIad4MZQcNUhzIX0wRVQQcCexz28+Ikj+t1PAuYSyUlfAN5MK8mO26fDQncG
	 d/zrWIm27m1HGqIn2shG9ogTrvS8MWeVKLCUVOI3/b+ADHWgNPnZWGYTB+q8RWCFsP
	 XajQFhHDH9MUnIop/VZYmn/y5hmiOOrwcMCrk1wM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7FE2F800D2;
	Thu, 25 Feb 2021 23:19:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8287FF800D2; Thu, 25 Feb 2021 23:19:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1783FF80159
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 23:19:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1783FF80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="HB1IjxBZ"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id A94DAA12BA;
 Thu, 25 Feb 2021 23:19:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=VmhpQ9IAKsvf
 k7oW2kDn8RfoCMyYDunAm6/v4M1Pbss=; b=HB1IjxBZ/F80GewGIjqAmYzCRU46
 9xVvfpcNpK0cvywrxzB1X11Yj2CBkL0ybUaLST83nCliwQRdxZ/RV1GlEyz8KqqY
 L286M1bSSYStGAgLMQjA/IZIo5eELlnwc3vMZb7bwianKhdfNV/+ORG3UVe8cfMB
 13mc6kuRo7noC774WSY5WXS4TSXZQVS3WMag1kS0P/z7BjG5RBepgjGY7rEiOqcP
 9d7m2+0ZJi+BuRD27GtkWIyA9uVnvq1vZwAsN5PWvwV/RG1ynHRLTt8aKyJDde7m
 aLh8h3c6eJSKchmZ5ojU4k1Ngi4AtXfK6zOp3c+nfrgZWpijgzqpoYdZig==
Subject: Re: [PATCH v5 6/9] ALSA: virtio: PCM substream operators
To: Takashi Iwai <tiwai@suse.de>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20210222153444.348390-1-anton.yakovlev@opensynergy.com>
 <20210222153444.348390-7-anton.yakovlev@opensynergy.com>
 <s5h35xkquvj.wl-tiwai@suse.de>
 <d9b6e8fa-7356-1cbf-029b-6f7c8bad4994@opensynergy.com>
 <s5hlfbcpayj.wl-tiwai@suse.de>
 <20210225135951-mutt-send-email-mst@kernel.org>
 <s5hblc7opok.wl-tiwai@suse.de>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Message-ID: <0a9f6dea-ed75-16eb-9fc2-84148fa820be@opensynergy.com>
Date: Thu, 25 Feb 2021 23:19:31 +0100
MIME-Version: 1.0
In-Reply-To: <s5hblc7opok.wl-tiwai@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SR-MAIL-02.open-synergy.com (10.26.10.22) To
 SR-MAIL-02.open-synergy.com (10.26.10.22)
Cc: virtio-dev@lists.oasis-open.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 virtualization@lists.linux-foundation.org
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

On 25.02.2021 21:30, Takashi Iwai wrote:> On Thu, 25 Feb 2021 20:02:50 
+0100,
> Michael S. Tsirkin wrote:
>>
>> On Thu, Feb 25, 2021 at 01:51:16PM +0100, Takashi Iwai wrote:
>>> On Thu, 25 Feb 2021 13:14:37 +0100,
>>> Anton Yakovlev wrote:


[snip]


>> Takashi given I was in my tree for a while and I planned to merge
>> it this merge window.
> 
> Hmm, that's too quick, I'm afraid.  I see still a few rough edges in
> the code.  e.g. the reset work should be canceled at the driver
> removal, but it's missing right now.  And that'll become tricky
> because the reset work itself unbinds the device, hence it'll get
> stuck if calling cancel_work_sync() at remove callback.

Yes, you made a good point here! In this case, we need some external
mutex for synchronization. This is just a rough idea, but maybe
something like this might work:

struct reset_work {
     struct mutex mutex;
     struct work_struct work;
     struct virtio_snd *snd;
     bool resetting;
};

static struct reset_work reset_works[SNDRV_CARDS];

init()
     // init mutexes and workers


virtsnd_probe()
     snd_card_new(snd->card)
     reset_works[snd->card->number].snd = snd;


virtsnd_remove()
     mutex_lock(reset_works[snd->card->number].mutex)
     reset_works[snd->card->number].snd = NULL;
     resetting = reset_works[snd->card->number].resetting;
     mutex_unlock(reset_works[snd->card->number].mutex)

     if (!resetting)
         // cancel worker reset_works[snd->card->number].work
     // remove device


virtsnd_reset_fn(work)
     mutex_lock(work->mutex)
     if (!work->snd)
         // do nothing and take an exit path
     work->resetting = true;
     mutex_unlock(work->mutex)

     device_reprobe()

     work->resetting = false;


interrupt_handler()
     schedule_work(reset_works[snd->card->number].work);


What do you think?


-- 
Anton Yakovlev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

