Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD2726D9D0
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 13:05:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AE8D1680;
	Thu, 17 Sep 2020 13:04:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AE8D1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600340705;
	bh=PZU8k7DAsm7e8rE5GArdOuLuIYHuiGZlrxjQPpemAAw=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vi39G4n5JOgRvS+JmIubzHRY0d/uWlJxychgtpu48QhFvrYTVwph5rOHdXpGsm50T
	 YzdONTAc623I13D4hd4SnXOiQJK6OjdcNWn/a4MigAxNrf79GRTFYyja58Xt+Cp+7d
	 jpoPfnLmtZZEolq2V3e7piqs5e7gIRRNC4KK/hJ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67FD9F8032A;
	Thu, 17 Sep 2020 12:59:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BF28F80329; Thu, 17 Sep 2020 12:59:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26D50F801EC
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 12:59:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26D50F801EC
IronPort-SDR: sqCjefnk5VygAzI61x3UWS0Ki5oxi7cTH7jSk4qYoeORUEGCNZOUF1ZojnpWRKb379hu07a8mS
 bwAIuY/qE4GQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="221220370"
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="221220370"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 03:59:07 -0700
IronPort-SDR: hPr1eDYh4F8Y+DSOxOm4zqgk/eL6GziqnlD3tIvey68trac8JwjBHfmOxUTYak7IMvX2ZQ8eff
 aeSLje3NRHyA==
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="452251439"
Received: from tkahl-mobl1.ger.corp.intel.com ([10.252.40.2])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 03:59:01 -0700
Message-ID: <08f624fa1c0efe49924e292abef934ff97c5ddf2.camel@linux.intel.com>
Subject: Re: [PATCH v5 01/13] ASoC: Intel: Add catpt device
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Date: Thu, 17 Sep 2020 11:58:57 +0100
In-Reply-To: <9050ad4f60764a55a98579e494bd53f0@intel.com>
References: <20200915162944.16241-1-cezary.rojewski@intel.com>
 <20200915162944.16241-2-cezary.rojewski@intel.com>
 <20200916152455.GP3956970@smile.fi.intel.com>
 <20200916165614.GC3956970@smile.fi.intel.com>
 <9050ad4f60764a55a98579e494bd53f0@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>, "N,
 Harshapriya" <harshapriya.n@intel.com>, "Papierkowski,
 Piotr \(Habana\)" <ppapierkowski@habana.ai>, "Barlik,
 Marcin" <marcin.barlik@intel.com>, "zwisler@google.com" <zwisler@google.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "Proborszcz,
 Filip" <filip.proborszcz@intel.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
 "Wasko, Michal" <michal.wasko@intel.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "Hejmowski, Krzysztof" <krzysztof.hejmowski@intel.com>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>, "Gopal,
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

On Wed, 2020-09-16 at 18:30 +0000, Rojewski, Cezary wrote:
> > On Wed, Sep 16, 2020 at 06:24:56PM +0300, Andy Shevchenko wrote:
> > > On Tue, Sep 15, 2020 at 06:29:32PM +0200, Cezary Rojewski wrote:
> > > > Declare base structures, registers and device routines for the
> > > > catpt
> > > > solution. Catpt deprecates and is a direct replacement for
> > > > sound/soc/intel/haswell. Supports Lynxpoint and Wildcat Point
> > > > both.
> > > Few nit-picks below. Overall looks good, FWIW,
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>

I can align the flows I need now from 2/13.

Liam

