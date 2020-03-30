Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2295C197FFC
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 17:42:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4D6E166F;
	Mon, 30 Mar 2020 17:41:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4D6E166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585582946;
	bh=oG6T/gOGk9/Kyd0hHVAMpBlx4+RhDiOzWifYqBCE8HM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VWuac1OLe+Pd8lAxOef7FLDHiVJLcShcxX1ma2zYXEtwE+fhdRGxORre7X4l+gGya
	 zZ303Hl6deSHP6ziXNI5tRbx9fSk0XqadUSt8OYYumIuKPq5uhvRiM3Mks/mJey0Fs
	 /laFKX1bKZUPRHGBrRBHtfUM+rAaMvCsw+27W4Cs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 500A0F8014A;
	Mon, 30 Mar 2020 17:40:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94BFCF80148; Mon, 30 Mar 2020 17:40:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52B49F800EB
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 17:40:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52B49F800EB
IronPort-SDR: 6QE95vv6dTYy8KGNFmYs4F+VdTp6BegdIx4DCiaTsfhWvlRlASz1NaaI/OQT5vFOlWsHIXygv6
 SpfANqhIBRyw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 08:40:16 -0700
IronPort-SDR: Eb2wCb1HDrU2DzP2nA7wX4Pbrz6pL26tO4z1Tv0An+jMLK0GbSzhbsOkvUE2sGuAJTXysg9+8M
 Nq2gK+so6sBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,324,1580803200"; d="scan'208";a="395161805"
Received: from sgobriel-mobl.amr.corp.intel.com (HELO [10.212.145.94])
 ([10.212.145.94])
 by orsmga004.jf.intel.com with ESMTP; 30 Mar 2020 08:40:15 -0700
Subject: Re: [PATCH 0/4] ASoC: Intel: boards: Remove ignore_suspend flag from
 SSP0 dai link
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200319204947.18963-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a8d375c4-6b07-fcae-270d-ad03d6eb9def@linux.intel.com>
Date: Mon, 30 Mar 2020 10:40:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319204947.18963-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: vkoul@kernel.org, broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com
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



On 3/19/20 3:49 PM, Cezary Rojewski wrote:
> As of commit:
> ASoC: soc-core: care .ignore_suspend for Component suspend
> 
> function soc-core::snd_soc_suspend no longer ignores 'ignore_suspend'
> flag for dai links. While BE dai link for System Pin is
> supposed to follow standard suspend-resume flow, appended
> 'ignore_suspend' flag disturbs that flow and causes audio to break
> right after resume. Remove the flag to address this.
> 
> Link to first message in conversation:
> https://lkml.org/lkml/2020/3/18/54
> 
> Cezary Rojewski (4):
>    ASoC: Intel: broadwell: Remove ignore_suspend flag from SSP0 dai link
>    ASoC: Intel: haswell: Remove ignore_suspend flag from SSP0 dai link
>    ASoC: Intel: bdw-rt5677: Remove ignore_suspend flag from SSP0 dai link
>    ASoC: Intel: bdw-rt5650: Remove ignore_suspend flag from SSP0 dai link

tested on Broadwell XPS 13 and bdw-rt5677, so

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
>   sound/soc/intel/boards/bdw-rt5650.c | 1 -
>   sound/soc/intel/boards/bdw-rt5677.c | 1 -
>   sound/soc/intel/boards/broadwell.c  | 1 -
>   sound/soc/intel/boards/haswell.c    | 1 -
>   4 files changed, 4 deletions(-)
> 
