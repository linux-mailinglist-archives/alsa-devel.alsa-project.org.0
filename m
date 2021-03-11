Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EEC33752C
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 15:12:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 880ED184C;
	Thu, 11 Mar 2021 15:11:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 880ED184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615471952;
	bh=GoxzRNOOPhROvcQvuTdT5hiedoDXvGvXfia8kUsFn0s=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EQJKnMJ4nUIhmtPjQL+dhxL5b9tj0k4PWCP7OfIJ2rcVhK0JML8VOQmdREpVb39Hg
	 WM9BT2Ruy++v+rLeJ9+j3q6Bu2JekZQ82wFe2iMBsQC/yF8uhd7Xuuru5gqrt1erBO
	 XOtRfXgx73fnEs1Urbxz/VGpepiosLz5QujLntiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9837CF8019B;
	Thu, 11 Mar 2021 15:11:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6ECB3F80227; Thu, 11 Mar 2021 15:11:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD699F8010D
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 15:10:42 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id B8372A003F;
 Thu, 11 Mar 2021 15:10:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz B8372A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1615471841; bh=Bhu1hDvSD7EWbTKsxAFB2tJYDMaa5wo79+M5tRAK6BI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=HTT+Bq3kJ3UYeyOMv2tiJX0w31pVpZBp6WOXecs7nvohel595E3OIHR69qT0mL2rA
 OuTTpKSTnetJY6g2xGXK9vAWcYAUgFWBer7l3cHYuZRAoXUyoPSnmSrtAywYXOofjl
 LORRfgurCgJkhC5SOVRoJi8zdZYzKN+CmYTMwcTQ=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 11 Mar 2021 15:10:31 +0100 (CET)
Subject: Re: No sound cards detected on Kabylake laptops after upgrade to
 kernel 5.8
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Chris Chiu
 <chris.chiu@canonical.com>, Cezary Rojewski <cezary.rojewski@intel.com>
References: <CABTNMG31sH99P0F7EKhpFwJf99x4U-VjFWrwXVe1wkra6owFLw@mail.gmail.com>
 <dba864a6-1442-1ebc-9de0-8c1511682b70@intel.com>
 <CABTNMG1bO2AJLY0o58TX2=1QZPnPsZXabtYZA01QyqDS40JORg@mail.gmail.com>
 <d2efd828-f0b7-fe3f-cfda-cf86d49861bb@perex.cz>
 <e66560d0-01e7-6695-4c5b-4b6fb37fdb95@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <4cec5ad9-7322-c3c4-7cd0-e2fea37eefcf@perex.cz>
Date: Thu, 11 Mar 2021 15:10:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <e66560d0-01e7-6695-4c5b-4b6fb37fdb95@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 yang.jie@linux.intel.com, Linux Kernel <linux-kernel@vger.kernel.org>,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org
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

