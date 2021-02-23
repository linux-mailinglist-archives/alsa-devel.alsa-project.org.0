Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CF332329A
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 21:58:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E643167B;
	Tue, 23 Feb 2021 21:57:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E643167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614113884;
	bh=6y3fMN0mu1O4A6K/+COPCcVewUx4JLhH8/W5cn7S+x0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RZeuDw/pzYQuv1mJPPOv0eI1xUoH6kT+lr+i0fHYyxTdXYaWz32IqsKmXqHwvk9ZK
	 XghNgURO8kXmejsMgEDju4ycNFZsTpc3046a8cA6Dn2iDywyB7AHClJm5QTxg9+kJ5
	 4qKSrRi7+MJEsSFuSNtxbPcDBb1tsNQgOFbfs4zM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6E1CF80167;
	Tue, 23 Feb 2021 21:56:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7B8FF8016A; Tue, 23 Feb 2021 21:56:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0069F80167
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 21:56:24 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 37923A003F;
 Tue, 23 Feb 2021 21:56:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 37923A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1614113784; bh=5WmfckAlXuQrJGZWwvN0A3L0+Og7tcLCzLn9Hg+L9C8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=NuH0LvcW2Q+jVaSSD8DdXNg18DqQjlJ7nzzHTewSM1ISABt+aGiSqqQ5uol009k5Y
 jWJciKXvJriE/uhMhdHxvfBZ2D0iCxiKocnbQ6po81c8UvzygM+yYod5ArwGQqeXoG
 s24n9+oufBzta/ibUjbd2pArjJPNmXFQTttHDC5w=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 23 Feb 2021 21:56:17 +0100 (CET)
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
To: Takashi Iwai <tiwai@suse.de>
References: <20210215142419.308651-1-hdegoede@redhat.com>
 <20210215142419.308651-3-hdegoede@redhat.com>
 <20210223134506.GF5116@sirena.org.uk>
 <578b1ee3-f426-c5b5-bc78-5a91108ebdc8@redhat.com>
 <20210223140930.GH5116@sirena.org.uk> <s5h8s7evp8p.wl-tiwai@suse.de>
 <fc28d535-87a7-fbfd-89c7-992a537606bc@perex.cz>
 <s5hv9aiu55y.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <5c6a21c1-7107-3351-25be-c007b0b946d3@perex.cz>
Date: Tue, 23 Feb 2021 21:56:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <s5hv9aiu55y.wl-tiwai@suse.de>
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

Dne 23. 02. 21 v 17:20 Takashi Iwai napsal(a):

> So do you mean that the LED feature should be selectively enabled like
> the current HD-audio?

Yes, it should be enabled only when the machine has the audio LEDs.

>>> Of course, this implementation would make the integration much easier,
>>> and that's a big benefit.  So I have a mixed feeling and not decided
>>> yet whether we should go for it right now...
>>
>> I think that we can reconsider the LED handling implementation later, when
>> someone brings something better on the table.
> 
> What worried me is the plan to expose this capability to user-space.
> If it's only a kernel-internal, we can fix it in the kernel and
> nothing else broken, but if it's a part of API, that's not easy.
> 
> So, if any, I'd like to avoid exposing to the user-space at first.
> (But then it comes to the question how to deal with a case like AMD
> ACP...)

I tried to propose a complete solution and the ACP was one strong reason for
this kernel / user space API. So without the user space support, it's just
a half solution for known issues.

Frankly, I don't see any drawback or a problem even if we remove this API
later. The LED group bits are just informal for the user space and it's
expected to create the user controls tied to this LED functionality only in
alsa-lib/plugins at the moment. The kernel may return an error when the user
space tries to set those new bits when the API is deprecated and I believe
that the hardware design faults like AMD ACP (without the hardware mute) are rare.

Initial alsa-lib support: https://github.com/alsa-project/alsa-lib/pull/121

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
