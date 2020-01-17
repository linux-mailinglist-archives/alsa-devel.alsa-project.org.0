Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 222401408F1
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 12:32:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83D2217EF;
	Fri, 17 Jan 2020 12:31:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83D2217EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579260730;
	bh=y/qHA+L7j4RSb5xPo/3ukRUEJQeVbTAdmPeDFarsUMU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UrLSddAbLvYEK/dKz7WLoMvY441/TqADM6+GT2P/XjCUSxUSLIBgJj7Doo1kplXHy
	 sjxzU3Q5NyoncFA+We8SdaM4SGisYRNrlCg1DaAg6Q0xbpHzZH3YDPfUYs7vTm7rQc
	 EN+a14pXuKmU7ZuVS2MNs9Jvo0RGIy8Ko/X+KHMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D8A5F800E9;
	Fri, 17 Jan 2020 12:28:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8459EF801EB; Fri, 17 Jan 2020 12:28:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A431F801F7
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 12:28:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A431F801F7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2020 03:28:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,330,1574150400"; d="scan'208";a="257769917"
Received: from kaiwenhs-mobl.amr.corp.intel.com (HELO [10.251.11.205])
 ([10.251.11.205])
 by fmsmga002.fm.intel.com with ESMTP; 17 Jan 2020 03:28:37 -0800
To: Bard liao <yung-chuan.liao@linux.intel.com>, broonie@kernel.org,
 tiwai@suse.de
References: <20200116202620.7401-1-yung-chuan.liao@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0549e5a6-0a3c-e3f0-61ce-f31260417581@linux.intel.com>
Date: Fri, 17 Jan 2020 05:27:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200116202620.7401-1-yung-chuan.liao@linux.intel.com>
Content-Language: en-US
Cc: liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, bard.liao@intel.com
Subject: Re: [alsa-devel] [PATCH RFC v3 0/4] ASoC: Add Multi CPU DAI support
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



On 1/16/20 2:26 PM, Bard liao wrote:
> As discussed in [1], ASoC core supports multi codec DAIs
> on a DAI link. However it does not do so for CPU DAIs.
> 
> So, add support for multi CPU DAIs on a DAI Link by adding
> multi CPU DAI in Card instantiation, suspend and resume
> functions, PCM ops, stream handling functions and DAPM.
> 
> [1]: https://www.spinics.net/lists/alsa-devel/msg71369.html
> 
> changes in v3:
>   - Return error if the function doesn't support multi cpu instead of
>     just showing a warning message.
>   - Revert changes for FE dai and compress device since we don't support
>     multi cpu for FE dai and compress device yet.

The code looks mostly good, except for an error in soc-compress (patch 4).

I would still suggest refactoring code first, adding the new checks or 
helpers first, to make sure we have the same functionality before adding 
the multi-cpu-dais, see specific points in the other emails.

Thanks Bard and Morimoto-san.

> 
> Bard liao (1):
>    ASoC: return error if the function is not support multi cpu yet.
> 
> Shreyas NC (3):
>    ASoC: Add initial support for multiple CPU DAIs
>    ASoC: Add multiple CPU DAI support for PCM ops
>    ASoC: Add multiple CPU DAI support in DAPM
> 
>   include/sound/soc.h                   |  15 +
>   sound/soc/soc-compress.c              |   5 +-
>   sound/soc/soc-core.c                  | 205 +++++-----
>   sound/soc/soc-dapm.c                  | 131 ++++---
>   sound/soc/soc-generic-dmaengine-pcm.c |  18 +
>   sound/soc/soc-pcm.c                   | 539 +++++++++++++++++---------
>   6 files changed, 591 insertions(+), 322 deletions(-)
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
