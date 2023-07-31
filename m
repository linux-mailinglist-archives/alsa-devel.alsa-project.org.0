Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 225E976A0F7
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 21:15:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0059F7F4;
	Mon, 31 Jul 2023 21:15:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0059F7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690830956;
	bh=SyJU7Qt2aBIN4OyFcC5oEmHd0DxKwQmqDlVAGFvHAGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EC2P/8jlMPzlGwhEuOg8aY2wmhfK15G7jNSsnQHlGBvC7MRn0H31L8JaqqOn6aSYx
	 ygPAMmK8VetM4nPuyz/4fwwyd+SCLMpASZ8VCtG9Y4t3HGqJhkJw7AzNkhvVm+S49d
	 pYNS89j9ysRIZNSh1iCa2P35eal+E1okt5QKOqjI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40D2FF80520; Mon, 31 Jul 2023 21:15:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA1FEF8015B;
	Mon, 31 Jul 2023 21:15:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D129F8016D; Mon, 31 Jul 2023 21:14:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44FAAF80149
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 21:14:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44FAAF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mfZY9Gbn
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CB22761276;
	Mon, 31 Jul 2023 19:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32AE9C433C7;
	Mon, 31 Jul 2023 19:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690830885;
	bh=SyJU7Qt2aBIN4OyFcC5oEmHd0DxKwQmqDlVAGFvHAGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mfZY9GbnMx+aOUhNak8hhNx+W4RQngWJkELmDVGW8q222cnSMnvbobDN1oms+zhPq
	 cbVaocl89DiKxBWlHYimi8lIVjOKKdGuWYEqGxdADX6HTYgNkF/bhaNpRm+5thXsSY
	 95pSQw5/dAnIbHeWNjq0VSi+To/RKfwFY9qNzU6d/4/eUCt6xAJXOAcUW5q+AntKar
	 0ORk/O7jvBbHgP4x2jVPEcuU93ljKLAk2vQDp2COzlYpPQo/dsMr+jYANsNy2HLrST
	 UBrBWz75Wxw3pzn3gUxpb0wnlkuByXvUEP/1l3Fv5WdcsVQuTaTpKYdvVRdwI4VJOk
	 N5mKreLQOiTOQ==
Date: Mon, 31 Jul 2023 20:14:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Walker Chen <walker.chen@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] ASoC: starfive: Add JH7110 PWM-DAC driver
Message-ID: <9b03c7ed-845c-494b-8c40-10d1fe923b15@sirena.org.uk>
References: <20230731032829.127864-1-hal.feng@starfivetech.com>
 <20230731032829.127864-3-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7WRSfejFGo+r56WO"
Content-Disposition: inline
In-Reply-To: <20230731032829.127864-3-hal.feng@starfivetech.com>
X-Cookie: Single tasking: Just Say No.
Message-ID-Hash: 37YMOFB5ZG5MEDWJJHOCXMCZNKP3YGJ7
X-Message-ID-Hash: 37YMOFB5ZG5MEDWJJHOCXMCZNKP3YGJ7
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/37YMOFB5ZG5MEDWJJHOCXMCZNKP3YGJ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--7WRSfejFGo+r56WO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 31, 2023 at 11:28:28AM +0800, Hal Feng wrote:

> +static const struct jh7110_ct_pwmdac pwmdac_ct_data_shift[] = {
> +	{ .name = "left 0 bit", .vals = PWMDAC_DATA_LEFT_SHIFT_BIT_0 },
> +	{ .name = "left 1 bit", .vals = PWMDAC_DATA_LEFT_SHIFT_BIT_1 },
> +	{ .name = "left 2 bit", .vals = PWMDAC_DATA_LEFT_SHIFT_BIT_2 },
> +	{ .name = "left 3 bit", .vals = PWMDAC_DATA_LEFT_SHIFT_BIT_3 },
> +	{ .name = "left 4 bit", .vals = PWMDAC_DATA_LEFT_SHIFT_BIT_4 },
> +	{ .name = "left 5 bit", .vals = PWMDAC_DATA_LEFT_SHIFT_BIT_5 },
> +	{ .name = "left 6 bit", .vals = PWMDAC_DATA_LEFT_SHIFT_BIT_6 },
> +	{ .name = "left 7 bit", .vals = PWMDAC_DATA_LEFT_SHIFT_BIT_7 }
> +};

It's not clear to me why this is user selectable - what does the control
do?

> +static int jh7110_pwmdac_put(struct snd_kcontrol *kcontrol,
> +			     struct snd_ctl_elem_value *ucontrol,
> +			     int pwmdac_ct)
> +{
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct jh7110_pwmdac_dev *dev = snd_soc_component_get_drvdata(component);
> +	int sel = ucontrol->value.enumerated.item[0];
> +	unsigned int items;

> +	if (pwmdac_ct == PWMDAC_CT_SHIFT)
> +		dev->shift = pwmdac_ct_shift[sel].vals;
> +	else if (pwmdac_ct == PWMDAC_CT_DUTY_CYCLE)
> +		dev->duty_cycle = pwmdac_ct_duty_cycle[sel].vals;
> +	else if (pwmdac_ct == PWMDAC_CT_DATA_CHANGE)
> +		dev->data_change = pwmdac_ct_data_change[sel].vals;
> +	else if (pwmdac_ct == PWMDAC_CT_DATA_MODE)
> +		dev->data_mode = pwmdac_ct_data_mode[sel].vals;
> +	else if (pwmdac_ct == PWMDAC_CT_DATA_SHIFT)
> +		dev->data_shift = pwmdac_ct_data_shift[sel].vals;
> +
> +	return 0;
> +}

_put() operations should return 1 if the control value changes so event
generation works - please test a card using this driver with the
mixer-test selftest, it'll identify this and a bunch of other potential
issues.

> +static int jh7110_pwmdac_component_probe(struct snd_soc_component *component)
> +{
> +	snd_soc_add_component_controls(component, jh7110_pwmdac_snd_controls,
> +				       ARRAY_SIZE(jh7110_pwmdac_snd_controls));
> +	return 0;
> +}

The driver can just point to the controls from the _driver struct and
skip having a probe() function.


--7WRSfejFGo+r56WO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTICB4ACgkQJNaLcl1U
h9Bkogf7B5sn9Y3g1mTAAspid/NHj9EJnpyylKVFcCH8D0UOo11qJLylO7cb8DQw
3M6ifjvdgMPSgZiwoshQnv3dS0yPr422sWUV65Dnm9pI0lwju9mFo4mh6i0zexdi
AvQWj6reLoNjF1zn3ZSLU0qkqSTxaOebz1O9RkldqqmbcVixM4sLJOoDzhb5K76O
lfD2y7zU3/GBt/+OwRObmMLz/AlrPbPkT2YF+0txEYEIitxWHgMoqJFWJI9cdg9I
8WBjG+5nh/yKozj2EYOEGhKNjBegDGOOp/7sqWdUMdrkRNdtczS3sp5/jRHLv6ph
1AMqKDncC9OfgKfFLfJy2saNmIxWlg==
=JSoy
-----END PGP SIGNATURE-----

--7WRSfejFGo+r56WO--
