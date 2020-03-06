Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E1D17C682
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 20:51:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBD2F15E4;
	Fri,  6 Mar 2020 20:50:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBD2F15E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583524285;
	bh=HR9K0yJlSRIM3ebFAX2H35qWcu2u/k0JeQL26Dr3rH0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NF8/CmsBPHRAKKb0Qo3qMmfrpW+ULpNcYH+kI2qTc/Nsnz3MjF7zReq3bzovsKcWl
	 el9F3d9v+Sf2JF0W+VY6Dsb4G0n3Y2qS53HrFhJeU2mpSeSskekFa0nniKoVcXUWGq
	 VuvOCDgLEmXnJhP+SsD4dkn0aJHa7Wo5ta8p1xs8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E695DF801F5;
	Fri,  6 Mar 2020 20:49:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B94B1F801ED; Fri,  6 Mar 2020 20:49:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F657F80125
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 20:49:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F657F80125
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Mar 2020 11:49:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,523,1574150400"; d="scan'208";a="275659587"
Received: from jrbond-mobl.amr.corp.intel.com (HELO [10.254.11.58])
 ([10.254.11.58])
 by fmsmga002.fm.intel.com with ESMTP; 06 Mar 2020 11:49:31 -0800
Subject: Re: [PATCH 5/7] ASoC: Intel: skl_hda_dsp: Enable Dmic configuration
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20200305145314.32579-1-cezary.rojewski@intel.com>
 <20200305145314.32579-6-cezary.rojewski@intel.com>
 <alpine.DEB.2.21.2003061636580.2957@eliteleevi.tm.intel.com>
 <b4874ca6-4c47-ffc8-f3b0-a2ba39797dcc@linux.intel.com>
 <47d77a70-2012-26f5-fda5-7a15e26bcdb4@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <de1267f8-de6c-7578-b07a-07c5019165b5@linux.intel.com>
Date: Fri, 6 Mar 2020 13:49:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <47d77a70-2012-26f5-fda5-7a15e26bcdb4@intel.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 vkoul@kernel.org, broonie@kernel.org,
 Mateusz Gorski <mateusz.gorski@linux.intel.com>
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



> Guys, we've simply taken long-standing working example such as skl_rt286 
> or bxt_rt298 and applied the missing diff between skl_hda_dsp's and said 
> machine boards DAPM routes. skl-pcm.c exposes BE: DMIC01 Rx which 
> Intel's SST topologies link against via dmic01_hifi. That has always 
> been the case. No bad intentions, the exact opposite is true: taken old 
> path approach to make sure nothing is broken. Turns out SOF does things 
> differently. Thanks for spotting/ testing this out on your end.

It's actually not SOF, but recent changes in the asoc core that will 
stop the probe if a route cannot be added, instead of just spewing a 
warning.

I think it's a good change to force topologies to be complete, but in 
cases where a previously released topology cannot be adjusted we need a 
backwards compatible solution. that's my plan for the rest of the afternoon.

> Not a problem to adjust topology on our end, though. In fact, I've 
> already done that on your requested, tested it out and it works just 
> fine. In consequence:
> - this patch will be dropped from the series
> - topology patch provided for alsa-ucm-conf will be updated accordingly 
> (dmic01_hifi widget will cease to exist)

Sounds good, thanks Cezary.
