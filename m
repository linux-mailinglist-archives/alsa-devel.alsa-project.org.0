Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C5954CE97
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jun 2022 18:26:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C5631933;
	Wed, 15 Jun 2022 18:25:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C5631933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655310392;
	bh=D8gMtM5jApeamlNpr7Y4zott9O22bSHKQKN/0wRyeaM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PO7FsU5XXeXNH30hKDFea1mBH7RZl5h85okTInXqMKWLc63PKHOqmY1IQ5c9cSnI7
	 SJYCWkd+eWp+/6PPCQykDZs+YRiHo0lmzd8kiXB8H2fB6sLjWI/efrcedc26SwUeoj
	 NePbbjpjQQCbGxvJ+8Z86eN0SdrhqNDZL0Jziq6s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73CA2F8012B;
	Wed, 15 Jun 2022 18:25:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31509F80162; Wed, 15 Jun 2022 18:25:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5787F8012B
 for <alsa-devel@alsa-project.org>; Wed, 15 Jun 2022 18:25:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5787F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Aq17VKXH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655310324; x=1686846324;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=D8gMtM5jApeamlNpr7Y4zott9O22bSHKQKN/0wRyeaM=;
 b=Aq17VKXHGdvQDLfzoR5eeEpna/6nVyday8ZwPyU2lj8NAzWLhKDzzagy
 VUgxaWiK7+NIEXUYKXHBsCs2D2KYe4DCFuHPP1ZJY1Lp/M1NkYn8h3M8X
 6IjrjMfD3zHmvSRu7gHXJM678Ifaxb5oFDG23bPW+ewqMnxte267TU+R6
 N0lgfZEC+c+EpRk4/x+G2oiZeZhav1CnDBSDA7+6koStPK9cllve0Q2OB
 AlcXGMhWuvomBIBkr07bU1UhEf7SgVQlwNtjajfq4hFTYqc3Y/XdRnyzu
 E71hL/UZmM7jFXhlFtRh+1xVQ2EpIVjVZT0V9qegeYRAFzgzTv4MVqIQs g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="304453976"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="304453976"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 09:25:14 -0700
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="831131886"
Received: from ldortadu-mobl1.amr.corp.intel.com (HELO [10.209.160.187])
 ([10.209.160.187])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 09:25:14 -0700
Message-ID: <a32db639-89e7-de35-6943-b29a7fb52200@linux.intel.com>
Date: Wed, 15 Jun 2022 11:25:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH v2 16/17] ASoC: Intel: bdw_rt286: Refactor suspend/resume
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20220613091546.1565167-1-cezary.rojewski@intel.com>
 <20220613091546.1565167-17-cezary.rojewski@intel.com>
 <dd6633cb-9db5-ee61-fde1-32b4e8d0e086@linux.intel.com>
 <1391e54d-7b6f-7b43-d979-ce08febd2378@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1391e54d-7b6f-7b43-d979-ce08febd2378@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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


> Jacks are often initialized during dai_link initialization which is
> completely out of platform_device area. This report made me think
> further - if we assign jack in dai_link->init(), we should be able to
> drop it in dai_link->exit().
> 
> Not exactly! ->init() is done once card components are already accounted
> for (available for use) but snd_soc_link_exit() is called during
> snd_soc_remove_pcm_runtime() when card components are available no
> longer - soc_remove_link_components().
> 
> TLDR: teardown path is not symmetric with its counterpart, perhaps a
> problem yet to be addressed. I'll see if moving the jack-NULLing to
> codec's DAI ->remove() won't be a better temporary (?) solution than
> reverting to platform_device->remove() usage.

It's a problem that impacted other platforms, see e.g.

static void kabylake_rt5660_codec_exit(struct snd_soc_pcm_runtime *rtd)
{
	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(rtd->card);

	/*
	 * The .exit() can be reached without going through the .init()
	 * so explicitly test if the gpiod is valid
	 */
	if (!IS_ERR_OR_NULL(ctx->gpio_lo_mute))
		gpiod_put(ctx->gpio_lo_mute);
}

I vaguely recall hitting this myself when working with codec properties.
It's worthy of a comment in the ASoC header to make sure this is better
known/shared.

I see in other drivers that the use of component_set_jack() is
symmetrical between .init and .exit, so far we haven't seen any issues
with sof_rt5682.c and others.
