Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6AA603104
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 18:49:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36886A052;
	Tue, 18 Oct 2022 18:49:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36886A052
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666111795;
	bh=hAuEFoNqUQ5RT/IyJwbMjVc19/QYr4Bx0HoSkaB0paU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BnWULniIIP1kHi0AWf/ui/Fuz257msKt9QsyVSNdeWfl5ynhn7gIwWp8S6uAy73Bz
	 o98mEUmfwaRWSTg6uZCKq/gWBVJswlLJQrO8ZsGAj5zYL8yoYG6DsLxkHmwEvpkgPn
	 dCO9rHMeCIDauRr3DIGJl+nRjFVcmRFlLmJpgqck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBDECF804C1;
	Tue, 18 Oct 2022 18:49:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FD89F804BD; Tue, 18 Oct 2022 18:49:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0BF4F800AA
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 18:48:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0BF4F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lQY1V4lZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666111736; x=1697647736;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hAuEFoNqUQ5RT/IyJwbMjVc19/QYr4Bx0HoSkaB0paU=;
 b=lQY1V4lZp0tt/1HnfCHSiSe59AlConh/jSkzROCSqO68pbW2SiorAUXR
 3lkVEntppNl1X/QzkwCuK7X+lzyyYElAv+goKZuU1IYAsqv2HNh9svsxx
 znIMzFq7+MOnbvV2JvhFwat48Br0tVbsx4sKE6TolVpL4zgAu/1eYWwDs
 fo2MPh3jktHjD6KhK8Yu8xH6OdKvNfb5NrCztabODTNBDuW1/K7iqg1TM
 My19sW4wsR+WEubOLyQN9qKCYnf6P8fygSu/CapFh131zS9liZAcnePYq
 mBHjNts9xNiwK6aNl/l0F5BVAhjYPAM71SbrFMy4bqxaw+6C3YQkDx5kU g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="303780567"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="303780567"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 09:48:43 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="803838237"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="803838237"
Received: from amdesimo-mobl1.amr.corp.intel.com (HELO [10.213.176.48])
 ([10.213.176.48])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 09:48:42 -0700
Message-ID: <522cf594-a56a-6649-9bce-b616bf8f47ca@linux.intel.com>
Date: Tue, 18 Oct 2022 11:37:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH 12/19] ASoC: SOF: Intel: Set the default firmware library
 path for IPC4
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org
References: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
 <20221018120916.19820-13-peter.ujfalusi@linux.intel.com>
 <4e501a9d-45bb-0ef0-6900-a61af5d4bae0@linux.intel.com>
 <b9e10ec7-1c4f-a2bf-7471-26b92616ce14@linux.intel.com>
 <06f141c4-cf3b-f227-2f94-625ffcda79f6@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <06f141c4-cf3b-f227-2f94-625ffcda79f6@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: chao.song@intel.com, alsa-devel@alsa-project.org,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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



On 10/18/22 10:46, Cezary Rojewski wrote:
> On 2022-10-18 3:49 PM, Péter Ujfalusi wrote:
>> On 18/10/2022 15:38, Amadeusz Sławiński wrote:
> 
> ...
> 
>>> I'm not sure that I understand the rationale here, can't libraries be
>>> kept in the same directory as FW, as far as I know they are version
>>> locked to FW anyway.

I am not sure what 'version lock' means, nor who determines the version
of the base firmware. The base firmware is not necessarily compiled by
Intel in an SOF/open-source context.

>> During the internal review we arrived to this setup, to keep the
>> libraries separate from the basefw binary.
>> One of the reason is that SOF project is not likely not going to release
>> external libraries, they are mostly vendor/product locked.
>> To make the life easier for the vendors (and distributions, packagers)
>> we concluded that it is better to keep them separate.
>>
>> The option is there to specify custom path as well in case it is needed.
> 
> Thanks for detailed answer, Peter. My two cents:
> 
> I'd say the origin of the library has a saying in that. If it's
> implemented by a vendor then it's simply not our decision. If it's made
> by us (Intel), it's highly probable that there's no problem with sharing
> the library. Library alone is often not enough - to process data as
> expected on the specific hardware, additional configuration is needed.
> We share that information over SRAM between the driver and the firmware.
> And that's the key bit that should not be shared here.

We should not debate on this mailing list what can or cannot be
released, not make any distinctions between Intel and others. The
library handling mechanism is generic, who provides the libraries is
irrelevant.

> As the basefw makes use of different prefixes when compared to the
> libraries, I believe it's fine to leave as is. If an error is made when
> differentiating between dsp_fw_* and dsp_lib_* then introducing avs-lib/
> is not going to help here. It's also much less hassle with matching the
> basefw and lib versions if you have them both within single folder,
> granted both target same AudioDSP generation (SKL-based, APL-based etc.).

You're assuming that it's the same exact set of binary libraries for all
skews based on the same SOC.

That's not necessarily a valid assumption, it's perfectly possible that
a specific OEM decides to allocate more budget for a specific feature
and less for others, resulting in libraries that are recompiled,
optimized or configured differently. The UUID is a weak notion here, as
measured by the same UUID being used for different DSP generations.
Nothing prevents someone from generating a slightly different library
exposed with the same UUID.

We didn't want to restrict our partners and gave them with the ability
to put both the base firmware and the libraries in different directories
and overload the default path should they wish to do so. They could
decide to point to the same directory if they wanted to. That's not our
decision.

If you look at all recent evolutions, we initially introduced different
paths for firmware, then topology, then firmware and topology names. The
logic of adding more flexibility for library path follow the pattern of
trying to avoid making assumptions we have to undo at a later point.

>>> In avs driver when we decided on intel/avs/platform
>>> path we planned to keep FW related libaries there...
>>
>> My initial approach was this as well, but after a long debate it got
>> revised.
> 
> Amadeo: have my bow..
> Czarek: ..and my axe..

I don't understand what bow and axe have to do with this discussion.
Let's say civil, shall we?
