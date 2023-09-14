Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC257A001A
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 11:32:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75E50852;
	Thu, 14 Sep 2023 11:32:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75E50852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694683976;
	bh=dvbii9bwHxdHdrRROQBIEWIpCDvUl0fNl55LAdxxUQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=reC6T1Wi19N+mhkMkA+ruq19XwKoyAXfYIu4zCzoOrz0L8oBchzE57+DzqL/u6g9B
	 zVTqktJZftiosl9a8s4AUtwugN/0bwnnGx4AKD9AdS21QsDru3se2nmcworzafkpa2
	 I0U3rdsm5nwpeU78vJZy6Usv7YerwbQx/k5EB8Ww=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0DD3F80537; Thu, 14 Sep 2023 11:32:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65B14F80212;
	Thu, 14 Sep 2023 11:32:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AE6AF80425; Thu, 14 Sep 2023 11:31:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out-221.mta0.migadu.com (out-221.mta0.migadu.com
 [91.218.175.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D121F80141
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 11:31:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D121F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=mqea8Dco
Date: Thu, 14 Sep 2023 19:27:03 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1694683906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vmPa+r4UrqSI4OyMQhsi2Wq5TKQmIhNTWv2ugXVReZk=;
	b=mqea8Dco5GkiVp3d+wmxmrg67/ao1nY64YhP2JCR+VosQ6HsA5pdF5EP+IMKNcOfvAkHDh
	JSbCKG24sH0K2Gbc1pwDeCvd2Y+kIS1DOdjSkSX3BkXvArTN36u1OTiDRr5KvQrz1def6i
	YoPsCEptgGxC/s4Ep7cAwC7qVtq3CTmGWiHLmEgmqzGAG08iJCsLq/ykteyK2nxamCfhwQ
	3xi4D3moJXUHTs7IGutAy/+oNofpaZjLQMsb8FBUKaMj4y+YeFpIbj5ZngStaPQgkavLma
	ayx+AH+lwFfUGuOZhiMtJtID6PAQIpVYb1FgRTtkA5/wvvd1pfvKrC55Awm/ng==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] ASoC: wm8782: Handle maximum audio rate at runtime
Message-ID: <ZQLR50CAzr0VDpeh@titan>
References: <20230913171552.92252-1-contact@jookia.org>
 <20230913171552.92252-2-contact@jookia.org>
 <20230914092107.GR103419@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914092107.GR103419@ediswmail.ad.cirrus.com>
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: WNTYHO3UTUI6B6WENAKAA6RUUEJP4XBD
X-Message-ID-Hash: WNTYHO3UTUI6B6WENAKAA6RUUEJP4XBD
X-MailFrom: contact@jookia.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WNTYHO3UTUI6B6WENAKAA6RUUEJP4XBD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Sep 14, 2023 at 09:21:07AM +0000, Charles Keepax wrote:
> On Thu, Sep 14, 2023 at 03:15:50AM +1000, John Watts wrote:
> > The wm8782 supports up to 192kHz audio when pins are set correctly.
> > Instead of hardcoding which rates are supported enable them all
> > then refer to a max_rate variable at runtime.
> > 
> > Signed-off-by: John Watts <contact@jookia.org>
> > ---
> > +static int wm8782_dai_hw_params(struct snd_pcm_substream *component,
> > +			    struct snd_pcm_hw_params *params,
> > +			    struct snd_soc_dai *dai)
> > +{
> > +	struct wm8782_priv *priv =
> > +		snd_soc_component_get_drvdata(dai->component);
> > +
> > +	if (params_rate(params) > priv->max_rate)
> > +		return -EINVAL;
> > +
> > +	return 0;
> > +}
> 
> We should be setting this as a constraint in startup, rather
> than returning an error in hw_params. That will let user-space
> know the supported rates and allow it to resample if necessary.

How do you do this? The struct with the rate is statically defined.

> 
> Thanks,
> Charles

John.
