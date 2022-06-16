Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D5154DE8C
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 12:01:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A4B51ADE;
	Thu, 16 Jun 2022 12:00:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A4B51ADE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655373689;
	bh=1mmFzbq5IaeLzR2rtmKWbZkl8I6V9CVhfo5aIuS0q9c=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NVlykAWZfs6HjzTRy4uVX8qnDJkfgIbelQEkY2ZPxs7wcP8DRVwbhftIIgxSc0uMh
	 1BpxrLDRHQcPTlMM0KRE5hHm8OJpjk3J+kkp9i5fWlBtLFVOdSfFznPnf6jXnr/znl
	 yWZSFVsHJgLwJMVG0RcjYFv4bLB//3N0PtFcd3Iw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F1AAF80310;
	Thu, 16 Jun 2022 12:00:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08BF2F801D8; Thu, 16 Jun 2022 12:00:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC442F800B9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 12:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC442F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="hr+6st1n"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="M+7Jk7nH"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 0E52BA1A3D402;
 Thu, 16 Jun 2022 12:00:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1655373629; bh=1mmFzbq5IaeLzR2rtmKWbZkl8I6V9CVhfo5aIuS0q9c=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=hr+6st1n+TJGv23eK5AWJwmbdYDvE5J91cE4OZCc1qY+f2m6oHIjaQmekmZ7jBJz0
 PsOfcsTzCs3Wgn9JbmfcZhHOjIzAzm/HGSWXij5CGpy6gwRKjTxAfTsAH4rWO3On5/
 FLb3kHKuEeZOUjl1uOJjaGpWXHSYRWfIMalXfarI=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qaXyJAK5YcQk; Thu, 16 Jun 2022 12:00:23 +0200 (CEST)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id 6F093A1A3D400;
 Thu, 16 Jun 2022 12:00:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1655373623; bh=1mmFzbq5IaeLzR2rtmKWbZkl8I6V9CVhfo5aIuS0q9c=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=M+7Jk7nH9m2YfTn7Ql4xNolqwf5FUyv4O/SZivhUicn5XlYl5zfzjXs9stgR1+gfL
 isMOW4TQuK+nVVrlhZUc2EIjUYAjsCliaYYWfV4dwWzLMJxvgViTdiqYmRw185iPes
 /58xh/T63RQNs2mku3nA+wZkSvoCPCIfXA7A7Gjw=
Message-ID: <900e96c0-6251-fa3d-42b4-847ece6e1a44@ivitera.com>
Date: Thu, 16 Jun 2022 12:00:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] aplay: Support setting timestamp
Content-Language: en-US
To: alsa-devel@alsa-project.org
References: <20220616065426.27915-1-pavel.hofman@ivitera.com>
 <YqrmNfnn2qCZV9Kf@workstation>
From: Pavel Hofman <pavel.hofman@ivitera.com>
In-Reply-To: <YqrmNfnn2qCZV9Kf@workstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Dne 16. 06. 22 v 10:13 Takashi Sakamoto napsal(a):
> 
> On Thu, Jun 16, 2022 at 08:54:26AM +0200, Pavel Hofman wrote:
>> To allow enabling timestamp and specify its type, a new option
>> --tstamp-type=TYPE is added. Recognized values are none (default),
>> gettimeofday, monotonic, monotonic-raw.
>>
>> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
>> ---
>>   aplay/aplay.1 |  4 ++++
>>   aplay/aplay.c | 32 ++++++++++++++++++++++++++++++++
>>   2 files changed, 36 insertions(+)
>   
> I prefer the idea to work for timestamp feature defined in ALSA PCM
> interface, while I have a mixed feeling to integrate `aplay` tool, since
> I have an intension to obsolete the tool with `axfer` tool with more
> robust design with command argument compatibility (as much as possible).
> 
> This is not so strong request but would I ask you to work for `axfer` tool
> instead of `aplay`? Then, it's preferable that the name of command
> argument is decided with enough care of all of timestamp feature in ALSA
> PCM interface, since we have two categories of timestamps at least; e.g.
> system timestamp and audio timestamp. As long as I know, they possibly use
> different clock sources, thus these two timestamps have different levels
> of clock id, I think.
> 
> Of course, it's a loose accord in the community to obsolete `aplay`, and
> it's easy to decide to continue aplay integration. (I'm not in leading
> place of the project.) I'll be a bit happy if people take care of axfer
> tool as well.

Thanks for your input. I use aplay in my project and needed to have 
tstamps enabled in proc status files for my simple code which calculates 
relative samplerate between capture and playback soundcards (one of them 
having rate adjustable - audio gadget, snd-aloop) 
https://mailman.alsa-project.org/pipermail/alsa-devel/2022-June/201647.html 
. The existing aplay did not have this feature, so I added it and 
submitted the patch. I did not know aplay was planned to be obsoleted, 
it seems to receive a healthy stream of patches.

As of the tstamp terminology - what command option would be more 
appropriate instead? Thanks a lot,

Pavel.

