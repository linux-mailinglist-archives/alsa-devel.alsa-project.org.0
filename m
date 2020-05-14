Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DDA1D3827
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 19:28:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD6451665;
	Thu, 14 May 2020 19:27:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD6451665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589477306;
	bh=6eyy38OkQeJpGAoVdxA2g1JF4/n6/riGZJslo9Y0psE=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q8hyUTwkmikHftTu0ANYMHYPB+VCq5nWamBGOafPb/jzgs1u9Zo+C5f6yK6IW81Oc
	 fLVT6J2h02dl6wM8rQrCToEL0B3SWsyFZqiop24j/Opm04kmocZYlmzzhpMz8Frrep
	 OjkL5P/KFnm6yLBD1w7OqXJ+AvvzahJBaVOi4NSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF1C4F80101;
	Thu, 14 May 2020 19:26:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E30CF8014C; Thu, 14 May 2020 19:26:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FEAAF800BD
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 19:26:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FEAAF800BD
IronPort-SDR: cW2P89DlaZ7MSM0GzGGGja32xhe/lBPM8/kMhxdlT4s4GHPv/xMm8tVyPKgOByLjpQfz8MvzIo
 A5sftiNyJ4kQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2020 10:26:30 -0700
IronPort-SDR: /nJxLbz7E7SgzEp8Y0H/gvtvm1lkpoiPHaGAsMss53RJOFEHUxaW9mDt4UJSY/kdM5a8PmEB0/
 5wtzSZ9Pw4BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,392,1583222400"; d="scan'208";a="252136227"
Received: from mathayi-mobl.amr.corp.intel.com ([10.254.177.108])
 by fmsmga007.fm.intel.com with ESMTP; 14 May 2020 10:26:30 -0700
Message-ID: <3d132bbcd985c450c3ac8cd406eb51893535b238.camel@linux.intel.com>
Subject: Re: [PATCH v2 00/21] ASoC: cleanup DAI/Component activity
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Thu, 14 May 2020 10:26:30 -0700
In-Reply-To: <87blmq9alx.wl-kuninori.morimoto.gx@renesas.com>
References: <87blmq9alx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On Thu, 2020-05-14 at 17:36 +0900, Kuninori Morimoto wrote:
> Hi Mark
> 
> These are v2 of DAI/Component activity cleanup.
> 
> This patch-set exchanges soc-dapm.c :: snd_soc_dai_link_event_xxx()
> behavior which updates dai->active but not cares other actives.
> But I think original code was wrong.
> So, I believe these works correctly, but maybe need some tests or
> deep review.
> 
> v1 patch-set used "activity", but v2 is using "active" for each
> function/macro naming.
> 
> Link: 
> https://lore.kernel.org/r/875zd39frp.wl-kuninori.morimoto.gx@renesas.com
> 
> Kuninori Morimoto (21):
>   ASoC: soc-pcm: replace snd_soc_runtime_activate()/deactivate() to
> macro
>   ASoC: soc-dai: add snd_soc_dai_action()
>   ASoC: soc-dapm: use snd_soc_dai_activate()/deactivate()
>   ASoC: soc-dai: add snd_soc_dai_active()
>   ASoC: soc-component: add snd_soc_component_active()
>   ASoC: soc-dai: add snd_soc_dai_stream_active()
>   ASoC: use snd_soc_xxx_active()
>   ASoC: atomel: use snd_soc_xxx_active()
>   ASoC: bcm: use snd_soc_xxx_active()
>   ASoC: cirrus: use snd_soc_xxx_active()
>   ASoC: codecs: use snd_soc_xxx_active()
>   ASoC: fsl: use snd_soc_xxx_active()
>   ASoC: intel: use snd_soc_xxx_active()
>   ASoC: jz4740: use snd_soc_xxx_active()
>   ASoC: mediatek: use snd_soc_xxx_active()
>   ASoC: meson: use snd_soc_xxx_active()
>   ASoC: pxa: use snd_soc_xxx_active()
>   ASoC: ti: use snd_soc_xxx_active()
>   ASoC: uniphier: use snd_soc_xxx_active()
>   ASoC: dwc: use snd_soc_xxx_active()
>   ASoC: cleanup dai / component active code

V2 looks good, Morimoto-san. Thanks!

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

