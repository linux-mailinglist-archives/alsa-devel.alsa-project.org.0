Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECF2423E5A
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 15:02:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17F65846;
	Wed,  6 Oct 2021 15:01:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17F65846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633525320;
	bh=AW7PWbT+TFfmRedLWviwKMd8qTHPDLUZCBDK0TmlBfI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X6j6NXtDRtaGt7jQNy/uFpvy0FVjnjo8AWG7ktSfOnVlxXhgIDpxYkZiHqFBXqJyo
	 IBMd2YKJ9V4Cfahez2kUxBMff4h3pPBW8BOV0/heRW1Oeu8hZBp1HpsT3L0sgQHRbm
	 ZDuiHvsmFNtyGXEf4MxWIPzTfEsLDk5mMwAmez9A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57619F80249;
	Wed,  6 Oct 2021 15:00:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5408F80249; Wed,  6 Oct 2021 15:00:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42ED6F80229
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 15:00:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42ED6F80229
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="289487120"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="289487120"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 06:00:23 -0700
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="439108434"
Received: from nbasa-mobl2.amr.corp.intel.com (HELO [10.213.170.135])
 ([10.213.170.135])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 06:00:22 -0700
Subject: Re: [PATCH 00/19] ASoC: SOF: Improvements for debugging
To: Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
References: <20211006110645.26679-1-peter.ujfalusi@linux.intel.com>
 <YV2HIkZv9dmSmvts@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <163495bf-498b-ce5d-e352-6b2a9efa08bf@linux.intel.com>
Date: Wed, 6 Oct 2021 07:32:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YV2HIkZv9dmSmvts@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com
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



On 10/6/21 6:23 AM, Mark Brown wrote:
> On Wed, Oct 06, 2021 at 02:06:26PM +0300, Peter Ujfalusi wrote:
>> Hi,
>>
>> The aim of this series is to clean up, make it easier to interpret and less
>> 'chatty' prints aimed for debugging errors.
>>
>> For example currently the DSP/IPC dump is printed every time we have an IPC
>> timeout and it is posible to lost the first and more indicative dump to find the
>> rootcause.
> 
> You might want to look at tracepoints and/or trace_printk, apart from
> anything else they're very useful for flight recorder style applications
> since they're very low overhead and have comparitively speeaking lots of
> storage available.

Yes, for the dev_dbg() I am thinking of a transition to tracepoints
indeed. That would be most interesting for IPC, stream events, state
machines, etc. We'll probably want to gather kernel and firmware traces
with the same tools as well, something that should already be supported
in hardware and not using due to inertia, lack of time, etc.

But the changes that Peter did for this series are for 'major' issues
that should typically not happen, rare events using limited bandwidth
and usually not recoverable without a DSP reset. It's the kind of things
we want end-users to report with 'alsa-info'.
