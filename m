Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0F1157D63
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 15:29:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9C891671;
	Mon, 10 Feb 2020 15:28:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9C891671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581344964;
	bh=B8cnMwsm61xYmo3N9w1jstgW2nKMCsTqX5rMa0VIxa4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oLKtQKEn5UyXRlrN3MFzcWl7k9gBtX7Ep6nPM3TJ8HqPQupDsiAnEfBeiccvcjqWm
	 adwY6qk1l69HlIpFRQvvX4z0aqiQ+YI8lPGGS75+e3FXu5gro8sbbicpv/6jJBhxNo
	 CJT3UZMgDAvGO2uo9FfdH6heBqDI3mrNP3IS9zjk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9923F80158;
	Mon, 10 Feb 2020 15:27:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35A4FF8014F; Mon, 10 Feb 2020 15:27:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A033F800E7
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 15:27:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A033F800E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Feb 2020 06:27:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,425,1574150400"; d="scan'208";a="226210474"
Received: from ykatsuma-mobl1.gar.corp.intel.com (HELO [10.251.140.95])
 ([10.251.140.95])
 by fmsmga007.fm.intel.com with ESMTP; 10 Feb 2020 06:27:29 -0800
To: alsa-devel@alsa-project.org
References: <20200114235227.14502-1-pierre-louis.bossart@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5f6af1da-ee9e-dcf8-0353-8f9eb4a39d21@linux.intel.com>
Date: Mon, 10 Feb 2020 08:27:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200114235227.14502-1-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 0/5] soundwire: stream: fix state
 machines and transitions
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



On 1/14/20 5:52 PM, Pierre-Louis Bossart wrote:
> The existing stream support works fine with simple cases, but does not
> map well with ALSA transitions for underflows/resume where prepare()
> can be called multiple times. Concurrency with multiple devices per
> links or multiple streams enabled on the same link also needs to be
> fixed.
> 
> These patches are the result of hours of validation on the Intel side
> and should benefit other implementations since there is nothing
> hardware-specific. The Intel-specific changes being reviewed do depend
> on those stream changes though to be functional.

Vinod, these patches have been in the queue for quite some time, and 
v5.6-rc1 is out. Can we move on with the reviews?
Thanks!

> Changes since v1:
> Removed spurious code block change flagged by Vinod
> 
> No change (replies provided in v1 thread)
> Github link issue is public, no reason to remove it
> Bandwidth computation on ALSA prepare/start (for resume cases) handled
> internally in stream layer.
> Kept emacs comment formatting.
> No additional code/test for concurrent streams (not supported due to locking)
> 
> Bard Liao (1):
>    soundwire: stream: only prepare stream when it is configured.
> 
> Pierre-Louis Bossart (2):
>    soundwire: stream: update state machine and add state checks
>    soundwire: stream: do not update parameters during DISABLED-PREPARED
>      transition
> 
> Rander Wang (2):
>    soundwire: stream: fix support for multiple Slaves on the same link
>    soundwire: stream: don't program ports when a stream that has not been
>      prepared
> 
>   Documentation/driver-api/soundwire/stream.rst | 61 +++++++++----
>   drivers/soundwire/stream.c                    | 90 ++++++++++++++++---
>   2 files changed, 124 insertions(+), 27 deletions(-)
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
