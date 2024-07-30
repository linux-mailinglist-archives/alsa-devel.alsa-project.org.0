Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D63940CB6
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 11:01:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7C13E66;
	Tue, 30 Jul 2024 11:01:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7C13E66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722330077;
	bh=UoLFiRXLnSzQFz3vQxHApNbca+UPgWp52jw1xG/qCOc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=feA5KR5k4BzVY1ekndAgu8Ri2C2FhqR8fQqCMCy2l5tF9tdtYRfCdifagAszgdtxW
	 fL0lIJVdv+Xw3d13DC7TyahXiaRP0OlqXwzo+NaBH1De3cn0FAor5HymjBe/ZFd3dh
	 XvI7ojhSbtEizcI+hPAvAMqoNmjlrqvlvz9uBxcM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36F4EF805B6; Tue, 30 Jul 2024 11:00:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F335F805AF;
	Tue, 30 Jul 2024 11:00:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DFA2F802DB; Tue, 30 Jul 2024 11:00:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE90FF80269
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 10:59:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE90FF80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dclBNxgc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722329993; x=1753865993;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UoLFiRXLnSzQFz3vQxHApNbca+UPgWp52jw1xG/qCOc=;
  b=dclBNxgcUvVOPi4WeNUzh1p1zKHgqvHy/MSRVCBdLXeSzIDdJbsU7uLR
   om0MUGM3c+A3UrdaCBF15KVCOFyO8+jQ6o15guXXx+GJi53yLB6CX/0fO
   BqoLf2Ki1e8+nfLHUG7FO2+teW6wUayAAm1NRb1sIEF7/ng7IXqw4cenX
   iVlBHRybEMq5fsFQ/6G5qjJ+lH8L/wECX67oXMye9qhd7t2OeGh2znoZF
   fTIBc/XQxt+bhNNrqPMBkWIbAJjVFvdF9JQ20ZWyzcbhAzySq/H4YwZ80
   387yEscAJRdlfXDmPgcXb31ZdoER3xZOgnZ41hxZ1idqDV/M3zmQraNar
   Q==;
X-CSE-ConnectionGUID: EXElRjpoQxK/m40DFLaUJA==
X-CSE-MsgGUID: o/rvvvY6QSyRaxyHrN4osQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23893707"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800";
   d="scan'208";a="23893707"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 01:59:49 -0700
X-CSE-ConnectionGUID: 53BEnqcuT4uuBZiTGV0yGg==
X-CSE-MsgGUID: SxIeXmWdSMSPNv+Hi2iRcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800";
   d="scan'208";a="58407084"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.246.40])
 ([10.245.246.40])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 01:59:45 -0700
