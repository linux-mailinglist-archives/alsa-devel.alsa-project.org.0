Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 733416B48D9
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 16:07:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2B88189C;
	Fri, 10 Mar 2023 16:06:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2B88189C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678460844;
	bh=uRO3ncPTAeH91sp2hvb+p3FEDisPorSl78+BYWZMFcs=;
	h=Date:To:References:From:Subject:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NCIJ+kJkbLjkJHkFQclxHThjUFfKuo7g1xEPuJHrdH1auxsohs6yz90Vp5xtExqjE
	 5r59DFDOQvbWGWWrkHzBG5QoMUnYDkANsk2C/ZSs40r5psvxGPF4j5Z/a2SGUknpNZ
	 NLugv/VoV0n1BbYnKSRyv2ns4/AympFpDkIxgDUU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17F70F80236;
	Fri, 10 Mar 2023 16:06:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61B3AF8007E; Fri, 10 Mar 2023 16:06:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27675F8007E
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 16:06:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27675F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dpuE+wWq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678460788; x=1709996788;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=uRO3ncPTAeH91sp2hvb+p3FEDisPorSl78+BYWZMFcs=;
  b=dpuE+wWqPKAuZF4VhR6X1UtP/doW8isqFBxLdkEO1pulEZNR6wqV687e
   JJ5byKCXdh98Gfc4c02feOClCiamLdh+tJ6+RM3/N5AqeP59Ea+Ld1IJX
   EpFIKj9nuJaWUdVRP0ghh8Wj+IMJF2YdcD7K1hsG/9VVIAlOvHJ5jscJ/
   g0v95nk9bSUUz0qRLSDHhBd+yLMKyk4pYS/WxOFHpVHxKO+AnSBXSv1ga
   OxZjcnVyccfVvY75coqb7PKWo1OrpxOltVYGb6pXI1XHLIb3JZjlFTAZ1
   535uXKKqDFXehSh38OVmo0kiCqboqYSLKbftHlim6h/ey+7PR/+g5C5UX
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="399342962"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400";
   d="scan'208";a="399342962"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 07:06:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="655216793"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400";
   d="scan'208";a="655216793"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
  by orsmga006.jf.intel.com with ESMTP; 10 Mar 2023 07:06:19 -0800
Message-ID: <a45ff335-0563-85c7-3b31-d6ca23a54a3f@linux.intel.com>
Date: Fri, 10 Mar 2023 17:07:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, broonie@kernel.org,
 lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, andersson@kernel.org,
 robh+dt@kernel.org, gregkh@linuxfoundation.org, tiwai@suse.com
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-2-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v3 01/28] xhci: Add support to allocate several
 interrupters
In-Reply-To: <20230308235751.495-2-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SPLCIR3WRK7LT2WXIA6IHTRH6N4WYRR7
X-Message-ID-Hash: SPLCIR3WRK7LT2WXIA6IHTRH6N4WYRR7
X-MailFrom: mathias.nyman@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SPLCIR3WRK7LT2WXIA6IHTRH6N4WYRR7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 9.3.2023 1.57, Wesley Cheng wrote:
> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> 
> Introduce xHCI APIs to allow for clients to allocate and free
> interrupters.  This allocates an array of interrupters, which is based on
> the max_interrupters parameter.  The primary interrupter is set as the
> first entry in the array, and secondary interrupters following after.
> 

I'm thinking about changing this offloading xHCI API
xhci should be aware and keep track of which devices and endpoints that
are offloaded to avoid device getting offloaded twice, avoid xhci driver
from queuing anything itself for these, and act properly if the offloaded
device or entire host is removed.

So first thing audio side would need to do do is register/create an
offload entry for the device using the API:

struct xhci_sideband *xhci_sideband_register(struct usb_device *udev)

(xHCI specs calls offload sideband)
Then endpoints and interrupters can be added and removed from this
offload entry

I have some early thoughts written as non-compiling code in:

git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git feature_interrupters
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=feature_interrupters

Let me know what you think about this.

> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

My Signed-off-by tag is being misused here.

I wrote a chunk of the code in this patch as PoC that I shared in a separate topic branch.
It was incomplete and not intended for upstream yet. (lacked locking, several fixme parts, etc..)
The rest of the code in this patch is completely new to me.

Thanks
-Mathias

