Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD5254215F
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jun 2022 07:56:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F07BA174A;
	Wed,  8 Jun 2022 07:55:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F07BA174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654667797;
	bh=ZpiBcURVMbIPE0fAutasooKtDGQvJlqu93yh5nzvCa4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JFB0p9LuvygULj0n4LTlOhLLhuFkUt7e2wF63BeTMzXQGaRCjhfVQN22SSrXRjf9G
	 WOuOGLUsgbIyEDjYhdTD3SU2z87zYyA/FlA3xIDjIcQgGLFURIAaE3+P7tDZ2xWh6N
	 5tRhF02Vx1CipHL/3fZNhAV/I9cvj/NEITqpyIno=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F7CAF8026A;
	Wed,  8 Jun 2022 07:55:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C77FF8024C; Wed,  8 Jun 2022 07:55:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91FCDF80116
 for <alsa-devel@alsa-project.org>; Wed,  8 Jun 2022 07:55:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91FCDF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="Wo6zdAVN"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="KlOdNCY9"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 16F59A1A3D401;
 Wed,  8 Jun 2022 07:55:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1654667733; bh=ZpiBcURVMbIPE0fAutasooKtDGQvJlqu93yh5nzvCa4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Wo6zdAVN+xmopW0cNBsCxNB1JcU6dXWR4op+SD/ebbfCMpaHEGl6eBsxPHHpAxNpY
 7GiCvGwsGH6NhI19AfN+DTnQmYcs8hToIwrYMAJKx5pMyVD+D7iw78zAUP2yzTwk+l
 UMKjsBWMNg5gc3DRCrpZlSX12l6RXC8245kr4niE=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZYmWvYnBm6OY; Wed,  8 Jun 2022 07:55:28 +0200 (CEST)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id D5F28A1A3D400;
 Wed,  8 Jun 2022 07:55:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1654667727; bh=ZpiBcURVMbIPE0fAutasooKtDGQvJlqu93yh5nzvCa4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KlOdNCY9vNsMbgLQz9FPFs4Wop1jrgK3D9dMb0re+nyFxD4MltMwIqN/rcxlfm4Ze
 /VLza6Ghr7DAXLKHhhEWheiEYA6Gnxpg55v7bU8GuoJnSi39nXmN8bHXcUjWBIagBo
 5MKToKF6wsS05nuKgdcAO0eSToHzAEcTOIS7zDJ8=
Message-ID: <378f370d-6b61-0e13-3da7-075c59b23ded@ivitera.com>
Date: Wed, 8 Jun 2022 07:55:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Combined wait for pcm_wait and ctl_wait
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>
References: <54d620be-08a9-c67c-5eac-56cae79def96@ivitera.com>
 <4c4f1308-2d7d-8b66-29f4-12e2245f9132@perex.cz>
From: Pavel Hofman <pavel.hofman@ivitera.com>
In-Reply-To: <4c4f1308-2d7d-8b66-29f4-12e2245f9132@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


Dne 07. 06. 22 v 12:15 Jaroslav Kysela napsal(a):
> On 07. 06. 22 11:56, Pavel Hofman wrote:
>> Hi,
>>
>> Please is there any way to wait for nonblocking read/write at min_avail
>> (like snd_pcm_wait) AND nonblocking subscribed ctl event (like
>> snd_ctl_wait) in a single combined wait? The goal is to react as fast as
>> possible to ctls in aloop and audio gadget devices which notify about
>> stream stop and start (at new rate/format/channel count) on the other 
>> side.
>>
>> I guess some wizardry with file descriptors and polling multiple fds
>> could do.
> 
> Yes, use snd_ctl_poll_descriptors* and snd_pcm_poll_descriptors* 
> functions to fetch descriptors and translate poll states returned from 
> poll(). The alsaloop utility from alsa-utils may be used as an example.
> 

Thanks a lot, I will do so.

With regards,

Pavel.
