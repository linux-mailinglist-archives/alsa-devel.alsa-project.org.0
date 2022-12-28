Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F05E8657DD1
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Dec 2022 16:47:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86CF15404;
	Wed, 28 Dec 2022 16:46:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86CF15404
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672242441;
	bh=SB1x38s3dv6Gdzi7eiwaN7LwRGEtLuEFsZIEzhZwdls=;
	h=Date:To:References:From:Subject:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dPzyrShETS/EukANh6D5mtYCDT8GUbsjz3Gmamg1d58Eg1Y+z3dGzS4fUKLYpFkSm
	 vZU8JkuXsAgK0570u7Qb20rIXNhCkiNLnbMzIHB8nSV/fZFRd+exlGnASS13FGJ1QA
	 NbZcl3D64Yi0ZYIuWZV6KQwSNka2AhGuZv6fGIRM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89E22F800F0;
	Wed, 28 Dec 2022 16:46:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74788F800F0; Wed, 28 Dec 2022 16:46:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E8EDF800F0
 for <alsa-devel@alsa-project.org>; Wed, 28 Dec 2022 16:46:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E8EDF800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DHPWjgQf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672242376; x=1703778376;
 h=message-id:date:mime-version:to:cc:references:from:
 subject:in-reply-to:content-transfer-encoding;
 bh=SB1x38s3dv6Gdzi7eiwaN7LwRGEtLuEFsZIEzhZwdls=;
 b=DHPWjgQf8kIF01kPTtS51OjBt6N2vbLDjNv32V9l+BG9MbwodfcQ9MSd
 9EXFoRhtjY+Vs5SzRjDuoIwZBQYQ29t9W2gRSC1Ov5DbQmE13BM7loGpp
 n4Gv7ti1tQquSC9qGMFwWV/wqIuooUADtVCV38Ujmk3szm8RiFGDKhPU6
 eSbFd8EJSPbobJo2qrI76pcEJ+4JjzNp7RiSKGI4RcveCLrR7DeJTnLjW
 HX1ph3aqnQi9P0ODx0TUxcevYw0MbpgkMhN6hr4yIPcK5MrtN6ks7Vqcu
 2uZBWm3qtD82tBzICm2rw247TXSDoFgRBJs2g0xC+Y9474G2MMNQHcvhX w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="304388693"
X-IronPort-AV: E=Sophos;i="5.96,281,1665471600"; d="scan'208";a="304388693"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2022 07:46:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="982118992"
X-IronPort-AV: E=Sophos;i="5.96,281,1665471600"; d="scan'208";a="982118992"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
 by fmsmga005.fm.intel.com with ESMTP; 28 Dec 2022 07:46:07 -0800
Message-ID: <7dfe215b-4cc7-f95f-17c3-563c0120151a@linux.intel.com>
Date: Wed, 28 Dec 2022 17:47:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, broonie@kernel.org,
 lgirdwood@gmail.com, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 robh+dt@kernel.org, agross@kernel.org
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-8-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [RFC PATCH 07/14] usb: host: xhci: Add XHCI secondary interrupter
 support
In-Reply-To: <20221223233200.26089-8-quic_wcheng@quicinc.com>
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

On 24.12.2022 1.31, Wesley Cheng wrote:
> Implement the XHCI operations for allocating and requesting for a secondary
> interrupter.  The secondary interrupter can allow for events for a
> particular endpoint to be routed to a separate event ring.  The event
> routing is defined when submitting a transfer descriptor to the USB HW.
> There is a specific field which denotes which interrupter ring to route the
> event to when the transfer is completed.
> 
> An example use case, such as audio packet offloading can utilize a separate
> event ring, so that these events can be routed to a different processor
> within the system.  The processor would be able to independently submit
> transfers and handle its completions without intervention from the main
> processor.
> 

Adding support for more xHCI interrupters than just the primary one make sense for
both the offloading and virtualization cases.

xHCI support for several interrupters was probably added to support virtualization,
to hand over usb devices to virtual machines and give them their own event ring and
MSI/MSI-X vector.

In this offloading case you probably want to avoid xHC interrupts from this device
completely, making sure it doesn't wake up the main CPU unnecessarily.

So is the idea here to let xhci driver set up the new interrupter, its event ring,
and the endpoint transfer rings. Then pass the address of the endpoint transfer rings
and the new event ring to the separate processor.

This separate processor then both polls the event ring for new events, sets its dequeue
pointer, clears EHB bit, and queues new TRBs on the transfer ring.

so xhci driver does not handle any events for the audio part, and no audio data URBs
are sent to usb core?

How about the control part?
Is the control endpoint for this device still handled normally by usb core/xhci?

For the xhci parts I think we should start start by adding generic support for several
interrupters, then add parts needed for offloading.

Thanks
Mathias

