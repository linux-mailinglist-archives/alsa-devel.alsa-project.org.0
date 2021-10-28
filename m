Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C31C43DECE
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Oct 2021 12:26:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B053816B0;
	Thu, 28 Oct 2021 12:25:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B053816B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635416794;
	bh=vmuQT9MC33VXX6Ej2uW8lwzcN6NfjlxFlfFbGRCze4o=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vm2zyMAbySaxOBrf4pL/mqMuXQG+JH1th0xQI7Dqqsd0IbgBt5wxjPqVqGZGW6MrC
	 GQ5yy5KFP8LuuTwlvZTbs9pMIqqptKrizw3y5psoXzGYAbS4J8U70uE+jrvSYg+XXY
	 kuFUUU1YEw0KW4cHdF0/FW8GLErjm1gdmB7bk5Ws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1579FF80269;
	Thu, 28 Oct 2021 12:25:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76159F802C8; Thu, 28 Oct 2021 12:25:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57C18F8010A
 for <alsa-devel@alsa-project.org>; Thu, 28 Oct 2021 12:25:06 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 7FEE7A0040;
 Thu, 28 Oct 2021 12:25:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 7FEE7A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1635416705; bh=29EYlLl+PLCVnNBxwqfAszf3WCSUJrnBwlfgLPvpm+A=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=N8ypkE5e7Y1F9k7ACPQ7+5ylT3Rt7wAxNRevkHHIe7KMUbknqf/8obfO6ReJ7Arfm
 H0bLSVZStltV2dnDPWZFb36+U57RvIAKlSeNSH1HqE2hILo30htWIJ98EsE3sIxwgp
 RkIyJqeFo3mYU8rLX0egSwZX37ABByFrFABiFABE=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 28 Oct 2021 12:25:03 +0200 (CEST)
Message-ID: <13ebeb0c-da11-eae2-fde2-76c64ef7f07e@perex.cz>
Date: Thu, 28 Oct 2021 12:25:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH alsa-utils] alsactl: Add --quiet option to suppress
 alsa-lib error messages
Content-Language: en-US
To: ALSA development <alsa-devel@alsa-project.org>
References: <20211027144008.27002-1-tiwai@suse.de>
 <e7de13ce-ee03-761d-0890-527bd00883e3@perex.cz>
 <s5hzgqtvfj3.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <s5hzgqtvfj3.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>
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

On 28. 10. 21 8:18, Takashi Iwai wrote:
> On Wed, 27 Oct 2021 19:25:29 +0200,
> Jaroslav Kysela wrote:
>>
>> On 27. 10. 21 16:40, Takashi Iwai wrote:
>>> alsactl prints error messages from alsa-lib as is, and it's rather
>>> annoying to see the error messages like
>>>
>>>     alsactl[xxx]: alsa-lib parser.c:242:(error_node) UCM is not supported for this HDA model (HDA Intel PCH...)
>>>     alsactl[xxx]: alsa-lib main.c:1405:(snd_use_case_mgr_open) error: failed to import hw:0 use case configuration -6
>>>
>>> that are recorded in the syslog at each boot.
>>>
>>> This patch adds --quiet (or -q) option to suppress those error
>>> messages from alsa-lib, and applies to the systemd services as
>>> default.
>>
>> The fix is inaccurate as it's just a warning not an error.
> 
> But it says "error" :)
> 
>> The
>> question is, how to signal those warnings to users to eliminate the
>> confusion.
>>
>> The suppression of all alsa-lib errors does not seem like a good idea to me.
> 
> At least the messages that are no real errors should not be shown in
> that way.  It's nothing but confusing.

 From the UCM perspective, it's an error, because the configuration is 
missing. UCM does not know anything about the legacy fallback. But yes, we 
should not confuse users. I tried to fix this in another way. It should hide 
only those specific messages.

https://github.com/alsa-project/alsa-utils/commit/af62c72e2d6db960405eb1bd8d50206d1600c392

https://github.com/alsa-project/alsa-lib/commit/23198a72cd4f8f8759e650362b4adb485fc9fb12

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
