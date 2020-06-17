Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A661FD02D
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 16:59:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75B731679;
	Wed, 17 Jun 2020 16:58:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75B731679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592405956;
	bh=SBmENQirz2VUCizrzoRl9Icep/v95C5fd1rsjtUJzkA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XYLSGn+yhnputURpt6tHnKO3y4ug1BANQHx4UDznL496snTwl/EgI5RI8tY88tlo9
	 J5lgnYNdSkrEXQisQlPo9deur58b4CVLoEL8x1XMHISLYxTjz0jqbC0QibwTPfABvz
	 eVcCBXdUhHvIx/sKcy35++1Inzg+WHwjdruY2UNo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92AA4F800EF;
	Wed, 17 Jun 2020 16:57:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E080CF800EF; Wed, 17 Jun 2020 16:57:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76441F800EF
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 16:57:26 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4F134A003F;
 Wed, 17 Jun 2020 16:57:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4F134A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1592405845; bh=2OR4Uih7ljidFWQUtnY6X10aiJz9Og7adGIr7ioXw6g=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=0hv/l7nmBcmGZPocxbnioTuDC76wvz7/Sh3FQq7TMNgG6zAryvCowRZi/V0r5zrOG
 xgtQkg1UUVK1ymrkLKLdvpU8VJ9QmQEbinYJwVKOfqtlCFHUkm/z6i2B7K3wve3DGL
 P7yluwwp4BIesG9OJ+4EgPm80jaCxdDb4V0FzEmA=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 17 Jun 2020 16:57:23 +0200 (CEST)
Subject: Re: Move ownership for repositories in Github related to
 gobject-introspection
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <20200617080114.GA265611@workstation>
 <26bcc126-6688-5996-b6ad-3288bd2facd8@perex.cz>
 <20200617125716.GA273906@workstation>
 <350b8bbe-afed-294f-a96a-0caf99ecb567@perex.cz>
 <20200617131746.GA274842@workstation>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <3feba622-81f6-f2a6-b4dd-289d98f0aca2@perex.cz>
Date: Wed, 17 Jun 2020 16:57:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200617131746.GA274842@workstation>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>
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

Dne 17. 06. 20 v 15:17 Takashi Sakamoto napsal(a):
> On Wed, Jun 17, 2020 at 03:07:02PM +0200, Jaroslav Kysela wrote:
>>> Thanks for your approval. Just now I transferred below four repositories
>>> from my account to alsa-project account:
>>>
>>>    * https://github.com/alsa-project/alsa-gobject-rs
>>>    * https://github.com/alsa-project/libhinawa
>>>    * https://github.com/alsa-project/libhinawa-docs
>>>    * https://github.com/alsa-project/hinawa-rs
>>>
>>> Fortunately I can select the 'gobject-introspection' team as destination
>>> of the transferring, but I'm grant for read-only access. Would I request
>>> you to grant my account Admin (or Writeable) right?
>>>
>>> And you made 'Hinawa' team and put libhinawa/hinawa-rs repositories into
>>> it. But in my preference they're in 'gobject-introspection' team as well
>>> as alsa-gobject repositories.
>>
>> I created new 'Hinawa' team and changed the priviledges for all new repos
>> appropriately.
>>
>> If something is wrong, let me know.
> 
> The half of libhinawa is an application of ALSA hwdep interface to
> implement user/kernel interaction described in 'include/uapi/sound/firewire.h'[1].
> (The rest is an application of Linux FireWire stack.)
> 
> Furthermore, in a point of application of gobject-introspection and
> abstraction to a kind of ioctl requests, libhinawa and alsa-gobject has
> similar design. For me, it's convenient to put them into the same
> 'gobject-introspection' team without adding the specific team.
> 
> Would I request you to put all of them under 'gobject-introspection'
> team, again?

Ok, done, the 'GObject Introspection' team is member of 'Hinawa' team now.

						Jaroslav

> 
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/tree/include/uapi/sound/firewire.h
> 
> Thanks
> 
> Takashi Sakamoto
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
