Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 168D890FF95
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2024 10:54:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60006DE5;
	Thu, 20 Jun 2024 10:54:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60006DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718873680;
	bh=2TvpXXhOk9nqvvpL7r4WYpLMcH8C6BL3/fs1sCKRmQI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n8IS5EOAjU/+/GrNsaurOjML5nGpQ9H4Tw6pKrJSK+Kmj8ARWOvYTMJfsMW4MsEuv
	 eJVXu8ja0stPpGYbbXZBWKedcdQzUgVLcS9VTJzVIJJRj2MEqgujKcqW4m8bA1dSeN
	 9SmoRn0R7yL2rAoPPEvDcalEIkVMdRjfsKtVc6aA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 072F2F805B1; Thu, 20 Jun 2024 10:54:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C5E4F805A8;
	Thu, 20 Jun 2024 10:54:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A94ABF80587; Thu, 20 Jun 2024 10:52:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2CE3F805B4
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 10:51:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2CE3F805B4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=y4LKIGLp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718873513; x=1750409513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2TvpXXhOk9nqvvpL7r4WYpLMcH8C6BL3/fs1sCKRmQI=;
  b=y4LKIGLp21SlB6X52nvtuDLk94n9GyVlINlgD4od+pfH6nA7Og4cZSwH
   MlbsMBkE3IuMU7gsbxhYk1A3QaS8xgyEMXBQSYfW/i2RastrV5UQ4UL7+
   EN6zHZbSAtgfV5AyCpSupH0EXN10nZPbve5T3DbnOMnaEhYIPlAR3H8Dw
   Stqw+6gCYVrvg691E0YVQREcigbSN+0YKCticUnMj5Prq4mq1l1BpOwMt
   NX4Htt18RHS6tGqNVdbdwYca4hgEIyUpMX14V9sn6UE85sesNmH75H1us
   YvL4tvIFxBdqnVZXtlqtZ28apv4Krg2HNq8yDgKk2ha0r0hvY38u+LZcs
   g==;
X-CSE-ConnectionGUID: 56ZSahdTSAWG5kTlegWLxQ==
X-CSE-MsgGUID: n5KP9bTySkmIbaRvewCWMg==
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000";
   d="asc'?scan'208";a="28910098"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jun 2024 01:51:49 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 20 Jun 2024 01:51:25 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 20 Jun 2024 01:51:22 -0700
Date: Thu, 20 Jun 2024 09:51:03 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Olivier MOYSAN <olivier.moysan@foss.st.com>
CC: Conor Dooley <conor@kernel.org>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Fabrice Gasnier
	<fabrice.gasnier@foss.st.com>, <alsa-devel@alsa-project.org>,
	<linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/8] dt-bindings: iio: dfsdm: move to backend framework
Message-ID: <20240620-custody-jailbreak-6540620d6570@wendy>
References: <20240618160836.945242-1-olivier.moysan@foss.st.com>
 <20240618160836.945242-5-olivier.moysan@foss.st.com>
 <20240618-footwear-impotence-5284985a609d@spud>
 <4734e915-9ea7-4e65-a9ef-bc1e88c40e76@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NJFxl4lrwoiFDjYE"
Content-Disposition: inline
In-Reply-To: <4734e915-9ea7-4e65-a9ef-bc1e88c40e76@foss.st.com>
Message-ID-Hash: GMQLEZRADNNUJB75YJ7OBJ4CMSNDX22Y
X-Message-ID-Hash: GMQLEZRADNNUJB75YJ7OBJ4CMSNDX22Y
X-MailFrom: prvs=8949280bc=Conor.Dooley@microchip.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GMQLEZRADNNUJB75YJ7OBJ4CMSNDX22Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--NJFxl4lrwoiFDjYE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 10:03:44AM +0200, Olivier MOYSAN wrote:
> On 6/18/24 20:10, Conor Dooley wrote:
> > On Tue, Jun 18, 2024 at 06:08:30PM +0200, Olivier Moysan wrote:
> > >       allOf:
> > >         - if:
> > >             properties:
> > > @@ -199,9 +264,19 @@ patternProperties:
> > >                 description:
> > >                   From common IIO binding. Used to pipe external sigm=
a delta
> > >                   modulator or internal ADC output to DFSDM channel.
> > > +              deprecated: true
> > > -          required:
> > > -            - io-channels
> > > +          if:
> > > +            required:
> > > +              - st,adc-channels
> > > +          then:
> > > +            required:
> > > +              - io-channels
> > > +
> > > +          patternProperties:
> > > +            "^channel@([0-9]|1[0-9])$":
> > > +              required:
> > > +                - io-backends
> >=20
> > Why is this here, rather than with reg above? Only some channels require
> > a backend?
>=20
> The io-backends property is required only when we use st,stm32-dfsdm-adc
> compatible. In other words, when we are in an analog use case. In this ca=
se
> the channel is a consumer of a backend (typically a sd modulator)
> In an audio use case (compatible st,stm32-dfsdm-dmic) the backend is not
> required.

Ahh, I think the hunks and indent confused me here. What you're doing is
making io-backends required based on the compatible, but what I thought
you were doing was trying to make io-backends required in channels if
st,adc-channels was set.

Thanks for the explanation,
Conor.

--NJFxl4lrwoiFDjYE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnPtdwAKCRB4tDGHoIJi
0j93AP44jgZe6b+HBEZ4omA3y0tvrLry/EB6akIV7NR8Vap5igEAg+cGLKESOy+o
Zt9PvSP8qWdePXuj43/CfT/7C1OO8go=
=JkF+
-----END PGP SIGNATURE-----

--NJFxl4lrwoiFDjYE--
