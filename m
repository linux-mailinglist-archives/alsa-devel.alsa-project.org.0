Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 795FE337048
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 11:42:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1C4D182D;
	Thu, 11 Mar 2021 11:41:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1C4D182D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615459365;
	bh=QqugwdV1RhwJSBQnu70XM3wGPoJDBbXvb63hmBLTruA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q5lcx7ogLtpJXQyWx0KFWZRAXD07k5iMwfPwocqmXyXVo0gXvP/jVZYE6N3tpcoG4
	 rSzWV01re5/icFsF0Si1kOm4zdMFXU1op+EMImq/2MoT28WKPypWpV44Q65fWGhKTs
	 obEfUdKVSsoRjwFuKMLH3bT8hWUDer6JRv+8Voqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AED7F80256;
	Thu, 11 Mar 2021 11:41:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F515F80227; Thu, 11 Mar 2021 11:41:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 562B6F800BF
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 11:41:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 562B6F800BF
IronPort-SDR: kM1VG8tlq/fA+L/o+xJmhl5fmOnfhgITf2vJ4wytrvyRcr5KMSudF5gDmlBw+sPwDnzwm3P3CJ
 GjdiIIU/4EGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="188012299"
X-IronPort-AV: E=Sophos;i="5.81,240,1610438400"; d="scan'208";a="188012299"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 02:40:59 -0800
IronPort-SDR: wQEsNqiOHTlGrV6UsCg7ri8QOwmqZa5FhGU/xtc9TdAdqMkKa5AncHQmXJm3UfqBaJecTyVK+E
 oZGqVDPDpU9Q==
X-IronPort-AV: E=Sophos;i="5.81,240,1610438400"; d="scan'208";a="404033923"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.237.12.105])
 ([10.237.12.105])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 02:40:56 -0800
Subject: Re: No sound cards detected on Kabylake laptops after upgrade to
 kernel 5.8
To: Jaroslav Kysela <perex@perex.cz>, Chris Chiu <chris.chiu@canonical.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>
References: <CABTNMG31sH99P0F7EKhpFwJf99x4U-VjFWrwXVe1wkra6owFLw@mail.gmail.com>
 <dba864a6-1442-1ebc-9de0-8c1511682b70@intel.com>
 <CABTNMG1bO2AJLY0o58TX2=1QZPnPsZXabtYZA01QyqDS40JORg@mail.gmail.com>
 <d2efd828-f0b7-fe3f-cfda-cf86d49861bb@perex.cz>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <e66560d0-01e7-6695-4c5b-4b6fb37fdb95@linux.intel.com>
Date: Thu, 11 Mar 2021 11:40:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <d2efd828-f0b7-fe3f-cfda-cf86d49861bb@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 3/11/2021 11:24 AM, Jaroslav Kysela wrote:
> Dne 11. 03. 21 v 6:50 Chris Chiu napsal(a):
>> On Tue, Mar 9, 2021 at 11:29 PM Cezary Rojewski
>> <cezary.rojewski@intel.com> wrote:
>>>
>>> On 2021-03-09 1:19 PM, Chris Chiu wrote:
>>>> Hi Guys,
>>>>       We have received reports that on some Kabylake laptops (Acer Swift
>>>> SF314-54/55 and Lenovo Yoga C930...etc), all sound cards no longer be
>>>> detected after upgrade to kernel later than 5.8. These laptops have
>>>> one thing in common, all of them have Realtek audio codec and connect
>>>> the internal microphone to DMIC of the Intel SST controller either
>>>> [8086:9d71] or [8086:9dc8]. Please refer to
>>>> https://bugzilla.kernel.org/show_bug.cgi?id=201251#c246 and
>>>> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1915117.
>>>>
>>>>       From the dmesg from kernel 5.8, the sound related parts only show
>>>> as follows but the expected snd_hda_codec_realtek and the snd_soc_skl
>>>> are not even loaded then.
>>>> [ 13.357495] snd_hda_intel 0000:00:1f.3: DSP detected with PCI
>>>> class/subclass/prog-if info 0x040100
>>>> [ 13.357500] snd_hda_intel 0000:00:1f.3: Digital mics found on
>>>> Skylake+ platform, using SST driver
>>>>
>>>>       Building the kernel with the CONFIG_SND_SOC_INTEL_KBL removed can
>>>> load the snd_hda_codec_realtek successfully and the pulseaudio and
>>>> alsa-utils can detect the sound cards again. The result of bisecting
>>>> between kernel 5.4 and 5.8 also get similar result, reverting the
>>>> commit "ALSA: hda: Allow SST driver on SKL and KBL platforms with
>>>> DMIC" can fix the issue. I tried to generate the required firmware for
>>>> snd_soc_skl but it did not help. Please refer to what I did in
>>>> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1915117/comments/14
>>>> and https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1915117/comments/18.
>>>>
>>>>       Since the skl_hda_dsp_generic-tplg.bin and dfw_sst.bin are not in
>>>> the linux-firmware. The Intel SST support for Skylake family is not
>>>> yet complete. Can we simply revert the "ALSA: hda: Allow SST driver on
>>>> SKL and KBL platforms with DMIC" in the current stage and wait for SOF
>>>> support for Skylake family? Or please suggest a better solution for
>>>> this. Thanks
>>>>
>>>> Chris
>>>>
>>>
>>> Hello Chris,
>>>
>>> Guide: "Linux: HDA+DMIC with skylake driver" [1] should help
>>> understanding history behind the problem as well as fixing it.
>>>
>>> Upstream skylake driver - snd_soc_skl - is intended to support HDA DSP +
>>> DMIC configuration via means of snd_soc_skl_hda_dsp machine board
>>> driver. You _may_ switch to legacy HDAudio driver - snd_hda_intel -
>>> losing DMIC support in the process. To remove any confusion - for
>>> Skylake and Kabylake platforms, snd_soc_skl is your option.
>>>
>>> Now, due to above, I doubt any skylake-related topology has ever been
>>> upstreamed to linux-firmware as a) most boards are I2S-based, these are
>>> used by our clients which we support via separate channel b) hda
>>> dsp+dmic support on linux for missing until early 2020.
>>>
>>> Topologies for most common skylake driver configurations:
>>> - skl/kbl with i2s rt286
>>> - apl/glk with i2s rt298
>>> - <any> with hda dsp
>>> can be found in alsa-topology-conf [2].
>>>
>>> Standard, official tool called 'alsatplg' is capable of compiling these
>>> into binary form which, after being transferred to /lib/firmware/ may be
>>> consumed by the driver during runtime.
>>> I have no problem with providing precompiled binaries to linux-firmware,
>>> if that's what community wants.
>>>
>>> Regards,
>>> Czarek
>>>
>>>
>>
>> I think the guild [1] is too complicated for normal users to fix the problem.
>> Given it's not only the internal microphone being affected, it's no sound
>> devices being created at all so no audio functions can work after kernel 5.8.
>>
>> Is there any potential problem to built-in the "<any> with hda dsp" precompiled
>> binary in linux-firmware?
> 
> How do you distribute the SOF firmware? I'm going to include those binary
> topology files to the SOF firmware package for Fedora. Perhaps, you may follow
> this.
> 

Wouldn't it make more sense to distribute binaries along with confs from 
which they are build, which are already installed by alsa-topology package?
Similarly Ubuntu could use alsa-topology-conf package...


