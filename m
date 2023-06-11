Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C99F72B1C3
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Jun 2023 13:58:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93C696C0;
	Sun, 11 Jun 2023 13:57:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93C696C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686484706;
	bh=Ud6DijTGw2KIKTv6kjmgnirT63T3fx5KrKvK33LlULk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BMoXQel+jO6orf5XlJHx2GrAlSqN+iJ18PYYHCxuplHTXEDPyvpza4bxvOObMTFAu
	 6GAz1nfloW8zmx+k+0CIvjzBVlradTlFNa90SVf1IldtD98Vk2jciAqK0iwyJpCVSH
	 Qm7z5T4T8JSiz1UMcZEV6uBHCaPC+6Nt9FFgVE0Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10E1CF80155; Sun, 11 Jun 2023 13:57:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D03DF80130;
	Sun, 11 Jun 2023 13:57:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CC79F80149; Sun, 11 Jun 2023 13:57:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C840F80130
	for <alsa-devel@alsa-project.org>; Sun, 11 Jun 2023 13:57:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C840F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=h/vQAFib
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7A7C960E75;
	Sun, 11 Jun 2023 11:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF48EC433EF;
	Sun, 11 Jun 2023 11:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686484637;
	bh=Ud6DijTGw2KIKTv6kjmgnirT63T3fx5KrKvK33LlULk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h/vQAFibCaPW0yRJvgsnM2JG0UujIwtsVSVTqGJvQPFv+H42fiCbfhAawJnAF6nTo
	 fZetCVS+Pu6JP6v9aOys2k9+l7KcJMD5R7QWdx4K7frnMQoMRWkdccTjaUv/yudaEK
	 W0sbQVSE/VVB3UvCEPtx7hza7hhwGN/p3rdfj0AwkJ8u+9BOzNvKdalZdugvB4d9b1
	 lO/kO7f/QsfY9zKH+abWn1s+FV9kbTNlUIAOTcVF80y5TnKzsLEQ54KTRPlsMkg5ri
	 cX3jRtVWHcOrAbinuHgLZg/Wm7mWrkk6EOdHaZaxxXPmc+kUYtSN4NhT3CIJyWtzjd
	 WUONGCEj39sHg==
Date: Sun, 11 Jun 2023 12:57:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Patrick Lai <quic_plai@quicinc.com>
Subject: Re: [PATCH v2 2/2] ASoC: codecs: wsa884x: Add WSA884x family of
 speakers
Message-ID: <191859d3-42e3-4ef2-87ff-dd56864103f9@sirena.org.uk>
References: <20230611102657.74714-1-krzysztof.kozlowski@linaro.org>
 <20230611102657.74714-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2UHYA9utW3zi5EMo"
Content-Disposition: inline
In-Reply-To: <20230611102657.74714-2-krzysztof.kozlowski@linaro.org>
X-Cookie: List was current at time of printing.
Message-ID-Hash: DBD542TXNFA53ZRZ7NUTN2CIYNEY3JYG
X-Message-ID-Hash: DBD542TXNFA53ZRZ7NUTN2CIYNEY3JYG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DBD542TXNFA53ZRZ7NUTN2CIYNEY3JYG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--2UHYA9utW3zi5EMo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 11, 2023 at 12:26:57PM +0200, Krzysztof Kozlowski wrote:

