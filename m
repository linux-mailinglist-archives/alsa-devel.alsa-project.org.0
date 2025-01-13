Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B2DA10262
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2025 09:52:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55EBE60285;
	Tue, 14 Jan 2025 09:52:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55EBE60285
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736844747;
	bh=fa8HZsJ3T5Bjo4OSf8OOsBtUydRcEuo4H0Nj9ULNofI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sL74gD0kxTfs4LYKUNeyz60shCd23fsFMZAPla+W2BvoDuxA9OvV6D0SpqHxcg6et
	 +2IzwXrkzI8F7bATsL0xDB7ExjQcomGitsJ9tTCu60HabcMtnMdNoz0jLSTZ3HnSSQ
	 sMFh9+D8urRA+wNU2E3FI30uCyEeJx3xn5OJt+1I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE4BEF805BD; Tue, 14 Jan 2025 09:52:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D91A4F805BE;
	Tue, 14 Jan 2025 09:51:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91A13F80224; Mon, 13 Jan 2025 06:55:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 907F8F800ED
	for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2025 06:55:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 907F8F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HkrDkcEE
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d7e3f1fc01so7873979a12.2
        for <alsa-devel@alsa-project.org>;
 Sun, 12 Jan 2025 21:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736747732; x=1737352532;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N4vQNusUmZAkLzXeYbfJ0r4HHkCe6vVP33VineDuAo8=;
        b=HkrDkcEEtOTGAI4VEN/NC+Qk2XsJ5SisAuUQJ6szFm70zT7yzjP0fNVg0ciZWJXgFe
         vv7J3jVibhom3VelSqIXe4uemrFsFnMVih0enLJp3UTWPqoDw7/lSJtlrELFVDvJcUoK
         FxwwtzbVn3yUDNfR7k/yVjoMJmuMEx9qcwyQ1mbbwlyAHMfhsb8vLjiDOYNlmLylKGTM
         lZlke+izkQab9bGFNG+yM2qZboBaHyIB73QklyC+Cq5cQEbyqEgaAPnRR5rNBuu8WIcC
         NAyTBg0k3s+l6xbSyfyqZ68nBpZ4KjHK4w/BCYGJ6JL4qYtT68YHgM0/gaEPyMvA9P8+
         iLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736747732; x=1737352532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N4vQNusUmZAkLzXeYbfJ0r4HHkCe6vVP33VineDuAo8=;
        b=XK3Qt0ZZhz5pm0LKDWKriGvEZdMKKDv9InvHzSqF/dQStkFgR8DwPZg6A3jKNDfwbC
         pjAVI09P9u4GZtkkFE4S/Ukus7uy+BHVRfpbEfTiX6n91xM5C4OKk8cUK9moalTSvess
         7VuLzar4abpuPjP5ltw7n0JmtMHXjYobSYwtXk1wqF1EhSxqp95t205pz5LobDKymefD
         eC9s7/2hR/9OQTLJo/ZSf+uzHTMc3nqE8I6viCWhSqkhChy7BQs5U4djwOCXSB0k03vm
         VrpE6Q7SHOzFo7J3+NWSI6xKa8BU50iXgePxVX0/i0vq+ZESctszCS8ms/y6h11aNKPd
         cIdw==
X-Gm-Message-State: AOJu0YzIWQmrqYSYoCUCNDIvmhDwmiu8D1tfCmykyvs2/8DEkeLbJ5Er
	rI7nqJngKt7fMbyn34SxIUh8If2HcaRcAeBW2M0Vm/80OObFBh5g
X-Gm-Gg: ASbGncsnAnpmzgbGbQ1Xrp4YVNNYNOFQ32H3Sc7/AuAgE6AD7JoKmh8EmfX2V4d21eS
	w+2HwSICqXQBcUVt0//B5/RO0jXZQPzIkeNEPVY38lwtfKDh4+eI5CIq3el4sOyIcZTnWn+Nucn
	0YcFnDYV5CNfW+4b8EPzYyZgQTbsvFRI+KLA32Vm0x6JivHVBNoMnxs5XX9uaociwwB/6Oe70ci
	puStLMgQCsIVqiF6cBDT9ONJaAozWlCF5yHUXOtFBZZ2WbkR6LTgu7Yo97QUGdc89bybw==
