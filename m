Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8E070C5C
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 00:09:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 776F3184A;
	Tue, 23 Jul 2019 00:08:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 776F3184A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563833376;
	bh=RXF/ODx8kuG1QBEhsR2aNGpkbdc3YAae4DpUMbeKLEc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TzVc/flgds1QPhWSgHWMWubrCKmZsEK8jXLXmuDBY2ThArXnz5MwwQpMInYRVlVwf
	 I92UaOa8gh0l9Fze6vaceO0AcABNVnQs1aOsYCrz+vuZ7IBl3Fm2vdiJgF7HBnxKPQ
	 3euDEWG2piE8PPhXN3cxPbSv5A+1rr2dCO38IzU8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9C5FF803D5;
	Tue, 23 Jul 2019 00:07:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29B66F803D5; Tue, 23 Jul 2019 00:07:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CA17F800F5
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 00:07:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CA17F800F5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 15:07:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,296,1559545200"; d="scan'208";a="320813685"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.251.89.116])
 ([10.251.89.116])
 by orsmga004.jf.intel.com with ESMTP; 22 Jul 2019 15:07:34 -0700
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20190722135209.30302-1-ckeepax@opensource.cirrus.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <7a6ca46b-9ca7-6c91-6aa9-d1be785c64c5@intel.com>
Date: Tue, 23 Jul 2019 00:07:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190722135209.30302-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 broonie@kernel.org, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH v2] ASoC: madera: Read device tree
 configuration
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

On 2019-07-22 15:52, Charles Keepax wrote:
> +static void madera_prop_get_inmode(struct madera_priv *priv)
> +{
> +	struct madera *madera = priv->madera;
> +	struct madera_codec_pdata *pdata = &madera->pdata.codec;
> +	u32 tmp[MADERA_MAX_INPUT * MADERA_MAX_MUXED_CHANNELS];
> +	int n, i, in_idx, ch_idx;
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(pdata->inmode) != MADERA_MAX_INPUT);
> +	BUILD_BUG_ON(ARRAY_SIZE(pdata->inmode[0]) != MADERA_MAX_MUXED_CHANNELS);
> +
> +	n = madera_get_variable_u32_array(madera->dev, "cirrus,inmode",
> +					  tmp, ARRAY_SIZE(tmp),
> +					  MADERA_MAX_MUXED_CHANNELS);
> +	if (n < 0)
> +		return;
> +
> +	in_idx = 0;
> +	ch_idx = 0;
> +	for (i = 0; i < n; ++i) {
> +		pdata->inmode[in_idx][ch_idx] = tmp[i];
> +
> +		if (++ch_idx == MADERA_MAX_MUXED_CHANNELS) {
> +			ch_idx = 0;
> +			++in_idx;
> +		}
> +	}
> +}
> +
> +static void madera_prop_get_pdata(struct madera_priv *priv)
> +{
> +	struct madera *madera = priv->madera;
> +	struct madera_codec_pdata *pdata = &madera->pdata.codec;
> +	u32 out_mono[ARRAY_SIZE(pdata->out_mono)];
> +	int i, n;
> +
> +	madera_prop_get_inmode(priv);
> +
> +	n = madera_get_variable_u32_array(madera->dev, "cirrus,out-mono",
> +					  out_mono, ARRAY_SIZE(out_mono), 1);
> +	if (n > 0)
> +		for (i = 0; i < n; ++i)
> +			pdata->out_mono[i] = !!out_mono[i];
> +
> +	madera_get_variable_u32_array(madera->dev,
> +				      "cirrus,max-channels-clocked",
> +				      pdata->max_channels_clocked,
> +				      ARRAY_SIZE(pdata->max_channels_clocked),
> +				      1);
> +
> +	madera_get_variable_u32_array(madera->dev, "cirrus,pdm-fmt",
> +				      pdata->pdm_fmt,
> +				      ARRAY_SIZE(pdata->pdm_fmt), 1);
> +
> +	madera_get_variable_u32_array(madera->dev, "cirrus,pdm-mute",
> +				      pdata->pdm_mute,
> +				      ARRAY_SIZE(pdata->pdm_mute), 1);
> +
> +	madera_get_variable_u32_array(madera->dev, "cirrus,dmic-ref",
> +				      pdata->dmic_ref,
> +				      ARRAY_SIZE(pdata->dmic_ref), 1);

Hmm, madera_get_variable_u32_array calls are not permissive within 
madera_prop_get_inmode yet here they are. Is this intentional?

> +}
> +
>   int madera_core_init(struct madera_priv *priv)
>   {
>   	int i;
> @@ -308,6 +402,9 @@ int madera_core_init(struct madera_priv *priv)
>   	BUILD_BUG_ON(!madera_mixer_texts[MADERA_NUM_MIXER_INPUTS - 1]);
>   	BUILD_BUG_ON(!madera_mixer_values[MADERA_NUM_MIXER_INPUTS - 1]);
>   
> +	if (!dev_get_platdata(priv->madera->dev))
> +		madera_prop_get_pdata(priv);
> +
>   	mutex_init(&priv->rate_lock);
>   
>   	for (i = 0; i < MADERA_MAX_HP_OUTPUT; i++)
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
