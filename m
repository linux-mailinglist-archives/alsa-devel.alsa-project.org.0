Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD43B999FFE
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2024 11:20:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8450486F;
	Fri, 11 Oct 2024 11:19:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8450486F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728638400;
	bh=fbA6yVZzuhHWvM2Ov7wvMLJR3FQvIpHqXvwZDC5zg30=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gBuYq4j6Nb5sER9w/u9Jgvw+9bLiHwkuhZ8v+tFmxAkmMTQOhiJKXmQ1JigunErLj
	 P1z1+v6KTVrrN56DE8B1LDXPSl1KC3bLnZg+HJm6+RJp4NLHJYI782vflJ2mQhSKXy
	 4qwkxYZlBUona1TrIHc8LWMW1EauyujfiVBjQ/oE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7853F805B6; Fri, 11 Oct 2024 11:19:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE832F80528;
	Fri, 11 Oct 2024 11:19:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2052CF80528; Tue,  8 Oct 2024 20:42:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by alsa1.perex.cz (Postfix) with ESMTP id 38944F800ED
	for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2024 20:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38944F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (4096-bit key,
 unprotected) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.a=rsa-sha256
 header.s=key header.b=RvbkmYnP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1728412960; bh=fbA6yVZzuhHWvM2Ov7wvMLJR3FQvIpHqXvwZDC5zg30=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RvbkmYnPEo5qwaLIvRjfCZuBLSxS88guS0+d1hL1VdYNxdF+C3aA6y0Jr4w13L/CI
	 1BHVAwGxR7KF/mffvgGvHy0BcPyu8Q+7KSdH5CVi1qWJOtIdKEYegy5cj5ygpnr3ai
	 4XVyIic7HUYYPn3mTAr9gr2iIswZUewGVB/9YKKqJH9t38v7mS3oqXgko8GYGqazT1
	 bvYldF3XBXxFKpKpzUcM/++VIzUDjsmP47aPV9l3Qq/gTZxjc+OndFSF+wLMT6iGlY
	 MzLVK/2KQvHXqW3nMbaZRB+bmR9oCJsiHVVl5pZkaA0hLM5lQGRYcZDV8ikqVXfKsV
	 SuX9+konASBJm6/gsuuV32UVnkkbI0lvxk6SPB98NwyA6TKH3IhmqwmacJNX70ObZw
	 rpN4GBdaOAPfshgSAmjmmG38guwPhTSoy6cT/ltbmgQYhT3Dg5Qz0JGAeb1xbC22gx
	 +yiE7TcR82LqOwx/jvkdVWK4bnlKAwy4DBwTIcOkgtqRpCqrpUsb8AJI3AfZad2/o4
	 Atb089EBF2mkuCzdn0G5xKZ3yqPxf8HnH5qgMED5yRjcvuKNT6pL742W27Jx4zMxfC
	 fE4i1jgp+L1JR+CTsq3SW87QPN80Q2NjUpyaAPqTdPH/P+T+bWbCztEHJsOtIKE/g2
	 ZI6z4NxkhRngZs5GL3Bu/zPk=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl
 [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id F07CD18D842;
	Tue,  8 Oct 2024 20:42:39 +0200 (CEST)
Message-ID: <4da61143-5a52-4ff1-b62d-84f3290f78e3@ijzerbout.nl>
Date: Tue, 8 Oct 2024 20:42:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ASoC: rt721-sdca: Add RT721 SDCA driver
To: Jack Yu <jack.yu@realtek.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "Flove(HsinFu)" <flove@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>, =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?=
 <shumingf@realtek.com>, =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?=
 <derek.fang@realtek.com>
References: <d18b35f8b6934fc6a2be6c4458a63fe5@realtek.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <d18b35f8b6934fc6a2be6c4458a63fe5@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: kees@ijzerbout.nl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2AYR3KYFKILCYILFO2Y5MWGILC5JYRI5
X-Message-ID-Hash: 2AYR3KYFKILCYILFO2Y5MWGILC5JYRI5
X-Mailman-Approved-At: Fri, 11 Oct 2024 09:19:24 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2AYR3KYFKILCYILFO2Y5MWGILC5JYRI5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Op 01-10-2024 om 11:17 schreef Jack Yu:
> This is the initial codec driver for rt721-sdca.
> It's a three functions (jack,mic,amp) soundwire driver.
>
> Signed-off-by: Jack Yu <jack.yu@realtek.com>
>
> v2: Fix typo in mbq default registers.
> v3: Include soundwire common functions for Realtek.
> ---
>   sound/soc/codecs/Kconfig          |    7 +
>   sound/soc/codecs/Makefile         |    2 +
>   sound/soc/codecs/rt721-sdca-sdw.c |  551 ++++++++++
>   sound/soc/codecs/rt721-sdca-sdw.h |  150 +++
>   sound/soc/codecs/rt721-sdca.c     | 1547 +++++++++++++++++++++++++++++
>   sound/soc/codecs/rt721-sdca.h     |  268 +++++
>   6 files changed, 2525 insertions(+)
>   create mode 100644 sound/soc/codecs/rt721-sdca-sdw.c
>   create mode 100644 sound/soc/codecs/rt721-sdca-sdw.h
>   create mode 100644 sound/soc/codecs/rt721-sdca.c
>   create mode 100644 sound/soc/codecs/rt721-sdca.h
>
> [...]
> +static int rt721_sdca_dmic_set_gain_get(struct snd_kcontrol *kcontrol,
> +		struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct rt721_sdca_priv *rt721 = snd_soc_component_get_drvdata(component);
> +	struct rt721_sdca_dmic_kctrl_priv *p =
> +		(struct rt721_sdca_dmic_kctrl_priv *)kcontrol->private_value;
> +	unsigned int boost_step = 0x0a00;
> +	unsigned int vol_max = 0x1e00;
> +	unsigned int regvalue, ctl, i;
> +	unsigned int adc_vol_flag = 0;
> +	const unsigned int interval_offset = 0xc0;
> +
> +	if (strstr(ucontrol->id.name, "FU1E Capture Volume"))
> +		adc_vol_flag = 1;
> +
> +	/* check all channels */
> +	for (i = 0; i < p->count; i++) {
> +		regmap_read(rt721->mbq_regmap, p->reg_base + i, &regvalue);
> +
> +		if (!adc_vol_flag) /* boost gain */
> +			ctl = regvalue / boost_step;
> +		else { /* ADC gain */
> +			if (adc_vol_flag)
> +				ctl = p->max - (((vol_max - regvalue) & 0xffff) / interval_offset);
> +			else
At this point it is dead code.
BTW This was detected by Coverity Scan; CID 1600271
> +				ctl = p->max - (((0 - regvalue) & 0xffff) / interval_offset);
> +		}
> +
> +		ucontrol->value.integer.value[i] = ctl;
> +	}
> +
> +	return 0;
> +}
>
