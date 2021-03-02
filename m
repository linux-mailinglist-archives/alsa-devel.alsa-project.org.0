Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC74832AC24
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:15:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DF571916;
	Tue,  2 Mar 2021 22:15:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DF571916
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614719751;
	bh=wgRZX9y8ZgFO0jwLHoFWWX66KYtBKwU2Cym5zpRZ6Cs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=izcgPDrSm0f+7cSjF949OBhtCcZECC8eNWeL+6IFLXdw+Bv9nlc786J86X3b1tww2
	 gBk/14YRHAa6eS4hv5O+T89lcwTLGNcp9CsdTG73ev7D5+xwgOVTIxbkVbXqzhZtqF
	 L/FRxN50f3GBL1u+E3Cr37w6nXsDlG7inflAsokE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD0F1F80271;
	Tue,  2 Mar 2021 22:14:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2413F80269; Tue,  2 Mar 2021 22:14:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FD7AF80088
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:14:11 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 07BF6A003F;
 Tue,  2 Mar 2021 22:14:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 07BF6A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1614719651; bh=jGlncfkDlEEAe8/XVPo2ZYkW901bH7Cf2sMDCjZmsl8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=v5R+HwbzNa+jzs7P+G+u2wTQazGaoDKJhHnH1QoN6XS+dn8wGuEgMLNQgTlUP/vYf
 26uKDMSu6Owb3BhccUqGX4WRFhHdMjqhK0gcURKTBr39H9UFhODlWBdQbYRUShkKdz
 LbvcjXc/EO76gRQkSM1Q5YXy1M9IW800TCs9Wvjk=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  2 Mar 2021 22:14:06 +0100 (CET)
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
To: Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>
References: <20210224125927.GB4504@sirena.org.uk>
 <e47c7fa5-cb1a-f8a3-bfe4-1f6bca6a7d80@redhat.com>
 <20210224193626.GF4504@sirena.org.uk>
 <56ea1110-c129-5f3a-264b-fb389f615dbe@redhat.com>
 <20210225145901.GB5332@sirena.org.uk>
 <c785af21-8170-62ca-6f08-0a9a1a9071bb@redhat.com>
 <20210301132352.GA4628@sirena.org.uk>
 <76103f3e-c416-c988-7bc2-d7657e1868bd@redhat.com>
 <20210301191503.GI4628@sirena.org.uk>
 <54c5fd8e-1835-b9c3-d5fd-5cb363eab32c@redhat.com>
 <20210301204313.GK4628@sirena.org.uk>
 <6d34af65-761b-7314-6af6-daf15cc9535c@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <4b61303c-cee6-32cc-a9b9-3de7db0043d8@perex.cz>
Date: Tue, 2 Mar 2021 22:14:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <6d34af65-761b-7314-6af6-daf15cc9535c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

Dne 01. 03. 21 v 22:26 Hans de Goede napsal(a):
> Hi,
> 
> On 3/1/21 9:43 PM, Mark Brown wrote:
>> On Mon, Mar 01, 2021 at 08:49:34PM +0100, Hans de Goede wrote:
>>> On 3/1/21 8:15 PM, Mark Brown wrote:
>>
>>>> Off the top of my head something like writing a control name into a
>>>> sysfs file might work, it doesn't scale if you need to use multiple
>>>> controls as rt5640 does though.
>>
>>> Currently ALSA/UCM does not use sysfs files for anything, so this
>>> feels very inconsistent with how all the rest of this currently works.
>>
>> Yes, you'd really want to add string controls in ALSA.
> 
> Hmm, we already have SNDRV_CTL_ELEM_TYPE_BYTES controls. I think that will
> work nicely actually, we can have the UCM conf file send a 0 terminated
> string to the driver that way. It would be nice to have some syntactic
> sugar on the UCM side to be able to actually specify a string instead
> of an array of bytes, but I don't think we need any new userspace API
> for this.

The LEDs are controlled per machine not per card. So do we need to create the 'Speaker/Mic LED Control' control for all cards?

Also, this change sounds really generic. The interface may be implemented in my proposed control led kernel module, not in the codec drivers.

The Mark's sysfs idea is not bad in my opinion. The sequences may be extended in UCM, we have already 'exec' command. Yes, this command is a little heavy for the sysfs writes, but we can add command like 'sysset' or so for sysfs like:

  # detach all speaker LED controls for card 1
  # similar to 'echo -n "card=1,*" > /sysfs/devices/virtual/sound/ctl-led/speaker/detach'
  sysset "devices/virtual/sound/ctl-led/speaker/detach:card=1,*"

  # attach the 'Speaker Playback Switch',10 control to speaker LED trigger in card 1
  # similar to 'echo -n "card=1,iface=MIXER,name='Speaker Playback Switch',index=10" > /sysfs/devices/virtual/sound/ctl-led/speaker/attach
  sysset "devices/virtual/sound/ctl-led/speaker/attach:card=1,iface=MIXER,name='Speaker Playback Switch',index=10"

Security: The LED-control bindings should be handled only in the boot / init phase (thus in UCM BootSequence section) and the sysfs interface files should be read-only for normal users.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
