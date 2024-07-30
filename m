Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9A0940DE7
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 11:38:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD9A8A4D;
	Tue, 30 Jul 2024 11:38:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD9A8A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722332306;
	bh=FTZPCGs19HrWuOXGCtCh9HJCvH3o9m5VKj2oA581aUI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SfwBxqy/3twBeyu3h/cAN8SBvXAz9Fq19jXj9qLhXSUGjGde6grtSegkavzbfQ7wT
	 w8sJzteZcJR95r2iktXZdL0GfTb60JimaasVUUgimShghlkNDsHt4Uf/3K/E5a/PPv
	 KPvCszwGn4wU7i19B8+f+dRWjLYh2NWhg381bW44=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6A54F805A0; Tue, 30 Jul 2024 11:37:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B03A6F800E3;
	Tue, 30 Jul 2024 11:37:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82756F802DB; Tue, 30 Jul 2024 11:29:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0345EF800E3
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 11:28:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0345EF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=e5wRL+En
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722331727; x=1753867727;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FTZPCGs19HrWuOXGCtCh9HJCvH3o9m5VKj2oA581aUI=;
  b=e5wRL+En3QwYZ8l2nvTZLKgOwK1vcldV8FpKxeVOVc52r8Re0pLkIq1D
   AG3RgheC43LJxQdRgw7iKbceIG+FS5abwZ96yYY7VJAlmkI1tJn/z+GSt
   CLfXpmft8xKgP7q5oZtveu4lftSO/hr0iQzFn6l8zgdBj33GL+S1oUlNW
   CTjOn/Ob1u5v3ypgfi1uyM130t5/VOnCbkAINYHArw/WLnyaDtHAGViM2
   8tHC+JF4VtBGkspmL3ZUmMOxQR3kNFoiH2ScJ2iGdOn/ZqF5h3n7BbN+C
   VDBK6W8VOB2nvxgysOOXVuH3Xhp/zsjosvz5RI0KwWlZThN6wIGeshgU+
   A==;
X-CSE-ConnectionGUID: 4PF7q/9lQASM0gDseUMR4A==
X-CSE-MsgGUID: bICNCm0DRE6nSndClrNn1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="30798417"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800";
   d="scan'208";a="30798417"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 02:28:44 -0700
X-CSE-ConnectionGUID: 0UWqluEYSc6AIJUsE5rrmg==
X-CSE-MsgGUID: 4q8DWr3YR9u5Cc6l/nkC3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800";
   d="scan'208";a="58603633"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.246.40])
 ([10.245.246.40])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 02:28:41 -0700
Message-ID: <048122b2-f4cc-4cfa-a766-6fcfb05f840a@linux.intel.com>
Date: Tue, 30 Jul 2024 11:28:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: stream: fix programming slave ports for
 non-continous port maps
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Shreyas NC <shreyas.nc@intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20240729140157.326450-1-krzysztof.kozlowski@linaro.org>
 <095d7119-8221-450a-9616-2df6a0df4c77@linux.intel.com>
 <22b20ad7-8a25-4cb2-a24e-d6841b219977@linaro.org>
 <dc66cd0d-6807-4613-89a8-296ce5dd2daf@linaro.org>
 <62280458-3e74-43b0-b9a1-84df09abd30e@linux.intel.com>
 <7171817f-e8c6-4828-8423-0929644ff2df@linaro.org>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <7171817f-e8c6-4828-8423-0929644ff2df@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 65P3MVNZJMOST3QTD3YZXURYUR5LU7NV
