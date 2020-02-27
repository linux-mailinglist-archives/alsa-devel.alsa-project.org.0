Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C170E1722AC
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Feb 2020 17:00:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 107B216C0;
	Thu, 27 Feb 2020 16:59:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 107B216C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582819223;
	bh=JmDMJq0AZRYt0Kb4UA1SPfwfeFw95p3CpcyrTi0lCxU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jcOJckwjVCAA9Hb5ybwH+QEf6ZH5W2z+SalztjG3HFsCO5Jb1kxKORfGmY5fb7Gam
	 zL+hnUpTgFiqj6iHYnEbt2yjThrHBHrT/41n/OPYqrCJnssFU1UCofI7QmbvNLMwkd
	 KzJSR02gylZCh9pKv5ski/ZeMcujFMzXlRR4Hd2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D77EF80143;
	Thu, 27 Feb 2020 16:58:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA4CDF80142; Thu, 27 Feb 2020 16:58:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31F35F800E8
 for <alsa-devel@alsa-project.org>; Thu, 27 Feb 2020 16:58:29 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 48176A003F;
 Thu, 27 Feb 2020 16:58:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 48176A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1582819109; bh=ifEx+5BpmsJaOevk1E9cDx4IOzSWZwsCIPzeXoq3dcw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=qgSIA2eCJtrfB+if0YElGvHV92MuFyd4NWONXOGTjYtT72ui5/Cpk8RHEYnOF3F7k
 Z4wE00pL8XOHClL4Q23tdB/GJFE9NA1X5kvxTWmnTOi1nXDlskDZbgX+B55eRunqzb
 lhlsvdH4td1E875oW82edSSVY+Vrth7JTPnhtOT4=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 27 Feb 2020 16:58:23 +0100 (CET)
Subject: Re: [PATCH] ASoC: SOF - topology - do not change the link trigger
 order for pre-1.4 firmware
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20200221100739.3883842-1-perex@perex.cz>
 <alpine.DEB.2.21.2002211510050.2957@eliteleevi.tm.intel.com>
 <3901b16e-372e-4839-0e97-929115ea130a@perex.cz>
 <1ebd94a8-a461-4b5b-dc30-53f35a7fca47@linux.intel.com>
 <aa6805c3-212b-13ce-3d91-dcd377b4a491@perex.cz>
 <alpine.DEB.2.21.2002271426070.2957@eliteleevi.tm.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <f8ace2e6-564e-dd94-784f-6bdf9d1d2572@perex.cz>
Date: Thu, 27 Feb 2020 16:58:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2002271426070.2957@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ranjani.sridharan@linux.intel.com
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

Dne 27. 02. 20 v 13:45 Kai Vehmanen napsal(a):
> Hi,
> 
> On Fri, 21 Feb 2020, Jaroslav Kysela wrote:
>> Dne 21. 02. 20 v 20:23 Pierre-Louis Bossart napsal(a):
>>>> Ok, it's really weird that we cannot determine the firmware/driver
>>>> combination which cause the DSP lock. I would propose to block the older
>>>> firmware load <1.4 (or 1.4.2 which has the correct firmware version!)
> [...]
>> It makes sense. At least a hint that something may be wrong. I believe that it
>> might help to identify issues.
> 
> I've continued testing today on multiple machines using the official (old)
> v1.3 binaries [1] we have and I cannot reproduce the DSP error you
> Jaroslav have seen. On all of my machines, latest sound tree with old v1.3
> FW works just fine. This matches earlier reports on SOF issue #2102.
> 
> I also looked back at the history of the kernel trigger order change, and
> it's a kernel-only change, to fix issues with certain pause-resume cases.
> It's not a change that was done in tandem with some specific FW side
> change, so I can't find a solid reason why DMA triggering order should be
> changed for old FW versions. One FW patch that was done at a time (and
> referred in the discussions) is:
> 
> dai: prevent dai_config while in active state
> https://github.com/thesofproject/sof/commit/c623e9246325dbee615a5cad0c8e4b0c29976056
> 
> .. but this is not changing the logic, just avoiding a DSP crash by
> returning an error (but IPC and use-case will still fail).
> 
> So although I cannot explain why Jaroslav you see the crash on the old
> v1.3 firmware on the Lenovo device, I would still recommend to leave
> current kernel code as is and not add any warnings. To summarize my
> rationale:
> 
> - we have known error in SOF driver logic, which was fixed
>    in 5.5, and now backported to 5.4
> - if above driver error was hit, very old FW versions would
>    end up with DSP crash, instead returning a proper error
> - for many systems, new 5.5 kernel and old 1.3 FW works ok with
>    no notable issues
> - we have at least one system, where new kernel and old FW does
>    not work -> on these machines, upgrade to v1.4.2 firmware helps
> 
> Unless we get more reports, I'd lean towards not adding any new warnings.
> If someone hits a similar case as Jaroslav you did, we can see this from
> dmesg based on fw version and DSP oops dump (and/or reported IPC error).
> And the recommended action is to upgrade the FW to 1.4.2.
> 
> How about it?

Ok, it seems that it's really a combination of the driver code and 1.3.2 
firmware. I tested 5.5 kernel with 1.3.2 again and it's fine on this platform.

Let's keep this without change.

Thank you for your tests.

						Jaroslav

> 
> [1] https://github.com/thesofproject/sof/releases
> 
> Br, Kai
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
