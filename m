Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A66417715
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Sep 2021 16:51:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0E3184A;
	Fri, 24 Sep 2021 16:50:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0E3184A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632495066;
	bh=n1J5CQcJcRVZCz7OXDp+KqCB0BRwC1TImqTuIqzpVqk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KjpZUQpxM9FhhVKRdBd6QWjAgozrQGwEB+PiFVQ24VBhD/FIA9TKTwTsrBMC3O/6u
	 zO9PrXBX4Ec6yc/L98pCsA7uqjA1bDncdT/mBW54mxfgA4bMws0S90I1JJ1YAuMnBe
	 lumXw9DtdN7wEvXWyFHtfV869f/8y90iffe+8zg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 767E1F800BC;
	Fri, 24 Sep 2021 16:49:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E480F802A0; Fri, 24 Sep 2021 16:49:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4C34F800BC
 for <alsa-devel@alsa-project.org>; Fri, 24 Sep 2021 16:49:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4C34F800BC
X-IronPort-AV: E=McAfee;i="6200,9189,10116"; a="203581272"
X-IronPort-AV: E=Sophos;i="5.85,320,1624345200"; d="scan'208";a="203581272"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2021 07:49:38 -0700
X-IronPort-AV: E=Sophos;i="5.85,320,1624345200"; d="scan'208";a="551836297"
Received: from bordone-mobl1.amr.corp.intel.com (HELO [10.209.164.235])
 ([10.209.164.235])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2021 07:49:37 -0700
Subject: Re: [PATCH v3] ASoC: Intel: boards: add max98390 2/4 speakers support
To: Mac Chiang <mac.chiang@intel.com>, alsa-devel@alsa-project.org
References: <20210924141446.19804-1-mac.chiang@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5418a9b0-b836-9248-b0e7-aae3a1df545e@linux.intel.com>
Date: Fri, 24 Sep 2021 09:49:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210924141446.19804-1-mac.chiang@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: jairaj.arava@intel.com, mark_hsieh@wistron.com, keith.tzeng@quantatw.com,
 broonie@kernel.org, sathyanarayana.nujella@intel.com, brent.lu@intel.com,
 bard.liao@intel.com
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



On 9/24/21 9:14 AM, Mac Chiang wrote:
> support 2 hw boards.
> 1. SSP2 connects max98390, 2 speakers.
> 2. SSP1 connects max98390, 2/4 speakers.
> 
> 2 or 4 speakers playback
> add echo reference capture
> add bt offload support
> add DMI_OEM_STRING for board varients
> add ALC5682I-VS support
> 
> Signed-off-by: Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>
> Signed-off-by: Mac Chiang <mac.chiang@intel.com>
> Signed-off-by: Kieth Tzeng <keith.tzeng@quantatw.com>
> Signed-off-by: Brent Lu <brent.lu@intel.com>
> ---
> v3:
>   - add acpi_dev_present() for additional tweeter condition, otherwise
>     stereo speakers.
>   - add ALC5682I-VS headphone codec support

I'll review this machine driver change when we've completed the topology
review in https://github.com/thesofproject/sof/pull/4723
Thanks.


