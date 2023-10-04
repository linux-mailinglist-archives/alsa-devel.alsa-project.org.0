Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 329727B9B9C
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 09:56:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BD44ED8;
	Thu,  5 Oct 2023 09:55:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BD44ED8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696492588;
	bh=ND6e8zppS+/0buxG1psBpDzddtzWLjPsHvkMnqKjyIs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F2y92GPBX50I8e64Bp3tWOGhOAgk3vb4cB9ZKFEma+EtmNFyI0IQtIOvNvj5+41c6
	 8M/7NGqCeulHo7aZkuRNJ05JFpFS40otDDzEa1FvqcJLRw7Pb2TwZGDHueA7SIAmCS
	 JxphDRC++e9JeHZtvXEEID7/OB8fFJWAi7gQ+4xI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5DEBF805D4; Thu,  5 Oct 2023 09:52:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00E3AF805C1;
	Thu,  5 Oct 2023 09:52:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2B8FF8047D; Wed,  4 Oct 2023 16:00:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C743BF800C1
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 16:00:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C743BF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lQJZdM6p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696428053; x=1727964053;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ND6e8zppS+/0buxG1psBpDzddtzWLjPsHvkMnqKjyIs=;
  b=lQJZdM6plITS4+vEf+htybn4eok/oPkj+EFv3td+w8LpYTnOv3ECFhr1
   rVF2TV87xRIYmevFV8RkkTQzJBDckB03J3Cw0HaaQemL6TpvmASJFq4kP
   TSe7H4DQXMaC05RI/J/JdvcMvAq/PkOAAd6u39nlTOPiVUeNP0XQAJ040
   4faFU8rtpACTG9NqxD7kRST4hCjlMnHB0xpSGd1T75Jefb4H0BWrfc+WI
   9OAWtCQrg6uiJEY0G8bQ0gjLfyczx01aQJoZR+OhOcG2BIyF65qDdApdC
   h+YTA96GYAzTfONzi9PbHOMh15Y9bzt9+0S+LXHrETkEW/XxVo3FQ96gk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="382041003"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200";
   d="scan'208";a="382041003"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 07:00:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="1082512034"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200";
   d="scan'208";a="1082512034"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
  by fmsmga005.fm.intel.com with ESMTP; 04 Oct 2023 07:00:41 -0700
Message-ID: <843897f1-3ce5-f8da-5f10-7d8a68849fd2@intel.com>
Date: Wed, 4 Oct 2023 17:02:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v7 01/33] xhci: add support to allocate several
 interrupters
To: Wesley Cheng <quic_wcheng@quicinc.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>, gregkh@linuxfoundation.org,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 Thinh.Nguyen@synopsys.com
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230921214843.18450-1-quic_wcheng@quicinc.com>
 <20230921214843.18450-2-quic_wcheng@quicinc.com>
 <10ad0613-7e88-dbe8-c5a2-d535f8e9db03@linux.intel.com>
 <e3f3c8cd-6338-da08-d988-4d2ed68280e6@quicinc.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@intel.com>
In-Reply-To: <e3f3c8cd-6338-da08-d988-4d2ed68280e6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: mathias.nyman@intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: I2DZMMDSD7QZXB5ERKXGI2NAVBRCVRBH
X-Message-ID-Hash: I2DZMMDSD7QZXB5ERKXGI2NAVBRCVRBH
X-Mailman-Approved-At: Thu, 05 Oct 2023 07:52:34 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I2DZMMDSD7QZXB5ERKXGI2NAVBRCVRBH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2.10.2023 23.07, Wesley Cheng wrote:
> Hi Mathias,
> 
> On 9/28/2023 3:31 AM, Mathias Nyman wrote:
>> On 22.9.2023 0.48, Wesley Cheng wrote:
>>> From: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>
>>> Modify the XHCI drivers to accommodate for handling multiple event rings in
>>> case there are multiple interrupters.  Add the required APIs so clients are
>>> able to allocate/request for an interrupter ring, and pass this information
>>> back to the client driver.  This allows for users to handle the resource
>>> accordingly, such as passing the event ring base address to an audio DSP.
>>> There is no actual support for multiple MSI/MSI-X vectors.
>>>
>>> Factoring out XHCI interrupter APIs and structures done by Wesley Cheng, in
>>> order to allow for USB class drivers to utilze them.
>>>
>>>   }
>>> +void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrupter *ir)
>>> +{
>>> +    struct xhci_hcd *xhci = hcd_to_xhci(hcd);
>>> +    unsigned int intr_num;
>>> +
>>> +    /* interrupter 0 is primary interrupter, don't touchit */
>>> +    if (!ir || !ir->intr_num || ir->intr_num >= xhci->max_interrupters) {
>>> +        xhci_dbg(xhci, "Invalid secondary interrupter, can't remove\n");
>>> +        return;
>>> +    }
>>> +
>>> +    /* fixme, should we check xhci->interrupter[intr_num] == ir */
>>> +    spin_lock(&xhci->lock);
>>
>> Needs to be spin_lock_irq() ir spin_lock_irqsave() as xhci->lock is used in interrupt handler.
>>
>>
>>> +    intr_num = ir->intr_num;
>>> +    xhci_free_interrupter(xhci, ir);
>>> +    xhci->interrupters[intr_num] = NULL;
>>> +    spin_unlock(&xhci->lock);
>>
>> likewise
>>
> 
> Let me check these again.  In general, I think I will use both the xhci->mutex and 
> xhci->lock where needed, because I believe we'd run into sleep while atomic issues
> while freeing the DMA memory.  Will rework this and submit in the next rev.
> 

Maybe we need to split xhci_free_interrupter() into separate remove and free functions

Did some work on this, and on the sideband api in general.

Code still has a lot of FIXMEs, and it's completely untested, but to avoid us
from doing duplicate work I pushed it to my feature_interrupters branch anyway

git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git feature_interrupters
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=feature_interrupters

Thanks
-Mathias

