Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE41F678085
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 16:51:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C463E0E;
	Mon, 23 Jan 2023 16:50:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C463E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674489089;
	bh=q/p7R22Dwd1VnE4UdAz1vguL9rsClepsQ5XC723K8bw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PkZcll38yc/9vhL96EECPIXL8GSDUvEQoXwoymNxqBbqMmDK/v6tBdqD5x5BFqrP3
	 fajO9GUYwWvmbAKl+8dM+RLo416NOPH7AzT0JuYC2ORddS2kycseEG/0UVBrAOcHNW
	 sXwdZEzkOnDKpUowiX4fjvTXPXwG0cdBH5WWWT98=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85950F80132;
	Mon, 23 Jan 2023 16:50:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA414F804C2; Mon, 23 Jan 2023 16:50:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3ADBFF80132
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 16:50:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ADBFF80132
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=oHANSRzT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674489024; x=1706025024;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=q/p7R22Dwd1VnE4UdAz1vguL9rsClepsQ5XC723K8bw=;
 b=oHANSRzTe2alyqrgJ4L9yLgZQIyT7s7ktGIjGiDD3Nzdr9xfJZ1Lysjr
 4wB02tT9D78m7pgGPmzZ4skFuWpDKL1aZonyeRCvLATb6B0mXNFpW8RfW
 jM1cizXR3pauRKQcTtqhdTXXq150YZax7M1OeZaxJj6Q0xGyF6kTZOk7r
 EovicAeEWL2sTQVlOOvRjAkyqNzPE/27F2trOtxLaksAFyYLF3lCvB2HL
 3RDX+KHwX2w/C+z3ON3MbqKMF1Y2X3z1Fg8R//nzSF9XWwdQp8Gmi4Zbh
 6F6Sdo/iuSPMx93Vm6PAJPsxDnsIot+nI2E2CqTtgfLEYqaDHUHoWJHus g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="309647186"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="309647186"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 07:50:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="693952499"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="693952499"
Received: from rgrachek-mobl.amr.corp.intel.com (HELO [10.212.113.123])
 ([10.212.113.123])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 07:50:16 -0800
Message-ID: <034245f8-50b7-e801-7961-58c77dbc00b1@linux.intel.com>
Date: Mon, 23 Jan 2023 09:50:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] soundwire: bus: Allow SoundWire peripherals to
 register IRQ handlers
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20230119165104.3433290-1-ckeepax@opensource.cirrus.com>
 <20230119165104.3433290-2-ckeepax@opensource.cirrus.com>
 <c05a6791-96a7-2b10-d353-eb7b316aefc8@linux.intel.com>
 <20230120095941.GL36097@ediswmail.ad.cirrus.com>
 <881088ad-95d7-2462-20d2-72a6a9d3ba68@linux.intel.com>
 <20230123145353.GX36097@ediswmail.ad.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230123145353.GX36097@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/23/23 08:53, Charles Keepax wrote:
> On Fri, Jan 20, 2023 at 10:20:50AM -0600, Pierre-Louis Bossart wrote:
>> On 1/20/23 03:59, Charles Keepax wrote:
>>> On Thu, Jan 19, 2023 at 11:12:04AM -0600, Pierre-Louis Bossart wrote:
>>>> There should be an explanation and something checking that both are not
>>>> used concurrently.
>>>
>>> I will try to expand the explanation a litte, but I dont see any
>>> reason to block calling both handlers, no ill effects would come
>>> for a driver having both and it is useful if any soundwire
>>> specific steps are needed that arn't on other control buses.
>>
>> I think it's problematic if the peripheral tries to wake-up the manager
>> from clock-stop with both an in-band wake (i.e. drive the data line
>> high) and a separate GPIO-based interrupt. It's asking for trouble IMHO.
>> We spent hours in the MIPI team to make sure there were no races between
>> the manager-initiated restarts and peripheral-initiated restarts, adding
>> a 3rd mechanism in the mix gives me a migraine already.
> 
> Apologies but I am struggling see why this has any bearing on
> the case of a device that does both an in-band and out-of-band
> wake. The code we are adding in this patch will only be called in the
> in-band case. handle_nested_irq doesn't do any hardware magic or
> schedule any threads, it just calls a function that was provided
> when the client called request_threaded_irq. The only guarantee
> of atomicity you have on the interrupt_callback is sdw_dev_lock
> and that is being held across both calls after the patch.
> 
> Could you be a little more specific on what you mean by this
> represents a 3rd mechanism, to me this isn't a new mechanism just
> an extra callback? Say for example this patch added an
> interrupt_callback_early to sdw_slave_ops that is called just
> before interrupt_callback.

Well, the main concern is exiting the clock-stop. That is handled by the
manager and could be done
a) as the result of the framework deciding that something needs to be
done (typically as a result of user/applications starting a stream)
b) by the device with an in-band wake in case of e.g. jack detection or
acoustic events detected
c) same as b) but with a separate out-of-band interrupt.

I'd like to make sure b) and c) are mutually-exclusive options, and that
the device will not throw BOTH an in-band wake and an external interrupt.
