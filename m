Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F4D55059F
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Jun 2022 17:14:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61D481F18;
	Sat, 18 Jun 2022 17:13:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61D481F18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655565276;
	bh=Q56i9+s2qPf3zIWu8N58E0XSqbzuKdHnKlxRDITBuyQ=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qgv1G8nR41vJGeKJlzXcq6mokM7WFwAOJFsmvk6ec0BtyF5SMuAoOJi4ecZX0dBmv
	 7NDZ+iJV0gr1Y8P12LbWW4/kv8LmJIj8e/Bt+/3WyIim/S6VSAibqIjyVuCXFmZQKu
	 W07v+aDpKlSKSSbyehXfluxrz6aZMV/LuHx5pyno=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0A22F80245;
	Sat, 18 Jun 2022 17:13:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AB6BF80245; Sat, 18 Jun 2022 17:13:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47BF6F80245
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 17:13:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47BF6F80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="CVhXbdo6"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="Q7Gjyg6V"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 4B4F9A1A3D405;
 Sat, 18 Jun 2022 17:13:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1655565209; bh=Q56i9+s2qPf3zIWu8N58E0XSqbzuKdHnKlxRDITBuyQ=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
 b=CVhXbdo6BQrrxl9k1UdBSsb8E14mkkxJUV62wq3xnz6JR1zFcA++9IWL1d76KnRTX
 SPwqT0WREiRrHXR5jvUtmaqcipgDaGojmzPBuULlqliEc8d8mRoOIHcPHjHczy7h6H
 j9kS56mk9R2lZVpuqCyFQFmY8bEFqEBZoEdPK5Fw=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jnt4PgfkhzIR; Sat, 18 Jun 2022 17:13:23 +0200 (CEST)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id 78487A1A3D403;
 Sat, 18 Jun 2022 17:13:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1655565203; bh=Q56i9+s2qPf3zIWu8N58E0XSqbzuKdHnKlxRDITBuyQ=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
 b=Q7Gjyg6Vow3PS1hvKO4G5IVicFVy9vwDlFkxojyvVkGxpqOtqTjZJXL/X/79R2ADN
 Hli8oHRUzq1RFQlGs9LLNVC84eXfcmddLOWB5s2KwrQBeMNO/8IOEuaFMuYeiKedCb
 OG2TeZqmU8YXe/JHZHVb5Fqpe7WItOX+g8QvQF7k=
Message-ID: <8eed80bf-bb4a-f397-c81e-6478910d40fe@ivitera.com>
Date: Sat, 18 Jun 2022 17:13:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] aplay: Support setting timestamp
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <20220616065426.27915-1-pavel.hofman@ivitera.com>
 <YqrmNfnn2qCZV9Kf@workstation>
 <900e96c0-6251-fa3d-42b4-847ece6e1a44@ivitera.com>
 <927f3c77-a88b-f564-13d8-5b8600b128ed@perex.cz>
From: Pavel Hofman <pavel.hofman@ivitera.com>
In-Reply-To: <927f3c77-a88b-f564-13d8-5b8600b128ed@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Dne 16. 06. 22 v 12:50 Jaroslav Kysela napsal(a):
> On 16. 06. 22 12:00, Pavel Hofman wrote:
>> Dne 16. 06. 22 v 10:13 Takashi Sakamoto napsal(a):
>>>
>>> On Thu, Jun 16, 2022 at 08:54:26AM +0200, Pavel Hofman wrote:
>>>> To allow enabling timestamp and specify its type, a new option
>>>> --tstamp-type=TYPE is added. Recognized values are none (default),
>>>> gettimeofday, monotonic, monotonic-raw.
>>>>
>>>> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
>>>> ---
>>>>    aplay/aplay.1 |  4 ++++
>>>>    aplay/aplay.c | 32 ++++++++++++++++++++++++++++++++
>>>>    2 files changed, 36 insertions(+)
>>> I prefer the idea to work for timestamp feature defined in ALSA PCM
>>> interface, while I have a mixed feeling to integrate `aplay` tool, since
>>> I have an intension to obsolete the tool with `axfer` tool with more
>>> robust design with command argument compatibility (as much as possible).
>>>
>>> This is not so strong request but would I ask you to work for `axfer` 
>>> tool
>>> instead of `aplay`? Then, it's preferable that the name of command
>>> argument is decided with enough care of all of timestamp feature in ALSA
>>> PCM interface, since we have two categories of timestamps at least; e.g.
>>> system timestamp and audio timestamp. As long as I know, they 
>>> possibly use
>>> different clock sources, thus these two timestamps have different levels
>>> of clock id, I think.
>>>
>>> Of course, it's a loose accord in the community to obsolete `aplay`, and
>>> it's easy to decide to continue aplay integration. (I'm not in leading
>>> place of the project.) I'll be a bit happy if people take care of axfer
>>> tool as well.
>>
>> Thanks for your input. I use aplay in my project and needed to have
>> tstamps enabled in proc status files for my simple code which calculates
>> relative samplerate between capture and playback soundcards (one of them
>> having rate adjustable - audio gadget, snd-aloop)
>> https://mailman.alsa-project.org/pipermail/alsa-devel/2022-June/201647.html 
>>
>> . The existing aplay did not have this feature, so I added it and
>> submitted the patch. I did not know aplay was planned to be obsoleted,
>> it seems to receive a healthy stream of patches.
> 
> It would be good to sync both tools (aplay/axfer) for the easy 
> replacement. Could you add this code to axfer, too?

Honestly, I do not understand the future plan for axfer vs. aplay. I 
consider aplay a diagnostics tool for alsa problems. I do not need other 
audio frameworks available when diagnosing alsa. I need the diagnostics 
tool having maximum features useful for the diagnostics, such a tool is 
not used for and aimed at general usage.

Yet I have prepared a patch for axfer which implements the very same 
feature as for aplay into its libasound backend. However, since Takashi 
objects to the implementation as is (which I do not dispute, it 
certainly is not any complex solution to the timestamping area in alsa), 
I do not intend to submit the axfer patch.

If you find the aplay patch useful, I would be happy if you accepted it. 
  If not, no problem, I will use my hacked aplay version. Since nobody 
has added such feature to aplay over a decade of its existence, my patch 
is certainly of negligible urgency. I am just a bit afraid about future 
of this simple-to-use diagnostics tool with huge user base and extensive 
online know-how in this regard.

Thanks a lot,

Pavel.

