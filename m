Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E021FCE17
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 15:09:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66C8D1678;
	Wed, 17 Jun 2020 15:08:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66C8D1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592399342;
	bh=hopque5QcQfJ8BSHI1M4s1vc9WOy9B0n7nLcm0pEyFE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jieFuv4LdS0y/wn+xdymFCyy1iPEHiABJI1ecF0Qad26g8cqxox07iMbvB742Lg5s
	 Q/k3i9VNWqfvB20qS96j7/oesLxnmtaJA3sOb/LKxblKtJZkK3b0RO//xzkOVJfMGz
	 b7/5kqwNQIQ7owmHJ8aQrQ9b+sTOzjQkft7BUGdU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6363BF800EF;
	Wed, 17 Jun 2020 15:07:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD0C9F80171; Wed, 17 Jun 2020 15:07:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D29FF800EF
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 15:07:07 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 7F435A0040;
 Wed, 17 Jun 2020 15:07:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 7F435A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1592399224; bh=SRK0dTFvmaslRCUdWj/+AqfpzbmcL2h/MLGdEGjYotM=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=PuNaQwjdLkb+EN18rL46f4YqGjEwAM8tvabfBkEBJF7KLytYk2IDdixCw6N9z/ugy
 5j8KibwTOH3Y691BlWabkdFz4jMWpvIFJNFJJJ6PR7ovc+dsS95beQ/zbs+QVG/YFZ
 ePLTGbVdfPm/3r5DX1DJFFSgclitgoyyEan+GulY=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 17 Jun 2020 15:07:02 +0200 (CEST)
Subject: Re: Move ownership for repositories in Github related to
 gobject-introspection
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <20200617080114.GA265611@workstation>
 <26bcc126-6688-5996-b6ad-3288bd2facd8@perex.cz>
 <20200617125716.GA273906@workstation>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <350b8bbe-afed-294f-a96a-0caf99ecb567@perex.cz>
Date: Wed, 17 Jun 2020 15:07:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200617125716.GA273906@workstation>
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

Dne 17. 06. 20 v 14:57 Takashi Sakamoto napsal(a):
> Hi,
> 
> On Wed, Jun 17, 2020 at 01:15:30PM +0200, Jaroslav Kysela wrote:
>> Dne 17. 06. 20 v 10:01 Takashi Sakamoto napsal(a):
>>> Hi Jaroslav,
>>>
>>> Now I'm going to prepare for official release of alsa-gobject v0.1.0.
>>>
>>> At the same time, Rust binding is also OK to be released. Currently It's in
>>> my private repository[1] but I think it better to put under alsa-project
>>> project account in Github.
>>>
>>> Github supports transferring ownership, and this time I'd like to utilize the
>>> feature if you don't mind it. After transferring. some arrangement for the
>>> repository are perhaps required; e.g. to put it to 'gobject-introspection'
>>> team[3]. Would I ask it to you?
>>>
>>> Additionally, I'd like to move repositories for libhinawa[4][5][6] as well,
>>> which is required to make up control service in user space for devices
>>> supported by ALSA firewire stack[7].
>>
>> Hi,
>>
>>    I have no objections against that proposal. I will try to configure the
>> repositories when transferred to the alsa-project organization.
> 
> Thanks for your approval. Just now I transferred below four repositories
> from my account to alsa-project account:
> 
>   * https://github.com/alsa-project/alsa-gobject-rs
>   * https://github.com/alsa-project/libhinawa
>   * https://github.com/alsa-project/libhinawa-docs
>   * https://github.com/alsa-project/hinawa-rs
> 
> Fortunately I can select the 'gobject-introspection' team as destination
> of the transferring, but I'm grant for read-only access. Would I request
> you to grant my account Admin (or Writeable) right?
> 
> And you made 'Hinawa' team and put libhinawa/hinawa-rs repositories into
> it. But in my preference they're in 'gobject-introspection' team as well
> as alsa-gobject repositories.

I created new 'Hinawa' team and changed the priviledges for all new repos 
appropriately.

If something is wrong, let me know.

				Thanks,
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
