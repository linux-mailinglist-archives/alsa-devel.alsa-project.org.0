Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0289F160
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 19:20:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C29631667;
	Tue, 27 Aug 2019 19:19:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C29631667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566926411;
	bh=lzSaT0lCfXk84Us4D1d4m2f2ia0IVN+LWHk+dBMauPY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CWJ8ClahfNhkz6hcBM0PPOpWXfb2q4EC9lL1hEzPFS+G9iZaZNradBcKU5AsBKio0
	 qBEk+IgkkNUgwK8LduqjuGkK4Z53O0gzDoHCHrr/8lEr3izW0LxwETKj04gpDmQQET
	 EPqQa7MylY7XzJdJbfWD5EGUW4vKq6dT3lAoTlLY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31E80F802A1;
	Tue, 27 Aug 2019 19:18:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A00F2F80274; Tue, 27 Aug 2019 19:18:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 501A9F80142
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 19:18:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 501A9F80142
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 10:18:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,438,1559545200"; d="scan'208";a="209827470"
Received: from lcrispin-mobl.amr.corp.intel.com (HELO [10.251.131.174])
 ([10.251.131.174])
 by fmsmga002.fm.intel.com with ESMTP; 27 Aug 2019 10:18:13 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 "Wasko, Michal" <michal.wasko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <50932a9f-2f3e-c150-77c7-f021f84ed4d1@intel.com>
 <20190823102652.GM23391@sirena.co.uk>
 <c845fda4-c18d-2ca8-7337-6e6af74d239c@intel.com>
 <70222fac-8c4e-5ceb-3c49-7020196b59df@linux.intel.com>
 <2e2a34b8-2451-01f6-79a1-14f06d1ed059@intel.com>
 <9dfd3a96-f286-34d6-fe57-9b6b8740e424@linux.intel.com>
 <20190823213920.GW23391@sirena.co.uk>
 <57196fe6-9291-5518-9fb6-731b9b5c27ed@intel.com>
 <ab5f0c6a-8d16-0848-1ca7-96286334a9bc@intel.com>
 <330b6be6-21c2-2eb8-9959-7d494841b3d6@linux.intel.com>
 <15484165-d751-b60e-f703-de7c1fa1ad17@linux.intel.com>
 <a95ac4d7-1c6a-ac19-59b3-cfb9ab058520@intel.com>
 <47683473-c177-055b-03fe-2f01feeb4016@linux.intel.com>
 <92ddf26a-f0ca-469d-2ccd-68a3e9cb2e6a@linux.intel.com>
 <49d056e3-e1f6-039b-5265-82a4052af577@linux.intel.com>
 <e91d8bf1-e832-7a4d-f056-a5105648a056@intel.com>
 <c67909a4-aae4-64f2-6e55-d513030fe085@linux.intel.com>
 <d3474fdb-9479-b6f7-07fb-9f7c2d4ccbe3@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <85f46beb-1218-4159-2abd-3ab804247a31@linux.intel.com>
Date: Tue, 27 Aug 2019 12:18:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d3474fdb-9479-b6f7-07fb-9f7c2d4ccbe3@intel.com>
Content-Language: en-US
Cc: "Wasko, Michal" <michal.wasko@intel.com>, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>
Subject: Re: [alsa-devel] [PATCH 00/35] ASoC: Intel: Clenaup SST
 initialization
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



