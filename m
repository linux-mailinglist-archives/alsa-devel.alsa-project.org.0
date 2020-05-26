Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C91F01E2220
	for <lists+alsa-devel@lfdr.de>; Tue, 26 May 2020 14:42:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 799721758;
	Tue, 26 May 2020 14:41:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 799721758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590496937;
	bh=yvwBiem+i63+BNWCmCgiq6RvZAYpWPUjCxFwLbHCAzU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rxnA6Rnow7+iqUGY+2Sfd46tDs6DucN/gfeCfFPerYog8bSrEyGv2eE1HXvRlgmd1
	 Lj9zuBOYNWXc08J+hkA4ivyQJHK2vbPZ/vC1vUKsYpmqAILqrwfdpY5Roq/aFHAKjO
	 sWq+NyeoHpk5y6so59A0U8UfZntRKUpyIaup1b80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D8F7F8015D;
	Tue, 26 May 2020 14:40:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1423F8015C; Tue, 26 May 2020 14:40:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF863F80131
 for <alsa-devel@alsa-project.org>; Tue, 26 May 2020 14:40:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF863F80131
IronPort-SDR: NmApHmxc91zTJHTRWdwfrMSx3M8y/4P2xv1pzTWjLb073zEBD/7Tz4VOf4QeR0ScgeWr3yVOI9
 8Zw2UAyzTYTg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2020 05:40:23 -0700
IronPort-SDR: Uq2GzSeRvydiR1fGoaDZ8XU1veHv0aNLx+M16uRxyj3GjPlPPReRb0iKs+Bq+FdWbeJotE/ruR
 pcRkWKXF5SRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,437,1583222400"; d="scan'208";a="468280827"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.10.59])
 ([10.213.10.59])
 by fmsmga005.fm.intel.com with ESMTP; 26 May 2020 05:40:21 -0700
Subject: Re: [PATCH v2 0/2] ASoC topology header parsing refinement
To: Keyon Jie <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org
References: <20200521074847.71406-1-yang.jie@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <32df1cf8-8a57-7fc8-c694-6ddcc03fffca@intel.com>
Date: Tue, 26 May 2020 14:40:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521074847.71406-1-yang.jie@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, broonie@kernel.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

On 2020-05-21 9:48 AM, Keyon Jie wrote:
> This small series is to optimize the header logging during the topology
> parsing. This is verified work fine on both SOF and SST drivers
> (bxt_rt298 with dfw_sst.bin).
> 
> Change History:
> v2:
> - Change the internal used array to be 'static' to fix the issue
>    reported by: kbuild test robot <lkp@intel.com>
> - Add testing coverage including Intel SST driver also.
> 
> v1:
> - Initial version.
> 
> Keyon Jie (2):
>    ASoC: topology: refine and log the header in the correct pass
>    ASoC: topology: remove the redundant pass checks
> 
>   sound/soc/soc-topology.c | 99 ++++++++++++++++++----------------------
>   1 file changed, 44 insertions(+), 55 deletions(-)
> 

No regression after applying these and running through SST CI on cAVS 
1.5+ (GLK) and 1.8 (CNL).

Given some comments on 1/2 though, believe it could be simplified.

Czarek
