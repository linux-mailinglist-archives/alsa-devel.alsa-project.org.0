Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71259F2EFC
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 14:16:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3DE31673;
	Thu,  7 Nov 2019 14:15:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3DE31673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573132606;
	bh=86z6LRYejrXQCgOVGKx2uL7BRKFDvedaW/Q2EDanxCQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CfGmxRCdV8QLIsB9Z5h5oYncMRHeZin9rjKfIkUq0UounQD/nl8LVG78aJ3iHCqPB
	 aeoIeEaaGXMZnSCXG0LM4wptt5F8dlF5N8qjQuwVAYcKZMVLgXh/RT2BDCihFS89iy
	 4ZAznClWchGs0W8+pjJe/Izopjyd3mqMu60DoFlQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43CA6F80111;
	Thu,  7 Nov 2019 14:14:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E83B4F8053B; Thu,  7 Nov 2019 14:14:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D709F80111
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 14:14:31 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 78704A0042;
 Thu,  7 Nov 2019 14:14:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 78704A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1573132471; bh=EmqTkMlOcKiK0QPkViLVcBHsKCrjX7QWriz+gudYTso=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=hKWQAxElfO5x4ZG9v68CdQNXXTsfDKvdaS9sHWtT4GgHx4113RzR0lsqBw3nAxdct
 w2YKP+fSobCYH7sK8GA/cyuIjEkW1GEEejs9dkJ3wDdus8IPmqhr88FjDkBySzZ6Us
 KfbtadWzB/lWN8hybEs1dqyK6jUcR4P+hb8CPEaI=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu,  7 Nov 2019 14:14:27 +0100 (CET)
To: Takashi Iwai <tiwai@suse.de>
References: <6dcc3e0d-0df5-90cf-220f-59253d3b5c7c@perex.cz>
 <s5ho8xo89m1.wl-tiwai@suse.de>
 <608ff861-9c2a-e498-3ec9-4fe09f2583e6@perex.cz>
 <s5hblto82fo.wl-tiwai@suse.de>
 <822f8c3d-b4fc-98ca-d749-e9f2f638e6e9@perex.cz>
 <s5hftj02ayj.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <8f7da616-caa9-5af7-e00b-812d65444171@perex.cz>
Date: Thu, 7 Nov 2019 14:14:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <s5hftj02ayj.wl-tiwai@suse.de>
Content-Language: en-US
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] UCM extensions
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

