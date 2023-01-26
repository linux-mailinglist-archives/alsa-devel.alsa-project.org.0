Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1135D67C71D
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 10:23:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 884C0DEC;
	Thu, 26 Jan 2023 10:22:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 884C0DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674725015;
	bh=QZRD9g35F/NDRqYmL+T9yJOxG2xvHNVanQSxoCD9XHk=;
	h=Date:To:References:From:Subject:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QQeBDx3HLi7Rie0JG7LpH/75f6BWcnYIjpb09Qaau5CbHFMm/2eQ01aBcMYH2T6Zh
	 DwSGe3LVmL3ghVFuDC/p9nF5WmCPrcnSC0ehlAYq0SJsfmx8sRNeF5VcYYuxhLr/2g
	 XTxOC7FG6QGFzu2VKzw8qo2BUyuTgNGE4j08RI8E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BDA9F802DF;
	Thu, 26 Jan 2023 10:22:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 753F3F802DF; Thu, 26 Jan 2023 10:22:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A180F8025D
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 10:22:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A180F8025D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bFYr37jt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674724953; x=1706260953;
 h=message-id:date:mime-version:to:cc:references:from:
 subject:in-reply-to:content-transfer-encoding;
 bh=QZRD9g35F/NDRqYmL+T9yJOxG2xvHNVanQSxoCD9XHk=;
 b=bFYr37jtnjC/IGaU4+1laLGjhB48AgElPGAk0bzIVnzrChrHyJnXpdyP
 kCuZq+zrXpMbUTTXslQ4lSHbicBr0OTpFrbINgr5yHM3C/xbag+xKL7IA
 Wi9E39kMOF9nMkg0M39sUlyYoa4/RwarXEsKnYvq65AFHLGeyYVNsKZ1Z
 x0hCzwQQxEeBYLiw+Ii7Rd+0JktDMTnihE8fBB7Jbs2Yo11cUA4EDMgQ8
 fzbli340r5JsPVXmiLeebUHsZIJFOj9fnS6w//eLLMaoxaX6ZjXblj4dO
 QcffTPwrDBrFHhwYD9QXZpzeffKPrlrn37hYqozSKT13gzvAKnio6hQjo g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="413000676"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; d="scan'208";a="413000676"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 01:22:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="693274407"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; d="scan'208";a="693274407"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
 by orsmga008.jf.intel.com with ESMTP; 26 Jan 2023 01:22:21 -0800
Message-ID: <1e889754-6492-4c53-27f0-796002d5680c@linux.intel.com>
Date: Thu, 26 Jan 2023 11:23:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, lgirdwood@gmail.com,
 andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, broonie@kernel.org,
 bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org, agross@kernel.org
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [RFC PATCH v2 00/22] Introduce QC USB SND audio offloading support
In-Reply-To: <20230126031424.14582-1-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 26.1.2023 5.14, Wesley Cheng wrote:
> Changes in v2:
> 
> XHCI:
> - Replaced XHCI and HCD changes with Mathias' XHCI interrupter changes
> in his tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=feature_interrupters
> 

I'll submit the first three patches from that branch myself to usb-next, might modify
them slightly.
Just need to make sure they don't cause regression. Those are changes I want done anyway.

> Adjustments made to Mathias' changes:
>    - Created xhci-intr.h to export/expose interrupter APIs versus exposing xhci.h.
>      Moved dependent structures to this file as well. (so clients can parse out
>      information from "struct xhci_interrupter")
>    - Added some basic locking when requesting interrupters.
>    - Fixed up some sanity checks.
>    - Removed clearing of the ERSTBA during freeing of the interrupter. (pending
>      issue where SMMU fault occurs if DMA addr returned is 64b - TODO)

Was this solvable by first clearing high 32 bits and then low 32 bits?

Thanks
Mathias



