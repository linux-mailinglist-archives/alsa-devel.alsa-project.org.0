Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B57E7E76CD
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 17:42:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 395EB2054;
	Mon, 28 Oct 2019 17:41:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 395EB2054
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572280942;
	bh=iY5gjzO7g7CgZqLJYV1Y/ikyWbJt8YhPhEvTD9E41gM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A5cKV69yL8sqNDq4DnWMkAZ7F9mmQqxA6wAeAMLRJkSl3wplKrdXbf0/hxzQzyXzp
	 NIfpniqE3mNXu4hUthXCPyQ4YEK18KqxIwnATwLhyFqwG1xeQvtOinBhlyi1FpY9pp
	 agOe4DjEqtPlejyeDzldx/egB2XG9HKrtJOWrYFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99570F802BD;
	Mon, 28 Oct 2019 17:40:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34883F802BD; Mon, 28 Oct 2019 17:40:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webclient5.webclient5.de (webclient5.webclient5.de
 [136.243.32.184])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F32FF80145
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 17:40:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F32FF80145
Received: from olorin.ladisch.de (x2f7f95e.dyn.telefonica.de [2.247.249.94])
 by webclient5.webclient5.de (Postfix) with ESMTPSA id 7F6BC5583F65;
 Mon, 28 Oct 2019 17:40:32 +0100 (CET)
To: Navid Emamdoost <navid.emamdoost@gmail.com>
References: <20191027221007.14317-1-navid.emamdoost@gmail.com>
 <s5hpnihmlk3.wl-tiwai@suse.de>
 <CAEkB2ESwKEQYQx75BnaHf4aUQHObx4jf0hreQx_KTeZ+QCjL4g@mail.gmail.com>
From: Clemens Ladisch <clemens@ladisch.de>
Message-ID: <d623a621-c62a-7ae9-958c-8709fb0c8c7d@ladisch.de>
Date: Mon, 28 Oct 2019 17:38:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAEkB2ESwKEQYQx75BnaHf4aUQHObx4jf0hreQx_KTeZ+QCjL4g@mail.gmail.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.4 at webclient5
X-Virus-Status: Clean
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>,
 Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: Fix memory leak in
	__snd_usbmidi_create
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Navid Emamdoost wrote:
> On Mon, Oct 28, 2019 at 1:27 AM Takashi Iwai <tiwai@suse.de> wrote:
>> On Sun, 27 Oct 2019 23:10:06 +0100,
>> Navid Emamdoost wrote:
>>> In the implementation of __snd_usbmidi_create() there is a memory leak
>>> caused by incorrect goto destination. Go to free_midi if
>>> snd_usbmidi_create_endpoints_midiman() or snd_usbmidi_create_endpoints()
>>> fail.
>>
>> No, this will lead to double-free.  After registering the rawmidi
>> interface at snd_usbmidi_create_rawmidi(), the common destructor will
>> be called via rawmidi private_free callback, and this will release the
>> all resources already.
>
> Now I can see how rawmidi private_free is set up to release the
> resources, but what concerns me is that at the moment of endpoint/port
> creation umidi is not yet added to the midi_list.
> In other words, what I see is that we still have just one local
> pointer to umidi if any of snd_usbmidi_create_endpoint* fail.

The snd_rawmidi device is automatically registered with the card, so the
line "rmidi->private_free = snd_usbmidi_rawmidi_free;" is the exact point
where the ownership of umidi changes.  midi_list does not matter.


Regards,
Clemens
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
