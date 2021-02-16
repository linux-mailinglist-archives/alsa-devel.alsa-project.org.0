Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3B331C766
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Feb 2021 09:35:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2D74850;
	Tue, 16 Feb 2021 09:34:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2D74850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613464541;
	bh=g4S28H9d1bD34WtJOswMRcdv8+78lEdXtImFrQj0l/o=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uvhkfqv9KCx6T8OSDlCfzQej50wV335JCCkbSwSil9h/Nw2TcBtsknzDmiNKVb20y
	 nox4vgSrMrGSHS+4ohFHmsoBgcYIWCnH0TVwi+AyqHAxuJHdKGSvmP7h1E1VGMHl2u
	 1VKYGxNzyB+P/9CdPo6UxyQiCYlZ2Oouo1kEwgEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 010FFF8016E;
	Tue, 16 Feb 2021 09:34:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E958F8015A; Tue, 16 Feb 2021 09:34:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05529F80059
 for <alsa-devel@alsa-project.org>; Tue, 16 Feb 2021 09:34:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05529F80059
IronPort-SDR: PxSryggSztkAa+lQW7lvraMdpUGdXoV27xsGSHwxv15HMZqJqHyjxO7COP2l+2Q3flSWwITodt
 rrxL8O7WOmmw==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="244312250"
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; d="scan'208";a="244312250"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 00:34:00 -0800
IronPort-SDR: bP2kJzY2TGVG44tM3fz9rMTw4XqXogxxGVncXvFCHrErVkiOnh5OvX70i0nL2UEcOlJrmnOkAE
 IJuPC2nL2KnQ==
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; d="scan'208";a="399426040"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 00:33:56 -0800
Date: Tue, 16 Feb 2021 10:30:26 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 2/3] ASoC: soc-pcm: add soc_pcm_hw_update_chan()
In-Reply-To: <87zh04wkf4.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <alpine.DEB.2.22.394.2102161024120.864696@eliteleevi.tm.intel.com>
References: <87tuqs90rl.wl-kuninori.morimoto.gx@renesas.com>
 <87r1lw90oo.wl-kuninori.morimoto.gx@renesas.com>
 <62f03ec8-7b9c-4550-d63d-cc50693e62fa@linux.intel.com>
 <alpine.DEB.2.22.394.2102142311050.864696@eliteleevi.tm.intel.com>
 <20210215204527.GC4378@sirena.org.uk>
 <alpine.DEB.2.22.394.2102160840420.864696@eliteleevi.tm.intel.com>
 <87zh04wkf4.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard liao <yung-chuan.liao@linux.intel.com>
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

On Tue, 16 Feb 2021, Kuninori Morimoto wrote:

> > I think we might still have issues if we have multiple CPU DAIs per
> > runtime and dpcm_init_runtime_hw() is called multiple times. With the 
> 
> Actually, when I posted the patch, I removed 1 line which I thought not needed.
> But it seems it was necessary...
> 
> Current fixup patch always initialize hw at dpcm_set_fe_runtime()'s loop,
> but I guess we need is initialize once.
> 
> How about this patch ?

yes, this is even better! dpcm_init_runtime_hw() is not called from 
anywhere else, so this looks good.

I kicked off SOF CI with this patch applied. It should be all good, but 
testing just in case.

Br, Kai
