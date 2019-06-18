Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D26474A8CE
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 19:51:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0007D16D1;
	Tue, 18 Jun 2019 19:50:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0007D16D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560880301;
	bh=8fhuNdeN94uxga1iSmCFvZ2f5QtyqYK1McVTV0mtTGo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RyVf0MjLjIXGiG534KbWpszhzL5sioJjTJqLCJfcgkKFsyRm4nzYszZl92xRvejCA
	 klpx7VABfBVf3lTphFvEXUSsD7KpVkwKKk5h94hjRN0WnLNb5ejmpOLnLxsPs48lFV
	 AzhY9BE/O2vzixOxBtV1lARbxIGRktpnPitE0d/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F468F8971C;
	Tue, 18 Jun 2019 19:49:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40A28F8075C; Tue, 18 Jun 2019 19:49:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 602A0F8075C
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 19:49:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 602A0F8075C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jun 2019 10:49:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,390,1557212400"; d="scan'208";a="170299855"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga002.jf.intel.com with ESMTP; 18 Jun 2019 10:49:47 -0700
Received: from rkammarx-mobl3.ger.corp.intel.com (unknown [10.252.61.163])
 by linux.intel.com (Postfix) with ESMTP id 4140758028E;
 Tue, 18 Jun 2019 10:49:46 -0700 (PDT)
To: Bard liao <yung-chuan.liao@linux.intel.com>, broonie@kernel.org,
 tiwai@suse.de
References: <20190618002336.5734-1-yung-chuan.liao@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8ee10576-6c07-c532-4142-abded850010f@linux.intel.com>
Date: Tue, 18 Jun 2019 19:49:48 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190618002336.5734-1-yung-chuan.liao@linux.intel.com>
Content-Language: en-US
Cc: liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 bard.liao@intel.com
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: Intel: sof-rt5682: add MCLK
 support for BYT platform
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

On 6/18/19 2:23 AM, Bard liao wrote:
> From: Xun Zhang <xun2.zhang@intel.com>
> 
> The sof-rt5682 machine driver currently uses BCLK on BYT/Minnowboard
> platform. The MCLK signal is available since the Turbot revision, so
> enable MCLK on BYT/Minnowboard Turbot platform.

The commit message is not wrong but for more context the MCLK is enabled 
on all known BYT/CHT platforms except early MinnowBoards and Up where 
the MCLK is not available on the low-speed/HAT connector.

> 
> Signed-off-by: Xun Zhang <xun2.zhang@intel.com>
> Signed-off-by: Bard liao <yung-chuan.liao@linux.intel.com>


>   	if (sof_rt5682_quirk & SOF_RT5682_MCLK_EN) {
> +		if (sof_rt5682_quirk & SOF_RT5682_MCLK_BYTCHT_EN) {
> +			ret = clk_prepare_enable(ctx->mclk);
> +			if (ret < 0) {
> +				dev_err(rtd->dev,
> +					"could not configure MCLK state");
> +				return ret;
> +			}
> +		}

Note that we could technically fallback to using the BCLK only in the 
error case but it's an unlikely scenario which we've never seen, so

Patch 1 and 2

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
