Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE1B461D78
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 19:19:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E51217E1;
	Mon, 29 Nov 2021 19:19:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E51217E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638209999;
	bh=5yScbZTV4bvQ9UZi6KVDVnfYnwevvo18CjwgTjDLPa4=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Razqyovdte5QT3p3GC9PFrKxexEBsn5SwhgNJCyPjnpR5AhM0itOHr+8Um7MyL0ee
	 Jpr5VgBhdZkIUdT4ohJ3rjPd+H//5lvEJ7WGMZlY0XcmPFz8HMpAeFrzzEXAZkXrb8
	 E8jvw71Yhu4BmNtGjzX+yflaD6PfXlbUSOsjse2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A29F2F80217;
	Mon, 29 Nov 2021 19:18:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5646DF80240; Mon, 29 Nov 2021 19:18:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1E8FF80084
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 19:18:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1E8FF80084
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="236272491"
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="236272491"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 10:18:27 -0800
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="676464231"
Received: from ticela-nm-11.amr.corp.intel.com (HELO [10.212.98.225])
 ([10.212.98.225])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 10:18:27 -0800
Subject: Re: Dual simulatenous output on single card not recognized
To: Eldred HABERT <stuff@eldred.fr>, alsa-devel@alsa-project.org
References: <8b18294d-d082-2be4-18ba-39b4ec4b9e91@eldred.fr>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <cdafcbb1-9eeb-6337-ee2b-d6a168996153@linux.intel.com>
Date: Mon, 29 Nov 2021 12:18:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <8b18294d-d082-2be4-18ba-39b4ec4b9e91@eldred.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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



On 11/28/21 7:28 AM, Eldred HABERT wrote:
> Hello,
> 
> I bought a laptop with integrated sound output (either to speakers or
> headphones), and a HDMI output. Attached is the output of `aplay -l`.
> 
> Under both PipeWire and PulseAudio, I only get a single output/sink (by
> default to the built-in output), but I can get simultaneous output to both:
> - under PulseAudio, by adding a `load-module module-alsa-sink
> device=hw:0,7` line to the config;
> - under PipeWire, by adding a profile to the card to enable both
> outputs, which correctly provides two outputs that work fine concurrently.
> 
> I was directed to this mailing list after the following discussion:
> 
>> It's a kernel ALSA bug if SOF actually must contain enough data for
> the driver to figure this out (or at least pass that data on to
> userspace to deal with it)
>> if [we are] right that hardware itself does not contain the required
> data, then it can only be fixed in userspace via a card database
>> which is one thing to do, another would be maybe a heuristic rule that
> attempts to guess if such cards with analog and digital sub-devices
> might be independent
> 
> Please tell me if more details are needed—it would be nice if hardware
> configurations like mine could be fully supported out of the box ^^

You may want to run 'alsa-info' and provide a link to the uploaded
results. It's hard to comment without any information on 'hardware
configurations like mine'.
Thanks.
