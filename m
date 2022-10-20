Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2030D6062A2
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 16:15:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4971D8D31;
	Thu, 20 Oct 2022 16:14:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4971D8D31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666275332;
	bh=4ffJQ1RXD/KkyXLHtdh10zhEBWT6RZnVyWCbuA2ZDXk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TyIlTNaYtDUNPlJ+cIur2vyo/Y1cs/UIiuwXXm5k4oXEy0syDKn0OGILpNCL9teTn
	 RzvoiyV95An/SADlpGG+hIojVWfdmsQZkdSE/CF9oAWBpMbm8X/y8yR8ceT+wQ135G
	 4gX+/TwPhz+IqXuo7CEXqQ6OLZOSW5kDj1zpFT20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4E4FF80137;
	Thu, 20 Oct 2022 16:14:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 480A0F804D8; Thu, 20 Oct 2022 16:14:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B1D4F800B5
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 16:14:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B1D4F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="k/8bJMEg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666275277; x=1697811277;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4ffJQ1RXD/KkyXLHtdh10zhEBWT6RZnVyWCbuA2ZDXk=;
 b=k/8bJMEg2TgpZG8jRCRTbeEBg13SYUp5ARqIwHTVYPa0PCS7MDOpI3uv
 rcCIAm+rQleoZyL3EnfmbHZ7MojKPwC8Lgn2gg9DQ5g0IEWvkeH0hgVnJ
 jdd8DUkC81frELAHJZVAcZ1S5iISdQUWJN5+8W4Gl0FiLHKpJjZI2Juqr
 xy1rx141uZBKwpkW7V8qmUNPvrPBTvt7f4e6/iTeEM3XJzJRPxZY7SfWs
 KSs9O/CGDAy8RBRJMvxyvIS0HU50AgRS0iS+sMNPAGpv6ZqWbScr7GOi+
 4eAJYEFPWQfEuqWBwxZ0WOTxRkv2r0yfDLe4Tn9oTn8b1+10VMB9YVj5N A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="393019875"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="393019875"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 07:14:31 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="958956740"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="958956740"
Received: from awmoore-mobl1.amr.corp.intel.com (HELO [10.212.11.204])
 ([10.212.11.204])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 07:14:31 -0700
Message-ID: <390775f4-5eca-b9a1-0474-69a182e66c11@linux.intel.com>
Date: Thu, 20 Oct 2022 09:14:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH 2/8] ASoC: Intel: avs: Introduce PCM power management
 routines
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20221019175317.1540919-1-cezary.rojewski@intel.com>
 <20221019175317.1540919-3-cezary.rojewski@intel.com>
 <2f391106-a73f-fb11-075d-5621bf592633@linux.intel.com>
 <247013af-31a2-2013-aae5-ea55eb4eb482@intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <247013af-31a2-2013-aae5-ea55eb4eb482@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: hdegoede@redhat.com, tiwai@suse.com, amadeuszx.slawinski@linux.intel.com
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



On 10/20/22 02:56, Cezary Rojewski wrote:
> On 2022-10-19 8:02 PM, Pierre-Louis Bossart wrote:
> 
> ...
> 
>> This is clearly going to conflict with my own rename/move changes in
>> "ALSA/ASoC: hda: move SPIB/DRMS functionality from ext layer"
>>
>> The SPIB and DRMS handling are not DSP-specific and should be handled in
>> the 'generic' sound/hda layer. In theory the HDaudio legacy driver
>> should have used those capabilities.
>>
>> It should be a simple rebase though for this patch.
> 
> No problem with waiting for the series you mention to be merged first.
> Will rebase once it's done.
> 
> Also, that's a good point in regard to DRSM. This could indeed be added
> into common sound/hda lib. Something like below perhaps?

Between SPIB and DRSM, I would pick SPIB as the most interesting for the
legacy HDaudio driver. This prevents the DMA hardware from playing stale
data and would allow for xruns to be detected in cleaner ways. The
programming sequences are relatively straightforward when the .ack is used.

I must admit my ignorance of how DRSM works exactly. We haven't used it
in the SOF driver where INFO_RESUME is disabled, and with a DSP I am not
too sure how to restart precisely from the same location with all the
intermediate buffering and processing that may happen.

> int snd_hdac_stream_resume(struct hdac_stream *azx_dev)
> {
>         struct hdac_bus *bus = azx_dev->bus;
>         u32 mask, reg;
>         int ret;
> 
>         mask = 1 << azx_dev->index;
> 
>         ret = readb_poll_timeout(bus->drsmcap + AZX_REG_DRSM_CTL, reg,
> !(reg & mask), 250, 2000);
>         if (ret)
>                 dev_dbg(bus->dev, "polling RSM 0x%08x failed: %d\n",
> mask, ret);
>         return ret;
> }
> EXPORT_SYMBOL_GPL(snd_hdac_stream_resume);