X-Google-Smtp-Source: 
 AGHT+IHHDjzYEn5VmjKBCEbcSi6Bm+0MjLFulYvO92cR0rmLIAiatEhlM1Jl2TgpnNeRlQjm4KQ3Vw==
X-Received: by 2002:a17:907:7ea2:b0:aa6:becf:b26a with SMTP id
 a640c23a62f3a-ab2ab66d9a0mr1600953066b.9.1736747732023;
        Sun, 12 Jan 2025 21:55:32 -0800 (PST)
Received: from [192.168.1.10] ([95.43.220.235])
        by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-ab2e57251fesm337068866b.53.2025.01.12.21.55.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jan 2025 21:55:31 -0800 (PST)
Message-ID: <db8321e3-e9c8-4f1e-8ebd-78d286320d55@gmail.com>
Date: Mon, 13 Jan 2025 07:55:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] soc: audio-graph-card2: use correct endpoint when
 getting link parameters
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 tony@atomide.com
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20241220071126.1066691-1-ivo.g.dimitrov.75@gmail.com>
Content-Language: en-GB
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
In-Reply-To: <20241220071126.1066691-1-ivo.g.dimitrov.75@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: ivo.g.dimitrov.75@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PJGJKQZEDJVYHVMOBGGME2VSZKRWIV6P
X-Message-ID-Hash: PJGJKQZEDJVYHVMOBGGME2VSZKRWIV6P
X-Mailman-Approved-At: Tue, 14 Jan 2025 08:51:44 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PJGJKQZEDJVYHVMOBGGME2VSZKRWIV6P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ping