> +static struct reg_default wsa884x_defaults[] = {

> +	{ WSA884X_CHIP_ID0,			0x00 },
> +	{ WSA884X_CHIP_ID1,			0x00 },
> +	{ WSA884X_CHIP_ID2,			0x04 },
> +	{ WSA884X_CHIP_ID3,			0x02 },
> +	{ WSA884X_BUS_ID,			0x00 },

It is generally bad practice to provide defaults for ID registers since
it rather defeats the point of having them.

> +	{ WSA884X_INTR_STATUS0,			0x00 },
> +	{ WSA884X_INTR_STATUS1,			0x00 },

Interrupt status registers will be volatile and therefore should not
have defaults.

> +	{ WSA884X_OTP_REG_0,			0x05 },
> +	{ WSA884X_OTP_REG_1,			0x49 },
> +	{ WSA884X_OTP_REG_2,			0x80 },
> +	{ WSA884X_OTP_REG_3,			0xc9 },
> +	{ WSA884X_OTP_REG_4,			0x40 },
> +	{ WSA884X_OTP_REG_5,			0xff },
> +	{ WSA884X_OTP_REG_6,			0xff },
> +	{ WSA884X_OTP_REG_7,			0xff },
> +	{ WSA884X_OTP_REG_8,			0xff },
> +	{ WSA884X_OTP_REG_9,			0xff },
> +	{ WSA884X_OTP_REG_10,			0xff },
> +	{ WSA884X_OTP_REG_11,			0xff },
> +	{ WSA884X_OTP_REG_12,			0xff },
> +	{ WSA884X_OTP_REG_13,			0xff },
> +	{ WSA884X_OTP_REG_14,			0xff },
> +	{ WSA884X_OTP_REG_15,			0xff },
> +	{ WSA884X_OTP_REG_16,			0xff },
> +	{ WSA884X_OTP_REG_17,			0xff },
> +	{ WSA884X_OTP_REG_18,			0xff },
> +	{ WSA884X_OTP_REG_19,			0xff },
> +	{ WSA884X_OTP_REG_20,			0xff },
> +	{ WSA884X_OTP_REG_21,			0xff },
> +	{ WSA884X_OTP_REG_22,			0xff },
> +	{ WSA884X_OTP_REG_23,			0xff },
> +	{ WSA884X_OTP_REG_24,			0x00 },
> +	{ WSA884X_OTP_REG_25,			0x22 },
> +	{ WSA884X_OTP_REG_26,			0x03 },
> +	{ WSA884X_OTP_REG_27,			0x00 },
> +	{ WSA884X_OTP_REG_28,			0x00 },
> +	{ WSA884X_OTP_REG_29,			0x00 },
> +	{ WSA884X_OTP_REG_30,			0x00 },
> +	{ WSA884X_OTP_REG_31,			0x8f },
> +	{ WSA884X_OTP_REG_32,			0x00 },
> +	{ WSA884X_OTP_REG_33,			0xff },
> +	{ WSA884X_OTP_REG_34,			0x0f },
> +	{ WSA884X_OTP_REG_35,			0x12 },
> +	{ WSA884X_OTP_REG_36,			0x08 },
> +	{ WSA884X_OTP_REG_37,			0x1f },
> +	{ WSA884X_OTP_REG_38,			0x0b },
> +	{ WSA884X_OTP_REG_39,			0x00 },
> +	{ WSA884X_OTP_REG_40,			0x00 },
> +	{ WSA884X_OTP_REG_41,			0x00 },
> +	{ WSA884X_OTP_REG_63,			0x40 },

These appear to be OTP data which suggests that they shouldn't have
defaults either since they can be programmed.

> +static bool wsa884x_readonly_register(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {

In general the read only registers probably shouldn't have defaults...

> +static bool wsa884x_volatile_register(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case WSA884X_ANA_WO_CTL_0:
> +	case WSA884X_ANA_WO_CTL_1:
> +		return true;
> +	}
> +	return wsa884x_readonly_register(dev, reg);
> +}

...and the volatile regiseters definitely not, the default values will
never be used and just waste space.

> +static struct regmap_config wsa884x_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 8,
> +	.cache_type = REGCACHE_RBTREE,

Please use REGCACHE_MAPLE for new devices.

> +	/* Speaker mode by default */
> +	{ WSA884X_DRE_CTL_0, 0x7 << WSA884X_DRE_CTL_0_PROG_DELAY_SHIFT },
> +	{ WSA884X_CLSH_CTL_0, (0x37 & ~WSA884X_CLSH_CTL_0_DLY_CODE_MASK) |
> +			      (0x6 << WSA884X_CLSH_CTL_0_DLY_CODE_SHIFT) },
> +	{ WSA884X_CLSH_SOFT_MAX, 0xff },

Why not just leave as the chip default?

--2UHYA9utW3zi5EMo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSFtpUACgkQJNaLcl1U
h9Bc2wf+MW3w20yWsADZfhfgAfmIMBYWCXDCv8gztK+ATSXpMqDU22Z+cNIX5V9h
hEegPQLq4qhuoNGundoTJkCccxhSZwvET/NlYtfxuxqhKFuI0qILC2VmVttTApX/
bP/D8kQxSNu0tmi06qzuqoJ9mb2RXV0dgfLZAesNqhqryCSnq9HdX9dX/zevFdlH
moxCU+WyoRFVvCwpJkHmrZXNkntoa58SkA73zFVpCX7DoZGOtbxRdlKRaNpuR8Ge
/Zf95c5xmwiNYFxToTUQm+YLIRySIrn5hRZGjkW18mj/gw8BWHSGyIY/llDsJ3i7
cdYyJANPFun6BAoRDMoG1p3zlzliOw==
=5kvz
-----END PGP SIGNATURE-----

--2UHYA9utW3zi5EMo--
