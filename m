Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FFE2F6255
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jan 2021 14:50:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C41816BF;
	Thu, 14 Jan 2021 14:49:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C41816BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610632205;
	bh=zdrGa6V4aDBkKB9y0gpsAi0fUOhHIG8zYDhtoSH3ziM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bt3ezf0RT7n5ko2mg6fT24M9xAHNfTyJVBHH+QE0Db/ceOe5WBiHjob3AgmcisbOB
	 ZcEmHd70eHO3G0ofvygIcQIEB5DnJ0mFW99mi/jdgFRKN4EgyQo307C2rnDRjnCLlH
	 Xod88eo4g4vQ/3VLj8bhQOeUimug2vzYZSlTo1Ko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A2C5F8026F;
	Thu, 14 Jan 2021 14:48:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CE2EF8025E; Thu, 14 Jan 2021 14:48:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8B04F80113
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 14:48:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8B04F80113
IronPort-SDR: rzljR9gL4ApGnY8AIO/VgWYVCaL4xPOMC0BIl1Kt4LzCu3wAt+VzZdd/yA6S9Kl5DPCHDWFH4E
 /3Ald+tjtyJw==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="242437253"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="242437253"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 05:48:17 -0800
IronPort-SDR: LPXGK75AcHx/Pw60m1Qwqa8V/KlU6stote91NRPfRrm6Uh5kqhg/guHs1njl+vRWifKi5MYVKb
 PK95daUiwMBg==
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="382270627"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 05:48:14 -0800
Date: Thu, 14 Jan 2021 15:45:10 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2] ASoC: SOF: Intel: initial support to AlderLake-P
In-Reply-To: <s5h1renpv43.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2101141534270.864696@eliteleevi.tm.intel.com>
References: <20210114115558.52699-1-kai.vehmanen@linux.intel.com>
 <s5h1renpv43.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com, broonie@kernel.org,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

On Thu, 14 Jan 2021, Takashi Iwai wrote:

> On Thu, 14 Jan 2021 12:55:58 +0100, Kai Vehmanen wrote:
> > --- a/sound/soc/sof/sof-pci-dev.c
> > +++ b/sound/soc/sof/sof-pci-dev.c
[...]
> > -#if IS_ENABLED(CONFIG_SND_SOC_SOF_TIGERLAKE)
> > +#if IS_ENABLED(CONFIG_SND_SOC_SOF_TIGERLAKE) || IS_ENABLED(CONFIG_SND_SOC_SOF_ALDERLAKE)
> >  static const struct sof_dev_desc tgl_desc = {
> >  	.machines               = snd_soc_acpi_intel_tgl_machines,
> >  	.alt_machines		= snd_soc_acpi_intel_tgl_sdw_machines,
> 
> I guess snd_soc_acpi_intel_tgl_* would be missing even by this patch
> alone if TIGERLAKE=n and ALDERLAKE=y.

The ACPI matching tables soc-acpi-intel-match.h are not behind Kconfig 
ifdefs, so this is ok. I did actually test all the build combinations this 
time :) and the builds go through.
 
> IMO, the easiest fix would be to select CONFIG_SND_SOC_SOF_TIGERLAKE
> from CONFIG_SND_SOC_SOF_ALDERLAKE forcibly in Kconfig instead.  Then
> no tweak of ifdef is needed.

I'd rather keep this here. We may later update sof_dev_desc for ADL and no 
longer reuse tgl_desc, and then it's easier to cleanup if the #ifdef is 
only here, close to where the dependency is.

I too think the ifdefs are too finegrained, so maybe the next step is to 
just drop these, and/or reduce their number. We can review and discuss 
this when we refactor sof-pci-dev to address the concern Arnd raised.

Br, Kai
