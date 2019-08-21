Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E839844B
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 21:25:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFBED165D;
	Wed, 21 Aug 2019 21:24:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFBED165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566415507;
	bh=XstUcnL/Bptt0fGIkETJhI+8hc8OaJvysJzmNF/0unw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tc++qHvrFEtDkYYT8GNJb8qxObObKQmkG3q48hTXkFA9xUPb7jyGajOfQczul2ORb
	 O0rLOCgEj4c/XcD/H9KrToE0zPqZcvV/f4TJe+ukuP87YCj8tLW5RaZc1bGUtikzbt
	 ZSb91+6xqeWivg1jZZMKcoJTHG9Qjnghva4jdqlY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC4B4F80306;
	Wed, 21 Aug 2019 21:23:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9863F800BF; Wed, 21 Aug 2019 21:23:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82847F800BF
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 21:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82847F800BF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Aug 2019 12:23:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; d="scan'208";a="180148220"
Received: from dbarua-mobl.amr.corp.intel.com (HELO [10.252.198.189])
 ([10.252.198.189])
 by fmsmga007.fm.intel.com with ESMTP; 21 Aug 2019 12:23:10 -0700
To: alsa-devel@alsa-project.org
References: <20190813213227.5163-1-pierre-louis.bossart@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <57e5dab5-2641-7c4b-a05a-fb4f0adccfc7@linux.intel.com>
Date: Wed, 21 Aug 2019 14:23:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813213227.5163-1-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, slawomir.blauciak@intel.com
Subject: Re: [alsa-devel] [PATCH 0/6] soundwire: inits and PM additions for
 5.4
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



On 8/13/19 4:32 PM, Pierre-Louis Bossart wrote:
> This is an update on the RFC, to be applied after the '[PATCH v2 0/3]
> soundwire: debugfs support for 5.4' and '[PATCH 00/17] soundwire:
> fixes for 5.4' series.
> 
> Total that makes 28 patches submitted for review, broken in 3 sets.

I double-checked that this patchset does apply on top of soundwire/next 
+ the 4 debugfs patches I just sent earlier.

I will now send the rather big changes needed for SOF integration as an 
RFC, assuming this set is applied.

> 
> Changes since RFC (Feedback from GregKH, Vinod, Cezary, Guennadi):
> Squashed init sequence fixes in one patch, which remains
> readable. Tested all return values and called update_config() as
> needed.
> Fixed hw-reset debugfs (removed -unsafe and noisy dev_info traces)
> Simplified enable_interrupt() with goto
> Fixed style, removed typos and FIXMES in pm_runtime code
> Clarified commit messages
> 
> Pierre-Louis Bossart (6):
>    soundwire: fix startup sequence for Intel/Cadence
>    soundwire: cadence_master: add hw_reset capability in debugfs
>    soundwire: intel: add helper for initialization
>    soundwire: intel: Add basic power management support
>    soundwire: cadence_master: make clock stop exit configurable on init
>    soundwire: intel: add pm_runtime support
> 
>   drivers/soundwire/cadence_master.c | 135 ++++++++++++++------
>   drivers/soundwire/cadence_master.h |   5 +-
>   drivers/soundwire/intel.c          | 194 +++++++++++++++++++++++++++--
>   3 files changed, 289 insertions(+), 45 deletions(-)
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
