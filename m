Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B30B83066F6
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 23:04:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E60F16A5;
	Wed, 27 Jan 2021 23:03:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E60F16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611785059;
	bh=vwmks73Vw5DQV83Ygk7SwPncGlg9s+x1080uc7Ao4cI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FSCNL9HGiXuwZxAAjkOA28hVj6E8ZynsZ074HBqozeAZCl45F5COEOudeQ/KQBhoS
	 C0U0hl111sNKg+lOr1fibK7i/JRqWzAo30TBSGfDIzmAfRrrGuIyvQXo6UPzjr9dsA
	 KMvg47ujM2uPB4CQi/gHOQljueCR0/O6zZPS/2vQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87B8AF800F0;
	Wed, 27 Jan 2021 23:02:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 176A5F80259; Wed, 27 Jan 2021 23:02:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 PRX_BODY_76,PRX_BODY_84,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE823F800F0
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 23:02:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE823F800F0
IronPort-SDR: 9PAfWnWhHik/jcoYvR9oVpNQJKAEwSKjTf+yrm5C8IJ8DGEk6gENlpjBbosQjuKsIxzhokZegY
 ECCrmVwGWK8g==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="198964097"
X-IronPort-AV: E=Sophos;i="5.79,380,1602572400"; d="scan'208";a="198964097"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 14:02:34 -0800
IronPort-SDR: i6F2gvM/6kh4rOtFpRty7DdNRR50gCxMPh7CIJN3lr4amk2x6aV+e5xOImusTA0cvWFdaxJKC4
 EWZ6/3SWpDxQ==
X-IronPort-AV: E=Sophos;i="5.79,380,1602572400"; d="scan'208";a="430259811"
Received: from sschwenc-mobl.amr.corp.intel.com (HELO [10.209.87.195])
 ([10.209.87.195])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 14:02:30 -0800
Subject: Re: Crash in acpi_ns_validate_handle triggered by soundwire on Linux
 5.10
To: =?UTF-8?Q?Marcin_=c5=9alusarz?= <marcin.slusarz@gmail.com>
References: <CA+GA0_sPC3rp5K4qwZm-u+W1C=+2Y2p-dbF4DMdHkKaTpeKKkg@mail.gmail.com>
 <CAJZ5v0iapmc8ywuySwexwTagKr89Hj7TPXkAvd_HXMhdLoyyQQ@mail.gmail.com>
 <1f0f7273-597e-cdf0-87d1-908e56c13133@linux.intel.com>
 <CA+GA0_v3JUWS3G3=R4XuQ=OW91cpwiBP1Rp=uzYOF8c9TUJ46w@mail.gmail.com>
 <CA+GA0_sCdowanpZmg==c+xVqqNxG5whLGsKHaCfSmpERBhqMzA@mail.gmail.com>
 <1dc2639a-ecbc-c554-eaf6-930256dcda96@linux.intel.com>
 <CA+GA0_sZm2pqOfA3LsNQowb930QS_g5CiCCGthzsS=vAjB9Rjg@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <709fa03c-43b7-45e4-3ddc-aae0d8f4ced4@linux.intel.com>
Date: Wed, 27 Jan 2021 16:02:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+GA0_sZm2pqOfA3LsNQowb930QS_g5CiCCGthzsS=vAjB9Rjg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Len Brown <lenb@kernel.org>
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



On 1/27/21 1:18 PM, Marcin Ślusarz wrote:
> śr., 27 sty 2021 o 18:28 Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> napisał(a):
>>> Weird, I can't reproduce this problem with my self-compiled kernel :/
>>> I don't even see soundwire modules loaded in. Manually loading them of course
>>> doesn't do much.
>>>
>>> Previously I could boot into the "faulty" kernel by using "recovery mode", but
>>> I can't do that anymore - it crashes too.
>>>
>>> Maybe there's some kind of race and this bug depends on some specific
>>> ordering of events?
>>
>> missing Kconfig?
>> You need CONFIG_SOUNDWIRE and CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE
>> selected to enter this sdw_intel_acpi_scan() routine.
> 
> It was a PEBKAC, but a slightly different one. I won't bore you with
> (embarrassing) details ;).
> 
> I reproduced the problem, tested both your and Rafael's patches
> and the kernel still crashes, with the same stack trace.
> (Yes, I'm sure I booted the right kernel :)
> 
> Why "recovery mode" stopped working (or worked previously) is still a mystery.
> 

Thanks Marcin for the information. If you have a consistent failure 
that's better to some extent.

Maybe a bit of explanation of what this routine tries to do:
when SoundWire is enabled in a system, we need to have the following 
pattern in the DSDT:

     Scope (_SB.PCI0)
     {
         Device (HDAS)
         {
             Name (_ADR, 0x001F0003)  // _ADR: Address
         }


         Scope (HDAS)
         {
             Device (SNDW)
             {
                 Name (_ADR, 0x40000000)  // _ADR: Address

The only thing the code does is to walk through the children and check 
if the valid _ADR 0x40000000 is found.

You don't have SoundWire in your device so there should not be any 
children found. I don't see anything in the DSDT that looks like 
_SB.PCI0.HDAS.<something>, so in theory we should not even enter the 
callback.

The error happens in acpi_bus_get_device(), after we read the adr but 
before we check it, so wondering if we shouldn't revert the checks. Can 
you try the diff below? I am not sure why there is a crash and we should 
root-cause this issue, just trying to triangulate what is happening.

diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index cabdadb09a1b..6bc87a682fb3 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -369,13 +369,6 @@ static acpi_status sdw_intel_acpi_cb(acpi_handle 
handle, u32 level,
         if (ACPI_FAILURE(status))
                 return AE_OK; /* keep going */

-       if (acpi_bus_get_device(handle, &adev)) {
-               pr_err("%s: Couldn't find ACPI handle\n", __func__);
-               return AE_NOT_FOUND;
-       }
-
-       info->handle = handle;
-
         /*
          * On some Intel platforms, multiple children of the HDAS
          * device can be found, but only one of them is the SoundWire
@@ -386,6 +379,13 @@ static acpi_status sdw_intel_acpi_cb(acpi_handle 
handle, u32 level,
         if (FIELD_GET(GENMASK(31, 28), adr) != SDW_LINK_TYPE)
                 return AE_OK; /* keep going */

+       if (acpi_bus_get_device(handle, &adev)) {
+               pr_err("%s: Couldn't find ACPI handle\n", __func__);
+               return AE_NOT_FOUND;
+       }
+
+       info->handle = handle;
+
         /* device found, stop namespace walk */
         return AE_CTRL_TERMINATE;
  }


