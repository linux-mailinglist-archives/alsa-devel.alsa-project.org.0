Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CC6323BC6
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 13:10:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF2CD167B;
	Wed, 24 Feb 2021 13:09:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF2CD167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614168644;
	bh=u0B8epsNz+KFfv6uIkBdyEY9TspTfXGRPrjDsf6nAZw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VdFOuPSpPICW59FcJrRDcSjD5b+wXpCJfKIaPXt5DD3ILUbq+jpto5+AaNXeGCqZ2
	 wPqNogPvfd/f36P/TVOBXAJaNvY4HgStLEei3mr3oXBMGplkfa6b5dcybYKholdFLQ
	 ia69OPXEeKZUqP6Tydh6psM1ThqioSJU59pZLlSA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06DBFF8022B;
	Wed, 24 Feb 2021 13:09:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84F9BF8016C; Wed, 24 Feb 2021 13:09:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E55FF800F2
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 13:09:03 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 32858A0040;
 Wed, 24 Feb 2021 13:09:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 32858A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1614168543; bh=pTNIyAgDWobJPoCbnwxIvRRy/LtmqBtOxDDtSvPAW6k=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=cObM/d2TrAFuTytMloCnuqEWFv5KDq/H8GfeSjJTEjVL+G7RxjLrdASkWsJoh+KhS
 ZfLO61m9iNM/ydy5pAd7apmU3Jld/mBGe1iVEAbQaBVNFRherwbzHbAnuytjr8P4Hk
 4Ax5HQXdZpZ8IfBai+fadIFZ5Z/flxtGaNW5paLc=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 24 Feb 2021 13:08:56 +0100 (CET)
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
To: Takashi Iwai <tiwai@suse.de>
References: <20210215142419.308651-1-hdegoede@redhat.com>
 <20210215142419.308651-3-hdegoede@redhat.com>
 <20210223134506.GF5116@sirena.org.uk>
 <578b1ee3-f426-c5b5-bc78-5a91108ebdc8@redhat.com>
 <20210223140930.GH5116@sirena.org.uk> <s5h8s7evp8p.wl-tiwai@suse.de>
 <fc28d535-87a7-fbfd-89c7-992a537606bc@perex.cz>
 <s5hv9aiu55y.wl-tiwai@suse.de>
 <5c6a21c1-7107-3351-25be-c007b0b946d3@perex.cz>
 <s5hh7m2szwb.wl-tiwai@suse.de>
 <776b4ad9-2612-b08a-cb76-c3e1ce02388a@perex.cz>
 <s5h8s7du9tn.wl-tiwai@suse.de>
 <4574088a-4676-131a-0065-499a516f80ae@perex.cz>
 <s5h1rd5u7p4.wl-tiwai@suse.de>
 <03068e15-2157-3ae6-ffd6-7ec315bb49a3@perex.cz>
 <s5hv9ahsqkj.wl-tiwai@suse.de>
 <e7de1dd2-199e-9e07-65a4-2a2eb2b46b49@perex.cz>
 <s5hsg5lsnbu.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <9c74e8de-769c-cd98-3944-85bd75bc840b@perex.cz>
Date: Wed, 24 Feb 2021 13:08:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <s5hsg5lsnbu.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bard.liao@intel.com>
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

Dne 24. 02. 21 v 12:43 Takashi Iwai napsal(a):

>>> So far, a user control is merely storing the value, let read/write via
>>> the control API.  That's all, and nothing wrong can happen just by
>>> that.  Now if it interacts with other subsystem...
>>>
>>> A more serious concern is rather the fragility of the setup; for
>>> enabling the mute LED control, you'd have to create a new user-space
>>> control, the function of the control has to be ignored by some
>>> application and some not, etc.  This has to be done on each machine
>>
>> You're using "ignore", but as I explained before, the user space switch will
>> be used in the whole chain:
>>
>> capture stream ->
>>   alsa-lib mute switch / silence PCM stream ->
>>   PA mute switch / silence PCM stream
>>
>> So PA can use this switch like the traditional hardware mute switch.
> 
> Does it mean PA would work as of now without any change?  Or does it
> need patching?

Yes, no PA modifications are required with my mechanism. The PA will just see
the new user space control - mute switch - created in alsa-lib - which will be
synced the internal PA path mute state like for the hardware mute switch. I
also think that handling LEDs independently (outside the upper layers like PA)
is more flexible.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
