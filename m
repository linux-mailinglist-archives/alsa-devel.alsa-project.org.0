Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74091192BCE
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 16:06:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1912F166B;
	Wed, 25 Mar 2020 16:05:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1912F166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585148791;
	bh=KaOL/dRSxDJQkGdvQPkIf/ldhHCiCNlaKHL4EJcDyrM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CJHBIfHMG+7jQW4UEmExS6UoiE4QdeXtyOLKA58qmyaEef2wHkWruY9+Ex6d3cbpF
	 KnBDJgl6vegzHmRlyGIH8GdDyGOOOXYQdLNygPFVPrQKvcvRvFtVp4u3nWIXL67d36
	 G8mfd+js/qntoACyvwhGW035frwp//I05HMKRopA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C05C4F8028C;
	Wed, 25 Mar 2020 16:03:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDBDCF8028B; Wed, 25 Mar 2020 16:03:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCD4CF80158
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 16:03:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCD4CF80158
IronPort-SDR: lKtzJlOBFuFmi+p/5qwzpS3i5GRIqkXWLzU8MSBPRzTdyvrNvHuXkaxGKXXXqzw9Icz3U7GiQ5
 7oeVYOKlyF6Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 08:03:42 -0700
IronPort-SDR: p8fzYMVvfWXcArNTYa9VOajBPHpffaMrSpjbM5vqdKYz28l6v8NgQazKnWIz38VAcAzmm05p+V
 fZCuHlb7PqRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; d="scan'208";a="393654622"
Received: from swmckee-mobl2.amr.corp.intel.com (HELO [10.252.137.27])
 ([10.252.137.27])
 by orsmga004.jf.intel.com with ESMTP; 25 Mar 2020 08:03:41 -0700
Subject: Re: [PATCH 0/3] ASoC: Intel: boards: Revert SSP0 links to use dummy
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200325131611.545-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2c22bea1-3139-260d-153d-04e9d212e3be@linux.intel.com>
Date: Wed, 25 Mar 2020 09:37:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200325131611.545-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: broonie@kernel.org, tiwai@suse.com, linux@dominikbrodowski.net
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



On 3/25/20 8:16 AM, Cezary Rojewski wrote:
> Recent series of patches targeting broadwell boards, while enabling
> SOF, changed behavior for non-SOF solutions. In essence replacing
> platform 'dummy' with actual 'platform' causes redundant stream
> initialization to occur during audio start. hw_params for haswell-pcm
> destroys initial stream right after its creation - only to recreate it
> again from proceed from there.
> 
> While harmless so far, this flow isn't right and should be corrected.
> The actual need for dummy components for SSP0 link is questionable but
> that issue is subject for another series.
> 
> Link to first message in conversation:
> https://lkml.org/lkml/2020/3/18/54
> 
> Cezary Rojewski (3):
>    ASoC: Intel: broadwell: Revert back SSP0 link to use dummy components
>    ASoC: Intel: bdw-rt5677: Revert SSP0 link to use dummy components
>    ASoC: Intel: bdw-rt5650: Revert SSP0 link to use dummy components

Thanks Cezary, for the series

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
>   sound/soc/intel/boards/bdw-rt5650.c | 7 ++++---
>   sound/soc/intel/boards/bdw-rt5677.c | 7 ++++---
>   sound/soc/intel/boards/broadwell.c  | 7 ++++---
>   3 files changed, 12 insertions(+), 9 deletions(-)
> 
