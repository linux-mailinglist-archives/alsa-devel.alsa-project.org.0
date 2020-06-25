Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F4A20A535
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 20:49:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D751C1945;
	Thu, 25 Jun 2020 20:48:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D751C1945
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593110943;
	bh=rLbojWXUptPdhCgDaskuNa2uLFc6h9pGZvfdLZl7BGg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rFAQU1tara3edroiElzFDIu+ubLZXXS23JKlxs95v8dzDVpq8M8bYj0ThgEXSB7vG
	 jziCYMLH/5bJ8lQjNjOBS0FnfIZJqvARTo4KN1AWTw9bZXVNCQMWZ2/XouNNd0Omj3
	 4lrcp5rRaIdS5AQNyC5JUNMyUwym/fCvKLH3AYuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC7F9F8023E;
	Thu, 25 Jun 2020 20:47:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB2F6F80234; Thu, 25 Jun 2020 20:47:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BAEBF80158
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 20:47:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BAEBF80158
IronPort-SDR: hvHqQyI6g6cBj02a3ZDflCloNX44FeHj2iD+MxMpwX3PheLU9Cg2Ng0PX4U24PlTbDezzzbtDZ
 b1nT82tgFQnA==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="132479965"
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="132479965"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 11:47:11 -0700
IronPort-SDR: +s+bQfE/QsCATeRVaatNfpITuJn6bUxiM4lrxARpv8HLiLD4pWnDJ8UBkX8hROuMXWeBpY4TNc
 cqpizLA22s4w==
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="265429477"
Received: from zeqimao-mobl.amr.corp.intel.com (HELO [10.254.109.39])
 ([10.254.109.39])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 11:47:10 -0700
Subject: Re: [PATCH 0/4] ASoC: Intel: fix missing .owner fields
To: alsa-devel@alsa-project.org
References: <20200625180635.3563-1-pierre-louis.bossart@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4c91abfb-5c68-97d4-713b-6271a3fc362b@linux.intel.com>
Date: Thu, 25 Jun 2020 13:47:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200625180635.3563-1-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, broonie@kernel.org
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



On 6/25/20 1:06 PM, Pierre-Louis Bossart wrote:
> Fix omission of .owner = THIS_MODULE in Intel and SOF cards.
> Thanks to Jaroslav and Takashi for reporting and suggesting a fix.

Sorry for the noise, please discard this series. I will add this in a 
separate machine driver update to avoid conflicts.

> 
> Pierre-Louis Bossart (4):
>    ASoC: SOF: nocodec: add missing .owner field
>    ASoC: Intel: cml_rt1011_rt5682: add missing .owner field
>    ASoC: Intel: sof_sdw: add missing .owner field
>    ASoC: Intel: bxt_rt298: add missing .owner field
> 
>   sound/soc/intel/boards/bxt_rt298.c         | 2 ++
>   sound/soc/intel/boards/cml_rt1011_rt5682.c | 1 +
>   sound/soc/intel/boards/sof_sdw.c           | 2 +-
>   sound/soc/sof/nocodec.c                    | 1 +
>   4 files changed, 5 insertions(+), 1 deletion(-)
> 
> 
> base-commit: 6f81e520b2906258a063f09b8d1dd9d0cc6a3172
> 
