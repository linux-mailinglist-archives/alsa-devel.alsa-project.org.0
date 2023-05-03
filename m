Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C646F59E1
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 16:23:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A50DB10B0;
	Wed,  3 May 2023 16:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A50DB10B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683123787;
	bh=j/CHcXNjX2K/pGjtkHJaofOEaIOSEo9KADwNlzvEsxM=;
	h=Date:To:References:From:Subject:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lkdf0lZX5tMUhT/al6YI0te2ExSL0ZOPayd3xjPSBmVmiHK4PCPp+v+kHEoUiMUJB
	 HU9I45FO1qbzAX34PsKGq2YNsWOE6e3ddxQPt3f1GAdG0zubDIpU869uFbF/ZuTPzm
	 SDaeLQKogEfEqCyYvejur/hwK4X3oE2M+43jEA9Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB052F8032B;
	Wed,  3 May 2023 16:22:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F21E3F8049E; Wed,  3 May 2023 16:22:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3368BF800EC
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 16:22:06 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id CD0C211E6;
	Wed,  3 May 2023 16:22:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz CD0C211E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683123725; bh=UeueB1dTwkHZe/HPtyJUZrbt0ewPZSjtBcFcer5GQ4I=;
	h=Date:To:References:Cc:From:Subject:In-Reply-To:From;
	b=AGPm3lDIA0V22+P3Tj4MstK1bX6Ar+JVOEvQHflDsNkrmbq5AT7hKNaSY7g+c4oK1
	 wwdLQ1Fij4sTkp6H73i11/11FU6hQi/H3f7sxrBzMA2Jc9YebAfO2BZib4t3Yl2sY9
	 Ne6pdaV6vUT4MgCAPLkzYZYW7oCCBoU/o07c0GSY=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed,  3 May 2023 16:22:03 +0200 (CEST)
Message-ID: <433f4a7c-a55b-6aa4-d2a3-100188c86960@perex.cz>
Date: Wed, 3 May 2023 16:22:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: ALSA development <alsa-devel@alsa-project.org>
References: <20230502115010.986325-1-perex@perex.cz>
 <20230502115010.986325-3-perex@perex.cz> <ZFJEers7NBjf5dCu@ugly>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH alsa-lib 2/4] pcm: hw: add drain_silence configuration
 keyword
In-Reply-To: <ZFJEers7NBjf5dCu@ugly>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GVQCH4YEL3DTU5NC3U34O7GSK4MRIYF5
X-Message-ID-Hash: GVQCH4YEL3DTU5NC3U34O7GSK4MRIYF5
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GVQCH4YEL3DTU5NC3U34O7GSK4MRIYF5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03. 05. 23 13:24, Oswald Buddenhagen wrote:
> On Tue, May 02, 2023 at 01:50:08PM +0200, Jaroslav Kysela wrote:
>>   # Add silence in drain (-1 = auto /default/, 0 = off, > 0 silenced frames)
>>   [drain_silence INT]
>>
> i find this wholly inadequate as a description.
> specifically, it's missing a motivation.
> 
> and how would one use this in a meaningful way, given that the actual
> silence size is dependent on the period size and preferably the pointer
> alignment?
> 
> what i could imagine _hypothetically_ making sense is making the 1/10th
> sec "overshoot" configurable, as it's hardware-dependent. but in
> practice, i don't see how that would be actually useful, as the cost of
> doing too much is negligible, and the default you chose seems more than
> safe enough.

The positive value is a bit bonus. I just picked an easy understandable way. 
But looking to this issue for the second time, I changed the meaning for the 
positive value to milliseconds. In this way, it's time/rate related.

The main purpose for this option is to turn the code off. The other silence 
size calculation schemes may be described by another configuration field in 
future on demand.

Thanks for the review of all patches - I picked some proposals and pushed 
changes to the alsa-lib repository:

https://github.com/alsa-project/alsa-lib/commits/master

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

