Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CE81777C5
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Mar 2020 14:51:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AC881679;
	Tue,  3 Mar 2020 14:50:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AC881679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583243487;
	bh=xByidxwh8RuILb26RgsjWmphRB1129uxOvQQfhO4WYw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JLjjHSaHz1ugagENFbyUHLl0+us6v3fi7CXtsFDtm7iVR4s8U8zRsWH6uvelAI5SQ
	 7cMENliYrNetGUfxMtIwbU7uOc/JpAfeVoI7TVZ5uAXkIe/N63eXFbnt8P/UXNTRAd
	 wjLIX7whpsqur68Uw1E1FcmWrAWMMNNDxGrOETIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F5ACF80266;
	Tue,  3 Mar 2020 14:49:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FEF2F8025F; Tue,  3 Mar 2020 14:49:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0C7DF8011C
 for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2020 14:49:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0C7DF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="hxA0KmDJ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="yN4PXMIO"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 27BC386E;
 Tue,  3 Mar 2020 08:49:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 03 Mar 2020 08:49:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=D
 Fq5AY9nqYAnwVRF+Wm04rFwZurV5Iq5A1Ozlub/24c=; b=hxA0KmDJpjbVpoBUD
 UpNgjj4Qy4G96NuHSPKUsiFZwyocGnKNWzH7UIs8Mq5zM6gBzy58YhJHQl39ZSil
 lwW2tmpEUNbaH7uImpPwv5nPw5swkFfrN3N/+OMApHv4S973rBeJC0kQ1xwAGcxO
 2OJl1A3kpQ2bSnYsDrvBCXy70l8Fq3mSvb9pqucG3e3hN/SbpyXqM5E+31wOFx+o
 D6bQ/A0ZnD5Mg9eLbhSjlXm9b9kI4dX5myrTGCxREIBzOvs+wPiws+eKjMOUMo3H
 sQfOYXpk379dafaqs4j6f9hD80eMwMuQYdRAjtWluW2xGZxLjkUDAzdZcApXzUWk
 SwPDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=DFq5AY9nqYAnwVRF+Wm04rFwZurV5Iq5A1Ozlub/2
 4c=; b=yN4PXMIOgG5h+smyL3fy7wchkPeJkqUDP6zzStiM7VwADZkmXN7m7BWdJ
 e0d6hfTK0l4JqFjOsL0ZJttu7I3Z4sIKtf7LND9yboGwTkSNE+yvRQEBCIpd8PIb
 +ZLuZswKK1BHc/iwk8rlbnDIgsLzdltw3zkEa0VTupvNo/PN7Hx81NA0PoXmdx3P
 V7Gk3JUeAqTcJWRlHKIcx+7/UGltoSraDnU//PFFcqkeVUDY8ayCn4keauACIgph
 zQndIv/Zsh3Ysr9tOFqOQvmCksTUtLuDcjWb6J4o5XeAsryR1OBzfUPd/2PKAGH9
 qK36dQCh+7zrbkSU0mrQmPr+K626Q==
X-ME-Sender: <xms:bmBeXiyvFASA7E0r5uIdIXP-R_4DkzaUWwGjVfem_sXDRjSByZy7Jw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedruddtiedgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukf
 hppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:bmBeXr8E1P_YCmbtWen_o3eMtfGocmzLcNUAZ0sndYdF-nazkJzqBA>
 <xmx:bmBeXmGJEL8efUyjtZUqV-rm6_Xs_aJzkn_KsXtZZXsqpPeoE-IoTg>
 <xmx:bmBeXlBdT3TaVVKpIfQ5caOTcaF--zxy5YNJySyDVAXLic371Sb8Hg>
 <xmx:b2BeXhnizlNnmM79qlv6C-VFNkN0zeLoKAhHG07WFP_ZvbcnAdQzLQ>
Received: from [192.168.50.169]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2399A328006E;
 Tue,  3 Mar 2020 08:49:34 -0500 (EST)
Subject: Re: [PATCH v3 3/3] ASoC: simple-card: Add support for codec2codec DAI
 links
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Jerome Brunet <jbrunet@baylibre.com>
References: <20200223034533.1035-1-samuel@sholland.org>
 <20200223034533.1035-4-samuel@sholland.org>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <9cdcfcb6-63c2-5b76-9de1-46719e4e7139@sholland.org>
Date: Tue, 3 Mar 2020 07:49:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200223034533.1035-4-samuel@sholland.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
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

