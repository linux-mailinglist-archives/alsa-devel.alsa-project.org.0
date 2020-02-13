Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C1D15C91C
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 18:06:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CD4B16D4;
	Thu, 13 Feb 2020 18:05:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CD4B16D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581613594;
	bh=4HGviXw6ZeDJQ2Z5sFQmBSLKa6/aNrnundXUzeu95l8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hHc0uk6dZIBJ8xQjwPNyGX4fjy9XLFQrZSURsiQJvXvOAW5V8xbcqbrTXh++rDa+Y
	 GZa+FG9qPWeCl318l8+UteVtwRgufhjPhdJCDWa16HETTytbe9kvRNFfBEunswU29F
	 H/z+T4e5CfCZIyyf4fbMRGFOxer/Tl0x6Xw/D2Rc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65816F80138;
	Thu, 13 Feb 2020 18:04:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 745B6F800F0; Thu, 13 Feb 2020 18:04:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71CFDF800F0
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 18:04:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71CFDF800F0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Feb 2020 09:04:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,437,1574150400"; d="scan'208";a="222709203"
Received: from rebrandt-mobl.amr.corp.intel.com (HELO [10.251.9.115])
 ([10.251.9.115])
 by orsmga007.jf.intel.com with ESMTP; 13 Feb 2020 09:04:40 -0800
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>
References: <87lfp7ruxl.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <aecb0570-1fc5-26b8-9439-86cec856f805@linux.intel.com>
Date: Thu, 13 Feb 2020 09:29:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87lfp7ruxl.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 0/6] ASoC: use for_each_rtd_codec_dai()
	macro
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

[adding Mark in Cc:]

> Hi Mark
> 
> Some drivers aren't using for_each_rtd_codec_dai() macro.
> This patch-set switches to use it.
> 
> Kuninori Morimoto (6):
>    ASoC: soundwaire: qcom: use for_each_rtd_codec_dai() macro
>    ASoC: qcom: sdm845: use for_each_rtd_codec_dai() macro
>    ASoC: qcom: apq8016_sbc: use for_each_rtd_codec_dai() macro
>    ASoC: intel: cml_rt1011_rt5682: use for_each_rtd_codec_dai() macro
>    ASoC: intel: kbl_da7219_max98927: use for_each_rtd_codec_dai() macro
>    ASoC: mediatek: mt8183-da7219-max98357: use for_each_rtd_codec_dai() macro

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

>   drivers/soundwire/qcom.c                      |  7 ++++---
>   sound/soc/intel/boards/cml_rt1011_rt5682.c    |  3 +--
>   sound/soc/intel/boards/kbl_da7219_max98927.c  |  8 ++++----
>   .../mediatek/mt8183/mt8183-da7219-max98357.c  |  8 ++++----
>   sound/soc/qcom/apq8016_sbc.c                  |  7 +++----
>   sound/soc/qcom/sdm845.c                       | 20 +++++++++----------
>   6 files changed, 25 insertions(+), 28 deletions(-)
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
