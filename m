Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B6D518CBF
	for <lists+alsa-devel@lfdr.de>; Tue,  3 May 2022 21:01:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3CE3F3;
	Tue,  3 May 2022 21:00:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3CE3F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651604464;
	bh=O6cnLIq6PMJ42A5MwOes/E+1bx4PUwV/2pSooNwtoS4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Drah78CZED7LSAyB+DePiuYO78UhmQ3lPhdng7O6Eougjq3cRhC3to7CgfJ2Uc01N
	 hoq1ZUiT/E2bHOHaVebs55aolFtwOYgBf+TfxTAty0lNpmIec9GYSiS3e9GhvL9r09
	 XRtJRsaVyJdXKQme0JwvVv5/zIaHFqitFmufZazo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B309F8025E;
	Tue,  3 May 2022 21:00:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5D3FF800E5; Tue,  3 May 2022 21:00:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0F19F800E5
 for <alsa-devel@alsa-project.org>; Tue,  3 May 2022 20:59:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0F19F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BQjaK6OV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651604401; x=1683140401;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=O6cnLIq6PMJ42A5MwOes/E+1bx4PUwV/2pSooNwtoS4=;
 b=BQjaK6OV1eQ4N20Z8HTfg05EzxWqnM6zrIno3jr1VebXJFGj9c/fKLBn
 pqOnv2C1CxQ0wyVrrPQ3uq/ubImln1TtRSZYdEZTOcOvBKa1WxcWuyqHQ
 j2xP2288asEIz6p7L9RFw+R25bOG76RT+1/0VFgloFf0QbL0LrHJYN+zL
 O5Ap/wvFheiPkZ6TRCXb41fCWWqdcbwsYte703w+9pYX2vE6JnHyMGYD1
 lqYX3DJ9Isr5+RkCtyqgMGGLW97yBCjUXRVGgN1ZfTCAgT9geAUG0DPkm
 FhXH9D1HaK/VdV1rr4MWCnEdc2DR6FxdONi+/c44uiEx840fRy5BZH4WG A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="248103766"
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; d="scan'208";a="248103766"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 11:59:55 -0700
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; d="scan'208";a="599192053"
Received: from karimmdr-mobl.amr.corp.intel.com (HELO [10.251.7.211])
 ([10.251.7.211])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 11:59:54 -0700
Message-ID: <6dea4606-cb5e-1224-bf98-d1da1484ebfd@linux.intel.com>
Date: Tue, 3 May 2022 13:59:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: ASoC component/card relationship
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <d9c3fed4-de6a-2cd8-acb6-7f3d2ad46b70@linux.intel.com>
 <YnFwGJBjVGrsMJWR@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <YnFwGJBjVGrsMJWR@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Curtis Malainey <cujomalainey@google.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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


> This means we get back to the assumption we started off with - what are
> we gaining by partitioning things into cards when that's not really
> what's going on with the hardware?

The main benefit is reuse of 'generic' cards.

Take for example HDMI support, it's typically exactly the same from one
board to the other - it's completely standard. And yet, for every card,
we have to add a path in the topology and the machine driver to
represent exactly the same information multiple times. see below how
many times we add the same 'late_probe' callback for HDMI support in
machine drivers.

BT audio is a similar case, the interface configuration and settings are
defined by profiles, so there's almost no variation from one board to
the other except for which I2S number is used.

A peripheral directly attached to an SOC or chipset, such as digital
microphones, is a similar case.

The point is really to try to split what will be variable from board to
board due to different choices of headset codecs, amplifiers,
microphones, from what is generic and reusable.

The logic can be pushed further, as done in the AVS patch series, to
split the card by codec type. This would avoid having to deal with the
permutations that we have to handle in machine drivers. See e.g. how
complicated the initially generic sof-rt5682 machine driver has become,
it now supports rt5682s, rt1011, rt1015, rt1015p, max98373 and
max98360a. I will accept this comes from ACPI limitations, but if we
could split cards it would also reduce the machine driver complexity.

In terms of functionality, I don't think there will be any performance
or power improvement coming from a multi-card solution, it's mostly a
maintenance simplification: less duplicated code, more reuse.

One key point is "who defines the split". That's really one of the main
problems and different people could have different opinions - Cezary and
I have a shared goal of enabling multiple cards but different takes on
what the 'optimal' split might be.

My take is that the integrator for a given hardware is responsible for
making the decision - not the provider of a DSP driver. In case you have
coupling between interfaces, playback or capture, it can become really
difficult to define a split that will work for all cases, or conversely
if you don't have 'self-contained' cards that can be tested
independently then splitting the functionality was probably a really bad
idea. If one needs to add dependencies and quirks for a local device,
the notion of split cards is probably not so good either.

In other words, I think we need to agree on the means to create and
expose multiple cards, and agree not to debate on what the functionality
of individual cards might be.

Hope this helps clarify the ask?
-Pierre

sound/soc/intel/boards$ git grep '\.late_probe'

bxt_da7219_max98357a.c: .late_probe = bxt_card_late_probe,

bxt_rt298.c:    .late_probe = bxt_card_late_probe,

bxt_rt298.c:    .late_probe = bxt_card_late_probe,

cml_rt1011_rt5682.c:    .late_probe = sof_card_late_probe,

ehl_rt5660.c:   .late_probe = card_late_probe,

glk_rt5682_max98357a.c: .late_probe = glk_card_late_probe,

kbl_da7219_max98357a.c: .late_probe = kabylake_card_late_probe,

kbl_da7219_max98927.c:  .late_probe = kabylake_card_late_probe,

kbl_da7219_max98927.c:  .late_probe = kabylake_card_late_probe,

kbl_da7219_max98927.c:  .late_probe = kabylake_card_late_probe,

kbl_da7219_max98927.c:  .late_probe = kabylake_card_late_probe,

kbl_rt5660.c:   .late_probe = kabylake_card_late_probe,

kbl_rt5663_max98927.c:  .late_probe = kabylake_card_late_probe,

kbl_rt5663_max98927.c:  .late_probe = kabylake_card_late_probe,

kbl_rt5663_rt5514_max98927.c:   .late_probe = kabylake_card_late_probe,

skl_hda_dsp_generic.c:  .late_probe = skl_hda_card_late_probe,

skl_nau88l25_max98357a.c:       .late_probe = skylake_card_late_probe,

skl_nau88l25_ssm4567.c: .late_probe = skylake_card_late_probe,

skl_rt286.c:    .late_probe = skylake_card_late_probe,

sof_cs42l42.c:  .late_probe = sof_card_late_probe,

sof_da7219_max98373.c:  .late_probe = card_late_probe,

sof_da7219_max98373.c:  .late_probe = card_late_probe,

sof_es8336.c:   .late_probe = sof_es8336_late_probe,

sof_nau8825.c:  .late_probe = sof_card_late_probe,

sof_pcm512x.c:  .late_probe = sof_card_late_probe,

sof_rt5682.c:   .late_probe = sof_card_late_probe,

sof_sdw.c:              if (!codec_info_list[i].late_probe)

sof_sdw.c:      .late_probe = sof_sdw_card_late_probe,

sof_ssp_amp.c:  .late_probe = sof_card_late_probe,

