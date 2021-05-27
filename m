Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A38A6392D7E
	for <lists+alsa-devel@lfdr.de>; Thu, 27 May 2021 14:03:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24B7A170C;
	Thu, 27 May 2021 14:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24B7A170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622117018;
	bh=2cT0hOx31Uw3kCyUQ7N1o9nBeZKLAqxa4fOK+dbGx5A=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R9HIZstpmryDscEwGgmyGncYEGOri+LFbsxOLRA7R6WrpsgpEzAvZtxqx51bEVcxb
	 uB5vagHcsixZ0fm+dnesWJdVJZIdvtn9ga79+YhbPVI+hkNf3aeNJVZM1cLQ/BcjmL
	 gyyV/M2J4vP1okQSvHEc7ACHG+RvejWYqHMBDTuE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AB16F80147;
	Thu, 27 May 2021 14:02:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A21BF80147; Thu, 27 May 2021 14:02:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [IPv6:2a0a:e5c0:0:2:400:b3ff:fe39:7956])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D310DF80116
 for <alsa-devel@alsa-project.org>; Thu, 27 May 2021 14:01:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D310DF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ungleich.ch header.i=@ungleich.ch
 header.b="CDTGUwWx"
Received: from nb3.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id A65841FE6A;
 Thu, 27 May 2021 14:01:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1622116913; bh=2cT0hOx31Uw3kCyUQ7N1o9nBeZKLAqxa4fOK+dbGx5A=;
 h=References:From:To:Cc:Subject:In-reply-to:Date:From;
 b=CDTGUwWxRl/4VZPLwVs/Q3CG3cEVQe2+fLOtR7YHy6HAGPPw+K8/Qd/bbSEGBnuQy
 LjShsp+1L/h/dm2/I0sY6p6DUsmni4FQCkS7tPLPM6b9qi3QqBVj+Ngi+5SzszQbT/
 dh0DAxY1pmKlSXXuBAYhHisWm7Mw6EsG3vO/RzavMFQWrnms99dOTlQJeFLXV7C1QQ
 WbRPbicSopNdccBxfCL43bb9AxTMIxBnta/ORRlFvxt5BudRebjoYAzLZNk+drznll
 Z5WQgS2aL4Bq9WFcdJ/Jz1dMZDkhbb03hh6dOkkqvRP1cHQo0Cq12cx+7tsvtZoVmM
 fpW8DDSHu/Hfg==
Received: by nb3.localdomain (Postfix, from userid 1000)
 id 8541714C01E2; Thu, 27 May 2021 14:02:21 +0200 (CEST)
References: <874keoijzh.fsf@ungleich.ch>
 <f2e7c889-cc99-63b3-3bd3-302faf1745fa@perex.cz>
 <87r1hs31h6.fsf@ungleich.ch>
 <alpine.DEB.2.22.394.2105271343540.3922722@eliteleevi.tm.intel.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: Internal microphone does not work with 5.12 (Tiger Lake, X1 Nano)
In-reply-to: <alpine.DEB.2.22.394.2105271343540.3922722@eliteleevi.tm.intel.com>
Date: Thu, 27 May 2021 14:02:21 +0200
Message-ID: <877djk8jw2.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Nico Schottelius <nico.schottelius@ungleich.ch>,
 alsa-devel@alsa-project.org
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


Hey Kai,
Kai Vehmanen <kai.vehmanen@linux.intel.com> writes:

> Hi Nico,
>
> On Thu, 27 May 2021, Nico Schottelius wrote:
>
>> Just checked, it was disabled. I rebuilt 5.12.6, rebooted, but now the
>> sound card is gone (no device files in /dev/snd anymore), proably
>> failing due to:
>>
>> [   55.713668] snd_hda_intel 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if info 0x040380
>> [   55.713679] snd_hda_intel 0000:00:1f.3: Digital mics found on Skylake+ platform, using SOF driver
>> [   55.745863] sof-audio-pci-intel-tgl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if info 0x040380
>> [   55.745872] sof-audio-pci-intel-tgl 0000:00:1f.3: Digital mics found on Skylake+ platform, using SOF driver
>> [   55.746033] sof-audio-pci-intel-tgl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if 0x040380
>> [   55.748315] sof-audio-pci-intel-tgl 0000:00:1f.3: use msi interrupt mode
>> [   55.752671] sof-audio-pci-intel-tgl 0000:00:1f.3: warning: No matching ASoC machine driver found
>> [   55.752673] sof-audio-pci-intel-tgl 0000:00:1f.3: error: no matching ASoC machine driver found - aborting probe
>> [   55.752673] sof-audio-pci-intel-tgl 0000:00:1f.3: error: failed to get machine info -19
>> [   55.752764] sof-audio-pci-intel-tgl 0000:00:1f.3: error: failed to probe DSP hardware!
>
> it seems more kernel config options are missing. Distribution kernels
> typically enable all the machine drivers, but you are specifically missing
> CONFIG_SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH=m

I've enabled this one and all machine types and indeed the card is being
recognised (report at
http://alsa-project.org/db/?f=5cbe7c293cbb80ab548b892cfc8b991476b0b2aa).
I checked permissions on /dev/snd, which looks good.

However, obs does not list the microphone at all and
chromium / jitsi shows the snd-hda-dsp mic, however does not let me
select it.

So with above options:

- playback works
- microphone does not work

> Distribution kernels are a good reference when building on your own, and
> we in SOF also maintain example kconfig settings for typical systems.
> Here's the bit for systems with DSP and HDA codecs:
> https://github.com/thesofproject/kconfig/blob/master/hdaudio-codecs-defconfig

I have used the .config from the linux-edge kernel from Alpine Linux as
a basis. The above configuration looks to be enabled in my .config as well.

Alpine's default config might include a bit less options than other
distros, I am currently in touch with the developers there for patching
it, as soon as I got the sound card properly working.

Best,

Nico

--
Sustainable and modern Infrastructures by ungleich.ch
