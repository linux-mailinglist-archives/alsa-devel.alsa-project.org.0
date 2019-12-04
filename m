Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD081120AA
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Dec 2019 01:36:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B746B10E;
	Wed,  4 Dec 2019 01:35:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B746B10E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575419784;
	bh=ore60bkNgH501LOOXAoKR0akN3SPqQFJKMcWhxAttco=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u240MLrDgdBNOFS/eOS/FV331QQNfZlYmpPmcryrJPc88mbGMaMh/1gflQXap2hkI
	 vSbSI60lWERYffac5B40d+jc5OzdzWujZlmQMCRd4ZMWMt3ihiUX1HMds4xnisBORP
	 arXGBvPrXpuBrpsoGR9wIZNTLUeYzm+KYj+1iiX0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B488FF80245;
	Wed,  4 Dec 2019 01:34:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E5D3F8023F; Wed,  4 Dec 2019 01:34:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F97CF800ED
 for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2019 01:34:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F97CF800ED
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 16:34:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,275,1571727600"; d="scan'208";a="208627028"
Received: from cakumnji-mobl.amr.corp.intel.com (HELO [10.254.102.10])
 ([10.254.102.10])
 by fmsmga008.fm.intel.com with ESMTP; 03 Dec 2019 16:34:33 -0800
To: Jaroslav Kysela <perex@perex.cz>,
 Curtis Malainey <cujomalainey@google.com>, =?UTF-8?Q?Mads_L=c3=b8nsethagen?=
 <mads@ab3.no>
References: <CAOReqxjFaWhYCzzyZ90Pc5EvzUky6kCYqakz2XBwSOii9d3maA@mail.gmail.com>
 <6b310509-212e-b887-5e3a-483a740d2d1c@ab3.no>
 <CAOReqxj3P4Kvf5YwTXoEzHd9hURBOP4ySEjURsO7LjK+vbpQTw@mail.gmail.com>
 <2f0297fa-4aab-b463-4652-208ee77b6cb8@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5985f899-82d0-cbb9-9981-1eb9aa5a935d@linux.intel.com>
Date: Tue, 3 Dec 2019 18:34:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <2f0297fa-4aab-b463-4652-208ee77b6cb8@perex.cz>
Content-Language: en-US
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Dylan Reid <dgreid@google.com>, Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] Headset button mapping in the kernel
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>




>> It appears some have started landing
>> upstream ae09a4783b9caf9307f303ef039f8297ce0371fe ("ASoC: Intel: Headset
>> button support in kabylake machine driver") but it would be great if 
>> we had
>> a way for userspace to configure these buttons similar to how we handle
>> UCMs.
> 
> The question why you need to change this settings in the user space. I 
> think that the device tree was designed exactly to describe this hw 
> platform specific settings. Another possibility is to use the kernel 
> module option to configure the settings from the user space. But it's 
> just an idea. You are probably looking for an interface which can be 
> used when the driver is running.

I am also unclear on the ask.
We've cleaned-up all machine drivers so that the mapping is identical, 
except for the cases where the codec inverts the buttons.
Are you saying you do an additional remapping of those buttons in 
userpace? If yes, why not fix the machine driver? The mapping is 
typically based on measured impedance, not really something userspace 
should really know about.
Or is this a case where the ChromeOS kernel has not yet seen the 
upstream patches?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
