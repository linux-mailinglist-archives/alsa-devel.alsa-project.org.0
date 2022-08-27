Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0995A34D8
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Aug 2022 07:32:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63175161E;
	Sat, 27 Aug 2022 07:31:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63175161E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661578321;
	bh=wwiIkk9cHOdnM/97eeLB9yuhfnvRhmZrQMwEG+gA8ik=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UBoZgYh4iPhY8V1m8wt3yCKKUBJSwYz5XL7tpMmX4nkiMdZKtkU9PVlsdZntBx84V
	 Ju9iQ32/Jsz5YbfjibxrfwatTI0FcFjzMAhdojuT/QW34vo9bXxEbBNdGIycVSZYUJ
	 OCjgwUUPOwRFzI87sqwffrzqtHZdEyQ4Afw8MxvM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB032F8021D;
	Sat, 27 Aug 2022 07:31:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DFEBF80132; Sat, 27 Aug 2022 07:31:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C408F800BD
 for <alsa-devel@alsa-project.org>; Sat, 27 Aug 2022 07:29:39 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A2C44A003F;
 Sat, 27 Aug 2022 07:29:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A2C44A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1661578178; bh=GxSqbro0l2JjJKm7vawhJDehPukRnUrqWhC0G0f+lLM=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=yLQlfhkYd+mngnG5VlN+x0hzg5AETacZDaHrmyhwXpZzCrLF65T9syfKjv1g8sLts
 ZI+RRlw8JRx5qYM0TvdM8e8JH8IBDFlhyqOqWbqfBCihgqwN6wZUU0tjokahQdqoh/
 /w+MFD+GdPJqrp6SyNi+2gCIbXh9Bt55YLqB9w+c=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sat, 27 Aug 2022 07:29:35 +0200 (CEST)
Message-ID: <9e83d9ca-ae9f-28b6-c8b6-fc0e16a6d728@perex.cz>
Date: Sat, 27 Aug 2022 07:29:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Request for setup of new repositories
Content-Language: en-US
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <b6e986d0-b594-4543-ae63-e08e88ad3418@www.fastmail.com>
 <YozAmQFZ3LhqQoZN@workstation>
 <afd7c233-39c5-b73f-75c7-728a8abbd434@perex.cz>
 <Yo2JcNT9rQ0xw0+Q@workstation>
 <ef0ab4a6-ed6e-51e5-ffd8-397aa3e289ab@perex.cz>
 <Yo95YGyUSSBOipM2@workstation>
 <edd3a849-13eb-9a21-963e-f8cc8deffe47@perex.cz>
 <YuzwXjaXXtufCTvo@workstation>
 <e8d9c980-11ce-d0cf-6df4-5a6a7ee8b1f9@perex.cz>
 <Yuz38K05IOxVXcnK@workstation> <YwmS1+DnoNbyRafC@workstation>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <YwmS1+DnoNbyRafC@workstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>
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

On 27. 08. 22 5:43, Takashi Sakamoto wrote:
> Hi,
> 
> On Fri, Aug 05, 2022 at 07:58:56PM +0900, Takashi Sakamoto wrote:
>> On Fri, Aug 05, 2022 at 12:42:59PM +0200, Jaroslav Kysela wrote:
>>> I have no objections for the OAuth access from crates.io .
>>
>> Ok. Just now I sent the request to organization. I'm waiting for the
>> acceptance notification.
> 
> This is just a reminder for the above task. I'm waiting for the change
> of pending state so long.

Approved.

			Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
