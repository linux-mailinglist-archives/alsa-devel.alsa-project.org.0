Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B557818776
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 13:28:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57CAADF6;
	Tue, 19 Dec 2023 13:28:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57CAADF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702988897;
	bh=XjeWIz1mpH5jVwObJLbapYiqEsmu7EHDGU47gm/OWGM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SfuqHTnKVF3PoE3mxjlqdo6lHopy4dAu7TLjANAQuHEyBM+qlm60vwRBGKpnum3ZO
	 yVdjlzYX/Qle66cA8MtWIK/HbvtbWb1NS7NHy6pyUcRYa7i+gMqFwpA7Xt2mRMFxFm
	 X+TVPDM4ff5TSvii3AZyXiU+9E341OaD27AkgtF8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6A53F805AC; Tue, 19 Dec 2023 13:27:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2FE2F805BA;
	Tue, 19 Dec 2023 13:27:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 898DFF80431; Tue, 19 Dec 2023 13:27:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23DEFF8016E
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 13:27:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23DEFF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dZqrKNkf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702988841; x=1734524841;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XjeWIz1mpH5jVwObJLbapYiqEsmu7EHDGU47gm/OWGM=;
  b=dZqrKNkfYZioqL4xwh9kUgdOOreQ5ODYYHRALVvCt6IbZRfSaOOKwN1o
   /yI1G0GUVny9j4cIzswxB1MVqIrfzyHLeUU/nr6atHGhYTBLXiWoWGBkT
   aR8whR0jAQBjktePhlT8qLRy8Q+Nn1QVeM5P0affmafWGR4HDSRlmA2gB
   2Y4OBEgRddMn3lQup1YNjt4G47DK49tqoFGs6nIV7zRQBnKpFAFIG4Y69
   Xf5KWnWB5edGQfuWX5Yll1Zx0Mbp4cpeR2iCVSK7I8ekDd8sjPFKPdCl3
   1/huLRdLBSXstgbME6kIz5ZLOxCZGoc1FnjiSUud34530cdGIcBJslklX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="14338248"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600";
   d="scan'208";a="14338248"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 04:27:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="1107335187"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600";
   d="scan'208";a="1107335187"
Received: from hierlema-mobl.ger.corp.intel.com (HELO [10.252.34.230])
 ([10.252.34.230])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 04:27:14 -0800
Message-ID: <884fa264-8d6b-4ac2-af57-b6fc07040361@linux.intel.com>
Date: Mon, 18 Dec 2023 17:44:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/16] soundwire: bus: add API for BPT protocol
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, tiwai@suse.de, broonie@kernel.org,
 vinod.koul@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, srinivas.kandagatla@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 vijendar.mukunda@amd.com, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-8-pierre-louis.bossart@linux.intel.com>
 <ZYAy9ZM0o3uAk2qY@matsya>
 <4f66f792-79c0-4221-82b5-a0d9ec5a898b@linux.intel.com>
 <20231218145716.GA14858@ediswmail.ad.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231218145716.GA14858@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QBOOKLDBGXANWEPIA4RAQBLSGQDUNC3X
X-Message-ID-Hash: QBOOKLDBGXANWEPIA4RAQBLSGQDUNC3X
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QBOOKLDBGXANWEPIA4RAQBLSGQDUNC3X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/18/23 08:57, Charles Keepax wrote:
> On Mon, Dec 18, 2023 at 02:12:36PM +0100, Pierre-Louis Bossart wrote:
>>> Is this a protocol requirement?
>>
>> No, it's an implementation requirement.
>>
>> We could move this to host-specific parts but then the codec drivers
>> will have to know about alignment requirements for each host they are
>> use with. IOW, it's more work for codec drivers if we don't have a
>> minimum bar for alignment requirement across all platforms.
>>
> 
> I do certainly see that side of the argument and it does probably
> warrant some thought as to how a slave might learn the alignment
> requirements. I guess maybe some sort of core helper function to
> return the alignment? Or putting it in properties the slave can
> access? One could even keep the check here, but just pull the
> value from something system specific.
> 
> The danger with putting it in the core is IMHO:
> 
> a) It rules out certain use-cases, generally I think its a bad
> idea if the framework design prohibits stuff the underlying bus
> could do because someone will, at some point, want to do it.

SoundWire has lots of fancy and borderline nebulous concepts, my take is
"let's do few things and do them well". We can always revisit new usages
later, for now my main objective is "speed up downloads".

> b) The core limit could get a bit out of hand once more
> controllers are added. The core limit needs to be a multiple of
> all the controller limits, if a controller comes along with a
> weird alignment requirement, that gets problematic fast.

I don't have any information on other controllers, but I wouldn't be
surprised if most of the quirks are due to peripheral limitations and
ambiguous interpretations of what 'ACK' means. I tried writing to
reserved parts of the memory or non-existent registers and nothing bad
was reported...