Dne 07. 11. 19 v 12:16 Takashi Iwai napsal(a):
> On Thu, 07 Nov 2019 12:08:26 +0100,
> Jaroslav Kysela wrote:
>>
>> Dne 07. 11. 19 v 10:23 Takashi Iwai napsal(a):
>>> On Thu, 07 Nov 2019 09:33:27 +0100,
>>> Jaroslav Kysela wrote:
>>>>
>>>> Dne 07. 11. 19 v 7:48 Takashi Iwai napsal(a):
>>>>> On Tue, 05 Nov 2019 20:36:28 +0100,
>>>>> Jaroslav Kysela wrote:
>>>>>>
>>>>>> Hi all,
>>>>>>
>>>>>> 	I make some internal ucm code cleanups in alsa-lib and added
>>>>>> three major extensions to allow more complex configurations which we
>>>>>> require for the SOF kernel driver.
>>>>>>
>>>>>> 	The first thing is the added substitution for the value strings:
>>>>>>
>>>>>> https://github.com/alsa-project/alsa-lib/commit/f1e637b285e8e04e6761248a070f58f3a8fde6fc
>>>>>>
>>>>>> 	The second thing is the If block:
>>>>>>
>>>>>> https://github.com/alsa-project/alsa-lib/commit/985715ce8148dc7ef62c8e3d8ce5a0c2ac51f8df
>>>>>>
>>>>>> 	The third thing is the card / hardware like specifier passed
>>>>>> as the ucm name to snd_use_case_mgr_open() to support multiple card
>>>>>> instances:
>>>>>>
>>>>>> https://github.com/alsa-project/alsa-lib/commit/60164fc5886cdc6ca55eeed0c2e3f751a7d2b2c0
>>>>>>
>>>>>> 	All those patches (with other cleanups) are in the ucm2 branch
>>>>>> on github for comments:
>>>>>>
>>>>>> https://github.com/alsa-project/alsa-lib/commits/ucm2
>>>>>>
>>>>>> 	The proposed SOF UCM config diff is here:
>>>>>>
>>>>>> https://github.com/alsa-project/alsa-ucm-conf/commit/723b6da881721488229154e923ed36413955a051
>>>>>> https://github.com/alsa-project/alsa-ucm-conf/commits/ucm2
>>>>>>
>>>>>> 	I added everything to keep the interface backward compatible,
>>>>>> so the current applications should not observe any different
>>>>>> behavior. The applications like pulseaudio should use the
>>>>>> 'hw:CARD_INDEX' specifier for the open call in the future and
>>>>>> snd_use_case_parse_ctl_elem_id() helper for the element control names.
>>>>>
>>>>> The only concern with these extensions so far is the compatibility.
>>>>> Imagine that people run the new profile on the old parser, it'd break
>>>>> easily.
>>>>>
>>>>> I think other scripts often installing on the versioned directory if
>>>>> incompatibilities are seen.  Can we do that for UCM as well?
>>>>>
>>>>> Or course, once after UCM parser is changed to be future-ready and
>>>>> allow some syntax for possible future extensions, we can keep that
>>>>> version directory in future, too.
>>>>
>>>> While we are going to separate UCM files from alsa-lib to
>>>> alsa-ucm-conf we can define the new syntax change until the first
>>>> version is released (I can put a notice to README).
>>>>
>>>> Speaking for Fedora, we have dependancy 'alsa-lib package version'
>>>> must be equal to 'alsa-ucm package version'. If users will do any
>>>> changes on their own, they should know what they are doing.
>>>
>>> This assumes that you have only one alsa-ucm package.  If there is a
>>> downstream version of UCM profile, this won't work well always.
>>>
>>>> Anyway, we should learn from this and I would propose to add add
>>>> something like 'Syntax 2' to the main configuration file now. The new
>>>> functions should be activated only according the version.
>>>
>>> Yeah, some extensibility is needed in the config space.
>>>
>>>> Unfortunately, the current parser will just show an error message like:
>>>>
>>>> ALSA lib parser.c:1337:(parse_master_file) uknown master file field Syntax
>>>> ALSA lib parser.c:1337:(parse_master_file) uknown master file field If
>>>
>>> Right, that's the problem now.  Even a non-existing control would lead
>>> to an error with the current version of parser.
>>>
>>>> But at least, users should be notified that there is a configuration mismatch.
>>>
>>> I don't think this would suffice.  The new UCM config is not merely a
>>> config but it's becoming rather a language, so this needs some
>>> distinction from the current v1 files.
>>>
>>>> Another possibility is to change the suffix for the master
>>>> configuration file to accept the "Syntax" check for the another future
>>>> update. But honestly, I don't like ".conf2" and ".v2.conf" looks not
>>>> so nice, too.
>>>
>>> My vote is for a different directory.  And, with v2 extension, we
>>> should leave the room for further extensibility, and keep the same
>>> location as long as it's compatible.  Keeping the location for
>>> incompatible configs would lead to a mess.
>>
>> Ok, I can move the new configs to ucm2 (/usr/share/alsa/ucm2) and
>> leave the original directory empty (as fallback), because all configs
>> can be modified to support the right card identificator (kernel module
>> id parameter) rather than the hard coded default value generated by
>> the ALSA core kernel code.
>>
>> But there is an issue with the environment variable "ALSA_CONFIG_UCM"
>> which specifies directly the directory. We cannot predict the syntax
>> for it.
> 
> Right, that's a bit of headache.  Another idea would be to we put
> under /usr/share/alsa/ucm/v2/... and the parser starts looking at
> $ALSA_CONFIG_UCM/v$VERSION/... then falls back to the
> $ALSA_CONFIG_UCM/...
> 
> But I'm really open for any other options, too.

I would probably vote for this:

/usr/share/alsa/ucm2	- new configs with 'Syntax' field protection
/usr/share/alsa/ucm	- old configs

ALSA_CONFIG_UCM2	- env path for the new configs
ALSA_CONFIG_UCM		- env path for the old configs

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
