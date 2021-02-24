Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B1C3239E0
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 10:51:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 027A01662;
	Wed, 24 Feb 2021 10:50:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 027A01662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614160296;
	bh=ipBCU7T58F4qOUfsiocebhVV8TKNDYDNSavvSztO+v4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KHYshBT9cW3EjktPdOJ7rpvJtBym5LeN3TEd7ocBxvEi8G4A/Jmh0P1kEjY/mzTuJ
	 ljZClB0uLPOnB2lQqW1psnCGIZnaVEidV7I3o+f0LnE1hGaPptWTgYEJWanVpeEka8
	 txGkcQH2i0EXVzNojMxsb0Kv3fwz0tSqM5n4lOiI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63325F8022B;
	Wed, 24 Feb 2021 10:50:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60DF7F8016C; Wed, 24 Feb 2021 10:50:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31DEBF80159
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 10:49:53 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 51897A003F;
 Wed, 24 Feb 2021 10:49:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 51897A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1614160188; bh=vZsoMfwJNw5zdKSqYCZ7qnWA+KwdY3LpAvrfRL3Jgmo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=2lG39rH31kfj0GtNlri/pyS82FkiYtMTjs3aa4L50rAJsX5G0QoTsK9cfPty7Gc20
 bkD96xU22Eu3Zbs0X3wI6U1fqAv+/BKREXYxzkRA76gFd1rBcuW/44+SQN7wg/zYCV
 yzngEklH6j/Wb2+vW/OtZSmXuA022BL1vMbnmaes=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 24 Feb 2021 10:49:41 +0100 (CET)
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
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <03068e15-2157-3ae6-ffd6-7ec315bb49a3@perex.cz>
Date: Wed, 24 Feb 2021 10:49:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <s5h1rd5u7p4.wl-tiwai@suse.de>
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

Dne 24. 02. 21 v 10:38 Takashi Iwai napsal(a):

>> It seems that you misunderstood the number of issues which my code is trying
>> to resolve:
>>
>> 1) set LED based on state from multiple cards (so you cannot trigger LED
>> inside single driver / single control element); we need one arbiter; this is
>> the main argument
>> 2) unifies the audio LED interface
>> 3) reduce the hardware driver code
> 
> Those purposes are all fine.  But they don't need to be exposed for
> user controls that can be abused.  That's the very concern.

So, how to handle this feature for AMD ACP without PA / PipeWire modifications?

And if we add an user space channel to the audio LED arbiter code, how it
differs from my proposed control API extension? We have already locking
mechanism for the user control element to one task, so it's possible to create
safe user space implementation (depending on the standard task priviledges) on
demand even with my proposal.

Could you elaborate the abuse you mean? Three bits?

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
