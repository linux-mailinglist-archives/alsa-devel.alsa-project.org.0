Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF9C26C9D2
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 21:28:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86EEF1671;
	Wed, 16 Sep 2020 21:27:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86EEF1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600284528;
	bh=4ThOD9KVdGV/arucUsJ6aZylQGo9xSf9mNkj6xhVjLU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ImWYWy2qGShH8urbskn50lX3ccEFmJd99wYkriowx1tVuMgoDBN02Ri8J1B12F3mh
	 XKvmLWkMb1i1Ulon2WhGpB2VVK7FKDPCL6D1XcbW0Cl1FI6cFRRTXmoINxdo7o3vC2
	 ejvBj6ASnscSICSrePsgaZow/a16TQ+Wb7KivK9U=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 217DEF8015C;
	Wed, 16 Sep 2020 21:27:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE01BF8015A; Wed, 16 Sep 2020 21:26:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BEABF800E8
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 21:26:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BEABF800E8
IronPort-SDR: hbfGURS0ZTKv/C/bThyuIaErEbFVSohAERmDkchs0xOLWwZghqiheTtEYd0Pll1Xch/Nf6GjaS
 BHWIu7KyW1Sg==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="139058915"
X-IronPort-AV: E=Sophos;i="5.76,434,1592895600"; d="scan'208";a="139058915"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 12:25:58 -0700
IronPort-SDR: RWmOuU45gJ522HRgspBlhHTEfDkjCDAjDJ2IIWWaCyDNgcRw5+3tnxOPfrEHYCxx/pJhDF9Q3v
 p2/7SK3cjpFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,434,1592895600"; d="scan'208";a="336142762"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 16 Sep 2020 12:25:53 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kIcrF-00H9bG-4F; Wed, 16 Sep 2020 22:12:45 +0300
Date: Wed, 16 Sep 2020 22:12:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Subject: Re: [PATCH v5 01/13] ASoC: Intel: Add catpt device
Message-ID: <20200916191245.GF3956970@smile.fi.intel.com>
References: <20200915162944.16241-1-cezary.rojewski@intel.com>
 <20200915162944.16241-2-cezary.rojewski@intel.com>
 <20200916152455.GP3956970@smile.fi.intel.com>
 <20200916165614.GC3956970@smile.fi.intel.com>
 <9050ad4f60764a55a98579e494bd53f0@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9050ad4f60764a55a98579e494bd53f0@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>, "N,
 Harshapriya" <harshapriya.n@intel.com>, "Barlik,
 Marcin" <marcin.barlik@intel.com>, "zwisler@google.com" <zwisler@google.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "Proborszcz, Filip" <filip.proborszcz@intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
 "Wasko, Michal" <michal.wasko@intel.com>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>, "Hejmowski,
 Krzysztof" <krzysztof.hejmowski@intel.com>, "Papierkowski,
 Piotr \(Habana\)" <ppapierkowski@habana.ai>, "Gopal,
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
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

On Wed, Sep 16, 2020 at 06:30:27PM +0000, Rojewski, Cezary wrote:
> > On Wed, Sep 16, 2020 at 06:24:56PM +0300, Andy Shevchenko wrote:
> > > On Tue, Sep 15, 2020 at 06:29:32PM +0200, Cezary Rojewski wrote:
> > > > Declare base structures, registers and device routines for the catpt
> > > > solution. Catpt deprecates and is a direct replacement for
> > > > sound/soc/intel/haswell. Supports Lynxpoint and Wildcat Point both.
> > >
> > > Few nit-picks below. Overall looks good, FWIW,
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > Actually hold on. See below.
> > 
> > > > +void catpt_sram_init(struct resource *sram, u32 start, u32 size);
> > > > +void catpt_sram_free(struct resource *sram);
> > > > +struct resource *
> > > > +catpt_request_region(struct resource *root, resource_size_t size);
> > 
> > These seems dangling declarations that has to be moved to the
> > corresponding
> > patch. Please, revisit entire series to be sure that:
> > 
> > - each patch doesn't add any warnings on W=1
> > - each patch doesn't have dangling stuff
> > - each patch is bisectable for compilation and run-time
> > 
> 
> TLDR: you want patches:
> 6/13 ASoC: Intel: catpt: PCM operations
> 5/13 ASoC: Intel: catpt: Add IPC messages
> 4/13 ASoC: Intel: catpt: Implement IPC protocol
> 3/13 ASoC: Intel: catpt: Firmware loading and context restore
> 2/13 ASoC: Intel: catpt: Define DSP operations
> 1/13 ASoC: Intel: Add catpt device
> 
> squashed. There is no other way to achieve that without combining
> all the core-code together. fs and traces can be provided separately,
> but not the first 6.

No. My point is introduce header (declaration) with definition (c-file)
together. Like those three of four functions.


-- 
With Best Regards,
Andy Shevchenko