X-Message-ID-Hash: 65P3MVNZJMOST3QTD3YZXURYUR5LU7NV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/65P3MVNZJMOST3QTD3YZXURYUR5LU7NV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/30/24 11:19, Krzysztof Kozlowski wrote:
> On 30/07/2024 10:59, Pierre-Louis Bossart wrote:
>>>>>
>>>>> 	/* Read dpn properties for source port(s) */
>>>>> 	sdw_slave_read_dpn(slave, prop->src_dpn_prop, nval,
>>>>> 			   prop->source_ports, "source");
>>>>>
>>>>> IOW, this is a valid change, but it's an optimization, not a fix in the
>>>>> usual sense of 'kernel oops otherwise'.
>>>>>
>>>>> Am I missing something?
>>>>>
>>>>> BTW, the notion of DPn is that n > 0. DP0 is a special case with
>>>>> different properties, BIT(0) cannot be set for either of the sink/source
>>>>> port bitmask.
>>>>
>>>> I think we speak about two different things. port num > 1, that's
>>>> correct. But index for src_dpn_prop array is something different. Look
>>>> at mipi-disco sdw_slave_read_dpn():
>>>>
>>>> 173         u32 bit, i = 0;
>>>> ...
>>>> 178         addr = ports;
>>>> 179         /* valid ports are 1 to 14 so apply mask */
>>>> 180         addr &= GENMASK(14, 1);
>>>> 181
>>>> 182         for_each_set_bit(bit, &addr, 32) {
>>>> ...
>>>> 186                 dpn[i].num = bit;
>>>>
>>>>
>>>> so dpn[0..i] = 1..n
>>>> where i is also the bit in the mask.
>>
>> yes, agreed on the indexing.
>>
>> But are we in agreement that the case of non-contiguous ports would not
>> create any issues? the existing code is not efficient but it wouldn't
>> crash, would it?
>>
>> There are multiple cases of non-contiguous ports, I am not aware of any
>> issues...
>>
>> rt700-sdw.c:    prop->source_ports = 0x14; /* BITMAP: 00010100 */
>> rt711-sdca-sdw.c:       prop->source_ports = 0x14; /* BITMAP: 00010100
>> rt712-sdca-sdw.c:       prop->source_ports = BIT(8) | BIT(4);
>> rt715-sdca-sdw.c:       prop->source_ports = 0x50;/* BITMAP: 01010000 */
>> rt722-sdca-sdw.c:       prop->source_ports = BIT(6) | BIT(2); /* BITMAP:
>> 01000100 */
>>
>> same for sinks:
>>
>> rt712-sdca-sdw.c:       prop->sink_ports = BIT(3) | BIT(1); /* BITMAP:
>> 00001010 */
>> rt722-sdca-sdw.c:       prop->sink_ports = BIT(3) | BIT(1); /* BITMAP:
>> 00001010 */
> 
> All these work because they have separate source and sink dpn_prop
> arrays. Separate arrays, separate number of ports, separate masks - all
> this is good. Now going to my code...
> 
>>
>>>> Similar implementation was done in Qualcomm wsa and wcd codecs like:
>>>> array indexed from 0:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/codecs/wcd938x-sdw.c?h=v6.11-rc1#n51
>>>>
>>>> genmask from 0, with a mistake:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/codecs/wcd938x-sdw.c?h=v6.11-rc1#n1255
>>>>
>>>> The mistake I corrected here:
>>>> https://lore.kernel.org/all/20240726-asoc-wcd-wsa-swr-ports-genmask-v1-0-d4d7a8b56f05@linaro.org/
>>>>
>>>> To summarize, the mask does not denote port numbers (1...14) but indices
>>>> of the dpn array which are from 0..whatever (usually -1 from port number).
>>>>
>>>
>>> Let me also complete this with a real life example of my work in
>>> progress. I want to use same dpn_prop array for sink and source ports
>>> and use different masks. The code in progress is:
>>>
>>> https://git.codelinaro.org/krzysztof.kozlowski/linux/-/commit/ef709a0e8ab2498751305367e945df18d7a05c78#6f965d7b74e712a5cfcbc1cca407b85443a66bac_2147_2157
>>>
>>> Without this patch, I get -EINVAL from sdw_get_slave_dpn_prop():
>>>   soundwire sdw-master-1-0: Program transport params failed: -2
>>
>> Not following, sorry. The sink and source masks are separate on purpose,
>> to allow for bi-directional ports. The SoundWire spec allows a port to
>> be configured at run-time either as source or sink. In practice I've
>> never seen this happen, all existing hardware relies on ports where the
>> direction is hard-coded/fixed, but still we want to follow the spec.
> 
> The ports are indeed hard-coded/fixed.
> 
>>
>> So if ports can be either source or sink, I am not sure how the
>> properties could be shared with a single array?
> 
> Because I could, just easier to code. :) Are you saying the code is not
> correct? If I understand the concept of source/sink dpn port mask, it
> should be correct. I have some array with source and sink ports. I pass
> it to Soundwire with a mask saying which ports are source and which are
> sink.
> 
>>
>> Those two lines aren't clear to me at all:
>>
>> 	pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;
>> 	pdev->prop.src_dpn_prop = wsa884x_sink_dpn_prop;
> 
> I could do: s/wsa884x_sink_dpn_prop/wsa884x_dpn_prop/ and expect the
> code to be correct.

Ah I think I see what you are trying to do, you have a single dpn_prop
array but each entry is valid for either sink or source depending on the
sink / source_mask which don't overlap.

Did I get this right?

