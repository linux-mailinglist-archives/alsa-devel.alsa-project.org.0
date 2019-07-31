Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8517C6B9
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 17:35:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55C0916C7;
	Wed, 31 Jul 2019 17:34:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55C0916C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564587331;
	bh=rXWtO6hkUHxQXB/fqovI/RV+scuwef8s5oJL5BGbqhk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sjcmXFHee6Iq0aaCZje9FtoC1pi/LjBVsoKOj9RMui471Ser3iHFjpSSEmo2ofCz0
	 GfxP1DQOJQbmsF6uEtU6j4E7p2EOvuwnRofnjOXAlJCuBHTN9m8fTPQxWrwwUruntn
	 RY+eD1qvkKkfRGYWE1vxcv8N3C7IJf2HUuORLCb0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9517DF80483;
	Wed, 31 Jul 2019 17:33:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF83FF80483; Wed, 31 Jul 2019 17:33:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A75D3F80214
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 17:33:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A75D3F80214
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jul 2019 08:33:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,330,1559545200"; d="scan'208";a="372141488"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 31 Jul 2019 08:33:37 -0700
Received: from csenarat-mobl2.amr.corp.intel.com
 (csenarat-mobl2.amr.corp.intel.com [10.254.66.62])
 by linux.intel.com (Postfix) with ESMTP id A893F5800BD;
 Wed, 31 Jul 2019 08:33:36 -0700 (PDT)
To: Takashi Iwai <tiwai@suse.de>
References: <20190729155151.14055-1-pierre-louis.bossart@linux.intel.com>
 <s5hmuguqpjk.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ba35154d-5620-bb3e-40c8-ede417d98a2a@linux.intel.com>
Date: Wed, 31 Jul 2019 10:33:36 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <s5hmuguqpjk.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Curtis Malainey <cujomalainey@google.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Daniel Drake <drake@endlessm.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v4 0/5] ALSA/HDA: abort probe when DMICs
	are detected
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

On 7/31/19 8:52 AM, Takashi Iwai wrote:
> On Mon, 29 Jul 2019 17:51:46 +0200,
> Pierre-Louis Bossart wrote:
>>
>> This is the second take on same problem of detecting when the HDaudio
>> legacy driver can be used and when the SST or SOF drivers are
>> required.
>>
>> The previous attempt based on a the PCI Class information was a
>> resounding failure and broke audio on Linus' laptop, so we need
>> additional information to avoid enabling a DSP-based driver without a
>> good reason to do so.
>>
>> This patchset suggests the use of the NHLT information which *in
>> theory* exposes DMIC endpoints. The legacy HDaudio driver cannot
>> handle DMICs and will not provide any capture capabilities. Since it's
>> typically the first one to probe due to the Makefile order, aborting
>> the probe will let the PCI subsystem look for the next driver which
>> hopefully will support this capability.
>>
>> I tested this patch on 5 devices (SKL, KBL, APL, GLK, WHL), three
>> without DMICs and two with, and the detection seems to work as
>> planned. Additional testing by Canonical and Endless folks did not
>> expose any issues.
>>
>> Changes since v3 (Feedback from Cezary)
>> Code cleanups (spaces and unnecessary inits)
>> Flipped test statement to return on errors and reduce indentation
>> Removed ACPI leak by adding missing ACPI_FREE()
>>
>> Changes since v2 (Feedback from Takahi and Cezary)
>> Added comment in Kconfig to alert the user to the dependency on ACPI
>>
>> Changes since v1 (Feedback from Takashi):
>> Squashed patch3 in patch2
>> Changed log to dbg_info
>> Fixed module parameter handling
>>
>> Changes since RFC:
>> Cosmetic code improvements
>> Moved intel-nhlt.h to include/sound
>> Moved intel-nhlt.c to sound/hda
>> Removed SOC prefixes
>> Added full-support for vendor-defined geometries
>> Added Kconfig and kernel module parameter to opt-in
>>
>> Pierre-Louis Bossart (5):
>>    ASoC: Intel: Skylake: move NHLT header to common directory
>>    ALSA: hda: move parts of NHLT code to new module
>>    ALSA: hda: intel-nhlt: handle NHLT VENDOR_DEFINED DMIC geometry
>>    ASoC: Intel: Skylake: use common NHLT module
>>    ALSA: hda/intel: stop probe if DMICS are detected on Skylake+
>>      platforms
> 
> Applied all five patches now.  Thanks.
> 
> Mark, the patches are found in topic/hda-dmic branch of sound git
> tree, which are based on 5.3-rc1.  If ASoC tree needs these changes,
> feel free to pull the branch into yours.

Thank you Takashi.

I will need to use these patches for SOF to dynamically change the 
topology file name depending on how many DMICs are detected for HDaudio 
platforms, if at all. The current solution requires the user to rename 
files and it's just not scalable.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
