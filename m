Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA74327D3DB
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Sep 2020 18:49:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 788D417D4;
	Tue, 29 Sep 2020 18:48:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 788D417D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601398143;
	bh=Px+Eu18+pEE46JGOoF2WbXfECqanKh/hxsUb51dwOzg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hFA8L8q0rXX69kQieNyUA4JQAEkF8s1rrNmmpeEt2Rf5RlUMVHmiBwllx1gaBKHCq
	 ZzNFX7M0WXxxpuRUHFvEt0sQlbk8m1KVYHcsySbbF+ovLQK45rIpj1EJGH3m4jn/I/
	 V09bnEwOtX0BKj8G0krBUOCa1KV3qJV+djm19G9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA30DF8020C;
	Tue, 29 Sep 2020 18:47:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6058F8020C; Tue, 29 Sep 2020 18:47:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EFBAF800AB
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 18:47:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EFBAF800AB
IronPort-SDR: jCaufbgunQ4Rzwb745y2LTquuTZVcPJQoXOXmrn0weqcIsxamXH0HQvHtBur9zTlTx/cX1k1IF
 /EtP8Qd4lo7Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="223831479"
X-IronPort-AV: E=Sophos;i="5.77,319,1596524400"; d="scan'208";a="223831479"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 09:47:05 -0700
IronPort-SDR: 1mSSNq486VN3OWLXmrxDgLYzIBfSHk57A70beMHlBOzY4co0exDsccBOr2BZqx7wO6sQ5uJ1cz
 +HgzxYxWWLsw==
X-IronPort-AV: E=Sophos;i="5.77,319,1596524400"; d="scan'208";a="351200652"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 09:47:01 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kNImF-002q6J-Jw; Tue, 29 Sep 2020 19:46:55 +0300
Date: Tue, 29 Sep 2020 19:46:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Subject: Re: [PATCH v9 06/14] ASoC: Intel: catpt: PCM operations
Message-ID: <20200929164655.GV3956970@smile.fi.intel.com>
References: <20200926085910.21948-1-cezary.rojewski@intel.com>
 <20200926085910.21948-7-cezary.rojewski@intel.com>
 <20200929113340.GH3956970@smile.fi.intel.com>
 <80336977ccb643b49559492fa9ca5927@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80336977ccb643b49559492fa9ca5927@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>, "N,
 Harshapriya" <harshapriya.n@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Barlik,
 Marcin" <marcin.barlik@intel.com>, "zwisler@google.com" <zwisler@google.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "Proborszcz, Filip" <filip.proborszcz@intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
 "Wasko, Michal" <michal.wasko@intel.com>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>, "Hejmowski,
 Krzysztof" <krzysztof.hejmowski@intel.com>,
 "ppapierkowski@habana.ai" <ppapierkowski@habana.ai>, "Gopal,
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

On Tue, Sep 29, 2020 at 01:26:51PM +0000, Rojewski, Cezary wrote:
> On 2020-09-29 1:33 PM, Andy Shevchenko wrote:

...

> Since you've already proposed the solution to LKML, once it's added to
> the kernel, it will be re-used in catpt just like resource_union().

Agree.

> Good ideas all around, Andy. It's rather surprising to me how many good
> ideas came during the upstream process of this small driver.

Thanks! That's how I consider to be a good Samaritan for the project.

-- 
With Best Regards,
Andy Shevchenko


