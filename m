Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D985A940E39
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 11:47:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A65DEC0;
	Tue, 30 Jul 2024 11:47:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A65DEC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722332876;
	bh=n+bDskUWnn1bpt3i1mkDbx3XQvcnjEMr1Kdl+ZZWL1E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZFKv5knDPijixJK8s5QIz/4iK8NoiZQtcKYN4pun1LaKvL4xNnqYlW9L33wAZRjKx
	 mtrHRbQMCOIPETGkzIgz33nM66hyOP9XaqPmRdNA6GFE37dvaICGww4x+XG8POmb+y
	 Aag9ZvBek+OEx75Y23lpL8aaEDyCg9evZQml4gsk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28A58F805AB; Tue, 30 Jul 2024 11:47:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66001F8057A;
	Tue, 30 Jul 2024 11:47:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2676AF802DB; Tue, 30 Jul 2024 11:44:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47B70F800C9
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 11:43:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47B70F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WHmQND9f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722332642; x=1753868642;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=n+bDskUWnn1bpt3i1mkDbx3XQvcnjEMr1Kdl+ZZWL1E=;
  b=WHmQND9ffCfoZ3Bed6Jlp/bTDHkw7dW41X3RVQ86sQgNDFNSeFG7+XMq
   G8veSUVXJvyGAsbN8zt2dV0Pj3Pq4oIR+iQVEBnQm7wKA3fZi4vAWotug
   EgVccPwHUTGdtOnDrywTzLe0j/fbTuUm3gx6TZffrtOQY2uMhXU0wc/j6
   0Ah/BfFdngN2JJWAgWGmfNlI5ICrgcFn/ACtgRLOy9ilqh2i7kxnXe25L
   QBOHi56IsgFksqr5Yv2odG0eHTU8Pv8Tiokz8LpBcqCSQLtfVc9AasEll
   Nu7Wvh7mLvOnx8JccxplKab0/LDAGJK6gvtfRCQloWN7rPGli9rolSwey
   g==;
X-CSE-ConnectionGUID: VNJ1iLWtQdO+JM91zt6G+w==
X-CSE-MsgGUID: Dr6uK1wrTq67ndnJ59hKQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31545731"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800";
   d="scan'208";a="31545731"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 02:43:58 -0700
X-CSE-ConnectionGUID: pew9M1btT9Ce452/apMdbw==
X-CSE-MsgGUID: ShtEv/XbR2+cJhrDgLtQlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800";
   d="scan'208";a="54191390"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.246.40])
 ([10.245.246.40])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 02:43:55 -0700
Message-ID: <d3d4e197-285a-49d9-8c1b-f718cd1f30d7@linux.intel.com>
Date: Tue, 30 Jul 2024 11:43:53 +0200
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
 <048122b2-f4cc-4cfa-a766-6fcfb05f840a@linux.intel.com>
 <9b916fb9-84ac-4574-8f3d-aad2f539fcd0@linaro.org>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <9b916fb9-84ac-4574-8f3d-aad2f539fcd0@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7GNDBRJAVZVGPYEPIVZT7XAP7OBUM4V5
X-Message-ID-Hash: 7GNDBRJAVZVGPYEPIVZT7XAP7OBUM4V5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7GNDBRJAVZVGPYEPIVZT7XAP7OBUM4V5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/30/24 11:29, Krzysztof Kozlowski wrote:
> On 30/07/2024 11:28, Pierre-Louis Bossart wrote:
>>>
>>>>
>>>> So if ports can be either source or sink, I am not sure how the
>>>> properties could be shared with a single array?
>>>
>>> Because I could, just easier to code. :) Are you saying the code is not
>>> correct? If I understand the concept of source/sink dpn port mask, it
>>> should be correct. I have some array with source and sink ports. I pass
>>> it to Soundwire with a mask saying which ports are source and which are
>>> sink.
>>>
>>>>
>>>> Those two lines aren't clear to me at all:
>>>>
>>>> 	pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;
>>>> 	pdev->prop.src_dpn_prop = wsa884x_sink_dpn_prop;
>>>
>>> I could do: s/wsa884x_sink_dpn_prop/wsa884x_dpn_prop/ and expect the
>>> code to be correct.
>>
>> Ah I think I see what you are trying to do, you have a single dpn_prop
>> array but each entry is valid for either sink or source depending on the
>> sink / source_mask which don't overlap.
>>
>> Did I get this right?
> 
> Yes, correct.

Sounds good, thanks for the explanations.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

