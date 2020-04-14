Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 155E71A7DDE
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 15:26:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B37C516AE;
	Tue, 14 Apr 2020 15:25:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B37C516AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586870809;
	bh=f+v0E4JJxJU7L2dVx9d3Hd05WcmTbiXWFHMvp7/llzU=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hfz4qrTBwF9Bn+JInVEIFGt8/facdOkNbY9gSaa8mn7ISRc+9PsotQ8JqE49WoFMs
	 HAKmgPXJsmUUM1MiKDZpJNw7+O5dqf8fT/mR9MTRWO9cs42DxrTgVVAZwAQbvvRqKZ
	 IB5UpeSHkvqci7sF6aNFkQlHU1FvmSVKVsPZfVlw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46EC7F80115;
	Tue, 14 Apr 2020 15:24:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EF96F8021E; Tue, 14 Apr 2020 15:24:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD678F8014E
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 15:24:45 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 6A04EA0040;
 Tue, 14 Apr 2020 15:24:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 6A04EA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1586870685; bh=3dpeGKAkJk9oS2wQdKXOOhZSuWkrx4ZmBGts2EJZoXg=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=2JUh9vBGs6TC2LIn1a7szsQ6ig855vp82dYu/nYweM7YV47CA31lffTxWIxBPTEAm
 LYz/+7oeqEE+9BRm1kWYhfBFNp0ebMoOnL/4Uq8a+DuWW6T/No7b+ec4TfTryFtxDN
 9gFdZSg9m5mujjnGGf4exvCM5rUrWPCVAbuwAzXA=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 14 Apr 2020 15:24:42 +0200 (CEST)
Subject: Re: [PATCH] alsactl: avoid needless wakeups in monitor loop.
To: Zev Weiss <zev@bewilderbeest.net>, alsa-devel@alsa-project.org,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <20191015043802.23619-1-zev@bewilderbeest.net>
 <20200412021905.GB3961@workstation>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <6baed77f-0876-f32e-2e9c-82f9d7ecbe83@perex.cz>
Date: Tue, 14 Apr 2020 15:24:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200412021905.GB3961@workstation>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

Dne 12. 04. 20 v 4:19 Takashi Sakamoto napsal(a):
> Hi,
> 
> On Mon, Oct 14, 2019 at 11:38:02PM -0500, Zev Weiss wrote:
>> The timeout wasn't really being used for anything; disabling it should
>> reduce idle energy consumption slightly.
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> ---
>>   alsactl/monitor.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> I overlooked it as well... It looks good to me.
> 
> Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> Tested-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

Applied. Thanks.

				Jaroslav

> 
>> diff --git a/alsactl/monitor.c b/alsactl/monitor.c
>> index 6b090e4f5c92..6d9328d899a4 100644
>> --- a/alsactl/monitor.c
>> +++ b/alsactl/monitor.c
>> @@ -340,7 +340,7 @@ static int run_dispatcher(int epfd, int sigfd, int infd, struct list_head *srcs,
>>   		int count;
>>   		int i;
>>   
>> -		count = epoll_wait(epfd, epev, max_ev_count, 200);
>> +		count = epoll_wait(epfd, epev, max_ev_count, -1);
>>   		if (count < 0) {
>>   			err = count;
>>   			break;
>> -- 
>> 2.23.0
> 
> Regards
> 
> Takashi Sakamoto
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
