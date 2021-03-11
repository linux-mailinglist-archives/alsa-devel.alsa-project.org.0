Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 371C8336FF5
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 11:26:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD62A17C4;
	Thu, 11 Mar 2021 11:25:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD62A17C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615458373;
	bh=7LcGJIBLGI7wFgLX8FWSgpwT7LrLXsANpZdD1JFa/Kg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ojmPK6C4p8ZGMl3nehrRq3/6GbPHRHvacSwkvT4JvXSp+TMvm5GeNTr5bbUxYdHJ4
	 +WxYVVKhK4NTHcH8ra7T4/DueKzeO4dweUGpQ3DsAV+kR+093CylOjt+ei9aTXsysu
	 V3p0vK/HdCvkBUSTXEY4J9SSIvdu9QZhzZLpOfc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84B8DF80256;
	Thu, 11 Mar 2021 11:24:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3097F80227; Thu, 11 Mar 2021 11:24:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0AE5F800BF
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 11:24:33 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D03CFA003F;
 Thu, 11 Mar 2021 11:24:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D03CFA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1615458271; bh=L5IgBNO2fmFDEe9Mj6mTow4/9RaSsRkfUSeV3Z9ysHc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ETWC3PUztLMZwBlgzpRw3vVIi3geRiYoqpDzVxfvBBwoa69kw8fGsPBrtutrMUnBd
 ey0ZMOgU8W3uepE6VJ6mcoR6oi0hcJudFxnL4bexm/f733KSokzXsEno5u6K+SLjvt
 PJoxFmX6oZHBZoWqtTkEHekoETwNtwKxg23d+JsE=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 11 Mar 2021 11:24:22 +0100 (CET)
Subject: Re: No sound cards detected on Kabylake laptops after upgrade to
 kernel 5.8
To: Chris Chiu <chris.chiu@canonical.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>
References: <CABTNMG31sH99P0F7EKhpFwJf99x4U-VjFWrwXVe1wkra6owFLw@mail.gmail.com>
 <dba864a6-1442-1ebc-9de0-8c1511682b70@intel.com>
 <CABTNMG1bO2AJLY0o58TX2=1QZPnPsZXabtYZA01QyqDS40JORg@mail.gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <d2efd828-f0b7-fe3f-cfda-cf86d49861bb@perex.cz>
Date: Thu, 11 Mar 2021 11:24:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CABTNMG1bO2AJLY0o58TX2=1QZPnPsZXabtYZA01QyqDS40JORg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 yang.jie@linux.intel.com, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, liam.r.girdwood@linux.intel.com,
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

Dne 11. 03. 21 v 6:50 Chris Chiu napsal(a):
> On Tue, Mar 9, 2021 at 11:29 PM Cezary Rojewski
> <cezary.rojewski@intel.com> wrote:
>>
>> On 2021-03-09 1:19 PM, Chris Chiu wrote:
>>> Hi Guys,
>>>      We have received reports that on some Kabylake laptops (Acer Swift
>>> SF314-54/55 and Lenovo Yoga C930...etc), all sound cards no longer be
>>> detected after upgrade to kernel later than 5.8. These laptops have
>>> one thing in common, all of them have Realtek audio codec and connect
>>> the internal microphone to DMIC of the Intel SST controller either
>>> [8086:9d71] or [8086:9dc8]. Please refer to
>>> https://bugzilla.kernel.org/show_bug.cgi?id=201251#c246 and
>>> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1915117.
>>>
>>>      From the dmesg from kernel 5.8, the sound related parts only show
>>> as follows but the expected snd_hda_codec_realtek and the snd_soc_skl
>>> are not even loaded then.
>>> [ 13.357495] snd_hda_intel 0000:00:1f.3: DSP detected with PCI
>>> class/subclass/prog-if info 0x040100
>>> [ 13.357500] snd_hda_intel 0000:00:1f.3: Digital mics found on
>>> Skylake+ platform, using SST driver
>>>
>>>      Building the kernel with the CONFIG_SND_SOC_INTEL_KBL removed can
>>> load the snd_hda_codec_realtek successfully and the pulseaudio and
>>> alsa-utils can detect the sound cards again. The result of bisecting
>>> between kernel 5.4 and 5.8 also get similar result, reverting the
>>> commit "ALSA: hda: Allow SST driver on SKL and KBL platforms with
>>> DMIC" can fix the issue. I tried to generate the required firmware for
>>> snd_soc_skl but it did not help. Please refer to what I did in
>>> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1915117/comments/14
>>> and https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1915117/comments/18.
>>>
>>>      Since the skl_hda_dsp_generic-tplg.bin and dfw_sst.bin are not in
>>> the linux-firmware. The Intel SST support for Skylake family is not
>>> yet complete. Can we simply revert the "ALSA: hda: Allow SST driver on
>>> SKL and KBL platforms with DMIC" in the current stage and wait for SOF
>>> support for Skylake family? Or please suggest a better solution for
>>> this. Thanks
>>>
>>> Chris
>>>
>>
>> Hello Chris,
>>
>> Guide: "Linux: HDA+DMIC with skylake driver" [1] should help
>> understanding history behind the problem as well as fixing it.
>>
>> Upstream skylake driver - snd_soc_skl - is intended to support HDA DSP +
>> DMIC configuration via means of snd_soc_skl_hda_dsp machine board
>> driver. You _may_ switch to legacy HDAudio driver - snd_hda_intel -
>> losing DMIC support in the process. To remove any confusion - for
>> Skylake and Kabylake platforms, snd_soc_skl is your option.
>>
>> Now, due to above, I doubt any skylake-related topology has ever been
>> upstreamed to linux-firmware as a) most boards are I2S-based, these are
>> used by our clients which we support via separate channel b) hda
>> dsp+dmic support on linux for missing until early 2020.
>>
>> Topologies for most common skylake driver configurations:
>> - skl/kbl with i2s rt286
>> - apl/glk with i2s rt298
>> - <any> with hda dsp
>> can be found in alsa-topology-conf [2].
>>
>> Standard, official tool called 'alsatplg' is capable of compiling these
>> into binary form which, after being transferred to /lib/firmware/ may be
>> consumed by the driver during runtime.
>> I have no problem with providing precompiled binaries to linux-firmware,
>> if that's what community wants.
>>
>> Regards,
>> Czarek
>>
>>
> 
> I think the guild [1] is too complicated for normal users to fix the problem.
> Given it's not only the internal microphone being affected, it's no sound
> devices being created at all so no audio functions can work after kernel 5.8.
> 
> Is there any potential problem to built-in the "<any> with hda dsp" precompiled
> binary in linux-firmware?

How do you distribute the SOF firmware? I'm going to include those binary
topology files to the SOF firmware package for Fedora. Perhaps, you may follow
this.

					Jaroslav

> 
> Chris
> 
>> [1]: https://gist.github.com/crojewsk/4e6382bfb0dbfaaf60513174211f29cb
>> [2]: https://github.com/alsa-project/alsa-topology-conf/tree/master/topology


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
