Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D1D8C7577
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2024 13:49:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86E1974C;
	Thu, 16 May 2024 13:48:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86E1974C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715860142;
	bh=wu41wYwUT3ZQ/LMwpK4vTqW07C2TaCMbGkW8wWLqctM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OTD7KSR5dDRaN/eUKAl0b0Ow4k26TO1xDKYNQNOnrYSuNMpySbbyLJEJJKPtRXClg
	 4ww1tHBkPT/M4cU3XEBsC1EFWrnLrCSDsLWYCoxA/ryqrWFqelZ+MiGHPXYNeqs3ly
	 jYyYWIGGQmwp97Ttc6U9reutHLi1+dYdsdgVzU2A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90EA4F805A9; Thu, 16 May 2024 13:48:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 214FFF805A1;
	Thu, 16 May 2024 13:48:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A7A8F8024C; Thu, 16 May 2024 13:47:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6853F800E2
	for <alsa-devel@alsa-project.org>; Thu, 16 May 2024 13:47:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6853F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QcnJO5Gz
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 760C9CE189E;
	Thu, 16 May 2024 11:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E24EC113CC;
	Thu, 16 May 2024 11:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715860026;
	bh=wu41wYwUT3ZQ/LMwpK4vTqW07C2TaCMbGkW8wWLqctM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QcnJO5Gze6rEySLsD5MoX2CcuqLtdZ8oTEU6W7LJ4ME+mJm6XdQUy3uUAlk37Oyuj
	 Wpqb9DkM7lhXwG5H1qnM9RPO4tLeD8Y4FzzKOzUC8WS7Ob4h96Ymg+MPoz4wUu1Q2I
	 AXK4zi2mL5jPQ3jAbhbV/p+TUgB5a5UjcnomXQjHy/XDgBZxNvGGunD620k/qwsitZ
	 yzbPLR17N5pzcEhv+iOG5vDg4AJm00f+KY6Cs3b0AKxr5QimIQgj9fl2JRKS3mYC+k
	 jycmvVl9DdjnVr9NqVI9N0TVL68NjRqrsgrKgZnYZBidC8sLf6EJFSIrPEEG3WQsVF
	 zUk6nkFH8Wikw==
Date: Thu, 16 May 2024 12:47:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
	quic_pkumpatl@quicinc.com
Subject: Re: [PATCH v4 2/7] ASoC: codecs: wcd937x-sdw: add SoundWire driver
Message-ID: <91f581ef-58ea-4b98-80e2-dd9b14a61c60@sirena.org.uk>
References: <20240516044801.1061838-1-quic_mohs@quicinc.com>
 <20240516044801.1061838-3-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6TMXXQ4QPf3seqeB"
Content-Disposition: inline
In-Reply-To: <20240516044801.1061838-3-quic_mohs@quicinc.com>
X-Cookie: I'm having a MID-WEEK CRISIS!
Message-ID-Hash: ODD37QC4TBNHBN4CGQVDWBF6UUWKUXPM
X-Message-ID-Hash: ODD37QC4TBNHBN4CGQVDWBF6UUWKUXPM
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ODD37QC4TBNHBN4CGQVDWBF6UUWKUXPM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--6TMXXQ4QPf3seqeB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 16, 2024 at 10:17:56AM +0530, Mohammad Rafi Shaik wrote:

> +static const struct reg_default wcd937x_defaults[] = {

> +	{ WCD937X_DIGITAL_EFUSE_REG_0,				0x00 },
> +	{ WCD937X_DIGITAL_EFUSE_REG_1,				0xff },
> +	{ WCD937X_DIGITAL_EFUSE_REG_2,				0xff },
> +	{ WCD937X_DIGITAL_EFUSE_REG_3,				0xff },

Given the name I'd expect these to vary per device so not have default
values.  In general ID, status or volatile registers probably shouldn't
have defaults since they should be read from the device.

> +static bool wcd937x_readonly_register(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {

> +	case WCD937X_DIGITAL_CHIP_ID0:
> +	case WCD937X_DIGITAL_CHIP_ID1:
> +	case WCD937X_DIGITAL_CHIP_ID2:
> +	case WCD937X_DIGITAL_CHIP_ID3:

> +	case WCD937X_DIGITAL_EFUSE_REG_0:
> +	case WCD937X_DIGITAL_EFUSE_REG_1:
> +	case WCD937X_DIGITAL_EFUSE_REG_2:

> +	.readable_reg = wcd937x_readable_register,
> +	.writeable_reg = wcd937x_rdwr_register,
> +	.volatile_reg = wcd937x_readonly_register,

It's not a bug per se since things will work but you should probably
have separate volatile and read only checks, things like the ID and
efuse registers are read only but they shouldn't vary at runtime so
could be cached and not volatile.

--6TMXXQ4QPf3seqeB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZF8jMACgkQJNaLcl1U
h9C/Agf/dxl2QvSF6O91HT9LEA+eXsV+RD+If0rb6NqB7TD6GqF4NT8biCZgRABj
+5j0XCauKqigxtMYyzxxdJE80SL5L9z93e7OLemzzOfxpspvFbNcnktzgCN2zPTc
HNDtykLiV7SvrRm8e2J7aU3aqhSBBp1d2e970CmaOnVuyvfbyZVoPjsvicMgHZP9
3CB0Pa1C1+By8DrFR7vI6yembohfU4wFeB/66qzYovFSCI/hOuMYo2usgNhsaT8d
hUjon+Xz5e9/yaNPVIRjWuOsEa2yL1lo21HwR9drPjRtZNeTlxxhKrXoDd3goJLS
EdleAlXH/IcsXx7gjcdXQDal8syQPg==
=W/m3
-----END PGP SIGNATURE-----

--6TMXXQ4QPf3seqeB--
