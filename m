Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EE24D2043
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 19:29:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62B741724;
	Tue,  8 Mar 2022 19:28:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62B741724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646764161;
	bh=JBHfXnj8F282xvFMF+nU221aD2nlurLIXu2okWterO0=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dVqfXA+nAkqSzTJDSI1896WkAb6wBIFrFU6kP11QCanfTe9Lcqm7cbN5CF6AAgIL3
	 gT7rjOI+E0HjCoBm7PZf3Me1Ojgkf1eDsOr/+pfFOW6jwU4wwJb/jDBSNoyXfcHQcS
	 fpqqfyIqplAClk7l88qwdErSUu8jbEPHrS1Vu0RQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6864F80121;
	Tue,  8 Mar 2022 19:28:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C13FF8026A; Tue,  8 Mar 2022 19:28:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75F0EF800D1
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 19:28:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75F0EF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Jvsv5ynV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646764087; x=1678300087;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JBHfXnj8F282xvFMF+nU221aD2nlurLIXu2okWterO0=;
 b=Jvsv5ynVToRpLOwSrn/mSwi5ax1qaF8SFwZiqbeq5QFXjvjzdSe+/n/r
 0HX2yEVfb1vHINswzq12kd+rFXzbnTeqJIplmPGmXx8DmAiIbVnXJi6vW
 guCEtOeXSymQEmgw9P7eFimX1Fjr/TVOKSxoFhmiwkZ3f4pNQ0NWdlxR3
 5t3wSDdjIBIBeI5xwrKOM/ePUYRQTt6XLrriCUMuSfZyBEEqJ+4fgy4VJ
 vol2cdDDdHbK+9VMMgVGBu0eGZb6JIuWrIrh/qbgfUBszuj4q45wwo85V
 vElDeR40KMb2RjRO2JT9x2yYd7mLmCnlFNo0nuJh/rfl/FxNalqLZRFsq g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="235385553"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="235385553"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 10:26:37 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="495555926"
Received: from slkortic-mobl1.amr.corp.intel.com ([10.254.25.36])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 10:26:36 -0800
Message-ID: <e71e12e1af0b9af115410c8210f21f4e50a09e6f.camel@linux.intel.com>
Subject: Re: [PATCH v3 11/17] ASoC: Intel: avs: Firmware resources
 management utilities
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
Date: Tue, 08 Mar 2022 10:26:35 -0800
In-Reply-To: <361901b8-f8a5-7b27-ee44-872c4e10bc2c@intel.com>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-12-cezary.rojewski@intel.com>
 <66e20563567955124488eb9f9b53ea6a2bc5d744.camel@linux.intel.com>
 <d7676598-27bc-fe5d-1167-c82795e533f7@intel.com>
 <a571f334944f3ae7762068572003299c34fd187a.camel@linux.intel.com>
 <f70be289-ee9c-51b5-4003-7bc567e87a54@intel.com>
 <9f4cbf5a720aa66d6a540092187ad88b3adb5525.camel@linux.intel.com>
 <4691b216-92f6-8d46-d3db-e302f5f21c34@intel.com>
 <3c79c158757bfd542747bcf7b4de73e4529ac4d5.camel@linux.intel.com>
 <361901b8-f8a5-7b27-ee44-872c4e10bc2c@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
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

On Tue, 2022-03-08 at 19:07 +0100, Cezary Rojewski wrote:
> > Keeping in mind that this driver is meant for older platforms, how
> > likely are you to support multiple sound cards with those
> > topologies?
> 
> 
> Not sure what's the question here. Age of the platform has nothing to
> do 
> 
> with the subject. There is not a single DSP-capable platform that
> Intel 
> 
> has shipped that would not contain more one audio device onboard. At 
> 
> least I'm not aware of any.

My question was related to your comment about multiple sound cards.
What I asked was do you plan to support multiple topologies with
modules spread across then with multiple sound component drivers with
the AVS driver and firmware? Does this mean you will need multiple
topology files and machine driver? And what is the rationale for this?

If not, there's no need for the mutex.

Thanks,
Ranjani

