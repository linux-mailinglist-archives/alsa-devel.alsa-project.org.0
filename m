Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 120633422B5
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 18:00:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB8D5169B;
	Fri, 19 Mar 2021 18:00:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB8D5169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616173253;
	bh=R+JV9D5GDL+fVJ+sheYY2/JlnYjLmjzlxPMVrcE3MPQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eHFmEIqhiLLstrKj0sy+L4nbFDfWl0XameQmS6457+dIDEMe4KKv86erLKnCtbCVo
	 qs4myZFBP+OSGbmnVEEh/5OxW+TRn3O6MS0c2/VCjlKzqoUxiLAJvtHpjfeISDCO5/
	 9QfsTTFUWbT7vYNnjK5YXNcqeMknPvX2mwdJOweo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 583E5F8032C;
	Fri, 19 Mar 2021 17:58:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 717D0F80254; Fri, 19 Mar 2021 17:58:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E68BF800BB
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 17:58:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E68BF800BB
IronPort-SDR: 4jmO4s8Z/CH2YRcZTMoPwUC3JYsAt2MMCz9HvgtJHvr+3h97fr/eB6UBThy9BROpl97uEUl4gg
 LQxW6W6wvscg==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="190022217"
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; d="scan'208";a="190022217"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 09:58:25 -0700
IronPort-SDR: OypGK9KIn31ZMdErlzFgEXoDKNOZKDx3pLwhMuIctAi4gM8MkfrF/X/tZmyHiGNCchEEZttLWF
 Ok5/kN8O/ZyA==
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; d="scan'208";a="406867357"
Received: from dgerstma-mobl.amr.corp.intel.com (HELO [10.212.157.39])
 ([10.212.157.39])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 09:58:23 -0700
Subject: Re: [PATCH v3 4/7] ASoC: codecs: wcd938x: add basic controls
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20210319092919.21218-1-srinivas.kandagatla@linaro.org>
 <20210319092919.21218-5-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <fe430019-783c-d5ba-e79d-d48944c01f04@linux.intel.com>
Date: Fri, 19 Mar 2021 11:03:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210319092919.21218-5-srinivas.kandagatla@linaro.org>
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


> +static int wcd938x_ear_pa_put_gain(struct snd_kcontrol *kcontrol,
> +				   struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
> +	struct wcd938x_sdw_priv *wcd = snd_soc_component_get_drvdata(component);
> +	struct wcd938x_priv *wcd938x = wcd->wcd938x;
> +
> +	if (wcd938x->comp1_enable) {
> +		dev_err(component->dev, "Can not set EAR PA Gain, compander1 is enabled\n");
> +		return -EINVAL;
> +	}
> +
> +	snd_soc_component_write_field(component, WCD938X_ANA_EAR_COMPANDER_CTL,
> +				      WCD938X_EAR_GAIN_MASK,
> +				      ucontrol->value.integer.value[0]);
> +
> +	return 0;

that goes back to my other comments, the earpiece is connected to the RX 
interface, so what component would be used to set the gain here? the TX 
one? But what tells you this component is active and ready to support 
commands?

