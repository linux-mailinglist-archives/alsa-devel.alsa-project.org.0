Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F406F678C
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 10:32:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BDCF18E1;
	Thu,  4 May 2023 10:32:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BDCF18E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683189175;
	bh=bOSPkVx16qG+nAo+JnFXbyt2OBtUMyLjRie/GWtMzm8=;
	h=Date:To:References:From:Subject:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fA68kVHOYEpXX0MfhviBxhNGAXmh4ELGgYJxwEMlZYNH1I261N9FPaxDDDOHlMccI
	 cGtlq0B2j/aLVUmKZwVShrH15YcVv9gXP4vnwD2iCt8RmUU94xKp/DFKGdfMDtG7+F
	 uFsLLqcgutl4hgn1Ir5BfnCgyRwZ5SUMo4rQX7bY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3195CF80529;
	Thu,  4 May 2023 10:32:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C41FF8052D; Thu,  4 May 2023 10:31:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0560F80114
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 10:31:54 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4886611E6;
	Thu,  4 May 2023 10:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4886611E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683189113; bh=NCvwj/UeOWnipnxCY0AV+bNs8bV3wfBVBd3305ynCFk=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=TBwrvHSEsHZlQd2xd5dJo3SxOixcxzalnByANi8EqZvKfFj2LiP1F+j4o3maHEQn+
	 UHFNcjbhN2hy9aQF5QUSevVJ/NJ0JqwmmLzG4Xo2CUCMmZXvgWzXk3R4gbWxtDWw/b
	 voY9CTIoZIQwtROPVNL/t6OCib7s/Lcj+A14kd9s=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu,  4 May 2023 10:31:51 +0200 (CEST)
Message-ID: <4ed7d609-7189-b08b-50da-81055e70c589@perex.cz>
Date: Thu, 4 May 2023 10:31:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20230502115010.986325-1-perex@perex.cz>
 <20230502115010.986325-4-perex@perex.cz> <87a5ykmrw7.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH alsa-lib 3/4] pcm: hw: introduce
 SNDRV_PCM_INFO_PERFECT_DRAIN
In-Reply-To: <87a5ykmrw7.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JAOKKHPNIRK4ICAJ7LTWFGP6PC3XES6A
X-Message-ID-Hash: JAOKKHPNIRK4ICAJ7LTWFGP6PC3XES6A
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: ALSA development <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JAOKKHPNIRK4ICAJ7LTWFGP6PC3XES6A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 04. 05. 23 10:18, Takashi Iwai wrote:
> On Tue, 02 May 2023 13:50:09 +0200,
> Jaroslav Kysela wrote:
>>
>> The driver may not require to touch the sample stream
>> for the drain operation at all. Handle this situation
>> in alsa-lib.
>>
>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> 
> Ideally speaking, the checks and the setups of those new bits should
> be coupled with the PCM protocol version check (and the version
> bump).
> 
> But it seems that you've already applied the series, and practically
> seen, those bits should be either not set or harmless, so let's cross
> fingers.

Exactly, the current kernel code should skip those new flags, so they are used 
in alsa-lib only. It's just something like a "reservation" for the kernel 
space until things are really used there. We can bump the protocol version 
later (perhaps with other changes).

			Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

