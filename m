Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D82B511C19
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 18:03:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81626851;
	Wed, 27 Apr 2022 18:02:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81626851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651075394;
	bh=rXX+rT71J5egDkFCr0XNgCNM2Ip7kcs7C+TCy0oaa2o=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dWKu0oOPfrOwjH4cmers4nCM+obWO+FFo8GatC8trYXcFAseNw+R0WTGqF0g6OcJg
	 Hg9XpVs/TM/nauf/0zsMNpstXEDRTrvsCf51rtBC8As61QDnISIK4+gSJlWECy25aK
	 PI8wLkctY+MLjehi/LFjFiz2HUvomf1/rzpg9B44=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D45C7F80256;
	Wed, 27 Apr 2022 18:02:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B72EBF800AE; Wed, 27 Apr 2022 18:02:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBE95F800AE;
 Wed, 27 Apr 2022 18:01:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBE95F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CHQhxdeN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651075322; x=1682611322;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rXX+rT71J5egDkFCr0XNgCNM2Ip7kcs7C+TCy0oaa2o=;
 b=CHQhxdeNQdGNuJ/p8Iwm9kwZ7yt57XsBwRrlSaZPJyyCGwZcZ/fjNa2B
 /kwTBfk/T6yoJwSwL31eEUXZ6sloIxYkViSpOX0qLqUIzQxa+gwhoVEdm
 QbqfJasU4YbpVLoaUNHUEy9F3ZEHwgwrM+tqurEoWoa/wQlNNJm5esaF/
 Oe/jW7h8g9IG1FxYIuKonxLlZSgTUmDs8Hbh/TV/3fJ23M2mpt00C7e2x
 L3/mQ9YW/JmOBOmIO4yyAuJXl3N7w529jgBmFsacyyITx+RV4QTlNclYa
 UfJML25Cr4VfS1GkuKPY3TF8KsaXoexep6YO8Kb9+rGXZ9+5rQBxKQFCt Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="352414798"
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; d="scan'208";a="352414798"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 08:56:36 -0700
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; d="scan'208";a="559008157"
Received: from dktowns1-mobl2.amr.corp.intel.com (HELO [10.209.20.44])
 ([10.209.20.44])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 08:56:34 -0700
Message-ID: <7213fec3-6844-6913-b63e-2be8fc6df626@linux.intel.com>
Date: Wed, 27 Apr 2022 10:39:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v2] ASoC: SOF: mediatek: Fix allyesconfig build error
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yaochun Hung <yc.hung@mediatek.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Yang Yingliang <yangyingliang@huawei.com>
References: <20220427071030.10172-1-tinghan.shen@mediatek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220427071030.10172-1-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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



On 4/27/22 02:10, Tinghan Shen wrote:
> ld: sound/soc/sof/mediatek/mt8186/mt8186-clk.o:(.opd+0x18): multiple
> definition of `adsp_clock_on';
> sound/soc/sof/mediatek/mt8195/mt8195-clk.o:(.opd+0x60): first defined
> here
> ld: sound/soc/sof/mediatek/mt8186/mt8186-clk.o: in function
> `.adsp_clock_on':
> 
> ld: sound/soc/sof/mediatek/mt8186/mt8186-clk.o:(.opd+0x30): multiple
> definition of `adsp_clock_off';
> sound/soc/sof/mediatek/mt8195/mt8195-clk.o:(.opd+0x78): first defined
> here
> ld: sound/soc/sof/mediatek/mt8186/mt8186-clk.o: in function
> `.adsp_clock_off':
> 
> ld: sound/soc/sof/mediatek/mt8186/mt8186-loader.o:(.opd+0x0): multiple
> definition of `sof_hifixdsp_boot_sequence';
> sound/soc/sof/mediatek/mt8195/mt8195-loader.o:(.opd+0x0): first defined
> here
> ld: sound/soc/sof/mediatek/mt8186/mt8186-loader.o: in function
> `.sof_hifixdsp_boot_sequence':
> 
> ld: sound/soc/sof/mediatek/mt8186/mt8186-loader.o:(.opd+0x18): multiple
> definition of `sof_hifixdsp_shutdown';
>  sound/soc/sof/mediatek/mt8195/mt8195-loader.o:(.opd+0x18): first defined
> here
> ld: sound/soc/sof/mediatek/mt8186/mt8186-loader.o: in function
> `.sof_hifixdsp_shutdown':
> 
> Fixes: 570c14dc92d5 ("ASoC: SOF: mediatek: Add mt8186 sof fw loader and
> dsp ops")
> Fixes: 210b3ab932f7 ("ASoC: SOF: mediatek: Add mt8186 dsp clock support")
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
> 
> Changes since v1:
> Rebase on Mark's for-next and update "Fixes" commit id
> 
> ---
>  sound/soc/sof/mediatek/mt8186/mt8186-clk.c    |  4 ++--
>  sound/soc/sof/mediatek/mt8186/mt8186-clk.h    |  4 ++--
>  sound/soc/sof/mediatek/mt8186/mt8186-loader.c |  4 ++--
>  sound/soc/sof/mediatek/mt8186/mt8186.c        | 18 +++++++++---------
>  sound/soc/sof/mediatek/mt8186/mt8186.h        |  4 ++--
>  5 files changed, 17 insertions(+), 17 deletions(-)
