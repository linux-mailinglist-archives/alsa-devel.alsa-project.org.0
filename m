Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 543572D577E
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Dec 2020 10:47:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7874836;
	Thu, 10 Dec 2020 10:46:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7874836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607593625;
	bh=BAn7IHoYlvvjxfebnshgwjKfJ9S8htAhsUbCVOiV+rE=;
	h=To:References:From:Subject:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oPFdWaLSw6lx4VKhR8zvSqklrwCug5AiFFA1gg6tzTrcgbGdZTsY4B2UuLwbyIxj+
	 VA8e8wqPUaBD1D9C+OgW5tjTycvTWUz5FD1io7ByWtrZWizzmovphJu5CeC5yFw2kt
	 TNWefXYH89YMmBGEW1f9z+NM11k9kT48GtaAR6gY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 187F1F80105;
	Thu, 10 Dec 2020 10:45:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABDD8F8016E; Thu, 10 Dec 2020 10:45:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from relay-b02.edpnet.be (relay-b02.edpnet.be [212.71.1.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39D9DF800E1
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 10:45:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39D9DF800E1
X-ASG-Debug-ID: 1607593522-15c4334639c7040001-UKjUFf
Received: from [192.168.177.53] ([213.219.152.236]) by relay-b02.edpnet.be
 with ESMTP id 9XdgylBPtPV5gVO1 for <alsa-devel@alsa-project.org>;
 Thu, 10 Dec 2020 10:45:22 +0100 (CET)
X-Barracuda-Envelope-From: janpieter.sollie@kabelmail.de
X-Barracuda-Effective-Source-IP: UNKNOWN[213.219.152.236]
X-Barracuda-Apparent-Source-IP: 213.219.152.236
To: alsa-devel@alsa-project.org
References: <07aae8e3-1ee2-60a9-daee-a0172c1012e7@kabelmail.de>
 <s5hczzkwd82.wl-tiwai@suse.de> <d4e099cd-3600-43d8-d2f5-9f7257da80ba@amd.com>
 <99e81caf-2742-32a0-cee1-7ff3ea8c6913@kabelmail.de>
 <3d8b7ad9-c6a4-0e2b-7e56-62b8d898eb23@amd.com>
 <ca8fa345-f0dd-330a-5a16-a8dbf68ea687@amd.com>
From: Janpieter Sollie <janpieter.sollie@kabelmail.de>
Subject: Re: AMD ACP raven ridge: invalid audio mode 2
Message-ID: <fec06387-1d64-9dda-c99f-c6d88b662f49@kabelmail.de>
X-ASG-Orig-Subj: Re: AMD ACP raven ridge: invalid audio mode 2
Date: Thu, 10 Dec 2020 10:45:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <ca8fa345-f0dd-330a-5a16-a8dbf68ea687@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Barracuda-Connect: UNKNOWN[213.219.152.236]
X-Barracuda-Start-Time: 1607593522
X-Barracuda-URL: https://212.71.1.222:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 3338
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.40
X-Barracuda-Spam-Status: No, SCORE=0.40 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=7.0 tests=BSF_SC0_SA085b
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.86423
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.40 BSF_SC0_SA085b         Custom Rule SA085b
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

Hi Vijendar,

Thank you, the patch got rid of the error message.

Well, I'm not an ALSA expert (more like a noob), but I'll ask the manufac=
turer (UDOO Bolt, ryzen
v1000) about details for the SOC modes then, they *might* be able to show=
 me something which
could lead to a (more or less) good implementation.
that said: would it be possible to get more info about the device an ABI =
or something?

The PCI registers show me the following:
frisbee /usr/src/linux # lspci -xxxxx -s 04:00.5
04:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD] Raven/R=
aven2/FireFlight/Renoir
Audio Processor
00: 22 10 e2 15 06 04 10 00 00 00 80 04 10 00 80 00
10: 00 00 68 fe 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 22 10 e2 15
30: 00 00 00 00 48 00 00 00 00 00 00 00 ff 02 00 00
40: 00 00 00 00 00 00 00 00 09 50 08 00 22 10 e2 15
50: 01 64 03 c8 0b 01 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 10 a0 02 00 a1 8f 00 00 30 29 00 00
70: 03 0d 40 00 40 00 03 11 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 08 70 00 00 00 00 00
90: 0e 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00
a0: 05 00 81 00 00 00 e0 fe 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
100: 0b 00 01 00 01 00 01 01 00 00 00 00 00 00 00 00

Where can I find more info about what these registers mean (if anything, =
I'll ask the udoo guys
about the device specific bytes)?

Janpieter

Op 10/12/2020 om 01:12 schreef Mukunda,Vijendar:
>
>
> On 10/12/20 12:18 am, Mukunda,Vijendar wrote:
>>
>
>>>
>>> So, if I understand correctly, the snd_pci_acp3x module initialised t=
he acp to mode 0x2, and
>>> then decides the mode is not supported?
>>> doesn't this sound a little weird to you?
>>
>> On Raven Ridge platform, ACP device enumerated by PCI root.ACP PCI dri=
ver creates child nodes
>> for I2S device.
>>
>> Currently we had added support for only I2S configuration.
>> We recently fixed audio driver probe failure issue when Audio configur=
ation is set to other
>> than I2S.
>>
>> When Audio Configuration is set to other than I2S, load the ACP PCI dr=
iver instead of
>> returning probe failure.
>> Below patch already got merged in to asoc-next branch.
>>
>> https://lore.kernel.org/alsa-devel/1603476441-3506-1-git-send-email-Vi=
jendar.Mukunda@amd.com/
>>
>>
>> Thanks,
>> Vijendar
>>
>>
>
> To add more to my previous explanation, Based on platform audio configu=
ration, I2S_PIN_CONFIG
> value is programmed from BIOS.
>
> ACP PCI driver during its probe it only checks what is the audio config=
uration is really set.
>
> If it sees current configuration is set to I2S, then ACP PCI driver
> will go ahead and create the platform devices required for I2S endpoint=
=2E
>
> If it is other than I2S audio configuration, it wont create the child n=
ode and returns the
> probe as success.
>
> ACP IP do's lot more stuff beyond supporting simple audio endpoints.
> For other audio configurations, we have added a default case
> and left it as a place holder for future implementation.
>
>
> Thanks,
> Vijendar
>
> .



