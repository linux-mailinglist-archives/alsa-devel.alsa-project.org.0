Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D94A01AFA65
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Apr 2020 15:10:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B6FC166D;
	Sun, 19 Apr 2020 15:09:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B6FC166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587301849;
	bh=XMOjf4v4FytdGkRxekhA0bRnpespfugoVEYzub+5rGM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mctX+DwVroC8jtTmPuG66IAUxcVdW3ZAATXzj0sOp8Dx1uJbf8PlHO3lptBiD4Dqh
	 cJWM5WguOGwE6kz13UK52vdGhOdIF1otryfltaWIAPOmz5D0JFM/MwIw7pBLXLs8D8
	 8hm7LI2MOeLA0nJzEoazRGysBlCFC6zzUG3auy/I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B7BEF80143;
	Sun, 19 Apr 2020 15:09:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BA71F801EC; Sun, 19 Apr 2020 15:09:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45618F800E7
 for <alsa-devel@alsa-project.org>; Sun, 19 Apr 2020 15:09:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45618F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="b6jiTsUP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1587301736;
 bh=XMOjf4v4FytdGkRxekhA0bRnpespfugoVEYzub+5rGM=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=b6jiTsUPtD5qnyhwlk/bkhVbj9Nd1THncQdXOB92gLLvAfetEAgkac4awOKEN7ROG
 HFxLWlJ4m52/7qY3P8DKZS5OJdqKrKl++naTEdSBvtwNA7aXfl9lG5DkeqCY2uSzAf
 7Bk4aBDTZzYbQKow9xhYZqAEePOBr39KbX8hxnOM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.36] ([85.127.240.3]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbzyJ-1iobod1jWZ-00dVLR; Sun, 19
 Apr 2020 15:08:56 +0200
Subject: Re: PROBLEM: No sound on ASUS ROG Zenith Extreme in 5.6.5
To: Takashi Iwai <tiwai@suse.de>
References: <f19e2e93-8d6d-207b-202a-5ceeab0f8571@gmx.at>
 <s5hwo6c6j1n.wl-tiwai@suse.de>
From: Johnathan Smithinovic <johnathan.smithinovic@gmx.at>
Message-ID: <6c4228e1-198e-1647-dc59-45910eafaec5@gmx.at>
Date: Sun, 19 Apr 2020 15:08:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <s5hwo6c6j1n.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:f2XVojTiuKepvjjseq8aYIngeLiqOIVCCvVuZdvIxFR57DuTxtf
 U08Pz3U3CHSLkhL99eV1gm0H54CBBfFeFE9fi8dOuRbZsl5rk52Dd3hXdEnsOFCoXT395N+
 e8NVSx3cRzS2+NsW3oYljV5CLA+J+kD8f3A+NwuXRP0yDFNYvlSCnbgnFr5pdosjtWyvRvW
 9F9+6ba8QMf8A2uXYmX9w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bFVJTuRdhJM=:xMgdJbgH/NCHoMqz5s5G0+
 APe/5OxJzPLKopYyPIyr29wyeZaBQnywH4/mcg3E5aCkP7vwQJRsYqfAt4/o891Fk8dP4v5ss
 TwCKyynSf7tnGx9iprCXghttkaHV8QtdCk58gq2HcTLZtp1hPCIu+2Fvr/SNY+VcmDaw7ZGgA
 QqLCaRFBbB+N6QAXaKC3rRQO6XD9xVZQorzZ8BxW3hXnwkdI/a5ZwLEceCPfmxHPvLQoyYNTc
 +9DlWZQ7UrX6yIZ9t4/Gckhze4tQPd7Ovt4r+EX4cC5tY6nW6SULnZ0DwhtDGPD7iJXbiW4h8
 6LBsOJCBMpUSxXP3mqm+D38OsFsgkMCBx4YUU1r38B4aPt1fZ2Y5uhdEvHXCgtAF8etxyWugi
 Xr74tGSHzPB7sUg/y5uESqKchXgS7Bsmg8BOle04eKxA32mKKx+LkBjobK+mIGGPacWYk/m1V
 JpImYXtXPXD+RKgg+f+WvdDw7rREtItdyP3VuXPaRyaajw5a9piNHV84MD7ljcFUUwKxE7T7r
 sKBFS7T2cn+rmhEMUGOkKW+mnSEv/vvfMWQLSVqZ7EUtlK/Zt1nxeu4ShY5irOVs1mcu24Bdd
 9YnsW0LCj9a4D1EyWL9G2b2e2+rCqEREci9YYhf7juC+Ab4VBf2QpaIVT8t/EmSJl3DzGJxKo
 jULdF3P0Y6pS2Bg9D95hos+YB1JVhz9THFvQGPyeIsCA5j0qWV2BJHjoz1CP4l9GEUcbr9mAS
 UsyX8HptGsczMXa1rYfeO5dGl2d3QJCYBqjBWsE7RAVZwOT9cTbFjG0o+q/ag1z1q2QVio3N3
 ANlvWXpChl27X7Y+r03gWr6hQIA1fWXJxYSedBDsSUXk2jCX3ZlkZ4fJXS8vkSfEG8HR9QPHx
 /uwuz1eC3r1QhiY15Tlwny7KVZPAXKfWI+Hxwvi80dLf6AQrSNey+vq0DTS+/YhZMlsnhHBdk
 dkx/ODMXkT9XJrJkhVUT7DhCs0t9u1it6sF3K3ofpswBCihiFOrFDfCSR/KsLU1GYVQK2S5Z/
 2fCj2dTfpJ2vunGOFFF+ME752iaTYdCUSpExyCxm/Rl/abWcLIhM+Phc9McbMx/gsdbexJ5Xn
 Khp8e+9WCHfa/wkos6bczEn4qMd3QsRUq09Axh0I3sALM6pGzcNyxLX+RNEd2LU+aG4BhnQxq
 71SMSxpn8eO7+I+EIDbAg6Wo22GEVic9nZ8SN03Xt1LNn6KfD+ShNpvIBTWqTDCS9MOBEU97w
 WTjJVGT5Rz7AG4SRCNJlhRziyit5YR7yqgAhA1Q==
Cc: alsa-devel@alsa-project.org, tiwai@suse.com
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

On 19/04/2020 09:17, Takashi Iwai wrote:
> On Sat, 18 Apr 2020 23:22:41 +0200,
> Johnathan Smithinovic wrote:
>>
>> PROBLEM: No sound on ASUS ROG Zenith Extreme since 5.6.5
>>
>> When I upgraded from 5.6.4 to 5.6.5 I noticed that my sound stopped wor=
king.
>>
>> My motherboard is a first generation "ASUS ROG Zenith Extreme".
>> (I'm running Ubuntu 18.04 in case that matters.)
>>
>> I'm pretty sure it comes from stable kernel release commit
>> 7f722d9aa00fde795834840cc84e13a94efb29ed
>> (git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git) which
>> notes "commit 3c6fd1f07ed03a04debbb9a9d782205f1ef5e2ab upstream."
>> ("ALSA: hda: Add driver blacklist").
>>
>> When I comment out 'SND_PCI_QUIRK(0x1043, 0x874f, "ASUS ROG Zenith II /
>> Strix", 0),' in sound/pci/hda/hda_intel.c my sound works again.
>>
>> (In case I chose incorrect places to write this mail to I'm sorry. I
>> tried to follow
>> https://www.kernel.org/doc/html/latest/admin-guide/reporting-bugs.html
>> while keeping this report minimal.)
>
> Oh that's bad, ASUS didn't give a unique ID for each model.
>
> I'm going to remove the entry for ASUS ROG Zenith as a quick solution,
> and we'll need to address in a different way, either switching to DMI
> matching or matching of both PCI ID and SSID later.
>
> Could you give "lspci -nv" output for the corresponding device?

Hi,

Output of `sudo lspci -nvs 09:00.3`:
09:00.3 0403: 1022:1457
	Subsystem: 1043:874f
	Flags: bus master, fast devsel, latency 0, IRQ 146, NUMA node 0
	Memory at b1800000 (32-bit, non-prefetchable) [size=3D32K]
	Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
	Capabilities: [50] Power Management version 3
	Capabilities: [64] Express Endpoint, MSI 00
	Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
	Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D1 Len=3D=
010 <?>
	Capabilities: [150] Advanced Error Reporting
	Capabilities: [2a0] Access Control Services
	Kernel driver in use: snd_hda_intel
	Kernel modules: snd_hda_intel

Thanks a lot!
John

