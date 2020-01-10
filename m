Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF970136B1D
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2020 11:33:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5793F1723;
	Fri, 10 Jan 2020 11:32:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5793F1723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578652408;
	bh=7LkyIRgo5J/bYhDpeFiHPobg9A+yd8lSo6kWd5/tTzk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ocInachY4xHJJUCWW4PRbq0GfyRjNLcQdLbgPbu6c55G1ZZ+CDbSjAegAoiv3vCcK
	 5hilqtMHDX+Nx3bkp1SOYRhrAhNOVYuqhrgRmkSLeoPbtXofbvEPsY6PzKwCTFQl1e
	 mBvvL3b7kQWzU3YFzl4W4nAIR5E5q+xSowwJDryo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A92C7F80159;
	Fri, 10 Jan 2020 11:31:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDE0EF8011C; Fri, 10 Jan 2020 11:31:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B24C4F8010B
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 11:31:38 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 8B395A0040;
 Fri, 10 Jan 2020 11:31:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 8B395A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1578652297; bh=kkS6k4Vqe/aQIiu/vUx6V9ei2NTfrbuVLe3Tuvjr6vI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=hmyz8mickaawShu6LcZDu4uooUnwjF8xUTS3FdRG+BF/PTARZS4HEfvgK71N/aqnq
 w6/2b5g/YF3brAr8j2PbROeg23wv0S5axP70l0Wv9itbTpnnnqHir58MJIELKYnUbC
 nrERdz4TYFY0gXW6ye5rCISF4hHwAh1X6bSWa2X0=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 10 Jan 2020 11:31:29 +0100 (CET)
To: Takashi Iwai <tiwai@suse.de>
References: <20191018073848.14590-1-kai.heng.feng@canonical.com>
 <20191018073848.14590-2-kai.heng.feng@canonical.com>
 <10e35320-b7a8-0bcf-92d1-61aa5c057f58@perex.cz>
 <s5ha76vmy8c.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <fd9d174e-febe-27ef-cc4c-f19007e21a1a@perex.cz>
Date: Fri, 10 Jan 2020 11:31:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <s5ha76vmy8c.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, linux-pci@vger.kernel.org, tiwai@suse.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, bhelgaas@google.com
Subject: Re: [alsa-devel] [PATCH v6 2/2] ALSA: hda: Allow HDA to be runtime
 suspended when dGPU is not bound to a driver
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 10. 01. 20 v 10:56 Takashi Iwai napsal(a):
> On Fri, 10 Jan 2020 10:43:26 +0100,
> Jaroslav Kysela wrote:
>>
>> Dne 18. 10. 19 v 9:38 Kai-Heng Feng napsal(a):
>>> Nvidia proprietary driver doesn't support runtime power management, so
>>> when a user only wants to use the integrated GPU, it's a common practice
>>> to let dGPU not to bind any driver, and let its upstream port to be
>>> runtime suspended. At the end of runtime suspension the port uses
>>> platform power management to disable power through _OFF method of power
>>> resource, which is listed by _PR3.
>>>
>>> After commit b516ea586d71 ("PCI: Enable NVIDIA HDA controllers"), when
>>> the dGPU comes with an HDA function, the HDA won't be suspended if the
>>> dGPU is unbound, so the power resource can't be turned off by its
>>> upstream port driver.
>>>
>>> Commit 37a3a98ef601 ("ALSA: hda - Enable runtime PM only for
>>> discrete GPU") only allows HDA to be runtime suspended once GPU is
>>> bound, to keep APU's HDA working.
>>>
>>> However, HDA on dGPU isn't that useful if dGPU is not bound to any
>>> driver.  So let's relax the runtime suspend requirement for dGPU's HDA
>>> function, to disable the power source to save lots of power.
>>
>> This patch breaks the HDMI audio detection at least on some platforms
>> (Lenovo P50 for example) with nouveau and the proprietary nvidia
>> driver. Those laptops have the external HDMI/DP ports connected to
>> dGPU instead the iGPU. The ACPI PR3 is set.
>>
>> The runtime PM off fixes this problem:
>>
>> echo on > /sys/bus/pci/devices/0000\:01\:00.1/power/control
> 
> But this will keep the power of the graphics chip on, and that's what
> the patch was supposed to "fix".
> 
>> But I don't think that it's the best solution. My proposal is to
>> create a pr3 check blacklist to keep power for the HDMI audio for
>> those machines. Also we may add a new module parameter for
>> snd-hda-intel to control this. Other ideas?
> 
> For nouveau, the best fix is to merge the audio component patch.
> This will make things working without fiddling with the power
> up/down.  The patch has been pending over months under review in DRM
> side, unfortunately...  Please pinging them for driving ahead.

Adding Cc: to dri-devel. You probably mean this thread:

https://lists.freedesktop.org/archives/dri-devel/2019-July/thread.html#227423

> For Nvidia, though, it's no path a binary-only stuff can go with, due
> to the GPL symbol of the component framework.  Those guys know of it
> well, and they seem adding the temporary power up/down procedure by
> poking the proc file from the user-space side at the HDMI connection.

Wow.

> About a module option: I don't think it's much better than the sysfs
> toggle.  You can set up a simple udev rule if needed, too.

Ok, it's a bit nightmare to maintain those extra settings in the distribution.

					Jaroslav

> 
> 
> thanks,
> 
> Takashi
> 
>>
>> 					Jaroslav
>>
>>
>>> BugLink: https://bugs.launchpad.net/bugs/1840835
>>> Fixes: b516ea586d71 ("PCI: Enable NVIDIA HDA controllers")
>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>> ---
>>> v5, v6:
>>> - No change.
>>> v4:
>>> - Find upstream port, it's callee's responsibility now.
>>> v3:
>>> - Make changelog more clear.
>>> v2:
>>> - Change wording.
>>> - Rebase to Tiwai's branch.
>>>    sound/pci/hda/hda_intel.c | 8 +++++++-
>>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
>>> index 240f4ca76391..e63b871343e5 100644
>>> --- a/sound/pci/hda/hda_intel.c
>>> +++ b/sound/pci/hda/hda_intel.c
>>> @@ -1280,11 +1280,17 @@ static void init_vga_switcheroo(struct azx *chip)
>>>    {
>>>    	struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
>>>    	struct pci_dev *p = get_bound_vga(chip->pci);
>>> +	struct pci_dev *parent;
>>>    	if (p) {
>>>    		dev_info(chip->card->dev,
>>>    			 "Handle vga_switcheroo audio client\n");
>>>    		hda->use_vga_switcheroo = 1;
>>> -		chip->bus.keep_power = 1; /* cleared in either gpu_bound op or codec probe */
>>> +
>>> +		/* cleared in either gpu_bound op or codec probe, or when its
>>> +		 * upstream port has _PR3 (i.e. dGPU).
>>> +		 */
>>> +		parent = pci_upstream_bridge(p);
>>> +		chip->bus.keep_power = parent ? !pci_pr3_present(parent) : 1;
>>>    		chip->driver_caps |= AZX_DCAPS_PM_RUNTIME;
>>>    		pci_dev_put(p);
>>>    	}
>>>
>>
>>
>> -- 
>> Jaroslav Kysela <perex@perex.cz>
>> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
>>


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
