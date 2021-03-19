Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFCD3422B0
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 18:00:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1E4B167A;
	Fri, 19 Mar 2021 17:59:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1E4B167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616173201;
	bh=SnGX5SW+9DTm9fOc+muHWNYT0I25LaRiz85xek/qVrQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mNz7Q+sWc3RonNqh3rnSveW4I7VoF3vwUJYElzKYsKQVsH8/fp3Tc1A/zzJlveM00
	 lPPz64FKZW94QwwqF7r6xlODtG7cL8l9H6yLeeHKjNnJ2YTTVfKsck2ReU2xTvdPSd
	 wP9IfBlP2Ro+qaaNyi4503OpPEOG43Ctd+dXjcZo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88957F800BB;
	Fri, 19 Mar 2021 17:58:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A615F8021C; Fri, 19 Mar 2021 17:58:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5E87F800E0
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 17:58:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5E87F800E0
IronPort-SDR: JK0og8+iNDjwmvuvFDhwIUfFgLEVB1R7j2cgBIRiViQ7i6rlo/kmpKSlrAG7tXXR1Z5rEQjB4U
 HdGa/tBO0NiA==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="190022205"
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; d="scan'208";a="190022205"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 09:58:20 -0700
IronPort-SDR: bxccxDNtBkOJpcorS5wqvftK5TV/i55eDdPQi+c3EWHe9/wNSNyiwB/hm0baidLvTSc1l/rSz0
 IUe7soNxlBGw==
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; d="scan'208";a="406867257"
Received: from dgerstma-mobl.amr.corp.intel.com (HELO [10.212.157.39])
 ([10.212.157.39])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 09:58:19 -0700
Subject: Re: [PATCH v3 2/7] ASoC: codecs: wcd-clsh: add new version support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20210319092919.21218-1-srinivas.kandagatla@linaro.org>
 <20210319092919.21218-3-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <26038ba1-e8f6-08e3-bee5-673d69d7decd@linux.intel.com>
Date: Fri, 19 Mar 2021 10:23:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210319092919.21218-3-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
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


> +static void wcd_clsh_v3_set_hph_mode(struct snd_soc_component *component,
> +				  int mode)
> +{
> +	u8 val = 0;

initialization not needed.

> +
> +	switch (mode) {
> +	case CLS_H_NORMAL:
> +		val = 0x00;
> +		break;
> +	case CLS_AB:
> +	case CLS_H_ULP:
> +		val = 0x0C;
> +		break;
> +	case CLS_AB_HIFI:
> +	case CLS_H_HIFI:
> +		val = 0x08;
> +		break;
> +	case CLS_H_LP:
> +	case CLS_H_LOHIFI:
> +	case CLS_AB_LP:
> +	case CLS_AB_LOHIFI:
> +		val = 0x04;
> +		break;
> +	default:
> +		dev_err(component->dev, "%s:Invalid mode %d\n", __func__, mode);
> +		return;
> +	};
> +
> +	snd_soc_component_update_bits(component, WCD9XXX_ANA_HPH, 0x0C, val);
> +}
> +
> +

extra line

> +void wcd_clsh_set_hph_mode(struct wcd_clsh_ctrl *ctrl, int mode)
> +{
> +	struct snd_soc_component *comp = ctrl->comp;
> +
> +	if (ctrl->codec_version >= WCD937X)
> +		wcd_clsh_v3_set_hph_mode(comp, mode);
> +	else
> +		wcd_clsh_v2_set_hph_mode(comp, mode);
> +
> +}
> +
>   static void wcd_clsh_set_flyback_current(struct snd_soc_component *comp,
>   					 int mode)
>   {
> @@ -289,6 +388,130 @@ static void wcd_clsh_set_buck_regulator_mode(struct snd_soc_component *comp,
>   					WCD9XXX_A_ANA_RX_REGULATOR_MODE_CLS_H);
>   }
>   
> +static void wcd_clsh_v3_set_buck_regulator_mode(struct snd_soc_component *component,
> +						int mode)
> +{
> +	snd_soc_component_update_bits(component, WCD9XXX_ANA_RX_SUPPLIES,
> +			    0x02, 0x00);
> +}
> +
> +static inline void wcd_clsh_v3_set_flyback_mode(struct snd_soc_component *component,
> +						int mode)
> +{
> +	if (mode == CLS_H_HIFI || mode == CLS_H_LOHIFI ||
> +	    mode == CLS_AB_HIFI || mode == CLS_AB_LOHIFI) {
> +		snd_soc_component_update_bits(component,
> +				WCD9XXX_ANA_RX_SUPPLIES,
> +				0x04, 0x04);
> +		snd_soc_component_update_bits(component,
> +				WCD9XXX_FLYBACK_VNEG_CTRL_4,
> +				0xF0, 0x80);
> +	} else {
> +		snd_soc_component_update_bits(component,
> +				WCD9XXX_ANA_RX_SUPPLIES,
> +				0x04, 0x00); /* set to Default */
> +		snd_soc_component_update_bits(component,
> +				WCD9XXX_FLYBACK_VNEG_CTRL_4,
> +				0xF0, 0x70);
> +	}
> +}
> +
> +static inline void wcd_clsh_v3_force_iq_ctl(struct snd_soc_component *component,
> +					 int mode, bool enable)
> +{
> +	if (enable) {
> +		snd_soc_component_update_bits(component,
> +				WCD9XXX_FLYBACK_VNEGDAC_CTRL_2,
> +				0xE0, 0xA0);
> +		/* 100usec delay is needed as per HW requirement */
> +		usleep_range(100, 110);
> +		snd_soc_component_update_bits(component,
> +				WCD9XXX_CLASSH_MODE_3,
> +				0x02, 0x02);
> +		snd_soc_component_update_bits(component,
> +				WCD9XXX_CLASSH_MODE_2,
> +				0xFF, 0x1C);
> +		if (mode == CLS_H_LOHIFI || mode == CLS_AB_LOHIFI) {
> +			snd_soc_component_update_bits(component,
> +					WCD9XXX_HPH_NEW_INT_PA_MISC2,
> +					0x20, 0x20);
> +			snd_soc_component_update_bits(component,
> +					WCD9XXX_RX_BIAS_HPH_LOWPOWER,
> +					0xF0, 0xC0);
> +			snd_soc_component_update_bits(component,
> +					WCD9XXX_HPH_PA_CTL1,
> +					0x0E, 0x02);
> +		}
> +	} else {
> +		snd_soc_component_update_bits(component,
> +				WCD9XXX_HPH_NEW_INT_PA_MISC2,
> +				0x20, 0x00);
> +		snd_soc_component_update_bits(component,
> +				WCD9XXX_RX_BIAS_HPH_LOWPOWER,
> +				0xF0, 0x80);
> +		snd_soc_component_update_bits(component,
> +				WCD9XXX_HPH_PA_CTL1,
> +				0x0E, 0x06);
> +	}
> +}

do you need the inline for the two functions above?


