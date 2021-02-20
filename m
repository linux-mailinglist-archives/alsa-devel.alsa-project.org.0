Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8119B32068A
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Feb 2021 18:56:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1459F166E;
	Sat, 20 Feb 2021 18:56:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1459F166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613843819;
	bh=RCxIPB/75Gy8F8CVvHT3q8bUt/k6Pnua1LBuCYcEdnU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XL4wHFTCB8Ep0RO6n5IOZ89eW4/qcktRn3pbYsPLTGtcCKSiA6Vz38gnf+MwpvLg6
	 jQLloGkVmuJuzrHmMfiNrapmNYPyg0hrQsLOPGV2RdAHb+V7vZ290ccTAtTGKBG6lv
	 KXTwFtGoP5jWls2cdLp23w4WJz+73RDeqpBODVG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D93FF8011C;
	Sat, 20 Feb 2021 18:55:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F567F8015A; Sat, 20 Feb 2021 18:55:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 920BDF80152
 for <alsa-devel@alsa-project.org>; Sat, 20 Feb 2021 18:55:19 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id E02C1A003F;
 Sat, 20 Feb 2021 18:55:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz E02C1A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1613843718; bh=5LaWwHwD10z+6cxpFru6xeo7R/ncQuy7I1B8jM+1YTw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=xAxmMTydr6LIE4CJA2WdBQnZYMnr1rHCUuo6mM8xXeuilb1jRsdR2y+qctCPZkNkI
 tC0yOIqM0xBIyAP00ST5HPKit8e5l+iqOTNOgFTa+cHJdnx9tjViDBStceBI3jtmLh
 0kyMI9Txh9jLpsztKDhakJakB/B40P5QIMFgsNEc=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sat, 20 Feb 2021 18:55:06 +0100 (CET)
Subject: Re: [PATCH v2] ASoC: rt1316: Add RT1316 SDCA vendor-specific driver
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
References: <20210218091208.28734-1-shumingf@realtek.com>
 <350ee43a-af99-bb8e-60d3-2a0dc561cb45@perex.cz>
 <84ce7570-b5c7-d89d-7d65-a391c3b65f93@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <37e136a7-01de-412a-6527-e3b6b6038de1@perex.cz>
Date: Sat, 20 Feb 2021 18:55:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <84ce7570-b5c7-d89d-7d65-a391c3b65f93@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, bard.liao@intel.com,
 flove@realtek.com, pierre-louis.bossart@intel.com
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

Dne 18. 02. 21 v 15:49 Pierre-Louis Bossart napsal(a):
> 
> 
> On 2/18/21 3:44 AM, Jaroslav Kysela wrote:
>> Dne 18. 02. 21 v 10:12 shumingf@realtek.com napsal(a):
>>
>>> +	SND_SOC_DAPM_SWITCH("DAC L", SND_SOC_NOPM, 0, 0, &rt1316_sto_dac_l),
>>> +	SND_SOC_DAPM_SWITCH("DAC R", SND_SOC_NOPM, 0, 0, &rt1316_sto_dac_r),
>>
>> Truly, I don't understand the reason to have a separate L/R switch when we can
>> map this functionality to one stereo (multichannel) control.
>>
>> It's an issue for all ASoC drivers. We should consider to be more strict for
>> the new ones.
> 
> At the same time we have to recognize that the L/R notion only makes 
> sense at the input to the amplifier. The amplifier may recombine 
> channels to deal with orientation/posture or simply select a specific 
> input, and drive different speakers (e.g. tweeter/woofer). Dac L and R 
> are often an abuse of language when the system have multi-way speakers. 
> Exhibit A for this is the TigerLake device with 2 RT1316 and 4 speakers. 
> L/R don't make sense to describe amplifier outputs and speaker position.

My point is a bit different. If the channels are supposed to be used together
(which usually mean a kind of the stereo operation in this case), it does not
make much sense to split this control to separate single channels. It's just a
waste of resources.

The current patch code:

one channel control "DAC L"
one channel control "DAC R"

The one control:

two channels control "DAC"

From the user space POV, the only difference is the value write operation
(both channels are set using one ioctl).

> There's also a difficult balance to be found between exposing all the 
> capabilities of the device, and making integration and userspace 
> simpler. I2C/IS2 and SoundWire devices tend to expose more controls than 
> HDaudio ones, and that was driven by a desire to optimize as much as 
> possible. Some devices are designed with limited number of controls, 
> others provide hooks to tweak everything in the system by exposing 
> literally have thousands of controls. I don't think we should pick and 
> choose which controls we want to expose, that's the codec vendor's job 
> IMHO (or the device class definition when standard and applicable)

The problem with ASoC tree is that many of those controls are not supposed to
be configured/used by the end user, but in UCM or other higher level layer
configuration, because they're a part of the hw/driver setup.

I think that we should classify those controls so the standard user space
tools can hide them, but it's another problem.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
