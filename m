Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B2A6F6CFC
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 15:34:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4169C138E;
	Thu,  4 May 2023 15:33:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4169C138E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683207268;
	bh=smo1JqYgSJMtGsiFqlsvbdZt1OQLhJp1W1YOSN/udvs=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EwrKNMv9x4Apm12TTVX7oPn7h8RfAeRmclQ86VRxJn02o4l1kKSs64wykeMUwHXKW
	 UI4Qr6WfIEbMq+AxO17SLW+5jZCRZi1tTjE02lcx5fuL8yBgW94V1Z5QCbiyU+r/az
	 DCPbIeLPNwI+3nrcOLiXBENG96U0ndG7xRKVpUpI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB937F80529;
	Thu,  4 May 2023 15:33:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D831F8052D; Thu,  4 May 2023 15:33:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6233FF80520
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 15:33:06 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 2389011E7;
	Thu,  4 May 2023 15:33:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 2389011E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683207186; bh=kS6Jj5U+tlswuHKtFdzR+EfR2jNQwjFKj2J/B70daiU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ex+kM2dhzP0GIXkKX4k1pA2qesGjzH0/YNZ3aqJkUHnsGFi6pavV7agswCDrkwma/
	 FPPOm4ppWMvyLLG3elN8wTJGOIlnrOjGeO88qfOx9dvMQJF/XrYlG9tS+gJD5a1hdv
	 NToB3YmLWi/lMo5yESJT7sNNKOdh1yKpOXTorhkA=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu,  4 May 2023 15:33:02 +0200 (CEST)
Message-ID: <c2e501b7-68bc-947b-645e-e425dcd20c65@perex.cz>
Date: Thu, 4 May 2023 15:33:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] ALSA: pcm: fix snd_pcm_playback_silence() with
 free-running mode
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>,
 Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
References: <20230504130007.2208916-1-oswald.buddenhagen@gmx.de>
 <87cz3gkyz9.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <87cz3gkyz9.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UMFVYCXEWP75AZUVOHXZXBVN7GWXZBEE
X-Message-ID-Hash: UMFVYCXEWP75AZUVOHXZXBVN7GWXZBEE
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, Jeff Chua <jeff.chua.linux@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UMFVYCXEWP75AZUVOHXZXBVN7GWXZBEE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 04. 05. 23 15:28, Takashi Iwai wrote:
> On Thu, 04 May 2023 15:00:07 +0200,
> Oswald Buddenhagen wrote:
>>
>> Turns out that we cannot rely on the application pointer being updated
>> in top-up mode, as its primary purpose is to remain operational in
>> free-running mode as used by dmix.
>>
>> So we logically revert some bits from commit 9f656705c5faa ("ALSA: pcm:
>> rewrite snd_pcm_playback_silence()"), but we retain the bug fixes and
>> try to make the code paths congruent.
>>
>> Reported-by: Jeff Chua <jeff.chua.linux@gmail.com>
>> Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
> 
> Honestly speaking, this is really hard to review.  As most of changes
> here are the revert of the previous commit, I'd rather like to get it
> reverted whole once, and re-apply the proper fix gradually.

I fully agree here. Takashi, please, revert the broken patch right now. I 
think that the review and improving the code may take some days.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

