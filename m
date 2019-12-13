Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0452311DD84
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2019 06:17:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ABE8178D;
	Fri, 13 Dec 2019 06:16:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ABE8178D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576214223;
	bh=i6kAhyZ+cPU90JyIdkYnVz03YJBU7vRvrC8F7Njyxi4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jfivnPTXjDPmcMPX6Ua80Ui4bhGiCw8SK7hUELbSk3/IaoZWnhMF2/isFBcTgBBgX
	 wqjo55bDahitg5HQkPZfn+Mo2QC/jhOdcq0d546TUAHnc/2o5GyD0YDcQt70pb3nde
	 zgK6OMBIsU1oY1s6gThazTTPGBWklrcvQTmzqeZ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8249F80240;
	Fri, 13 Dec 2019 06:07:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CC88F8021D; Fri, 13 Dec 2019 06:07:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EDDBF8019B
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 06:07:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EDDBF8019B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Dec 2019 21:07:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,308,1571727600"; d="scan'208";a="204212406"
Received: from vbagrodi-mobl2.amr.corp.intel.com (HELO [10.251.130.70])
 ([10.251.130.70])
 by orsmga007.jf.intel.com with ESMTP; 12 Dec 2019 21:07:18 -0800
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87mubx59la.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <15d4ac12-1216-43ab-ce6d-67927392434d@linux.intel.com>
Date: Thu, 12 Dec 2019 21:49:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <87mubx59la.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v2 00/15] ASoC: soc-core cleanup step7
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 12/12/19 6:54 PM, Kuninori Morimoto wrote:
> 
> Hi Mark
> 
> These are v2 of codec_conf cleanup.
> 
> ASoC has codec_conf, and we are using original
> dev_name, of_node for it to finding codec.
> But, we already have snd_soc_dai_link_component method.
> We can reuse it for codec_conf, too.
> This patches are for it.

Looks good to me

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> Big change from v1 is
> 
> 	- COMP_CODEC_CNF(_name)
> 	+ COMP_CODEC_CONF(_name)
> 
> Kuninori Morimoto (15):
>    ASoC: soc-core: support snd_soc_dai_link_component for codec_conf
>    ASoC: fsl: imx-audmix: use snd_soc_dai_link_component for codec_conf
>    ASoC: intel: kbl_da7219_max98927: use snd_soc_dai_link_component for codec_conf
>    ASoC: intel: kbl_rt5663_max98927: use snd_soc_dai_link_component for codec_conf
>    ASoC: intel: kbl_rt5663_rt5514_max98927: use snd_soc_dai_link_component for codec_conf
>    ASoC: intel: skl_nau88l25_ssm4567: use snd_soc_dai_link_component for codec_conf
>    ASoC: mediatek: mt8173-rt5650-rt5514: use snd_soc_dai_link_component for codec_conf
>    ASoC: mediatek: mt8173-rt5650-rt5676: use snd_soc_dai_link_component for codec_conf
>    ASoC: mediatek: mt8183-da7219-max98357: use snd_soc_dai_link_component for codec_conf
>    ASoC: samsung: bells: use snd_soc_dai_link_component for codec_conf
>    ASoC: samsung: lowland: use snd_soc_dai_link_component for codec_conf
>    ASoC: samsung: neo1973_wm8753: use snd_soc_dai_link_component for codec_conf
>    ASoC: samsung: speyside: use snd_soc_dai_link_component for codec_conf
>    ASoC: ti: rx51: use snd_soc_dai_link_component for codec_conf
>    ASoC: soc-core: remove legacy style of codec_conf
> 
>   include/sound/soc.h                                 |  4 ++--
>   sound/soc/fsl/imx-audmix.c                          |  2 +-
>   sound/soc/intel/boards/kbl_da7219_max98927.c        |  8 ++++----
>   sound/soc/intel/boards/kbl_rt5663_max98927.c        |  4 ++--
>   sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c |  4 ++--
>   sound/soc/intel/boards/skl_nau88l25_ssm4567.c       |  4 ++--
>   sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c    |  2 +-
>   sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c    |  2 +-
>   sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c  |  2 +-
>   sound/soc/samsung/bells.c                           |  2 +-
>   sound/soc/samsung/lowland.c                         |  2 +-
>   sound/soc/samsung/neo1973_wm8753.c                  |  2 +-
>   sound/soc/samsung/speyside.c                        |  2 +-
>   sound/soc/soc-core.c                                | 12 +++++-------
>   sound/soc/ti/rx51.c                                 | 12 ++++++------
>   15 files changed, 31 insertions(+), 33 deletions(-)
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