Message-ID: <62280458-3e74-43b0-b9a1-84df09abd30e@linux.intel.com>
Date: Tue, 30 Jul 2024 10:59:42 +0200
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
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <dc66cd0d-6807-4613-89a8-296ce5dd2daf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6QAG4TN2ZDV2PVQ5QV5S5XWFWKYCGQIR
X-Message-ID-Hash: 6QAG4TN2ZDV2PVQ5QV5S5XWFWKYCGQIR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6QAG4TN2ZDV2PVQ5QV5S5XWFWKYCGQIR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/30/24 10:39, Krzysztof Kozlowski wrote:
> On 30/07/2024 10:23, Krzysztof Kozlowski wrote:
>> On 29/07/2024 16:25, Pierre-Louis Bossart wrote:
>>>
>>>
>>> On 7/29/24 16:01, Krzysztof Kozlowski wrote:
>>>> Two bitmasks in 'struct sdw_slave_prop' - 'source_ports' and
>>>> 'sink_ports' - define which ports to program in
>>>> sdw_program_slave_port_params().  The masks are used to get the
>>>> appropriate data port properties ('struct sdw_get_slave_dpn_prop') from
>>>> an array.
>>>>
>>>> Bitmasks can be non-continuous or can start from index different than 0,
>>>> thus when looking for matching port property for given port, we must
>>>> iterate over mask bits, not from 0 up to number of ports.
>>>>
>>>> This fixes allocation and programming slave ports, when a source or sink
>>>> masks start from further index.
>>>>
>>>> Fixes: f8101c74aa54 ("soundwire: Add Master and Slave port programming")
>>>> Cc: <stable@vger.kernel.org>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> This is a valid change to optimize how the port are accessed.
>>>
>>> But the commit message is not completely clear, the allocation in
>>> mipi_disco.c is not modified and I don't think there's anything that
>>> would crash. If there are non-contiguous ports, we will still allocate
>>> space that will not be initialized/used.
>>>
>>> 	/* Allocate memory for set bits in port lists */
>>> 	nval = hweight32(prop->source_ports);
>>> 	prop->src_dpn_prop = devm_kcalloc(&slave->dev, nval,
>>> 					  sizeof(*prop->src_dpn_prop),
>>> 					  GFP_KERNEL);
>>> 	if (!prop->src_dpn_prop)
>>> 		return -ENOMEM;
>>>
>>> 	/* Read dpn properties for source port(s) */
>>> 	sdw_slave_read_dpn(slave, prop->src_dpn_prop, nval,
>>> 			   prop->source_ports, "source");
>>>
>>> IOW, this is a valid change, but it's an optimization, not a fix in the
>>> usual sense of 'kernel oops otherwise'.
>>>
>>> Am I missing something?
>>>
>>> BTW, the notion of DPn is that n > 0. DP0 is a special case with
>>> different properties, BIT(0) cannot be set for either of the sink/source
>>> port bitmask.
>>
>> I think we speak about two different things. port num > 1, that's
>> correct. But index for src_dpn_prop array is something different. Look
>> at mipi-disco sdw_slave_read_dpn():
>>
>> 173         u32 bit, i = 0;
>> ...
>> 178         addr = ports;
>> 179         /* valid ports are 1 to 14 so apply mask */
>> 180         addr &= GENMASK(14, 1);
>> 181
>> 182         for_each_set_bit(bit, &addr, 32) {
>> ...
>> 186                 dpn[i].num = bit;
>>
>>
>> so dpn[0..i] = 1..n
>> where i is also the bit in the mask.

yes, agreed on the indexing.

But are we in agreement that the case of non-contiguous ports would not
create any issues? the existing code is not efficient but it wouldn't
crash, would it?

There are multiple cases of non-contiguous ports, I am not aware of any
issues...

rt700-sdw.c:    prop->source_ports = 0x14; /* BITMAP: 00010100 */
rt711-sdca-sdw.c:       prop->source_ports = 0x14; /* BITMAP: 00010100
rt712-sdca-sdw.c:       prop->source_ports = BIT(8) | BIT(4);
rt715-sdca-sdw.c:       prop->source_ports = 0x50;/* BITMAP: 01010000 */
rt722-sdca-sdw.c:       prop->source_ports = BIT(6) | BIT(2); /* BITMAP:
01000100 */

same for sinks:

rt712-sdca-sdw.c:       prop->sink_ports = BIT(3) | BIT(1); /* BITMAP:
00001010 */
rt722-sdca-sdw.c:       prop->sink_ports = BIT(3) | BIT(1); /* BITMAP:
00001010 */

>> Similar implementation was done in Qualcomm wsa and wcd codecs like:
>> array indexed from 0:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/codecs/wcd938x-sdw.c?h=v6.11-rc1#n51
>>
>> genmask from 0, with a mistake:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/codecs/wcd938x-sdw.c?h=v6.11-rc1#n1255
>>
>> The mistake I corrected here:
>> https://lore.kernel.org/all/20240726-asoc-wcd-wsa-swr-ports-genmask-v1-0-d4d7a8b56f05@linaro.org/
>>
>> To summarize, the mask does not denote port numbers (1...14) but indices
>> of the dpn array which are from 0..whatever (usually -1 from port number).
>>
> 
> Let me also complete this with a real life example of my work in
> progress. I want to use same dpn_prop array for sink and source ports
> and use different masks. The code in progress is:
> 
> https://git.codelinaro.org/krzysztof.kozlowski/linux/-/commit/ef709a0e8ab2498751305367e945df18d7a05c78#6f965d7b74e712a5cfcbc1cca407b85443a66bac_2147_2157
> 
> Without this patch, I get -EINVAL from sdw_get_slave_dpn_prop():
>   soundwire sdw-master-1-0: Program transport params failed: -2

Not following, sorry. The sink and source masks are separate on purpose,
to allow for bi-directional ports. The SoundWire spec allows a port to
be configured at run-time either as source or sink. In practice I've
never seen this happen, all existing hardware relies on ports where the
direction is hard-coded/fixed, but still we want to follow the spec.

So if ports can be either source or sink, I am not sure how the
properties could be shared with a single array?

Those two lines aren't clear to me at all:

	pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;
	pdev->prop.src_dpn_prop = wsa884x_sink_dpn_prop;

