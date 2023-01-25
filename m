Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0431867B96C
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jan 2023 19:35:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DC4A1DE;
	Wed, 25 Jan 2023 19:35:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DC4A1DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674671754;
	bh=WFoJYI40GhN4kH+1n/Su0dbONVytayO4iz1UGAa80SY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qYYnZCdbx4a+Dp0zngy2f8ojGkpc0n9eICkWYSBMEkINaswgAz7grZVo7gDvifAnQ
	 PyLKljssI1Ry3G+aPoiL6AaYbPUuRzakQXnLPOz5jsMYsqC5io3kb0q9enBDP8rIbm
	 c6zYrx2mS0UZgZlvaPxPW03Ntl7B8Ao4T7NvngYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94EEBF800FB;
	Wed, 25 Jan 2023 19:34:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 410CEF80424; Wed, 25 Jan 2023 19:34:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2213F80163
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 19:34:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2213F80163
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ThXHZj4p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674671691; x=1706207691;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WFoJYI40GhN4kH+1n/Su0dbONVytayO4iz1UGAa80SY=;
 b=ThXHZj4pgVSZlXgthHIpQvpCsUm3bdxY1bxfCQChyGBkl8pOkqyOX3/s
 D++6+rITiHQBlVoJAGjpH/MO6tuE+54faYQDSNdOc2uzPB1bR7hdyE+25
 9FAd3RCELfDXYAKtiOjdDAdPUP+owRpP7a+bp5jzP+Hco8ppRpub8giCn
 wrndOC8pD03FDQtsLS1Vc4CImJkSkZoOPh54M5n49W4AvJ3OdZ/fVgaSm
 SHki+Dsf6fAJo8gsCA4nZjS/ThG8Bwusi8OdBF/XFzX86jNB/LgHBWPdu
 TCRbFef+O4ZOpvDtGNWul6iY/LOQ2Mwc/X07uC4r6k3qEIrMmdTzDpzwl g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="306984908"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="306984908"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 10:34:44 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="907969301"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="907969301"
Received: from bshunt-mobl.amr.corp.intel.com (HELO [10.212.37.80])
 ([10.212.37.80])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 10:34:44 -0800
Message-ID: <971a9d17-58ec-3655-6cc4-42c59da6e0af@linux.intel.com>
Date: Wed, 25 Jan 2023 12:34:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: struct snd_pcm_ops callbacks
Content-Language: en-US
To: Muni Sekhar <munisekharrms@gmail.com>
References: <CAHhAz+gxrjB04c-GHa1YzahyKDQcW3+xoDt9iUnkj9THKvG_TA@mail.gmail.com>
 <53e3919e-48cc-81a0-365e-015235d10c9b@linux.intel.com>
 <CAHhAz+gTrToehWki8h17DdR_u8uKmRPsDWeEygijpm51MLvz1g@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CAHhAz+gTrToehWki8h17DdR_u8uKmRPsDWeEygijpm51MLvz1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/25/23 12:06, Muni Sekhar wrote:
> On Wed, Jan 25, 2023 at 8:30 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>>
>>
>>
>> On 1/25/23 05:21, Muni Sekhar wrote:
>>> Hi,
>>>
>>> struct snd_pcm_ops callbacks can be used for sending\receiving PDM
>>> audio data to and from a sound card? Or is it only designed for PCM
>>> audio data?
>>
>> It depends what side of the sound card you are looking at, the physical
>> interface with external devices or the userspace interface.
> I am looking at the userspace interface side.

that's not possible without some sort of formatting of 1-bit audio in
bytes or more likely 24/32-bit words that look like PCM and can be
handled by existing DMA/FIFO hardware. That solution works for HDMI/DP
and USB.

>> PDM can be supported at the physical interface level as long as there is
>> a conversion to PCM somewhere in the hardware. Userspace will
>> play/record PCM. See examples in many codecs and SOCs.
>>
>> There is also the possibility of packing PDM (aka DSD) as pseudo-PCM,
>> that's a trick used by several USB cards. In that case of course the
>> sound card cannot apply any processing to the data and is just a
>> pass-through module.
>>
>>
> 
> 
