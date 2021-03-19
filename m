Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3728A342430
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 19:13:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5EC5167B;
	Fri, 19 Mar 2021 19:12:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5EC5167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616177590;
	bh=Ocsc8BZ25Ib3RG1yUV+GWtusdsaiM4vGTciw88pDbpc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KteL/1RlXffxQ0wnERGppHTKYrP/hwztG+hhtiSr/d3H5r1Z7wvDBi1+vXv0RlUR3
	 3qfgHuQyqmTBjzZjTFWd77hn+yPEKFwSYC9QZo8uKZLO8IIuKvpgSzl0OXna4AzKoW
	 bMd/INEKLOd+LgGhLYoOdxpxnaMxu+8kalq+JBvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BB45F8023C;
	Fri, 19 Mar 2021 19:11:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD07FF8021C; Fri, 19 Mar 2021 19:11:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51A12F80124
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 19:11:32 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 069DBA003F;
 Fri, 19 Mar 2021 19:11:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 069DBA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1616177492; bh=C7iyN8k86TZMDc8qtgZ4qdQmUe9RUpP9eCva1jyw7QI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BLaR6I/Eog9VyCa1yVVOic/TuUiZ0pGKiuXEUJdpEQsdAE6w/UfYFIqIZQjf5rQet
 7v4KPIv3UHbBKdt9JnjpchmrpCOEhNH2an2y0gsBCctARUxlVsGWN7MlcgdTwErh65
 wjaKf+6ZUdHRasfv/+Tpd/a3FcvXZJ7Nkc6Hezik=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 19 Mar 2021 19:11:28 +0100 (CET)
Subject: Re: [PATCH v4 6/6] ALSA: led control - add sysfs kcontrol LED marking
 layer
To: Hans de Goede <hdegoede@redhat.com>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20210317172945.842280-1-perex@perex.cz>
 <20210317172945.842280-7-perex@perex.cz>
 <a3ddb881-6580-cd25-ef3c-734e686e6942@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <ba480ab5-80b7-d911-052b-53b1e8d43695@perex.cz>
Date: Fri, 19 Mar 2021 19:11:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <a3ddb881-6580-cd25-ef3c-734e686e6942@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>
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

Dne 19. 03. 21 v 17:34 Hans de Goede napsal(a):
> Hi,
> 
> On 3/17/21 6:29 PM, Jaroslav Kysela wrote:
>> We need to manage the kcontrol entries association for the LED trigger
>> from the user space. This patch adds a layer to the sysfs tree like:
>>
>> /sys/devices/virtual/sound/ctl-led/mic
>>    + card0
>>    |  + attach
>>    |  + detach
>>    |  ...
>>    + card1
>>       + attach
>>       ...
>>
>> Operations:
>>
>>   attach and detach
>>     - amixer style ID is accepted and easy strings for numid and
>>       simple names
>>   reset
>>     - reset all associated kcontrol entries
>>   list
>>     - list associated kcontrol entries (numid values only)
>>
>> Additional symlinks:
>>
>> /sys/devices/virtual/sound/ctl-led/mic/card0/card ->
>>   /sys/class/sound/card0
>>
>> /sys/class/sound/card0/controlC0/led-mic ->
>>   /sys/devices/virtual/sound/ctl-led/mic/card0
>>
>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> 
> Thank you so much for this patch.
> 
> I've given this new version a try, dropping my sound/soc/codecs/rt56??.c patches to set the access-flags directly.
> 
> And with these 3 lines in /etc/rc.d/rc.local I get nicely working control of the mute
> LED build into the (detachable) USB-keyboard's mute hot-key:
> 
> modprobe snd_ctl_led
> echo -n name="Speaker Channel Switch" > /sys/class/sound/card1/controlC1/led-speaker/attach
> echo -n name="HP Channel Switch" > /sys/class/sound/card1/controlC1/led-speaker/attach
> 
> This needs to be replaced by some UCM profile code doing the equivalent of course,
> but for a proof-of-concept test of the kernel API this introduces the above will do.

I added already the FixedBootSequence support to alsa-lib and alsactl and the "sysset" sequence command. But looking to this command now, it may be better to rename it to "sysw" ("double s" does not look so great).

> Only complaint which I have is the need to add "-n" to the echo commands,
> it would be nice if set_led_id() would check if the copy which it stores in buf2
> ends with "\n" and if it does if it would then strip that from the copy in buf2.

Yes, I will fix that. It's possible to use the shorter string:

echo "Speaker Channel Switch" > /sys/class/sound/card1/controlC1/led-speaker/attach


				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