Dne 11. 03. 21 v 11:40 Amadeusz Sławiński napsal(a):
> On 3/11/2021 11:24 AM, Jaroslav Kysela wrote:
>> Dne 11. 03. 21 v 6:50 Chris Chiu napsal(a):
>>> On Tue, Mar 9, 2021 at 11:29 PM Cezary Rojewski
>>> <cezary.rojewski@intel.com> wrote:
>>>>
>>>> On 2021-03-09 1:19 PM, Chris Chiu wrote:
>>>>> Hi Guys,
>>>>>       We have received reports that on some Kabylake laptops (Acer Swift
>>>>> SF314-54/55 and Lenovo Yoga C930...etc), all sound cards no longer be
>>>>> detected after upgrade to kernel later than 5.8. These laptops have
>>>>> one thing in common, all of them have Realtek audio codec and connect
>>>>> the internal microphone to DMIC of the Intel SST controller either
>>>>> [8086:9d71] or [8086:9dc8]. Please refer to
>>>>> https://bugzilla.kernel.org/show_bug.cgi?id=201251#c246 and
>>>>> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1915117.
>>>>>
>>>>>       From the dmesg from kernel 5.8, the sound related parts only show
>>>>> as follows but the expected snd_hda_codec_realtek and the snd_soc_skl
>>>>> are not even loaded then.
>>>>> [ 13.357495] snd_hda_intel 0000:00:1f.3: DSP detected with PCI
>>>>> class/subclass/prog-if info 0x040100
>>>>> [ 13.357500] snd_hda_intel 0000:00:1f.3: Digital mics found on
>>>>> Skylake+ platform, using SST driver
>>>>>
>>>>>       Building the kernel with the CONFIG_SND_SOC_INTEL_KBL removed can
>>>>> load the snd_hda_codec_realtek successfully and the pulseaudio and
>>>>> alsa-utils can detect the sound cards again. The result of bisecting
>>>>> between kernel 5.4 and 5.8 also get similar result, reverting the
>>>>> commit "ALSA: hda: Allow SST driver on SKL and KBL platforms with
>>>>> DMIC" can fix the issue. I tried to generate the required firmware for
>>>>> snd_soc_skl but it did not help. Please refer to what I did in
>>>>> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1915117/comments/14
>>>>> and https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1915117/comments/18.
>>>>>
>>>>>       Since the skl_hda_dsp_generic-tplg.bin and dfw_sst.bin are not in
>>>>> the linux-firmware. The Intel SST support for Skylake family is not
>>>>> yet complete. Can we simply revert the "ALSA: hda: Allow SST driver on
>>>>> SKL and KBL platforms with DMIC" in the current stage and wait for SOF
>>>>> support for Skylake family? Or please suggest a better solution for
>>>>> this. Thanks
>>>>>
>>>>> Chris
>>>>>
>>>>
>>>> Hello Chris,
>>>>
>>>> Guide: "Linux: HDA+DMIC with skylake driver" [1] should help
>>>> understanding history behind the problem as well as fixing it.
>>>>
>>>> Upstream skylake driver - snd_soc_skl - is intended to support HDA DSP +
>>>> DMIC configuration via means of snd_soc_skl_hda_dsp machine board
>>>> driver. You _may_ switch to legacy HDAudio driver - snd_hda_intel -
>>>> losing DMIC support in the process. To remove any confusion - for
>>>> Skylake and Kabylake platforms, snd_soc_skl is your option.
>>>>
>>>> Now, due to above, I doubt any skylake-related topology has ever been
>>>> upstreamed to linux-firmware as a) most boards are I2S-based, these are
>>>> used by our clients which we support via separate channel b) hda
>>>> dsp+dmic support on linux for missing until early 2020.
>>>>
>>>> Topologies for most common skylake driver configurations:
>>>> - skl/kbl with i2s rt286
>>>> - apl/glk with i2s rt298
>>>> - <any> with hda dsp
>>>> can be found in alsa-topology-conf [2].
>>>>
>>>> Standard, official tool called 'alsatplg' is capable of compiling these
>>>> into binary form which, after being transferred to /lib/firmware/ may be
>>>> consumed by the driver during runtime.
>>>> I have no problem with providing precompiled binaries to linux-firmware,
>>>> if that's what community wants.
>>>>
>>>> Regards,
>>>> Czarek
>>>>
>>>>
>>>
>>> I think the guild [1] is too complicated for normal users to fix the problem.
>>> Given it's not only the internal microphone being affected, it's no sound
>>> devices being created at all so no audio functions can work after kernel 5.8.
>>>
>>> Is there any potential problem to built-in the "<any> with hda dsp" precompiled
>>> binary in linux-firmware?
>>
>> How do you distribute the SOF firmware? I'm going to include those binary
>> topology files to the SOF firmware package for Fedora. Perhaps, you may follow
>> this.
>>
> 
> Wouldn't it make more sense to distribute binaries along with confs from 
> which they are build, which are already installed by alsa-topology package?
> Similarly Ubuntu could use alsa-topology-conf package...

From the packaging perpective, it would be another package which should be
forcefully installed on x86_64 containing few files (and it's unclear if the
list will be extended in future). Also the .conf files are not required for
the operation. But it's just my suggestion, other distributions can choose a
different approach.

I just created Makefile [1] which may help with the packaging, because the
topology .conf -> fw .bin relation is _unclear_ for may of us for those SST
drivers. If you know more information (you can fill the rules for other
topology files), please, share it with us.

					Jaroslav

[1] https://github.com/alsa-project/alsa-topology-conf/blob/master/Makefile


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
