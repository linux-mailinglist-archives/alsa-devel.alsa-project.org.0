Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 346D073E12C
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 15:55:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76C6583E;
	Mon, 26 Jun 2023 15:54:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76C6583E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687787728;
	bh=UIOhw/+18cUbQ6mrRiXB9WS5HrjLqAxhhP6EGQM4t/0=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Nwjt/sAVBUDNBzr5MJRz77C/n2JyqdZwm1yl5KqbVEMSw50AWRn1A3FMj+CBMqX6H
	 XMr2R0UVkfqkqAA4mYEPX5PMsgB5v1WJIdol+a+o/X6Q3sAGEQ/eDPG6NhhjoQSCFo
	 0vIg+TcJzXkZJb4dPABgxBvYfumpnIqX/ouXHOsw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDC90F80093; Mon, 26 Jun 2023 15:54:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A17C2F80093;
	Mon, 26 Jun 2023 15:54:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9A48F80246; Mon, 26 Jun 2023 15:54:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 857B7F80169
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 15:54:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 857B7F80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gNk17S/d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687787671; x=1719323671;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=UIOhw/+18cUbQ6mrRiXB9WS5HrjLqAxhhP6EGQM4t/0=;
  b=gNk17S/dzQq6CUlTGQkMNJ6PXVvLTq/ttLbFWVAtsKYfy3xB2swWOU0O
   Zk0osXTL5Kn7JpaxuNnZ56B0niN0zAbec5zES9m+9bm1fpCNXEDBMpsZq
   r2qYXP01mF98C2i0tY0PPma2MCBVmQ7iPAqSD98IPdtWYeMXYqYWR3ZI4
   WQzXgEik0bBkxo0q1B6tNtY0xITal2gj3OLk+M6aEPZszO5v8ja37qNGc
   tm0Ok+UMwi6zbW4x4SPmvXb7/Ucg3ugs5LY1sQjSLgJI+bOMltw9toW3A
   s2V9Cb3k2BLSLPp9/twVt8c0iJdL7Oa21PG1hc8OObB2lBGk30LUxhrIi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="424942332"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200";
   d="scan'208";a="424942332"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 06:54:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="962761705"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200";
   d="scan'208";a="962761705"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
  by fmsmga006.fm.intel.com with ESMTP; 26 Jun 2023 06:54:19 -0700
Message-ID: <da468fe6-709c-b6e6-159d-10f76d296307@linux.intel.com>
Date: Mon, 26 Jun 2023 16:55:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, broonie@kernel.org,
 lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, andersson@kernel.org,
 robh+dt@kernel.org, gregkh@linuxfoundation.org, tiwai@suse.com
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-2-quic_wcheng@quicinc.com>
 <a45ff335-0563-85c7-3b31-d6ca23a54a3f@linux.intel.com>
 <ed0397eb-da17-fbee-647e-f3a2a57577fe@quicinc.com>
 <9f30e9f9-280e-b381-fecc-2a032c1117af@quicinc.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v3 01/28] xhci: Add support to allocate several
 interrupters
In-Reply-To: <9f30e9f9-280e-b381-fecc-2a032c1117af@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XEGSFD6NUBYSAUNU222FJ2XEX4WLFEWT
X-Message-ID-Hash: XEGSFD6NUBYSAUNU222FJ2XEX4WLFEWT
X-MailFrom: mathias.nyman@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XEGSFD6NUBYSAUNU222FJ2XEX4WLFEWT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 24.6.2023 1.37, Wesley Cheng wrote:
> Hi Mathias,
> 
> On 3/13/2023 1:32 PM, Wesley Cheng wrote:
>> Hi Mathias,
>>
>> On 3/10/2023 7:07 AM, Mathias Nyman wrote:
>>> On 9.3.2023 1.57, Wesley Cheng wrote:
>>>> From: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>>
>>>> Introduce xHCI APIs to allow for clients to allocate and free
>>>> interrupters.  This allocates an array of interrupters, which is based on
>>>> the max_interrupters parameter.  The primary interrupter is set as the
>>>> first entry in the array, and secondary interrupters following after.
>>>>
>>>
>>> I'm thinking about changing this offloading xHCI API
>>> xhci should be aware and keep track of which devices and endpoints that
>>> are offloaded to avoid device getting offloaded twice, avoid xhci driver
>>> from queuing anything itself for these, and act properly if the offloaded
>>> device or entire host is removed.
>>>
>>> So first thing audio side would need to do do is register/create an
>>> offload entry for the device using the API:
>>>
>>> struct xhci_sideband *xhci_sideband_register(struct usb_device *udev)
>>>
>>> (xHCI specs calls offload sideband)
>>> Then endpoints and interrupters can be added and removed from this
>>> offload entry
>>>
>>> I have some early thoughts written as non-compiling code in:
>>>
>>> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git feature_interrupters
>>> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=feature_interrupters
>>>
>>> Let me know what you think about this.
>>>
>>>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>>>
>>> My Signed-off-by tag is being misused here.
>>>
>>> I wrote a chunk of the code in this patch as PoC that I shared in a separate topic branch.
>>> It was incomplete and not intended for upstream yet. (lacked locking, several fixme parts, etc..)
>>> The rest of the code in this patch is completely new to me.
>>>
>>
>> Sorry about this.  I cherry picked the change directly from your branch, so it carried your signed off tag with it.  Will make to include them properly next time.
>>
> 
> I'm about ready to submit the next revision for this set of changes, and I was wondering how we should handle the changes you made on:
> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=feature_interrupters
> 
> I did make some modifications to some of the interrupter fixme tags you had, and also updated the xhci-sideband APIs with the proper logic.  I don't believe it is correct for me to submit a set of patches authored by you without your signed off tag. (checkpatch throws an error saying the author did not sign off on the change)
> 

Note that the first patch "xhci: split allocate interrupter into separate alloacte and add parts"
is already in usb-next on its way to 6.5

Maybe Co-developed-by would work in this case, with a small explanation at the end of the commit message.
Something like:

Locking, DMA something and feataure x added by Wesley Cheng to
complete original concept code by Mathias

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Co-developed-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Thanks
-Mathias

