Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D24A14E37
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 17:01:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDC1218F1;
	Mon,  6 May 2019 17:00:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDC1218F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557154878;
	bh=s+hZnJWdX8hl56mp2AkAIp3An1alt3p+BBrpE11EfcQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OBfW3B3yS3+HgbDfApPNpu3Cwpf/bXug1Af8gcG6Mi3hab4mPFYD4rn3zU0YUW27U
	 oUIjTBVqKyiqiDAaTHx5Uu9M3RePW5yTqBOIcPzv4VoiFE+GRREkNH/9QVQrpmdpP8
	 PZ+T7JgkTvXq7/cS4SnxjqyuqNpiEQGcGlRquX/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B6ACF896E6;
	Mon,  6 May 2019 16:59:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9103F896F0; Mon,  6 May 2019 16:59:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4BB6F80C07
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 16:59:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4BB6F80C07
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 May 2019 07:59:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,438,1549958400"; d="scan'208";a="137404343"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 06 May 2019 07:59:25 -0700
Received: from slaugust-mobl.amr.corp.intel.com (unknown [10.254.21.102])
 by linux.intel.com (Postfix) with ESMTP id 0801358010A;
 Mon,  6 May 2019 07:59:24 -0700 (PDT)
To: Mark Brown <broonie@kernel.org>
References: <20190430230934.4321-1-pierre-louis.bossart@linux.intel.com>
 <20190503054047.GB14916@sirena.org.uk>
 <6ac56436-5ce1-d977-45ef-f305f77bfe01@linux.intel.com>
 <20190506035133.GI14916@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <cf4cf0ca-b11d-48ff-8e23-fd2e308ec3af@linux.intel.com>
Date: Mon, 6 May 2019 09:59:24 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506035133.GI14916@sirena.org.uk>
Content-Language: en-US
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH 00/19] ASoC: SOF: improvements for ABI
 checks and Intel code
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

On 5/5/19 10:51 PM, Mark Brown wrote:
> On Fri, May 03, 2019 at 09:47:39AM -0500, Pierre-Louis Bossart wrote:
>> On 5/3/19 12:40 AM, Mark Brown wrote:
> 
>>> reviewer fatigue setting in with this stuff, one thing that'd really
>>> help here is if there were some help from Intel people with review for
>>> the DPCM code.
> 
>> I can certainly understand reviewer fatigue, i've had to put a time limit on
>> daily reviews to keep my sanity, but I don't get your last point. These
>> patches were submitted and reviewed by Intel people on GitHub, what you see
>> here is the result of multiple iterations precisely to make sure the patches
>> are acceptable for upstream. we've set the goal of having two Intel aprovers
>> for each patch. Can you elaborate on how we can make your life simpler?
> 
> The last point there is that Intel only write patches, nobody from Intel
> is reviewing other people's patches especially in areas of the code like
> DPCM which are complex, fragile and where Intel is by far the most
> active user.

It's a valid point, and for now we indeed only check for non-regressions 
and provide point solutions without looking at the bigger picture. We 
have a couple of people ramping up (Ranjani, Libin, Guennadi, Jaska) and 
hopefully at some point we'll be able to review and improve.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
