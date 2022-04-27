Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B45511256
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 09:27:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A65E917E0;
	Wed, 27 Apr 2022 09:26:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A65E917E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651044436;
	bh=2/IRGZCMyAEwQk5AnwH4BPYPn0JlnnUPyH5HN+F/tJY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hcLiD1+N5DomIKcL1PZDB8MOf/UKploYSUAV5FWU8t7Pru6DcbTlUJvlDpIvjOw7J
	 b2QKdzbsIEXx1IyqrLs8Gz/dJqoK7UibvpEvP4+HmhhUQyJB7NG3owCN5GVFFeYtx4
	 wv0aKh0tq3JPcb0rVtMH2Yi2uBcxk3LlJihAlsrY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C170F80256;
	Wed, 27 Apr 2022 09:26:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E1BBF8016E; Wed, 27 Apr 2022 09:26:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2230F800AE;
 Wed, 27 Apr 2022 09:26:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2230F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RNtGq4ms"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651044373; x=1682580373;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2/IRGZCMyAEwQk5AnwH4BPYPn0JlnnUPyH5HN+F/tJY=;
 b=RNtGq4msUMUThDhUlTvXx0YroSa5f54AJpnX5pTzhCPBQ4wu/oLMU+fe
 684qeZImDk3xYk57Gj9QaNuF+/Oxsgh63uGr83j3qZgT2CD/s2cpJe5q+
 PGrVOfrQopsCjOHLDggLCRO8wLCqbDo49ZUjTTgbE2D2p+PQF28fKg4Cc
 5Z9w7aNCEleyUHNpWreTu/an9FdRxXasVA2bXbM8/aZpEgfirg7PXBf1y
 pXIw0Seu4nPMSqjiU4BDID0YtA2jkph4faSXhqrLmanq3QE92jDnBHIFA
 ugM6sjQ3Evr5HIU7dLdnTPIHPtuTl2iXMVurUw5gXlYH2qSa2OQo8dTB3 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="328788818"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="328788818"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 00:26:07 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="705424932"
Received: from rdegreef-mobl1.ger.corp.intel.com (HELO [10.252.32.27])
 ([10.252.32.27])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 00:26:04 -0700
Message-ID: <e349e9ca-7a4f-8d65-3ade-5ac4dfd5700a@linux.intel.com>
Date: Wed, 27 Apr 2022 10:26:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: out-of-bounds access in sound/soc/sof/topology.c
Content-Language: en-US
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <Ylk5o3EC/hyX5UQ0@google.com>
 <8eeb08ec-4836-cf7d-2285-8ed74ccfc1cb@linux.intel.com>
 <8986a1c6-b546-7a66-a778-048487624c95@linux.intel.com>
 <e31ff7c4-7cdc-fdaf-b12c-fc1e51798a1b@linux.intel.com>
 <Ymjo1aHD4V6bNHz7@google.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <Ymjo1aHD4V6bNHz7@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Ricardo Ribalda <ribalda@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
 Jaska Uimonen <jaska.uimonen@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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



On 27/04/2022 09:55, Sergey Senozhatsky wrote:
> On (22/04/19 08:07), Pierre-Louis Bossart wrote:
>>> Your analyzes are spot on, unfortunately. But...
>>>
>>> As of today, the sof_get_control_data() is in the call path of
>>> (ipc3-topology.c):
>>>
>>> sof_widget_update_ipc_comp_process() -> sof_process_load() ->
>>> sof_get_control_data()
>>>
>>> sof_widget_update_ipc_comp_process() is the ipc_setup callback for
>>> snd_soc_dapm_effect. If I'm not mistaken these only carries bin payload
>>> and never MIXER/ENUM/SWITCH/VOLUME.
>>> This means that the sof_get_control_data() is only called with
>>> SND_SOC_TPLG_TYPE_BYTES and for that the allocated data area is correct.
>>>
>>> This can explain why we have not seen any issues so far. This does not
>>> renders the code right, as how it is written atm is wrong.
>>
>>
>> Sergey's results with KASAN show that there's a real-life problem though. I also don't understand how that might happen.
>>
>> Could it be that these results are with a specific topology where our assumptions are incorrect?
> 
> Is there anything I can do to help?

I will send a patch shortly, I think it is going to be easy to backport
for you and test it.

-- 
Péter
