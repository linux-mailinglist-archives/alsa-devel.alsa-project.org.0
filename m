Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECF4164988
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 17:11:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8AEC1697;
	Wed, 19 Feb 2020 17:10:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8AEC1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582128675;
	bh=wfuKTsSAkv9Z0gYQnuIcU+X+ypse1c6k1bZ8YnUzH/I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uBmwrHrb16l8/r2IczOR7/XbtPNeGQyeygbflusGAWver8Rmb9+4svwNKyvLuru4Z
	 mv/Hra2egDdUNf9ruwJmnr1D5M2ypfsKWuwxQ4vrmKyH48Kbzk8A2mkSwEaKmW2mj6
	 yVyLs2ktbv4jl0+PrFjBQnhxPmfDkhvjoaIx50aI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14319F80114;
	Wed, 19 Feb 2020 17:09:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42A78F80273; Wed, 19 Feb 2020 17:09:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 767D9F80114
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 17:09:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 767D9F80114
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2020 08:09:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,461,1574150400"; d="scan'208";a="434517377"
Received: from jsahoo-mobl.amr.corp.intel.com (HELO [10.254.110.74])
 ([10.254.110.74])
 by fmsmga005.fm.intel.com with ESMTP; 19 Feb 2020 08:09:22 -0800
Subject: Re: [alsa-devel] [PATCH v3 0/7] ASoC: soc-pcm cleanup step2
To: Dmitry Osipenko <digetx@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87d0anceze.wl-kuninori.morimoto.gx@renesas.com>
 <5d19876d-86a4-a461-f47a-68c7ba1f46ac@gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d60ccad5-9c52-551b-ae22-2815ab768a59@linux.intel.com>
Date: Wed, 19 Feb 2020 10:09:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5d19876d-86a4-a461-f47a-68c7ba1f46ac@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jon Hunter <jonathanh@nvidia.com>
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


> I'm observing a NULL dereference on NVIDIA Tegra20/30 once PulseAudio is
> loaded.
> 
> The offending patch is:
> 
>    ASoC: soc-pcm: call snd_soc_component_open/close() once

We also see a regression Kai bisected to the same patch

https://github.com/thesofproject/linux/pull/1805#issuecomment-588266014


