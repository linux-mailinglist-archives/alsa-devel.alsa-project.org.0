Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4904229FBD
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 21:00:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 346B91657;
	Wed, 22 Jul 2020 21:00:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 346B91657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595444458;
	bh=1+5giqJxmqUEEQjjQ6pcWWIu4TEqcIJn4C21ZpM5fiw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jAVaHpotU+d4ZJ9x23pk3w9el2xZYKGCnpGDmUGwjAOuf5tm+XvvMR25kpmqkKjZD
	 TAwV68R8usxY+FfUqbZLGHbfMaYUMvU4Dff8APOGmEmCUl/K6NvybQV5wDbuWim4an
	 jg7PsgjsoosJ/2EiBesf/TqDGNDss1RDjW7By7Vg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50FF7F800CE;
	Wed, 22 Jul 2020 20:59:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FED2F8014C; Wed, 22 Jul 2020 20:59:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4B47F800CE
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 20:59:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4B47F800CE
IronPort-SDR: nCOXsoSOdgxt3xQnbPURKfDysjgsN4He70L2+PsMpAAVY/3y71s/QzC/AcNKQeMsIlFzSE6BxG
 KUZpGXXZlGlw==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="129970113"
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; d="scan'208";a="129970113"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 11:59:07 -0700
IronPort-SDR: bBqd56HJe+NmVFrt+eeHg7uxSh0BHu5L+2+QWjeZ+AFr7fh8yr0p4IPe+mexTiTddqsbAqvR8u
 z1up+DOAvdRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; d="scan'208";a="310737918"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.22.112])
 ([10.213.22.112])
 by fmsmga004.fm.intel.com with ESMTP; 22 Jul 2020 11:59:06 -0700
Subject: Re: [PATCH] ASoC: Intel: skl_hda_dsp_generic: Fix NULLptr dereference
 in autosuspend delay
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200722173524.30161-1-mateusz.gorski@linux.intel.com>
 <2674621e-1546-3048-3ba2-f8fe1265d6e1@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <014d8a2f-1ba7-1872-73b2-2384d908de79@intel.com>
Date: Wed, 22 Jul 2020 20:59:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2674621e-1546-3048-3ba2-f8fe1265d6e1@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, tiwai@suse.com,
 Mateusz Gorski <mateusz.gorski@linux.intel.com>
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

On 2020-07-22 8:24 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 7/22/20 12:35 PM, Mateusz Gorski wrote:
>> Different modules for HDMI codec are used depending on the
>> "hda_codec_use_common_hdmi" option being enabled or not. Driver private
>> context for both of them is different.
>> This leads to null-pointer dereference error when driver tries to set
>> autosuspend delay for HDMI codec while the option is off (hdac_hdmi
>> module is used for HDMI).
>>
>> Change the string in conditional statement to "ehdaudio0D0" to ensure
>> that only the HDAudio codec is handled by this function.
> 
> I am not sure this is correct.
> 
> I may be wrong, but my understanding is the following:
> 
> Before 5bf73b1b1dec, the driver would use the first dailink of the card, 
> and in the case of devices without an HDaudio codec (e.g. Up2 board) it 
> would set the auto suspend delay using that first dailink. See the code 
> in skl_hda_fill_card_info(), it reorders the dailinks when HDaudio 
> codecs are not present so if you test for 'edhaudio00' you no longer 
> allow for this HDMI-only case to be handled with autosuspend.
> 
> Kai would need to review this, so this will have to wait I am afraid.
> 

So, for_each_card_rtds needs to be context aware (hdmi type). Right now, 
introduced _autosuspend_delay is causing kernel panics.
