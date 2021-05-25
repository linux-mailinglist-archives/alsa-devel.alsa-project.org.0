Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B0938FDF4
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 11:34:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D8281726;
	Tue, 25 May 2021 11:34:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D8281726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621935294;
	bh=FePyl+1EzWWc5/TpSIdc9+U35vn/lPqIkS7Vf+sUKOI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sBNdcuiyd3sYFrCb7n4EhGKKAs0U2xe5JKoLG+ltLrXDvy1Eg+5LEhGegBRu94NzO
	 fRNjX69skFLu34V9CoQ8qbvrMoa3mi9SZ+ueFruHAkk9h3/MPg8LYH9Gli5JsQ6aUb
	 QmQc1paedXwAvGXCS59W3CJ6iA6BrtaFarLOHcRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E38B6F801F5;
	Tue, 25 May 2021 11:33:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31BDBF801EB; Tue, 25 May 2021 11:33:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F026F80137
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 11:33:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F026F80137
IronPort-SDR: uJ0+XgjAQ/cR1bK0rUTxhjv+7okCIhO6P041Oz98o7TDEjla5keiYiAZtJdAE8Bpibpo1UQwSo
 GpskmaeapjWw==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="182473309"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="182473309"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 02:33:17 -0700
IronPort-SDR: 03bxMCJnHjkapOYeBavX3PK6rCBaqzbrD754BtcWIUXQm6MdhrnVdDmwdedAwlJQ1BK16JcpW0
 X6QlnuI5o7FQ==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="546702087"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 02:33:14 -0700
Date: Tue, 25 May 2021 12:28:17 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: Intel: boards: Select SND_SOC_HDAC_HDMI for
 Soundwire machine driver
In-Reply-To: <9ed54875-fe77-f70f-9085-0f3b4c9d576e@linux.intel.com>
Message-ID: <alpine.DEB.2.22.394.2105251158580.3922722@eliteleevi.tm.intel.com>
References: <20210520163324.19046-1-rf@opensource.cirrus.com>
 <9ed54875-fe77-f70f-9085-0f3b4c9d576e@linux.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: cezary.rojewski@intel.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 patches@opensource.cirrus.com, yang.jie@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org
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

Hi,

On Mon, 24 May 2021, Pierre-Louis Bossart wrote:

> On 5/20/21 11:33 AM, Richard Fitzgerald wrote:
> > Add select of SND_SOC_HDAC_HDMI for SND_SOC_INTEL_SOUNDWIRE_SOF_MACH.
> > Without this the build results in missing references to
> > hdac_hdmi_jack_port_init and hdac_hdmi_jack_init.
> Kai, can you comment on this one? There is nothing specific to HDMI in this
> driver.

usage of hdac-hdmi is removed in newer mach drivers (like 
sof_da7219_max98373, sof-pcm512 and ehl_rt5660 -> and there's no select 
for SND_SOC_HDAC_HDMI for these). For older ones, we've kept hdac-hdmi in 
to keep compatibility.

For sof_sdw, there are still calls to hdac_hdmi_jack_init() and friends
in sof_sdw_hdmi.c, so this is a real problem.

I'd say a better fix is that we remove the hdac-hdmi support from sof_sdw.
I can do a patch for that.

> Something's inconsistent here, it's not limited to SoundWire I am afraid

I checked all the related mach drivers and the Kconfig definitions are 
correct for others. So select is done to HDAC_HDMI whenever the mach 
driver uses hdac_hdmi_jack_*().

Br, Kai