On 20.12.24 г. 9:11 ч., Ivaylo Dimitrov wrote:
> We may have multiple links between ports, with each link
> having different parameters. Currently, no matter the topology,
> it is always port endpoint 0 that is used when setting parameters.
> 
> On a complex sound system, like the one found on Motorola droid4,
> hifi and voice DAIs require differents formats (i2s vs dsp_a)
> and curently it is impossible to use DT to set that.
>   
> Implementing the change leads to partially dropping of at least
> 0dedbde5062d (ASoC: cpcap: Implement set_tdm_slot for voice call
> support), as core does most of what is needed to configure voice DAI.
> 
> We (on Maemo Leste ) use the patch (along with few others) to have
> voice calls working properly on d4 through UCM.
> 
> The patch is for linux 6.6, I want to know whether the
> approach would be accepted before sending a proper patch for
> current master.
> 
> the original commit message follows:
> 
> When link parameters are parsed, it is always endpoint@0 that is used and
> parameters set to other endpoints are ignored.
> 
> Fix that by using endpoint that is set in DT when parsing link parameters.
> 
> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> ---
>   sound/soc/generic/audio-graph-card2.c | 59 +++++++++++++--------------
>   1 file changed, 28 insertions(+), 31 deletions(-)
> 
> diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
> index b1c675c6b6db..163a20c8ffee 100644
> --- a/sound/soc/generic/audio-graph-card2.c
> +++ b/sound/soc/generic/audio-graph-card2.c
> @@ -508,17 +508,16 @@ static int __graph_parse_node(struct asoc_simple_priv *priv,
>   
>   static int graph_parse_node(struct asoc_simple_priv *priv,
>   			    enum graph_type gtype,
> -			    struct device_node *port,
> +			    struct device_node *ep,
>   			    struct link_info *li, int is_cpu)
>   {
> -	struct device_node *ep;
>   	int ret = 0;
> +	struct device_node *port = of_get_parent(ep);
> +	bool is_multi = graph_lnk_is_multi(port);
>   
> -	if (graph_lnk_is_multi(port)) {
> +	if (is_multi) {
>   		int idx;
>   
> -		of_node_get(port);
> -
>   		for (idx = 0;; idx++) {
>   			ep = graph_get_next_multi_ep(&port);
>   			if (!ep)
> @@ -532,9 +531,8 @@ static int graph_parse_node(struct asoc_simple_priv *priv,
>   		}
>   	} else {
>   		/* Single CPU / Codec */
> -		ep = port_to_endpoint(port);
> +		of_node_put(port);
>   		ret = __graph_parse_node(priv, gtype, ep, li, is_cpu, 0);
> -		of_node_put(ep);
>   	}
>   
>   	return ret;
> @@ -591,22 +589,20 @@ static void graph_parse_daifmt(struct device_node *node,
>   }
>   
>   static void graph_link_init(struct asoc_simple_priv *priv,
> -			    struct device_node *port,
> +			    struct device_node *ep,
>   			    struct link_info *li,
>   			    int is_cpu_node)
>   {
>   	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
> -	struct device_node *ep;
> +	struct device_node *port = of_get_parent(ep);
> +	bool is_multi = graph_lnk_is_multi(port);
>   	struct device_node *ports;
>   	unsigned int daifmt = 0, daiclk = 0;
>   	unsigned int bit_frame = 0;
>   
> -	if (graph_lnk_is_multi(port)) {
> -		of_node_get(port);
> +	if (is_multi) {
>   		ep = graph_get_next_multi_ep(&port);
>   		port = of_get_parent(ep);
> -	} else {
> -		ep = port_to_endpoint(port);
>   	}
>   
>   	ports = of_get_parent(port);
> @@ -642,6 +638,9 @@ static void graph_link_init(struct asoc_simple_priv *priv,
>   	dai_link->ops		= &graph_ops;
>   	if (priv->ops)
>   		dai_link->ops	= priv->ops;
> +
> +	of_node_put(port);
> +	of_node_put(ports);
>   }
>   
>   int audio_graph2_link_normal(struct asoc_simple_priv *priv,
> @@ -650,7 +649,7 @@ int audio_graph2_link_normal(struct asoc_simple_priv *priv,
>   {
>   	struct device_node *cpu_port = lnk;
>   	struct device_node *cpu_ep = port_to_endpoint(cpu_port);
> -	struct device_node *codec_port = of_graph_get_remote_port(cpu_ep);
> +	struct device_node *codec_ep = of_graph_get_remote_endpoint(cpu_ep);
>   	int ret;
>   
>   	/*
> @@ -658,20 +657,20 @@ int audio_graph2_link_normal(struct asoc_simple_priv *priv,
>   	 * see
>   	 *	__graph_parse_node() :: DAI Naming
>   	 */
> -	ret = graph_parse_node(priv, GRAPH_NORMAL, codec_port, li, 0);
> +	ret = graph_parse_node(priv, GRAPH_NORMAL, codec_ep, li, 0);
>   	if (ret < 0)
>   		goto err;
>   
>   	/*
>   	 * call CPU, and set DAI Name
>   	 */
> -	ret = graph_parse_node(priv, GRAPH_NORMAL, cpu_port, li, 1);
> +	ret = graph_parse_node(priv, GRAPH_NORMAL, cpu_ep, li, 1);
>   	if (ret < 0)
>   		goto err;
>   
> -	graph_link_init(priv, cpu_port, li, 1);
> +	graph_link_init(priv, cpu_ep, li, 1);
>   err:
> -	of_node_put(codec_port);
> +	of_node_put(codec_ep);
>   	of_node_put(cpu_ep);
>   
>   	return ret;
> @@ -684,7 +683,6 @@ int audio_graph2_link_dpcm(struct asoc_simple_priv *priv,
>   {
>   	struct device_node *ep = port_to_endpoint(lnk);
>   	struct device_node *rep = of_graph_get_remote_endpoint(ep);
> -	struct device_node *rport = of_graph_get_remote_port(ep);
>   	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
>   	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
>   	int is_cpu = asoc_graph_is_ports0(lnk);
> @@ -718,7 +716,7 @@ int audio_graph2_link_dpcm(struct asoc_simple_priv *priv,
>   		dai_link->dynamic		= 1;
>   		dai_link->dpcm_merged_format	= 1;
>   
> -		ret = graph_parse_node(priv, GRAPH_DPCM, rport, li, 1);
> +		ret = graph_parse_node(priv, GRAPH_DPCM, rep, li, 1);
>   		if (ret)
>   			goto err;
>   	} else {
> @@ -751,7 +749,7 @@ int audio_graph2_link_dpcm(struct asoc_simple_priv *priv,
>   		dai_link->no_pcm		= 1;
>   		dai_link->be_hw_params_fixup	= asoc_simple_be_hw_params_fixup;
>   
> -		ret = graph_parse_node(priv, GRAPH_DPCM, rport, li, 0);
> +		ret = graph_parse_node(priv, GRAPH_DPCM, rep, li, 0);
>   		if (ret < 0)
>   			goto err;
>   	}
> @@ -761,11 +759,10 @@ int audio_graph2_link_dpcm(struct asoc_simple_priv *priv,
>   
>   	snd_soc_dai_link_set_capabilities(dai_link);
>   
> -	graph_link_init(priv, rport, li, is_cpu);
> +	graph_link_init(priv, rep, li, is_cpu);
>   err:
>   	of_node_put(ep);
>   	of_node_put(rep);
> -	of_node_put(rport);
>   
>   	return ret;
>   }
> @@ -777,7 +774,7 @@ int audio_graph2_link_c2c(struct asoc_simple_priv *priv,
>   {
>   	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
>   	struct device_node *port0, *port1, *ports;
> -	struct device_node *codec0_port, *codec1_port;
> +	struct device_node *codec0_ep, *codec1_ep;
>   	struct device_node *ep0, *ep1;
>   	u32 val = 0;
>   	int ret = -EINVAL;
> @@ -834,31 +831,31 @@ int audio_graph2_link_c2c(struct asoc_simple_priv *priv,
>   	ep0 = port_to_endpoint(port0);
>   	ep1 = port_to_endpoint(port1);
>   
> -	codec0_port = of_graph_get_remote_port(ep0);
> -	codec1_port = of_graph_get_remote_port(ep1);
> +	codec0_ep = of_graph_get_remote_endpoint(ep0);
> +	codec1_ep = of_graph_get_remote_endpoint(ep1);
>   
>   	/*
>   	 * call Codec first.
>   	 * see
>   	 *	__graph_parse_node() :: DAI Naming
>   	 */
> -	ret = graph_parse_node(priv, GRAPH_C2C, codec1_port, li, 0);
> +	ret = graph_parse_node(priv, GRAPH_C2C, codec1_ep, li, 0);
>   	if (ret < 0)
>   		goto err2;
>   
>   	/*
>   	 * call CPU, and set DAI Name
>   	 */
> -	ret = graph_parse_node(priv, GRAPH_C2C, codec0_port, li, 1);
> +	ret = graph_parse_node(priv, GRAPH_C2C, codec0_ep, li, 1);
>   	if (ret < 0)
>   		goto err2;
>   
> -	graph_link_init(priv, codec0_port, li, 1);
> +	graph_link_init(priv, codec0_ep, li, 1);
>   err2:
>   	of_node_put(ep0);
>   	of_node_put(ep1);
> -	of_node_put(codec0_port);
> -	of_node_put(codec1_port);
> +	of_node_put(codec0_ep);
> +	of_node_put(codec1_ep);
>   err1:
>   	of_node_put(ports);
>   	of_node_put(port0);
