Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD7520D068
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 19:35:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C186B85D;
	Mon, 29 Jun 2020 19:34:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C186B85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593452149;
	bh=WN91G3eI6s3heePTpuvDfIb5SPDgy6dXobvdyEBs+2w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eg5mLjr4kjWwcYqVxJwr5Rq5CvgTwwHmF5dUpMKn0CTrqJY6oJIFQJW9xy3WNzpg+
	 LRt8NnmmMmi1HQa/oPsynaTPIBlYWL0wV2XpccD0RjOlx/+wSQ9ZWewkXtDa33AP3L
	 kis5OA8ngWXq0twdXRzHdl+xWbxOl4nLZ+7CPWU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D51D6F8021D;
	Mon, 29 Jun 2020 19:34:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED574F8021D; Mon, 29 Jun 2020 19:34:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18CA4F80096
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 19:34:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18CA4F80096
IronPort-SDR: xBi7+IK0NNGymgdxiXj+t0fpyRj2BkTLeaqRLOp5naHrIrXsMgYKIhIOQ2CFvBblIOJY4EZJmO
 HrBg4dDPVrUg==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="147561791"
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; d="scan'208";a="147561791"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2020 10:33:59 -0700
IronPort-SDR: ifTNC6vK3Hv++aTC6d4EftzwDzy8SJ/ov5Xgz5cG76np/LhlBPWbAluyFWi7WsP7ZRudUfRAWw
 evmVrd018qBA==
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; d="scan'208";a="318665194"
Received: from mmmille1-t460s.amr.corp.intel.com (HELO [10.255.230.126])
 ([10.255.230.126])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2020 10:33:58 -0700
Subject: Re: [PATCH 1/6] ASoC: Intel: cht_bsw_rt5672: Change bus format to I2S
 2 channel
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20200628155231.71089-1-hdegoede@redhat.com>
 <20200628155231.71089-2-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4a9413ef-89d9-427b-27e9-a3b2df6f310a@linux.intel.com>
Date: Mon, 29 Jun 2020 10:06:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200628155231.71089-2-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, stable@vger.kernel.org
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



On 6/28/20 10:52 AM, Hans de Goede wrote:
> The default mode for SSP configuration is TDM 4 slot and so far we were
> using this for the bus format on cht-bsw-rt56732 boards.
> 
> One board, the Lenovo Miix 2 10 uses not 1 but 2 codecs connected to SSP2.
> The second piggy-backed, output-only codec is inside the keyboard-dock
> (which has extra speakers). Unlike the main rt5672 codec, we cannot
> configure this codec, it is hard coded to use 2 channel 24 bit I2S.
> 
> Using 4 channel TDM leads to the dock speakers codec (which listens in on
> the data send from the SSP to the rt5672 codec) emiting horribly distorted
> sound.
> 
> Since we only support 2 channels anyways, there is no need for TDM on any
> cht-bsw-rt5672 designs. So we can simply use I2S 2ch everywhere.
> 
> This commit fixes the Lenovo Miix 2 10 dock speakers issue by changing
> the bus format set in cht_codec_fixup() to I2S 2 channel.
> 
> This change has been tested on the following devices with a rt5672 codec:
> 
> Lenovo Miix 2 10
> Lenovo Thinkpad 8
> Lenovo Thinkpad 10 (gen 1)
> 
> Cc: stable@vger.kernel.org
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1786723
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   sound/soc/intel/boards/cht_bsw_rt5672.c | 23 +++++++++++------------
>   1 file changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
> index 7a43c70a1378..22e432768edb 100644
> --- a/sound/soc/intel/boards/cht_bsw_rt5672.c
> +++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
> @@ -253,21 +253,20 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
>   	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
>   
>   	/*
> -	 * Default mode for SSP configuration is TDM 4 slot
> +	 * Default mode for SSP configuration is TDM 4 slot. One board/design,
> +	 * the Lenovo Miix 2 10 uses not 1 but 2 codecs connected to SSP2. The
> +	 * second piggy-backed, output-only codec is inside the keyboard-dock
> +	 * (which has extra speakers). Unlike the main rt5672 codec, we cannot
> +	 * configure this codec, it is hard coded to use 2 channel 24 bit I2S.
> +	 * Since we only support 2 channels anyways, there is no need for TDM
> +	 * on any cht-bsw-rt5672 designs. So we simply use I2S 2ch everywhere.
>   	 */

The change looks fine, but you may want to add additional comments to 
explain what happens here.

The default mode for the SSP configuration is TDM 4 slot for the cpu-dai 
(hard-coded in DSP firmware)
the default mode for the SSP configuration is I2S for the codec-dai 
(hard-coded in the 'SSP2-Codec" .dai_fmt masks, so far unused).

So with this change, you trade one dynamic configuration for another 
(was codec, not cpu). It works because of the pre-existing hard-coded 
values for the parts that are not set in this function.

> -	ret = snd_soc_dai_set_fmt(asoc_rtd_to_codec(rtd, 0),
> -				  SND_SOC_DAIFMT_DSP_B |
> -				  SND_SOC_DAIFMT_IB_NF |
> +	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
> +				  SND_SOC_DAIFMT_I2S     |
> +				  SND_SOC_DAIFMT_NB_NF   |
>   				  SND_SOC_DAIFMT_CBS_CFS);
>   	if (ret < 0) {
> -		dev_err(rtd->dev, "can't set format to TDM %d\n", ret);
> -		return ret;
> -	}
> -
> -	/* TDM 4 slots 24 bit, set Rx & Tx bitmask to 4 active slots */
> -	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(rtd, 0), 0xF, 0xF, 4, 24);
> -	if (ret < 0) {
> -		dev_err(rtd->dev, "can't set codec TDM slot %d\n", ret);
> +		dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret); >   		return ret;
>   	}
>   
> 
