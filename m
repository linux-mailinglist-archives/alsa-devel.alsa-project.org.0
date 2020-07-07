Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA26D2169AE
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:05:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FCC3950;
	Tue,  7 Jul 2020 12:04:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FCC3950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594116322;
	bh=nGU4XQasJSq1j5aumLxJQTZpmtljSEP/5O85TJTA65w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u1BqseblHwDGlvHnb0DLEsCS7IEVLaQzFIY6g9R41vK+X/UebOMS6L/3EOPx5nZix
	 fTNPOpVfKZzVlCoDhJPLA8/ISIuuB05Cz9PMdFk2FSdQhPEGS9b20x3jLC8HBrDWdz
	 5/H9i6cISzWJrTO72C1ugiYZq7kGNgNK9Z5om2NY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 932DAF80257;
	Tue,  7 Jul 2020 12:03:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7933F80216; Tue,  7 Jul 2020 12:03:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25E9EF8011F
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:03:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25E9EF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="B5OjS2Ld"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="B5OjS2Ld"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id B116CA1F4B194;
 Tue,  7 Jul 2020 12:03:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1594116205; bh=nGU4XQasJSq1j5aumLxJQTZpmtljSEP/5O85TJTA65w=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=B5OjS2LdtdN2QOA0D3I9J4kvXojBXki8a3sVG3fiaOrqKDHU4FEsP8BH4UIgCQH96
 WXtICQGaAwMlsT7M1DnPKRkxu5iMGWIj/XDJWOQ2FoggmXYWl7Xay5tbN+3skfzxCP
 tJFof1PrQvBwpjboqmmVjKiS8rYqxxqf1rD3RAfY=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r9SToiHroC4E; Tue,  7 Jul 2020 12:03:25 +0200 (CEST)
Received: from [192.168.100.21] (unknown [192.168.100.21])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id 6FE05A1F4395D;
 Tue,  7 Jul 2020 12:03:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1594116205; bh=nGU4XQasJSq1j5aumLxJQTZpmtljSEP/5O85TJTA65w=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=B5OjS2LdtdN2QOA0D3I9J4kvXojBXki8a3sVG3fiaOrqKDHU4FEsP8BH4UIgCQH96
 WXtICQGaAwMlsT7M1DnPKRkxu5iMGWIj/XDJWOQ2FoggmXYWl7Xay5tbN+3skfzxCP
 tJFof1PrQvBwpjboqmmVjKiS8rYqxxqf1rD3RAfY=
Subject: Re: Ignored USB-audio implicit feedback in kernel 5.8rc3
To: Takashi Iwai <tiwai@suse.de>
References: <5be78c36-bca0-da9c-43ec-2e2a538948a8@ivitera.com>
 <51a129ba-d74f-bfe3-933c-4805bc87804a@ivitera.com>
 <5bd5efb4-66f0-955c-783e-57aff997028a@ivitera.com>
 <a9002e0a-2a89-12c3-77c6-f2b9d51db8f2@ivitera.com>
 <s5hmu4bek8e.wl-tiwai@suse.de>
From: Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <acf819e6-d875-f791-7839-797bd647accf@ivitera.com>
Date: Tue, 7 Jul 2020 12:03:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <s5hmu4bek8e.wl-tiwai@suse.de>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: cs-CZ
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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

Hi Takashi,

Dne 07. 07. 20 v 11:40 Takashi Iwai napsal(a):
> On Fri, 03 Jul 2020 12:17:14 +0200,
> Pavel Hofman wrote:
>>
>>
>> Dne 02. 07. 20 v 13:28 Pavel Hofman napsal(a):
>>>
>>>
>>> Please is the requirement that EP OUT + EP IN implicit feedback data
>>> must be in the same interface really necessary? If such a requirement
>>> was dropped, IMO many devices could be removed from the existing
>>> set_sync_ep_implicit_fb_quirk and many devices would work out of the
>>> box,
>>
>> I am still thinking about the single-interface requirement. If both
>> endpoints were to be part of a single interface, could they use
>> different altsettings for different sample lengths for capture and
>> playback? E.g. to save USB bandwidth when the capture is used only for
>> implicit feedback - capturing at 16bits, playback at 32bits.
>>
>> In the quirked XMOS devices the common clock for both directions is
>> defined by the clock feature, the altsettings for each direction (in
>> separate interfaces) are used for setting sample length.
> 
> Could you check for-linus branch of my sound git tree?
> Just to be sure whether you're hitting the issue that has been already
> addressed.
> 

I developed the RTX6001 patch on 5.8-rc3 kernel, and commits since that 
tag in 
https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/log/?h=for-linus 
do not seem to address the issue.

I think the generic code searching for the implicit-feedback endpoint 
works only on the current interface (alts) 
https://github.com/tiwai/sound/blob/master/sound/usb/pcm.c#L491

I do not know if searching for IN endpoints with the same number and 
USB_ENDPOINT_USAGE_IMPLICIT_FB mask in other interfaces is correct. But 
it seems to me it would yield correct results for a number of existing 
quirks in set_sync_ep_implicit_fb_quirk (typically those setting ep=0x81).

Thanks a lot,

Pavel.



