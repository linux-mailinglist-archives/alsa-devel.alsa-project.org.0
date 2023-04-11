Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA2A6DE267
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 19:24:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CE79EF6;
	Tue, 11 Apr 2023 19:23:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CE79EF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681233860;
	bh=BQKfozDRimzYHC15X2Cx3uw+iVJMxTDMS7hWmstGFgM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=IGDh8P7ZounzTXE/qGlbeklHoMJBa6QlT9CdgxNnfcBLuKcDbLgQIIZY1p23a13q/
	 YeMq3+U5H9f3EHNEkzsqDkZZ8ZaxnqrU8Ml8veJrKZL2IwI4kcZd0ZH0Ic/oWSjzE7
	 B+KMyBEoXXnmO9roy2NOZbLgT0uturFP44ok4lZM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98535F8025E;
	Tue, 11 Apr 2023 19:23:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDD71F8032B; Tue, 11 Apr 2023 19:23:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6C10F80149
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 19:23:22 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4168111D8;
	Tue, 11 Apr 2023 19:23:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4168111D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1681233801; bh=HBz+ZBbwigxQAZQz464QUuHmyj27KM5CMfC4HPULviA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ysxVP/TmpNFeJjSeDZQswh9QP0PNrrK5L7fnYxa22w5SvmXcx1GQRWssDV2UU4/8s
	 a9aqYxAe5J0NRXt88B2W/r6Vzynx4jx04468JKWRBTH+ZQYIG94zDhTa9N+xK4tHc+
	 UK1ydIug+av2BLV5evpitPDY0t2awmPkl0ysQybg=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 11 Apr 2023 19:23:18 +0200 (CEST)
Message-ID: <7b317956-deb1-0a75-0a34-f82d6a81cf90@perex.cz>
Date: Tue, 11 Apr 2023 19:23:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/2] ALSA: pcm: auto-fill buffer with silence when
 draining playback
Content-Language: en-US
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
References: <20230405201219.2197789-1-oswald.buddenhagen@gmx.de>
 <20230405201219.2197789-2-oswald.buddenhagen@gmx.de>
 <3d75c103-7e94-e6a1-7f3d-7f957c33cddc@perex.cz> <ZDEWyjdVE2IocpGY@ugly>
 <22f551f3-deae-1536-bd07-0b9340940ea4@perex.cz> <ZDVnUj2B0EkMiOlA@ugly>
 <6d6c5f3a-81bc-acf4-eb4d-229b581bbe8b@perex.cz> <ZDWPy9YbXWWOqaC+@ugly>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <ZDWPy9YbXWWOqaC+@ugly>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TUSN5WSKH6TDDRVZGVOJU5QKNZA4F3NJ
X-Message-ID-Hash: TUSN5WSKH6TDDRVZGVOJU5QKNZA4F3NJ
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TUSN5WSKH6TDDRVZGVOJU5QKNZA4F3NJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11. 04. 23 18:50, Oswald Buddenhagen wrote:

>> If we allow modification of the PCM buffer, I think that we should:
>>
>> - Do not modify the buffer for drivers already working with the
>>    appl_ptr data (end position) only.
>>
> i suppose that should be detected by the drain callback being set up?

Yes, but it would be probably better to add a default silencing callback with 
a warning to notify authors of drivers to review and eventually correct the 
behavior.

>> - Handle the situation with the large buffer; it may make sense
>>    to change the "wait" operation from the end-of-period interrupt to time
>>    scheduler and stop the drain more early when the end-of-valid data condition
>>    is fulfilled.
>>
> i don't understand what you're asking for.

Use jiffies/timeout instead waiting to the interrupt. In this case, the stop 
may be called earlier (in the middle of period). In this case the silenced 
area may be much smaller.

>> - Increase the protocol version.
>>
>> But as I wrote, I would make those extensions configurable
>> (SNDRV_PCM_HW_PARAMS_DRAIN_ALLOW_SILENCE). It can be turned on by default.
>>
> i have no clue what would be involved in doing that. to me that sounds
> like overkill (solving a non-issue), and goes waaaay beyond what i
> expected to invest into this issue (really, i just wanted to verify that
> the emu10k1 fixes work, and accidentally discovered that there is a
> mid-layer issue that affects user space, as the pyalsaaudio lib i'm
> using doesn't handle it).

OK. I don't think that it's a pyalsaudio job to resolve the issue with the 
minimal transfer chunk / period (which you set / know before the transfer is 
initiated).

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

