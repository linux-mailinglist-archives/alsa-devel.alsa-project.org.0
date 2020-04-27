Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0E61BA5B6
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 16:10:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6979F1687;
	Mon, 27 Apr 2020 16:09:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6979F1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587996647;
	bh=LfVXsHAmAAR7zisPA2s9NJx81ZCsvHgOFxPxz/X4o18=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p93Yl70PQRckNjp5SY0qxVdEEV9OySJL7GXXRfsdk4W8EbAvAIOQsq9GJNADcB5vg
	 br5AjIF/k1wyfO/jfFO3qaRkhRiQiGYcY3XuZlYSKZPnGGMhUW0oqbIO+dslYk3XYX
	 dcuPseRwNEcKIqx3huOq1e4OoV6ZRq0PVtjmYM0Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B7B5F80217;
	Mon, 27 Apr 2020 16:09:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 599CEF8022B; Mon, 27 Apr 2020 16:09:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C5F5F80113
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 16:08:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C5F5F80113
IronPort-SDR: q/UvkNj8NaVQwDa5iqwD1JeXgMEnSxRh1galFrWTYXFbl9/cSF4s+6tLL1COtDGpeO2A45J3NE
 Dn7Jm6SulfVw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 07:08:53 -0700
IronPort-SDR: GobTRMgy3OfjcVKMlDiPXfhDit2+wkqNnnXn8CmJIeUb4CRJhClZ4iqmEU45CX3HC0otXWKfuq
 +tG30TzUMMqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,324,1583222400"; d="scan'208";a="248887328"
Received: from amedirat-mobl3.amr.corp.intel.com (HELO [10.254.24.88])
 ([10.254.24.88])
 by fmsmga008.fm.intel.com with ESMTP; 27 Apr 2020 07:08:37 -0700
Subject: Re: [PATCH v6 0/3] Add support for different DMIC configurations
To: Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200427132727.24942-1-mateusz.gorski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ccec5162-ae44-3a71-5118-2539ade442f4@linux.intel.com>
Date: Mon, 27 Apr 2020 08:30:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427132727.24942-1-mateusz.gorski@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, broonie@kernel.org, tiwai@suse.com
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



On 4/27/20 8:27 AM, Mateusz Gorski wrote:
> Set of patches to enable DMIC capture on different hardware
> configurations.
> Information about supported DMIC configuration is read from NHLT and
> correct pipeline configuration is selected automatically.
> Also, adding additional option for topology binary name which is
> based on used machine driver.
> 
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
> Mateusz Gorski (3):
>    ASoC: Intel: Skylake: Add alternative topology binary name
>    ASoC: Intel: Multiple I/O PCM format support for pipe
>    ASoC: Intel: Skylake: Automatic DMIC format configuration according to
>      information from NHLT
> 
> Changes in v2:
> - removed patch 1/4 swapping machine device and platform device
>    registration order
> - alt_tplg_name creation now uses different field to read machine driver
>    name
> - including of <sound/soc-acpi.h> moved to different patch
> 
> Changes in v3:
> - cosmetic changes in skl-topology.c file
> 
> Changes in v4:
> - refactored patch 2/3 to use one common helper function to deal with both
>    set and get pipe configuration operations, as suggested by Pierre
> - adjusted patch 3/3 to also use this helper function for DMIC pipes
> - added comment in patch 3/3 explaining the change of access rights for
>    DMIC enums
> 
> Changes in v5:
> - fixed alignment issue in patch 2/3
> - addressed "checkpatch.pl --strict" warnings in patches
> 
> Changes in v6:
> - fixed commit message in patch 2/3
> 
>   include/uapi/sound/skl-tplg-interface.h |   2 +
>   sound/soc/intel/skylake/skl-topology.c  | 178 +++++++++++++++++++++++-
>   sound/soc/intel/skylake/skl-topology.h  |   1 +
>   3 files changed, 176 insertions(+), 5 deletions(-)
> 
