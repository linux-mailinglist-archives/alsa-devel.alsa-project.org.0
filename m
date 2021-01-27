Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD963066D2
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 22:54:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A9D916BB;
	Wed, 27 Jan 2021 22:53:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A9D916BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611784463;
	bh=8GJimUg9f5NPZeRr4z7A+KX8AjT4Nisk4EAo2Ok4T+8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MUVLbGfpypHXv0gD04om+2d4qOgs3p4p2fzIjLCrGv1Al7EI28FU2EnartbFMN8Vc
	 YE4tZH1S7o+Wjl8TYlACsBzGYqmmSWiSO4BpYIOVF7PK18l/O99HrHvp94tU4+24Tk
	 7HnpZOcmnmstMd/UZoGhibpTTzsBXvdF+MAMC+0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0186F8011C;
	Wed, 27 Jan 2021 22:52:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2091EF80259; Wed, 27 Jan 2021 22:52:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 PRX_BODY_76,PRX_BODY_84,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D467F8011C
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 22:52:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D467F8011C
IronPort-SDR: LM3ntPOyN/YcxpErCpH1Q4HHf+NWEfXdfuvLcwy8oyk4hShoA2IhRBndN8hy+0lXl9ol6nMOmF
 VLFetiIhbnbQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="180217731"
X-IronPort-AV: E=Sophos;i="5.79,380,1602572400"; d="scan'208";a="180217731"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 13:52:24 -0800
IronPort-SDR: gteFvDl2CjPds7XthdSGQbmnnQ47OwYTSe9MJotOb61g2jPaf+hF8uIX/AdjyjLuhRyjeLARr5
 OvCaX20Yu77A==
X-IronPort-AV: E=Sophos;i="5.79,380,1602572400"; d="scan'208";a="357204084"
Received: from johaleryn.amr.corp.intel.com (HELO [10.209.174.152])
 ([10.209.174.152])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 13:52:22 -0800
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
Message-ID: <ee468703-8e36-52dd-ac7a-d2560997a98c@linux.intel.com>
Date: Wed, 27 Jan 2021 15:52:20 -0600
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

ok, well if you have a consistent failure that's better to some extent.

Maybe a bit of explanations of what this routine tries to do:
when SoundWire is enabled in a system, we need to have the following 
pattern in the DSDT


