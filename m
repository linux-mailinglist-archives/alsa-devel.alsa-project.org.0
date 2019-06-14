Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 848EB45A1B
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 12:12:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B2941878;
	Fri, 14 Jun 2019 12:11:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B2941878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560507157;
	bh=N0OhtNSwEtnR5Bu/XrqFABpD+P7xLGWQosMDht1L830=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bLfMugluutgx3e7NpHYshAk3gNtvnipUOmtIKt7BqlXfv3CcTSNhWLYFWqT9SjTOh
	 8s5B+5CZhPOsB/bqIQoYv7AcNDiGxXgHTj6/MqyBbEAc7pUsQOBeauEMH5WB6JMDuH
	 UneINE3Js2RDt8OOzG95Xr0nFS7C6F4j3PpCSQSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FDC1F896EA;
	Fri, 14 Jun 2019 12:11:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEBE7F896E0; Fri, 14 Jun 2019 12:11:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D889BF80794
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 12:11:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D889BF80794
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jun 2019 03:11:23 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 14 Jun 2019 03:11:22 -0700
Received: from jhoenked-mobl.ger.corp.intel.com (unknown [10.252.48.113])
 by linux.intel.com (Postfix) with ESMTP id 5D5075803E4;
 Fri, 14 Jun 2019 03:11:18 -0700 (PDT)
To: Mark Brown <broonie@kernel.org>
References: <20190612164726.26768-1-pierre-louis.bossart@linux.intel.com>
 <20190612164726.26768-2-pierre-louis.bossart@linux.intel.com>
 <20190613184431.GU5316@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <da825e8e-e960-2a08-3ddb-608b4991d150@linux.intel.com>
Date: Fri, 14 Jun 2019 12:11:16 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613184431.GU5316@sirena.org.uk>
Content-Language: en-US
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH v2 1/3] ASoC: SOF: trace: move to opt-in
 with Kconfig and module parameter
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

On 6/13/19 8:44 PM, Mark Brown wrote:
> On Wed, Jun 12, 2019 at 11:47:24AM -0500, Pierre-Louis Bossart wrote:
> 
>> +	    (sof_core_debug & SOF_CORE_ENABLE_TRACE)) {
>> +		sdev->dtrace_is_supported = true;
> 
> Given that dtrace is a widely known product with a Linux implementation
> can we not call this dtrace?  use_dma_trace or something?  A long name
> doesn't seem too bad here but a collision with the more common usage of
> the name isn't great.

Sure, we can rename these fields. I'll send a v3.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
