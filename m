Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C4024024D
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Aug 2020 09:18:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FA4B1663;
	Mon, 10 Aug 2020 09:17:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FA4B1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597043929;
	bh=BOzVhhKXPBlqTHLysOI7omL7BH+XJiwh7xMXwSK7hTg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ItDhzrqkdE500GkVnm8xe+CSiQ4DngYqmPK7ntAJY682/tfuG174PSZji6S2RheWj
	 uBtNT6IXosfNDKu08CW2M81W0VeeGpYPduyscWmFdRE0V7YQpVxvp9vInYw2xz+BU4
	 ZtVyZTmm8i/+3hbaV9vHQwX5Keaaeab6qSnYkoEM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C57C1F800BC;
	Mon, 10 Aug 2020 09:17:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCB54F800BC; Mon, 10 Aug 2020 09:17:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E2B8F800BC
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 09:16:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E2B8F800BC
IronPort-SDR: hrTJcmXDjNAJot3opjAMb0XjRg+4fBeWOK3v/t3ahwT0nkjqCeVxulH07NjCGJ5Ew7kFep2SIr
 OZR+fjLKKgHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9708"; a="141095720"
X-IronPort-AV: E=Sophos;i="5.75,456,1589266800"; d="scan'208";a="141095720"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2020 00:16:53 -0700
IronPort-SDR: FAGNOisr2ije6Sy9AP+9TEgxwVQg9Y68dkR7JscLU+eyZDraKng2Ea6mtdY0vGWGPOLzxXfUgX
 p9eVSNruVLMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,456,1589266800"; d="scan'208";a="275934992"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.249.154.188])
 ([10.249.154.188])
 by fmsmga007.fm.intel.com with ESMTP; 10 Aug 2020 00:16:49 -0700
Subject: Re: [PATCH 07/13] ASoC: Intel: catpt: Event tracing
To: Mark Brown <broonie@kernel.org>
References: <20200807110649.17114-1-cezary.rojewski@intel.com>
 <20200807110649.17114-8-cezary.rojewski@intel.com>
 <20200807150908.GN5435@sirena.org.uk>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <2e964389-9917-91a4-5f41-7031e54f83a5@intel.com>
Date: Mon, 10 Aug 2020 09:16:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200807150908.GN5435@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 andriy.shevchenko@intel.com, filip.kaczmarski@intel.com,
 harshapriya.n@intel.com, marcin.barlik@intel.com, zwisler@google.com,
 lgirdwood@gmail.com, tiwai@suse.com, filip.proborszcz@intel.com,
 michal.wasko@intel.com, cujomalainey@chromium.org, ppapierkowski@habana.ai,
 vamshi.krishna.gopal@intel.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2020-08-07 5:09 PM, Mark Brown wrote:
> On Fri, Aug 07, 2020 at 01:06:43PM +0200, Cezary Rojewski wrote:
>> Define tracing macros for easy catpt debug. These are divided into
>> memory, registry and ipc event categories.
>>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
>>   sound/soc/intel/catpt/trace.h | 169 ++++++++++++++++++++++++++++++++++
> 
> Usually events go into include/trace/events/
> 

Thought TRACE_INCLUDE_FILE/ _PATH are designed specifically to remove 
the need for trace.h to go into mentioned folder. Based my decision on 
fact that sound/hda and sound/core have their traces defined locally.

What's the preferred way?

>> +/* SPDX-License-Identifier: GPL-2.0
> 
> This needs to be a separate comment to match the spec.
> 

Ack.
