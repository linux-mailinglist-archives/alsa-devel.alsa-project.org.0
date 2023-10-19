Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F767D0929
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 09:04:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A679A4A;
	Fri, 20 Oct 2023 09:03:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A679A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697785469;
	bh=1qSyF6jW+62ZpbFqpj/OvHRXsXpCYeJLWhXZBQkHJAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o8cZ7AW5T77ulrI/WCdhnh2MvZoUSNQSnmXDKbqhWYne0/m2grkviG4h8LUtLfv08
	 udV0vm92uArYx9DVs3ZJULYC1aueEz5UZbwE4SNBOzixJVULbbCWGAcHyZsy+4Aquh
	 q3J6duoMZtITvAAGFGTmZTcfMDcdvzCpyzXplRus=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E343F8056F; Fri, 20 Oct 2023 09:03:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 289C5F80558;
	Fri, 20 Oct 2023 09:03:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16200F8025F; Thu, 19 Oct 2023 19:27:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from srv01.abscue.de (abscue.de
 [IPv6:2a03:4000:63:bf5:4817:8eff:feeb:8ac7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41A15F80166
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 19:27:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41A15F80166
Received: from srv01.abscue.de (localhost [127.0.0.1])
	by spamfilter.srv.local (Postfix) with ESMTP id 1E44F1C0612;
	Thu, 19 Oct 2023 19:27:28 +0200 (CEST)
Date: Thu, 19 Oct 2023 19:27:21 +0200
From: Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>,
	linux-arm-msm@vger.kernel.org,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/3] ASoC: qcom: q6afe: check ADSP version when setting
 clocks
Message-ID: <ZTFm+ZqCH8wcIhs/@abscue.de>
References: <20231014172624.75301-1-otto.pflueger@abscue.de>
 <20231014172624.75301-3-otto.pflueger@abscue.de>
 <7aca4eff-edb9-2ae5-1146-68e4530f76be@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7aca4eff-edb9-2ae5-1146-68e4530f76be@linaro.org>
X-MailFrom: otto.pflueger@abscue.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 664ZQW6ZRSZZAYJS52KE5OEHOFZRSHUA
X-Message-ID-Hash: 664ZQW6ZRSZZAYJS52KE5OEHOFZRSHUA
X-Mailman-Approved-At: Fri, 20 Oct 2023 07:03:08 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/664ZQW6ZRSZZAYJS52KE5OEHOFZRSHUA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

[...]

> 
> <---
> > +		port = q6afe_port_get_from_id(dev, PRIMARY_MI2S_RX);
> > +		if (IS_ERR(port))
> > +			return PTR_ERR(port);
> > +
> > +		dcfg.i2s_cfg_minor_version = AFE_API_VERSION_I2S_CONFIG;
> > +		dcfg.clk_val = freq;
> > +		dcfg.clk_root = 5;
> > +		ret = q6afe_set_digital_codec_core_clock(port, &dcfg);
> > +
> > +		q6afe_port_put(port);
> --->
> 
> Could you pl explain what are we doing in this snippet?
> 
> Isn't this what is exactly done in q6afe_mi2s_set_sysclk(LPAIF_DIG_CLK...)
> 
> 

Yes, this is the same, except that q6afe_mi2s_set_sysclk is in
q6afe-dai.c and relies on being part of the DAI, while this is called
from q6afe-clocks.c in a context which doesn't necessarily require a DAI
to be present, e.g. if q6afe-clocks is used as a simple clock controller
without any DAIs defined in the device tree.

Setting the digital codec clock always requires a port, but it isn't
relevant which port is used here because there is usually only one
codec clock.

> 
> 
> > +		return ret;
> > +	}
> > +
> >   	cset.clk_set_minor_version = AFE_API_VERSION_CLOCK_SET;
> >   	cset.clk_id = clk_id;
> >   	cset.clk_freq_in_hz = freq;
> > @@ -1124,6 +1150,41 @@ int q6afe_set_lpass_clock(struct device *dev, int clk_id, int attri,
> >   }
> >   EXPORT_SYMBOL_GPL(q6afe_set_lpass_clock);
> ...
> 
> >   int q6afe_port_set_sysclk(struct q6afe_port *port, int clk_id,
> >   			  int clk_src, int clk_root,
> >   			  unsigned int freq, int dir)
> > @@ -1133,6 +1194,26 @@ int q6afe_port_set_sysclk(struct q6afe_port *port, int clk_id,
> >   	struct afe_digital_clk_cfg dcfg = {0,};
> >   	int ret;
> > +	if (q6core_get_adsp_version() >= Q6_ADSP_VERSION_2_7) {
> > +		/* Always use the new clock API on newer platforms. */
> > +		switch (clk_id) {
> > +		case LPAIF_DIG_CLK:
> > +			clk_src = Q6AFE_LPASS_CLK_ATTRIBUTE_COUPLE_NO;
> > +			clk_root = Q6AFE_LPASS_CLK_ROOT_DEFAULT;
> > +			clk_id = Q6AFE_LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE;
> > +			break;
> > +		case LPAIF_BIT_CLK:
> > +			clk_src = Q6AFE_LPASS_CLK_ATTRIBUTE_COUPLE_NO;
> > +			clk_root = Q6AFE_LPASS_CLK_ROOT_DEFAULT;
> > +			clk_id = q6afe_get_v2_bit_clk_id(port);
> > +			if (clk_id < 0)
> > +				return clk_id;
> > +			break;
> > +		default:
> > +			break;
> > +		}
> > +	}
> 
> This should be probably done in machine driver or q6afe-dai, not in q6afe.
> 

I'll put it in q6afe-dai since this fits nicely into the switch
statement in q6afe_mi2s_set_sysclk.

As stated in the cover letter, I don't think adding this to the machine
driver is the best option. The LPAIF_* clocks look simple and generic
enough to be usable by different drivers, and making those drivers care
about different clock versions in the firmware doesn't seem right.


> 
> > +
> >   	switch (clk_id) {
> >   	case LPAIF_DIG_CLK:
> >   		dcfg.i2s_cfg_minor_version = AFE_API_VERSION_I2S_CONFIG;
