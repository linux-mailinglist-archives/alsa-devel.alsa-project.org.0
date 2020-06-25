Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 672F920A4FD
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 20:28:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16502193D;
	Thu, 25 Jun 2020 20:27:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16502193D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593109725;
	bh=b6IU2J8HMZggkj1g3IODXnhaD8liZDTyBbQVYqjqm64=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nAMit5opVy4zMWg9Z0WoXclRQdC8eGq1ysX3RBhtBxue3qefYxnd43K5SszeNAPuZ
	 5RscAb5ECFgBz3JTYoo5O+zHtgUe3Vd/53yla9H6Sz5XW06YF/tsjua3+NTmli7Lk/
	 tn4Jn6xfNQIBjN8TNe+u9RYzmgV7yPERymlN5i2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CED8F80158;
	Thu, 25 Jun 2020 20:27:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E476F80218; Thu, 25 Jun 2020 20:27:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCE89F80158
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 20:26:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCE89F80158
IronPort-SDR: P2pjeCJ2Jt/syRt8WUkwoIzfaxaUbP/5NV1B2GXwFu9kxpQCWGO0N8qviYLxdVKdKFTLK0LpJm
 UUrIxLOlDYgQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="125268447"
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="125268447"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 11:26:50 -0700
IronPort-SDR: IkSsLCM/BBRNo9DHpoeMUCGXfeim8QmUvkYKSUO25/jDHiA3/Ead1w5tDCFYwiJOir47GCnd41
 Dm8sInng6dGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="354547989"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.11.151])
 ([10.213.11.151])
 by orsmga001.jf.intel.com with ESMTP; 25 Jun 2020 11:26:48 -0700
Subject: Re: [PATCH 0/4] ASoC: Intel: fix missing .owner fields
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200625180635.3563-1-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <11b67e99-c256-bc34-ff79-63db1573a459@intel.com>
Date: Thu, 25 Jun 2020 20:26:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200625180635.3563-1-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org
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

On 2020-06-25 8:06 PM, Pierre-Louis Bossart wrote:
> Fix omission of .owner = THIS_MODULE in Intel and SOF cards.
> Thanks to Jaroslav and Takashi for reporting and suggesting a fix.
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

Apart for small question in 3/4 patch, looks good. Thanks Pierre!

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
