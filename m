Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 061F617C0D7
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 15:48:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DC0515F9;
	Fri,  6 Mar 2020 15:47:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DC0515F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583506109;
	bh=62klweFIwoKvoOGe6pTO4aaPOmnp2C1NGbSMttzCUPk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a16kU6hBs37d73gw33cxPygD+/DBLZGxQijjXg6a5HMOWzdmCcY/S8texEj53KS2V
	 v76tJ7daiFXHEbPk/EdD8W7s3qDLQjtfa23oW0ngOns0Uww4IuqXZh571hBFWUs0VH
	 dUm3RmTmTU8FUWzpBSUMTxQYDAe8SeEQ2kgZFGaE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B25AF801F5;
	Fri,  6 Mar 2020 15:46:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63F5FF801ED; Fri,  6 Mar 2020 15:46:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01569F80126
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 15:46:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01569F80126
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Mar 2020 06:46:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,522,1574150400"; d="scan'208";a="264476569"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga004.fm.intel.com with ESMTP; 06 Mar 2020 06:46:37 -0800
Date: Fri, 6 Mar 2020 16:46:36 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 5/7] ASoC: Intel: skl_hda_dsp: Enable Dmic
 configuration
In-Reply-To: <20200305145314.32579-6-cezary.rojewski@intel.com>
Message-ID: <alpine.DEB.2.21.2003061636580.2957@eliteleevi.tm.intel.com>
References: <20200305145314.32579-1-cezary.rojewski@intel.com>
 <20200305145314.32579-6-cezary.rojewski@intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-ID: <alpine.DEB.2.21.2003061645420.2957@eliteleevi.tm.intel.com>
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
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

Hey,

On Thu, 5 Mar 2020, Cezary Rojewski wrote:

> --- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
> +++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
> @@ -59,6 +59,9 @@ static const struct snd_soc_dapm_route skl_hda_map[] = {
>  	{ "Digital CPU Capture", NULL, "Digital Codec Capture" },
>  	{ "codec2_in", NULL, "Alt Analog CPU Capture" },
>  	{ "Alt Analog CPU Capture", NULL, "Alt Analog Codec Capture" },
> +
> +	{ "dmic01_hifi", NULL, "DMIC01 Rx" },
> +	{ "DMIC01 Rx", NULL, "DMIC AIF" },

hmm, we need to figure out something else for this. This very same table 
already has:

»       /* digital mics */
»       {"DMic", NULL, "SoC DMIC"},

.. so now we have dmic entries two times in the same initializer list.

But a more pressing issue is that this breaks platforms using SOF 
firmware:

[   28.751756] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: no sink widget found for dmic01_hifi
[   28.751987] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed to add route DMIC01 Rx -> direct -> dmic01_hifi

... maybe you can align the topology to mathc so we can reuse the same 
widget mapping for both SOF and SST firmwares..?

Br, Kai
