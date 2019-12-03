Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD6D10FE1C
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 13:53:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15D1282A;
	Tue,  3 Dec 2019 13:52:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15D1282A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575377623;
	bh=cXoBW+QWd5joALsUiJJC4t1ejFFt2yvwJ/CdezNSOqE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CmZ7Of5x4dGEBPfAiXRWyH/ApTnJJc4AtGLmoA+n/tc01g8CGxtZ0nQ+qao6VH9t9
	 BaMjSBXpzZsySjiIci+EN8CbS+PQqhKC+PkVibQAdbQ+W4csAyjIC9kThrnjHCCtDT
	 Angzz6qAXDnwNiisfODhxluJ/Dd29qNXytHHBPR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBB15F80227;
	Tue,  3 Dec 2019 13:51:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 802ECF80227; Tue,  3 Dec 2019 13:51:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0F6CF800B4
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 13:51:53 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D183DA003F;
 Tue,  3 Dec 2019 11:23:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D183DA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1575368590; bh=5yqSg5EBHxrtkRyGUm7dmt4fb/W4TQdkXFCUEubu3Zs=;
 h=Subject:To:References:From:Cc:Date:In-Reply-To:From;
 b=dfQm0IzOanmGxePf0UeuDaesw45wpAnUvtpOHriVZTa/mWtlSdbZpf5Iyh2J/v6dY
 xt1gf8RvlW80R5xPrZzDKxAvzovjvC/kZtrrtUUx52pwCmM4T1FTV2Mt2R/aE7OeTQ
 eg1BRvkUxOnrXrZzisdDO1SAZI/kxzIwXxs2VnZM=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  3 Dec 2019 11:23:08 +0100 (CET)
To: Vinod Koul <vkoul@kernel.org>
References: <20191119112625.GD82508@vkoul-mobl>
 <20191119124302.GE82508@vkoul-mobl>
 <85e86218-6766-82a9-059c-c4a169178c26@perex.cz>
 <20191203101203.GZ82508@vkoul-mobl>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <89f264dd-e020-4d75-b6ac-e98893923e0a@perex.cz>
Date: Tue, 3 Dec 2019 11:23:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191203101203.GZ82508@vkoul-mobl>
Content-Language: en-US
Cc: ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [ANNOUNCE] fcplay: compressed audio test utility
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 03. 12. 19 v 11:12 Vinod Koul napsal(a):
> On 26-11-19, 11:27, Jaroslav Kysela wrote:
>> Dne 19. 11. 19 v 13:43 Vinod Koul napsal(a):
>>> On 19-11-19, 16:56, Vinod Koul wrote:
>>>> Hello,
>>>>
>>>> I have forked the cplay test app into fcplay which is a different repo
>>>> [1] licensed as LGPLv2.1. The reason for fork was me getting sick of
>>>> seeing the tool miss sync word for mp3 and no support for other formats
>>>> which I wanted to test. But I was lazy to start exploring all media
>>>> formats and write a parser for them so I have used libavcodec to the job
>>>> for me which is GPL.
>>>>
>>>> The fcplay links to libavcodec to get compressed audio parameters and
>>>> then uses tinycompress to send data to sound card.
>>>>
>>>> It supports mp3 (no more complaints about sync words) and Flac. I will
>>>> add more formats, wma etc are in the list along with gapless audio
>>>> playback and support for new changes coming to gapless audio playback
>>>> as discussed in audio meeting at Lyon.
>>>>
>>>> As usual patches are welcome.
>>>>
>>>> Jaroslav, can we add to alsa-project github as well?
>>>
>>> Here is the missing link!
>>>
>>> [1]: git@github.com:vinodkoul/fcplay.git
>>> https://github.com/vinodkoul/fcplay/
>>
>> I would probably add this to the tinycompress package, too. The mixed
>> licence is not an issue, I think.
> 
> That depends on who you talk to :-) Some folks seem to be averse to
> anything *GPL*! so adding this to tinycompress can have issues for them.

I mean that you can add a new tool to tinycompress with the LGPL-only licence. 
It depends on the packager/user if he/she accepts it. So, dual BSD/LGPL 
licence by default and LGPL-only to fcplay. You may place this tool to 
src/utils-lgpl directory or so.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
