Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8822D31E4
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 19:15:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91D6516EE;
	Tue,  8 Dec 2020 19:14:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91D6516EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607451311;
	bh=ea1AVJ9yyvspzXRetj/xC6xqoRTxMdDLFfGuKoczcko=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=idPfGNZqug38o/DRZ/FaI1ZQqycezcN+sZKVzJkMM15bLBmwiTIp+7mMR/TI0MT76
	 eTPuz6tR5Me3f6IMSpIE1mrhteTQmmSN+LfeMjkQGwjBsZCchn1QVVwxtUlClzePJL
	 +VJ6KL+0fN4jGEmYYn8giRQK6KO+z2VDGazo8j7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9538F800E1;
	Tue,  8 Dec 2020 19:14:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F4211F80253; Tue,  8 Dec 2020 19:14:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC2BDF800E1
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 19:14:11 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D5CA8A0042;
 Tue,  8 Dec 2020 19:14:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D5CA8A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1607451250; bh=jGTYe8hOOOYU21yTyeUAb6tFgv3B2nW4gMbKdkgm8/0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=1uU5cfNJTxvcS1/72vl9N7dbDlm9BKTHR2B67QYYImWszCueITX4mf5Q2pWDYteiK
 uyHqYf8qDRxlKuGT3x5BW5lYiuetkDqzZuEbeMYpH6J1xayTKn+MxymW3IgGXxyBW5
 tTw4Ebj0DDtJX1STMp62nZf5qtAyA2OZQvl4NnVE=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  8 Dec 2020 19:14:06 +0100 (CET)
Subject: Re: [PATCH] ASoC: AMD Renoir - add DMI table to avoid the ACP mic
 probe (broken BIOS)
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, Takashi Iwai <tiwai@suse.de>
References: <20201208153654.2733354-1-perex@perex.cz>
 <s5h4kkww9j3.wl-tiwai@suse.de> <20201208174002.GH6686@sirena.org.uk>
 <2e4587f8-f602-cf23-4845-fd27a32b1cfc@amd.com> <s5htuswuqng.wl-tiwai@suse.de>
 <2c48dcdb-e8c8-ca2e-e004-4e63887788c5@amd.com>
 <098fa0b7-5493-f3e5-afd5-8296d4300590@amd.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <7d7d93be-e5b5-6022-0977-b82943d10993@perex.cz>
Date: Tue, 8 Dec 2020 19:14:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <098fa0b7-5493-f3e5-afd5-8296d4300590@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>
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

Dne 08. 12. 20 v 19:23 Mukunda,Vijendar napsal(a):
> 
> 
> On 08/12/20 11:51 pm, Mukunda,Vijendar wrote:
>>
>>
>> On 08/12/20 11:27 pm, Takashi Iwai wrote:
>>> On Tue, 08 Dec 2020 19:06:21 +0100,
>>> Mukunda,Vijendar wrote:
>>>>
>>>>
>>>>
>>>> On 08/12/20 11:10 pm, Mark Brown wrote:
>>>>> On Tue, Dec 08, 2020 at 05:24:32PM +0100, Takashi Iwai wrote:
>>>>>
>>>>>> BTW, both Raven and Reonir drivers point to the very same PCI ID,
>>>>>> and both drivers will be probed for this machine (and both to be
>>>>>> skipped).
>>>>>
>>>>> Ugh, that's not good.  It's not even super obvious from the code that
>>>>> this is happening.  Seems like it should be one core driver which
>>>>> instantiates the components for Raven and Reonir as appropriate, the 
>>>>> PCI
>>>>> driver is pretty thin at present anyway.
>>>>>
>>>>
>>>> Raven and Renoir has same PCI ID but both platforms have different
>>>> revision ID. Raven platform revision id is 0x00 where as for Renoir it
>>>> is 0x01.
>>>
>>> But your drivers don't check the revision ID, as far as I see?
>>>
>>> The linux PCI driver doesn't distinguish the revision id at the
>>> matching time, unfortunately.
>>>
>>>
>>> Takashi
>>>
>> Apart from Revision ID difference, There are few hardware differences
>> specific to ACP IP.
>> ACP IP hardware versions are different for Raven and Renoir.
>> Unfortunately we don't have specific logic to distinguish ACP hardware 
>> versions for Raven and Renoir.
>>
> But build wise both Raven and Renoir uses different Kconfig options.

We need to build all drivers for the universal distros to one kernel. The
Kconfig does not help here.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
