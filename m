Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F9C60F5F0
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 13:09:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E876F307D;
	Thu, 27 Oct 2022 13:08:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E876F307D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666868974;
	bh=VfVKyp1Dxs5WMcZ0NytyalV/nlR49XyBEGLjnKFSn78=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TT3/3LCPBGyKZz9Ap6S6WvQ7LAsNbx2fJzYlYQonhHpbKkpi6DFiHfCTYhl6oMi0O
	 4Po8OfINGq3y/yFkLRVlwWm5P0MbbE0cqFBDBBcu6r6p6X5BrsY12l5beGAJw8tmrK
	 BGqNXG2g0EVxcTzODvK9jDEcAQKQ/5xLwcZoifRc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 683F7F80100;
	Thu, 27 Oct 2022 13:08:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 370D2F8025E; Thu, 27 Oct 2022 13:08:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0CB5F8016C
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 13:08:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0CB5F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Q0Y6yvzc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666868914; x=1698404914;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VfVKyp1Dxs5WMcZ0NytyalV/nlR49XyBEGLjnKFSn78=;
 b=Q0Y6yvzcrBMyHMcEaMTzxmFz5S1EIoBwyRSq/8GgFnhKeiiPok/d/tNf
 kJgKwO5lmx8a/4o4gE0w/HhZn21+hQPqBFOMw8uQcLkNzI3A25gumlprB
 OtqJPmfjtXdZVhiQGHTBx/4ig4ksI2IqJVlzbelGeiuXgGFRyj9F5FRcb
 TML+8P+ln+jPBCNTL/X+lYnzTa+h4i8Ow1aJV/9ZpxHKm9sE/W/9bIBNG
 C0PgezY8oVhhnsxaaR20MNlvltbDLIeaqmzLc+cZVswK1kZxxAcZDvGg9
 0508eFstui2eFoOxbr72gucH2X+OboT/oLt/FwFzlN5vMlnH/6PPP/rzG Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="291497109"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="291497109"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 04:08:30 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="665642358"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="665642358"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.18])
 ([10.99.241.18])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 04:08:28 -0700
Message-ID: <5b7879f6-a15b-919a-842b-42617934aea3@linux.intel.com>
Date: Thu, 27 Oct 2022 13:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 3/9] ALSA: hda: Introduce snd_hdac_stream_wait_drsm()
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20221027082331.1561740-1-cezary.rojewski@intel.com>
 <20221027082331.1561740-4-cezary.rojewski@intel.com>
 <874jvpo9by.wl-tiwai@suse.de>
 <3977c2b3-ead3-3904-820a-d602aa04c51b@linux.intel.com>
 <87zgdhmsqa.wl-tiwai@suse.de>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87zgdhmsqa.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
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

On 10/27/2022 1:05 PM, Takashi Iwai wrote:
> On Thu, 27 Oct 2022 12:29:35 +0200,
> Amadeusz Sławiński wrote:
>>
>> On 10/27/2022 12:21 PM, Takashi Iwai wrote:
>>> On Thu, 27 Oct 2022 10:23:25 +0200,
>>> Cezary Rojewski wrote:
>>>> --- a/sound/hda/hdac_stream.c
>>>> +++ b/sound/hda/hdac_stream.c
>>>> @@ -821,6 +821,27 @@ void snd_hdac_stream_drsm_enable(struct hdac_bus *bus,
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(snd_hdac_stream_drsm_enable);
>>>>    +/*
>>>> + * snd_hdac_stream_wait_drsm - wait for HW to clear RSM for a stream
>>>> + * @azx_dev: HD-audio core stream to await RSM for
>>>> + *
>>>> + * Returns 0 on success and -ETIMEDOUT upon a timeout.
>>>> + */
>>>> +int snd_hdac_stream_wait_drsm(struct hdac_stream *azx_dev)
>>>> +{
>>>> +	struct hdac_bus *bus = azx_dev->bus;
>>>> +	u32 mask, reg;
>>>> +	int ret;
>>>> +
>>>> +	mask = 1 << azx_dev->index;
>>>> +
>>>> +	ret = readb_poll_timeout(bus->drsmcap + AZX_REG_DRSM_CTL, reg, !(reg & mask), 250, 2000);
>>>
>>> Remember that HD-audio bus doesn't always allow readb().  Tegra
>>> requires the aligned access, for example.
>>>
>>
>> The readb_poll_timeout macro was updated to take care of that,
>> https://lore.kernel.org/all/20221007084856.1638302-1-amadeuszx.slawinski@linux.intel.com/
>> so it should be fine?
> 
> This patch doesn't use that macro...
> 

Ah... right, sorry for confusion, I looked at diff part instead of macro 
name.
