Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A995667C7
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 12:21:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B71BF16EC;
	Tue,  5 Jul 2022 12:21:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B71BF16EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657016516;
	bh=RYl9IYSG9cksS7fgtP/Z5qYiEyPG+m5whyd+N1MwcCI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eqFRPOL7r3JOyFxku69umXKaCadFw3i+aH+ws323UHu7V8UXMh7pIFJp03/TyNGmV
	 4rUbhqbga1H8XnDINLkgBFgRmZPp/QcX0mf/FoE8c+JaxKyiVvKWOfz7OSPxKcHy+7
	 Obv9iNavxTh2klu0uh6CXmwHp+cZwYM8lemLGEro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC555F80212;
	Tue,  5 Jul 2022 12:20:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 902FFF8012A; Tue,  5 Jul 2022 12:20:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A541FF8012A
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 12:20:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A541FF8012A
Received: from ramsan.of.borg ([84.195.186.194])
 by albert.telenet-ops.be with bizsmtp
 id rNLf270094C55Sk06NLfeX; Tue, 05 Jul 2022 12:20:44 +0200
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o8ffa-0029jA-Kj; Tue, 05 Jul 2022 12:20:38 +0200
Date: Tue, 5 Jul 2022 12:20:38 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
X-X-Sender: geert@ramsan.of.borg
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 02/14] ASoC: codecs: Add HD-Audio codec driver
In-Reply-To: <20220511162403.3987658-3-cezary.rojewski@intel.com>
Message-ID: <alpine.DEB.2.22.394.2207051218200.513966@ramsan.of.borg>
References: <20220511162403.3987658-1-cezary.rojewski@intel.com>
 <20220511162403.3987658-3-cezary.rojewski@intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com,
 kai.vehmanen@linux.intel.com, harshapriya.n@intel.com,
 linux-kernel@vger.kernel.org, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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

 	Hi Cezary,

On Wed, 11 May 2022, Cezary Rojewski wrote:
> Add generic ASoC equivalent of ALSA HD-Audio codec. This codec is
> designed to follow HDA_DEV_LEGACY convention. Driver wrapps existing
> hda_codec.c handlers to prevent code duplication within the newly added
> code. Number of DAIs created is dependent on capabilities exposed by the
> codec itself. Because of this, single solution can be applied to support
> every single HD-Audio codec type.
>
> At the same time, through the ASoC topology, platform drivers may limit
> the number of endpoints available to the userspace as codec driver
> exposes BE DAIs only.
>
> Both hda_codec_probe() and hda_codec_remove() declare their expectations
> on device's usage_count and suspended-status. This is to catch any
> unexpected behavior as PM-related code for HD-Audio has been changing
> quite a bit throughout the years.
>
> In order for codec DAI list to reflect its actual PCM capabilities, PCMs
> need to be built and that can only happen once codec device is
> constructed. To do that, a valid component->card->snd_card pointer is
> needed. Said pointer will be provided by the framework once all card
> components are accounted for and their probing can begin. Usage of
> "binder" BE DAI solves the problem - codec can be listed as one of
> HD-Audio card components without declaring any actual BE DAIs
> statically.
>
> Relation with hdac_hda:
>
> Addition of parallel solution is motivated by behavioral differences
> between hdac_hda.c and its legacy equivalent found in sound/pci/hda
> e.g.: lack of dynamic, based on codec capabilities, resource allocation
> and high cost of removing such differences on actively used targets.
> Major goal of codec driver presented here is to follow HD-Audio legacy
> behavior in 1:1 fashion by becoming a wrapper. Doing so increases code
> coverage of the legacy code and reduces the maintenance cost for both
> solutions.
>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

Thanks for your patch, which is now commit b5df2a7dca1cc6c6 ("ASoC:
codecs: Add HD-Audio codec driver") in sound-asoc/for-next.

> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -937,6 +937,16 @@ config SND_SOC_HDAC_HDA
> 	tristate
> 	select SND_HDA
>
> +config SND_SOC_HDA
> +	tristate "HD-Audio codec driver"
> +	select SND_HDA_EXT_CORE
> +	select SND_HDA

I am wondering if this needs a platform dependency?
Or perhaps this symbol should be made invisible, as it is selected by
SND_SOC_INTEL_AVS_MACH_HDAUDIO?  Are there any other users?

Thanks!

> +	help
> +	  This enables HD-Audio codec support in ASoC subsystem. Compared
> +	  to SND_SOC_HDAC_HDA, driver's behavior is identical to HD-Audio
> +	  legacy solution - including the dynamic resource allocation
> +	  based on actual codec capabilities.
> +
> config SND_SOC_ICS43432
> 	tristate "ICS43423 and compatible i2s microphones"
>

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
