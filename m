Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3A52D4457
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 15:30:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D656C16B6;
	Wed,  9 Dec 2020 15:29:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D656C16B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607524215;
	bh=2Z27zOHOYMCejqstDmpvUwF0igPa2WGOtVelcwzAIjo=;
	h=To:References:From:Subject:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IVbBo5jiZp8W8ZV2fJbuLwf/XBBF9cVXNj2B6s6N9/gBN3HgDBrrOXBZfpjPY/e9w
	 u+vc2pk37rYequCCZj12yuDr7tP3/Ux5/nB9cw8cdO/A/3MSf+wEjZz6uwDy2HUno+
	 HKqKd3L0KHCj8LfPHek+7icumnj8vUVCJ5nfC53U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19755F8012C;
	Wed,  9 Dec 2020 15:28:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A9BFF8020D; Wed,  9 Dec 2020 15:28:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from relay-b03.edpnet.be (relay-b03.edpnet.be [212.71.1.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F26DCF800E1
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 15:28:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F26DCF800E1
X-ASG-Debug-ID: 1607524108-0a88185a2826a80001-UKjUFf
Received: from [192.168.177.53] ([213.219.152.236]) by relay-b03.edpnet.be
 with ESMTP id jKbjromNdq2g8aa9; Wed, 09 Dec 2020 15:28:28 +0100 (CET)
X-Barracuda-Envelope-From: janpieter.sollie@kabelmail.de
X-Barracuda-Effective-Source-IP: UNKNOWN[213.219.152.236]
X-Barracuda-Apparent-Source-IP: 213.219.152.236
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, Takashi Iwai <tiwai@suse.de>
References: <07aae8e3-1ee2-60a9-daee-a0172c1012e7@kabelmail.de>
 <s5hczzkwd82.wl-tiwai@suse.de> <d4e099cd-3600-43d8-d2f5-9f7257da80ba@amd.com>
From: Janpieter Sollie <janpieter.sollie@kabelmail.de>
Subject: Re: AMD ACP raven ridge: invalid audio mode 2
Message-ID: <99e81caf-2742-32a0-cee1-7ff3ea8c6913@kabelmail.de>
X-ASG-Orig-Subj: Re: AMD ACP raven ridge: invalid audio mode 2
Date: Wed, 9 Dec 2020 15:28:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <d4e099cd-3600-43d8-d2f5-9f7257da80ba@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Barracuda-Connect: UNKNOWN[213.219.152.236]
X-Barracuda-Start-Time: 1607524108
X-Barracuda-URL: https://212.71.1.220:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 3823
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 1.00
X-Barracuda-Spam-Status: No, SCORE=1.00 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=7.0 tests=BSF_SC0_MV0963_2
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.86404
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.00 BSF_SC0_MV0963_2       BSF_SC0_MV0963_2
Cc: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 alsa-devel@alsa-project.org, Akshu Agrawal <akshu.agrawal@amd.com>
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

Dear Viiendar,

Thank you for your answer,

The .config file includes the following (no idea why the uploaded config =
file does not include
it, you'll have to take my word for it):
CONFIG_SND_SOC=3Dy
CONFIG_SND_SOC_AC97_BUS=3Dy
# CONFIG_SND_SOC_AMD_ACP is not set
CONFIG_SND_SOC_AMD_ACP3x=3Dm
# CONFIG_SND_SOC_AMD_RENOIR is not set
on a raven ridge, I believe this should be sufficient.

Indeed, I found the device on the PCI bus:
04:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD] Raven/R=
aven2/FireFlight/Renoir
Audio Processor
It builds the following modules:
snd-acp3x-i2s.ko=C2=A0 snd-acp3x-pcm-dma.ko=C2=A0 snd-pci-acp3x.ko
I tried to initialize each and everyone of them one by one, but all I cou=
ld was:
frisbee /usr/src/linux # modprobe snd_pci_acp3x
frisbee /usr/src/linux # dmesg | tail
[=C2=A0=C2=A0 23.326984] elogind-daemon[3633]: Watching system buttons on=
 /dev/input/event4 (Trust 2.4G
Keyboard And Mouse)
[=C2=A0=C2=A0 23.327261] elogind-daemon[3633]: Watching system buttons on=
 /dev/input/event10 (Trust 2.4G
Keyboard And Mouse Consumer Control)
[=C2=A0=C2=A0 23.327533] elogind-daemon[3633]: Watching system buttons on=
 /dev/input/event12 (Trust 2.4G
Keyboard And Mouse System Control)
[=C2=A0=C2=A0 24.560093] elogind-daemon[3633]: New session c1 of user fri=
zbee.
[=C2=A0=C2=A0 24.803864] fuse: init (API version 7.31)
[=C2=A0=C2=A0 52.527742] elogind-daemon[3633]: New session c2 of user jan=
pieter.
[=C2=A0 572.817028] snd_pci_acp3x 0000:04:00.5: enabling device (0000 -> =
0002)
[=C2=A0 572.817192] snd_pci_acp3x 0000:04:00.5: Invalid ACP audio mode : =
2
frisbee /usr/src/linux # lsmod | grep acp
snd_pci_acp3x=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12288=
=C2=A0 0
snd_acp3x_pcm_dma=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12288=C2=A0 0

So, if I understand correctly, the snd_pci_acp3x module initialised the a=
cp to mode 0x2, and
then decides the mode is not supported?
doesn't this sound a little weird to you?

Janpieter


Op 8/12/2020 om 19:27 schreef Mukunda,Vijendar:
>
>
> On 08/12/20 8:34 pm, Takashi Iwai wrote:
>> Adding AMD people to Cc.
>>
>> On Tue, 08 Dec 2020 15:01:24 +0100,
>> Janpieter Sollie wrote:
>>>
>>> Forwarded from:
>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fb=
ugzilla.kernel.org%2Fshow_bug.cgi%3Fid%3D208699&amp;data=3D04%7C01%7CVije=
ndar.Mukunda%40amd.com%7Cc55d2e5a7fc8472e14ce08d89b8a9a5e%7C3dd8961fe4884=
e608e11a82d994e183d%7C0%7C1%7C637430367345025555%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000=
&amp;sdata=3DLnNjfKSgSFcozSegpZ52afwMtmK%2FE5AbcHwn0r49jdY%3D&amp;reserve=
d=3D0
>>>
>>> Anybody who knows what this "ACP" actually does? what's its use?
>
> ACP(Audio Co-processor) is an AMD Audio IP which has multiple generatio=
ns
> support(1.x,2.x,3.x..etc)
>
> ACP supports different audio configurations like I2S/AZ etc.. endpoint =
support.
> Based on the platform, Audio configuration will be programmed from BIOS=
=2E
> For example, to use I2S endpoint ACP_I2S_PIN_CONFIG is programmed as 0x=
04 on Raven Ridge.
> To use the AZ(HD AUdio) endpoint, ACP_I2S_PIN_CONFIG is programmed to d=
ifferent value.
>
> On Raven ridge APU, We have upstreamed ACP PCI driver and I2S ASoC driv=
er.
>
> On Renoir APU, We have upstreamed ACP PCI driver along with PDM DMA dri=
ver. You have to enable
> ACP specific Kconfig flags for renoir platform when platform has DMIC s=
upport and it is
> connected to APU.
>
> I see from the logs, you have tried to load ACP PDM DMIC driver but att=
ached config file is
> not matching.
>
> There are hardware differences in terms of ACP IP for both Raven and Re=
noir.
>
> HD Audio endpoint uses open source HDA driver.
>
> Let us know what is your platform configuration?
> What Audio endpoints your platform supports?
>
> --=20
> Vijendar
>
>
>
>
>>>
>>>
>>> Kind regards,
>>>
>>>
>>> Janpieter Sollie
>>>
>
> .



