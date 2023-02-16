Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44863699756
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 15:25:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90BFEEA3;
	Thu, 16 Feb 2023 15:24:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90BFEEA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676557533;
	bh=ZPiTiVLqkCXz88yabBq3tzkm7o56tZ3jJHHoeNaFMe4=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MMOj+1q4eX4T22/7aWtLCWEvKwElgDpfZddHTPkSGxd8+sBIRo6ouLNYuAWu8LiSu
	 x7U//yREHO31/C1UR6x/gHCL306UyhfZhu52e4KiQKVOY8/8Ayx/EnO21U1RvIHi8h
	 RxG0zM1Pv/jYY+7veeCIJWxnPUxJdZynnkDy48ms=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7702F800E4;
	Thu, 16 Feb 2023 15:24:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6743F80171; Thu, 16 Feb 2023 15:24:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC7D4F800B6
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 15:24:33 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 8FE5811C4;
	Thu, 16 Feb 2023 15:24:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 8FE5811C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1676557472; bh=FgH3Qzhphe7TdI4udoIDgciY4D7L2FQoyQf63XuPnVM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TpMiq+irI0wceAKdnOUvZRzu1rAZH+ogSdDnRYRpgAuzQUjeDHDDHd2Vrzp167RP3
	 fMfM1J1biWpjF/wQXMxR77G02ow6u1ZFKYoam1hrWe8Dak3Okcr8S/zOM/lW9EbE1b
	 fxsc5qouvMTOx2RAm2tzcNYuDjSoNzrrbggoLORE=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu, 16 Feb 2023 15:24:28 +0100 (CET)
Message-ID: <f973b667-8cae-a914-f969-fdedad01fe55@perex.cz>
Date: Thu, 16 Feb 2023 15:24:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] ALSA: Change calculation of audio time from frames
Content-Language: en-US
To: Alan Young <consult.awy@gmail.com>, alsa-devel@alsa-project.org
References: <20230216135806.1973959-1-consult.awy@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230216135806.1973959-1-consult.awy@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZSJHJJLW2V2C65K46DFGFCB7ZUOIKLE6
X-Message-ID-Hash: ZSJHJJLW2V2C65K46DFGFCB7ZUOIKLE6
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: pierre-louis.bossart@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZSJHJJLW2V2C65K46DFGFCB7ZUOIKLE6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16. 02. 23 14:58, Alan Young wrote:
> Introduce snd_pcm_lib_frames_to_timespec64() to replace the calculation
> 
> 	audio_nsecs = div_u64(audio_frames * 1000000000LL,
> 				runtime->rate);
> 
> which overflows after a playback duration of 4.8 days @ 44100 HZ or 0.56
> days @ 384000 Hz.
> 
> The implementation of snd_pcm_lib_frames_to_timespec64() extends these
> limits, to 1.5 million years (@ 384000 Hz), or the 68 year limit of
> struct timespec on 32-bit systems.
> 
> Fixes: 3179f6200188 ("ALSA: core: add .get_time_info")
> Fixes: 4eeaaeaea1ce ("ALSA: core: add hooks for audio timestamps")
> Signed-off-by: consult.awy@gmail.com

Suggested-by: Jaroslav Kysela <perex@perex.cz>
Reviewed-by: Jaroslav Kysela <perex@perex.cz>

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

