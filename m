Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11889218AFF
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 17:17:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2026165E;
	Wed,  8 Jul 2020 17:16:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2026165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594221466;
	bh=UC6oSFw+xAAM+nsp5SZVLcG0/NC4rzmj/E2BuoIkVJc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pO8Vy1kQ/NzeBVqjVNSTM/c2Rpk6OmFL1yXQpV9wyt1gSkd53b64wPBOw416/vp3t
	 GDDCIQpkzGK5ZZoqdZcrToY3OXSazIIcv/irWgzvxNBBMEQDBkA+cH/CicmjCcHJe5
	 0GUSLLZywKmukGElZONGkOAsk+Efdnhj28/1QREo=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD067F8011F;
	Wed,  8 Jul 2020 17:16:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16592F8015A; Wed,  8 Jul 2020 17:15:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E13B8F8011F
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 17:15:52 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A9DE5A003F;
 Wed,  8 Jul 2020 17:15:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A9DE5A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1594221351; bh=L7wlZWI5+DZRpaNg1rpqzDekxfe8o9CSeTzTiwCAVq4=;
 h=Subject:To:References:From:Cc:Date:In-Reply-To:From;
 b=QPxXlm2H8jw+W5aeK56djQGx3j5UbXTS/Ycg3VS4Ar1orq81Ykp5No6AYz5p3MEC/
 QDfOR/nLVlRp7qB2fVL4rnTtG1SwnvlYn3N5Y8EcepiMG/enJmk26EzdGZiK3Oztf1
 s4OV5X63Fsv+o9vMh+TjTIa49XaLCVIHJ3kUfj/M=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed,  8 Jul 2020 17:15:47 +0200 (CEST)
Subject: Re: [RFT] ALSA control service programs for Digidesign Digi 002/003
 family and Tascam FireWire series
To: alsa-devel@alsa-project.org, Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <20200707125651.GA200100@workstation>
 <a322006e-bd58-4dba-f590-855be17a2cdb@perex.cz>
 <20200708144439.GA27082@workstation>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <e6547db6-e8e8-a39c-c333-0fa5b65b2fdf@perex.cz>
Date: Wed, 8 Jul 2020 17:15:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200708144439.GA27082@workstation>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ffado-devel@lists.sourceforge.net, sbahling@suse.com
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

Dne 08. 07. 20 v 16:44 Takashi Sakamoto napsal(a):
> Hi Jaroslav,
> 
> On Tue, Jul 07, 2020 at 03:15:53PM +0200, Jaroslav Kysela wrote:
>> Dne 07. 07. 20 v 14:56 Takashi Sakamoto napsal(a):
>>> They have command line options. For all models of Digi 002/003 family, the
>>> executable has an option for the numerical ID of sound card.
>>>
>>> ```
>>> Usage:
>>>     snd-firewire-digi00x-ctl-service CARD_ID
>>>
>>>     where:
>>>       CARD_ID: The numerical ID of sound card.
>>> ```
>>
>> It's better to handle both card number and the card id string. In the latter
>> case, the user may create independent environment and use udev or
>> modprobe.conf configurations to address the devices. The card number may
>> change when the plug-and-play devices are randomly connected / disconnected.
>>
>> snd_card_new() - third argument.
> 
> Thanks for the comment and I also think it good idea for users to have
> fixed configuration since the numerical ID of sound card differs
> depending on system environment.
> 
> At the same time, I like to keep the specification of service programs
> as small as possible. The numerical ID of sound card is enough to
> identify target sound card, and it's sole way for it.
> 
> If implementing the idea, I need to add enough instructions about the
> mechanism of card id string in kernel land so that users can utilize
> it without any puzzle. Actually, the mechanism heavily depends on kernel
> loadable module domain and I think it better not to consider that the
> users are enough friendly to the domain.
> 
> Actually there are good tools to identify the numerical ID of user's
> sound card, and usage of such tools are more friendly than module
> manipulation and option documentation.
> 
> For future, I have a plan to write system service to handle udev
> event and launch the service programs automatically. For the case,
> the event includes enough information to construct arguments for
> the service program, therefore no need to handle mapping information
> and extra care of the card id string.
> 
> At last, the most of drivers in ALSA firewire stack don't support the
> card id string, except for my initial work for bebob and fireworks
> driver. If ALSA control core had a feature to change card id string
> dynamically for existent card instance by ioctl command, or it had a
> feature to maintain mapping between card id string and the other
> identification such as system-wide or bus-wide UUID, I would be
> willing to implement them to the drivers. At present, it's outside
> of my work scope.

The id can be changed via sysfs:

$ LC_ALL=C ls -la /sys/class/sound/card0/id
-rw-r--r--. 1 root root 4096 Jul  3 11:58 /sys/class/sound/card0/id

I believe that we should offer tools and let users to select the usage way.

					Jaroslav

> 
> 
> Thanks
> 
> Takashi Sakamoto
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