On 8/27/19 10:08 AM, Cezary Rojewski wrote:
> On 2019-08-27 17:00, Pierre-Louis Bossart wrote:
> 
>>>>>>>>>> On the second thought what if instead of 
>>>>>>>>>> duplicating kernel code, binaries would be 
>>>>>>>>>> duplicated? I.e. rather than targeting 
>>>>>>>>>> /intel/dsp_fw_cnl.bin, _new_ /skylake would be 
>>>>>>>>>> expecting /intel/dsp_fw_cnl_release.bin? Same with 
>>>>>>>>>> topology binaries. In such case, we "only" need to 
>>>>>>>>>> figure out how to propagate new files to Linux 
>>>>>>>>>> distos so whenever someone updates their kernel, 
>>>>>>>>>> new binaries are already present in their 
>>>>>>>>>> /lib/firmware.
>>>>>>>>>> 
>>>>>>>>>> If such option is valid, we can postpone /skylake 
>>>>>>>>>> upgrade till 5.4 merging window closes and the 
>>>>>>>>>> patches (rough estimation is 150) would descend 
>>>>>>>>>> upon alsa-devel in time between 5.4 and 5.5.
>>>>>>>>> 
>>>>>>>>> If the driver and FW update will be within the same 
>>>>>>>>> kernel release then IMHO there should be no 
>>>>>>>>> compatibility problem between those two components, 
>>>>>>>>> right? This way kernel users willing to stick to old 
>>>>>>>>> FW can stay on older kernel version while others can 
>>>>>>>>> update and receive all the latest FW functionality 
>>>>>>>>> that was developed and enabled.
>>>>>>>> 
>>>>>>>> I am not comfortable with precluding a kernel update 
>>>>>>>> because of a single firmware file. There are all sort 
>>>>>>>> of reasons for updating a kernel, security, sideband 
>>>>>>>> attacks and Android CDD compatibility being the most 
>>>>>>>> obvious ones.
>>>>>>>> 
>>>>> The single firmware file will not be a blocker as the driver 
>>>>> included in updated kernel will support it. All you have to 
>>>>> do is the little effort to re-generate your custom topology 
>>>>> for the new firmware target. The entire operation should not 
>>>>> be a problem as there are dedicated utilities like FDK to do 
>>>>> that.
>>>> 
>>>> The issue is the same whether it's a topology file or a 
>>>> firmware file. The ideal situation is that when the kernel is 
>>>> updated it handles both in backwards compatible ways.
>>>> 
>>>> If to deal with a new firmware file you have to regenerate a 
>>>> new topology, you are in a different model altogether.
>>>> 
>>>>> Your statement Pierre suggest that everyone should avoid any 
>>>>> functional changes in kernel that are not critical because 
>>>>> that would be problematic for others who switch from older 
>>>>> kernel version.
>>>> All I said was that you cannot assume that people who are
>>>> using an old firmware/driver will remain on an old kernel.
>>>> 
>>>> Mark made an initial proposal to essentially freeze the
>>>> current solution, which would make it possible to update the
>>>> kernel but keep the same skylake driver in legacy/maintenance
>>>> mode only, and an 'new' option that would rely on an updated 
>>>> distribution of firmware/driver. I did not get the counter 
>>>> proposal from Cezary at all.
>>> 
>>> Ain't my previous message:
>>> 
>>> -
>>> 
>>> On the second thought what if instead of duplicating kernel
>>> code, binaries would be duplicated? I.e. rather than targeting 
>>> /intel/dsp_fw_cnl.bin, _new_ /skylake would be expecting 
>>> /intel/dsp_fw_cnl_release.bin? Same with topology binaries. In 
>>> such case, we "only" need to figure out how to propagate new 
>>> files to Linux distos so whenever someone updates their kernel, 
>>> new binaries are already present in their /lib/firmware.
>>> 
>>> If such option is valid, we can postpone /skylake upgrade till 
>>> 5.4 merging window closes and the patches (rough estimation is 
>>> 150) would descend upon alsa-devel in time between 5.4 and 5.5.
>>> 
>>> -
>>> 
>>> a counter proposal?
>> 
>> you didn't explain how the 'duplicated binaries' would be
>> selected. And 'instead of' means you suggested an alternative to
>> Mark's proposal.
> 
> What I have in mind:
> 
> We leave the old stuff as is, e.g:
> /lib/firmware/intel/dsp_fw_cnl.bin -> points to _old_ FW binaries 
> /lib/firmware/<PCI-ID>-INTEL-<oem_data_from_NHLT -> points to old 
> topology
> 
> Existing /skylake i.e. before our initialization refactor would 
> (kernels <5.5?) would still point to these and since they are not 
> being removed from linux-firmware, nothing gets broken.
> 
> 
> And then we "duplicate" and simply append the new ones: 
> /lib/firmware/intel/dsp_fw_cnl_release.bin -> points to _new_ FW 
> /lib/firmware/dfw_cnl_rt274 -> points to _new_ topology
> 
> Updated /skylake would simply expect the _new_ files and totally 
> ignore the old ones i.e.: descriptors would be pointing to 
> dsp_fw_cnl_release and dfw_cnl_rt274.

What if those new files are not present on the filesystem?

Mark suggested:
"We could have a wrapper which tries to load the newer firmware and uses
the fixed driver code if that's there, otherwise tries the old driver
with the existing firmware paths."

Maybe that's too complicated, I had in mind some sort of opt-in Kconfig 
where you only use the new firmware/topology when the user/distro gives 
a clear hint than it's fine to use newer stuff.

I also wonder how you are going to deal with all these topology files 
with a name derived from the OEM/NHLT. There's just so many of 
them...For upstream you probably want to provide ONE per platform 
variant, which limits you to the number of machine drivers supported.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