On 2/22/20 9:45 PM, Samuel Holland wrote:
> Following the example in cb2cf0de1174 ("ASoC: soc-core: care Codec <->
> Codec case by non_legacy_dai_naming"), determine if a DAI link contains
> only codec DAIs by examining the non_legacy_dai_naming flag in each
> DAI's component.
> 
> For now, we assume there is only one or a small set of valid PCM stream
> parameters, so num_params == 1 is good enough. We also assume that the
> same params are valid for all supported streams. params is set to the
> subset of parameters common among all DAIs, and then the existing code
> automatically chooses the highest quality of the remaining values when
> the link is brought up.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  Documentation/sound/soc/codec-to-codec.rst |  9 +++-
>  sound/soc/generic/simple-card-utils.c      | 49 ++++++++++++++++++++++
>  2 files changed, 56 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/sound/soc/codec-to-codec.rst b/Documentation/sound/soc/codec-to-codec.rst
> index 810109d7500d..4eaa9a0c41fc 100644
> --- a/Documentation/sound/soc/codec-to-codec.rst
> +++ b/Documentation/sound/soc/codec-to-codec.rst
> @@ -104,5 +104,10 @@ Make sure to name your corresponding cpu and codec playback and capture
>  dai names ending with "Playback" and "Capture" respectively as dapm core
>  will link and power those dais based on the name.
>  
> -Note that in current device tree there is no way to mark a dai_link
> -as codec to codec. However, it may change in future.
> +A dai_link in a "simple-audio-card" will automatically be detected as
> +codec to codec when all DAIs on the link belong to codec components.
> +The dai_link will be initialized with the subset of stream parameters
> +(channels, format, sample rate) supported by all DAIs on the link. Since
> +there is no way to provide these parameters in the device tree, this is
> +mostly useful for communication with simple fixed-function codecs, such
> +as a Bluetooth controller or cellular modem.
> diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
> index 9b794775df53..54294367a40f 100644
> --- a/sound/soc/generic/simple-card-utils.c
> +++ b/sound/soc/generic/simple-card-utils.c
> @@ -331,6 +331,51 @@ static int asoc_simple_init_dai(struct snd_soc_dai *dai,
>  	return 0;
>  }
>  
> +static int asoc_simple_init_dai_link_params(struct snd_soc_pcm_runtime *rtd,
> +					    struct simple_dai_props *dai_props)
> +{
> +	struct snd_soc_dai_link *dai_link = rtd->dai_link;
> +	struct snd_soc_component *component;
> +	struct snd_soc_rtdcom_list *rtdcom;

This variable is unused in v3. I can send a v4.

> +	struct snd_soc_pcm_stream *params;
> +	struct snd_pcm_hardware hw;
> +	int i, ret, stream;
> +
> +	/* Only codecs should have non_legacy_dai_naming set. */
> +	for_each_rtd_components(rtd, i, component) {
> +		if (!component->driver->non_legacy_dai_naming)
> +			return 0;
> +	}
> +
> +	/* Assumes the capabilities are the same for all supported streams */
> +	for (stream = 0; stream < 2; stream++) {
> +		ret = snd_soc_runtime_calc_hw(rtd, &hw, stream);
> +		if (ret == 0)
> +			break;
> +	}
> +
> +	if (ret < 0) {
> +		dev_err(rtd->dev, "simple-card: no valid dai_link params\n");
> +		return ret;
> +	}
> +
> +	params = devm_kzalloc(rtd->dev, sizeof(*params), GFP_KERNEL);
> +	if (!params)
> +		return -ENOMEM;
> +
> +	params->formats = hw.formats;
> +	params->rates = hw.rates;
> +	params->rate_min = hw.rate_min;
> +	params->rate_max = hw.rate_max;
> +	params->channels_min = hw.channels_min;
> +	params->channels_max = hw.channels_max;
> +
> +	dai_link->params = params;
> +	dai_link->num_params = 1;
> +
> +	return 0;
> +}
> +
>  int asoc_simple_dai_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
> @@ -347,6 +392,10 @@ int asoc_simple_dai_init(struct snd_soc_pcm_runtime *rtd)
>  	if (ret < 0)
>  		return ret;
>  
> +	ret = asoc_simple_init_dai_link_params(rtd, dai_props);
> +	if (ret < 0)
> +		return ret;
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(asoc_simple_dai_init);
> 

