Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1675E6A33
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Sep 2022 20:00:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BF46100;
	Thu, 22 Sep 2022 19:59:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BF46100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663869612;
	bh=l49MJjVEZg6dHjjz5rjJy7LXGACd9SGftHKcNu/cLYY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sKewuHpgvQZpJhSyU4jXQ3KHWYmVOROpXODv3EDw4/p2FdDPbFn7eMkTqRwysVPJd
	 IOcbOZUdUsqaH6n/6dAhw5kKVD60tPPGIHVqRgGy6n9R+RFdaYJxwcuMR7b24+7mvU
	 ciV0kXMrt2loxFSzMo4pQlDIjv0OB4ZPEUExMf+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADBB2F8030F;
	Thu, 22 Sep 2022 19:59:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6470AF8027B; Thu, 22 Sep 2022 19:59:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D125EF80107
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 19:59:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D125EF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="F86iEDIl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663869549; x=1695405549;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=l49MJjVEZg6dHjjz5rjJy7LXGACd9SGftHKcNu/cLYY=;
 b=F86iEDIl8Rk/8RI+r88uR7qHFrSC4F06yM21rSUS1WBkzHOMRg4t5+CM
 gA/mOejlL3grqcmSSqS8taXnSO3Ixv2e+18CJBCJlDimkTSYZm+GypL5d
 3PnnjS6iHAjZYtblUEdMeiqOTvFFZ7nHR4aBc6/5UIue6o8eEMEULM0UG
 ptC8Yo74DWWgjGQ/YRr7wFlLBif18LdCVwqL6g0pJ2OyugDYm9BS14vU5
 M2Dq5DpXausq4F2amDdKAiu8GTcDwRD/te6TKNXzFz5r/93CXzk3GOtbt
 Mc2ilnFmGMMM2ayo5pTcHOaIOpPiQRZpSwwqpdEHNuHagCPW29eypyqcU A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="362151997"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="362151997"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 10:59:04 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="688395874"
Received: from icostanz-mobl1.amr.corp.intel.com (HELO [10.251.210.149])
 ([10.251.210.149])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 10:59:01 -0700
Message-ID: <b0595977-7cf4-7261-d006-a43ce6b63e31@linux.intel.com>
Date: Thu, 22 Sep 2022 19:58:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH -next] ASoC: Intel: sof_da7219_mx98360a: Access num_codecs
 through dai_link
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20220922153752.336193-1-nathan@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220922153752.336193-1-nathan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, patches@lists.linux.dev
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



On 9/22/22 17:37, Nathan Chancellor wrote:
> After commit 3989ade2d1e7 ("ASoC: soc.h: remove num_cpus/codecs"), the
> following build error occurs:
> 
>   sound/soc/intel/boards/sof_da7219_max98373.c:198:27: error: no member named 'num_codecs' in 'struct snd_soc_pcm_runtime'
>           for (j = 0; j < runtime->num_codecs; j++) {
>                           ~~~~~~~  ^
>   1 error generated.
> 
> This conversion was missed by the aforementioned change. Do it now to
> fix the build error.
> 
> Fixes: 3989ade2d1e7 ("ASoC: soc.h: remove num_cpus/codecs")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/intel/boards/sof_da7219_max98373.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/boards/sof_da7219_max98373.c b/sound/soc/intel/boards/sof_da7219_max98373.c
> index 34cf849a8344..e048e789e633 100644
> --- a/sound/soc/intel/boards/sof_da7219_max98373.c
> +++ b/sound/soc/intel/boards/sof_da7219_max98373.c
> @@ -195,7 +195,7 @@ static int ssp1_hw_params(struct snd_pcm_substream *substream,
>  	struct snd_soc_pcm_runtime *runtime = asoc_substream_to_rtd(substream);
>  	int ret, j;
>  
> -	for (j = 0; j < runtime->num_codecs; j++) {
> +	for (j = 0; j < runtime->dai_link->num_codecs; j++) {
>  		struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, j);
>  
>  		if (!strcmp(codec_dai->component->name, MAXIM_DEV0_NAME)) {
> 
> base-commit: a921986f445ad611b441c8ee7749dc6dfc770481
