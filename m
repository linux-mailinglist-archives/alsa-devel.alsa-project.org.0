Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EF116B727
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Feb 2020 02:24:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4160E168F;
	Tue, 25 Feb 2020 02:23:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4160E168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582593858;
	bh=3UQO2A8FawDNSus/ZwgxA3mwFbPDQDDox0shRwTabWM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aR29mTYMe6smpbfXmhqZC5rIInspzo59DrADnvQkcHPKSt7nUQRxrb201dn/3BO1N
	 vwixrP9vKiVIo/l3gLUpVefDkMlDnrEyfrg3lCc6t6/QtgaQIMfEoerllo8MQ4Pa6p
	 dw/VabLSWBVMPtiudY0TA8ZHG4oB+fy7YB3Fwtlo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BF8BF80090;
	Tue, 25 Feb 2020 02:22:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4236F8014E; Tue, 25 Feb 2020 02:22:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19E2FF80137
 for <alsa-devel@alsa-project.org>; Tue, 25 Feb 2020 02:22:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19E2FF80137
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Feb 2020 17:22:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,482,1574150400"; d="scan'208";a="231304243"
Received: from hjremley-mobl1.amr.corp.intel.com (HELO [10.252.142.201])
 ([10.252.142.201])
 by fmsmga008.fm.intel.com with ESMTP; 24 Feb 2020 17:22:25 -0800
Subject: Re: [alsa-devel] [PATCH 7/7] ASoC: soc-pcm: tidyup soc_pcm_open()
 order
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <877e1doeis.wl-kuninori.morimoto.gx@renesas.com>
 <87wo9dmzwv.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <eb217e1e-6438-b59d-c155-5fe53de542ee@linux.intel.com>
Date: Mon, 24 Feb 2020 19:22:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87wo9dmzwv.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>
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

Hi Morimoto-san,

> soc_pcm_open() operation order is not good.
> At first, soc_pcm_open() operation order is
> 
> 	1) CPU DAI startup
> 	2) Component open
> 	3) Codec DAI startup
> 	4) rtd startup
> 
> But here, 2) will call try_module_get() if component has
> module_get_upon_open flags. This means 1) CPU DAI startup
> will be operated *before* its module was loaded.
> DAI should be called *after* Component.
> 
> Second, soc_pcm_close() operation order is
> 	1) CPU DAI shutdown
> 	2) Codec DAI shutdown
> 	3) rtd shutdown
> 	4) Component close
> 
> soc_pcm_open() and soc_pcm_close() are paired function,
> but, its operation order is unbalance.
> This patch tidyup soc_pcm_open() order to Component -> rtd -> DAI.

Maybe a red-herring but while reviewing the other soc-pcm changes I 
started wondering if this order change is actually valid for all platforms.

If you look at the soc-pcm code, all the way to 2011

ddee627cf6bb60 ('ASoC: core - Separate out PCM operations into new
file')

you'll see that the intent was to
- start the cpu_dai
- open the platform driver to e.g handle DMAs
- start the codec_dai.

The second step is not really needed for Intel but might be needed on 
others where the DMA is centrally handled (Omap, etc).

My concern is that we've modified the order to deal with module 
dependencies, without necessarily taking into account that DMA setup part

That said I don't understand the initial sequence for soc_pcm_close() so 
I am not advocating for a revert, but more a clarification of what those 
component open/close steps are supposed to do.

Thanks
-Pierre
