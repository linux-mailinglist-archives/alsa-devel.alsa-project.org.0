Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A76696FD3C0
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 04:11:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B76E01074;
	Wed, 10 May 2023 04:10:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B76E01074
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683684683;
	bh=poI666OI/xsZPVnr06pLwQAkEzT1SEYPhOfJQcJRHw8=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VS9OKf0KcSdq3vC4QI/1ICETLM6uDy9V7nXKekNFwwAlhR+/gYxucsqetEpQh5umj
	 zBAGkRw81jHzRyfX4SItQubdqbCH1x7Up2j6lDVH276KTdq84RLjmPno/0SLvtdxEd
	 J8U+c7FQREt4Yo+hKpS0D9AwjVro1QegPFtkfP2A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 177DCF80310;
	Wed, 10 May 2023 04:10:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98B79F8032D; Wed, 10 May 2023 04:10:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88EB2F8014C
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 04:10:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88EB2F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WvYIzReu
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D31C362FC1;
	Wed, 10 May 2023 02:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB05C433EF;
	Wed, 10 May 2023 02:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683684619;
	bh=poI666OI/xsZPVnr06pLwQAkEzT1SEYPhOfJQcJRHw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WvYIzReuFXvL7NWwO5OG68hV84RKTLdKoP1oCl2TR8I1Y0FOR6/EdqJsLSr4PSPiv
	 3LrFhIJSEZ4ijpVINxD5n51oDYBfbSdvft/Z1ejFYfRUAt9UB1LI5vaalQKi9thGyD
	 kqFZDd4/zKyUzRR8567MvtoWIpn61Q6asj/L0dy3aisq0e5+LQhzkS/5uZwdPP2+4r
	 Ee5oR5s0cUwTggR4m79UHTcbKg5c7XB+mOzo4JG/qRRc08zUa9l5S3GY+PfFddKWjV
	 YZ0xEoRbnDNK9m56cqXEGWC6B33PjLW9aN47OhxOoxP1+474T8kHMm2XY7+lKBqKMn
	 5FxwMnevFYVdg==
Date: Wed, 10 May 2023 11:10:16 +0900
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Add adi,ssm3515 amp schema
Message-ID: <ZFr9CP3Dfmb/3LzP@finisterre.sirena.org.uk>
References: <20230509163828.86003-1-povik+lin@cutebit.org>
 <20230509-marxism-plug-759c99ac601c@spud>
 <0216884B-A6F4-46B0-AEB9-AA16B3F24C8C@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x8yWm22KI+W3sa7J"
Content-Disposition: inline
In-Reply-To: <0216884B-A6F4-46B0-AEB9-AA16B3F24C8C@cutebit.org>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: BPFFL3SC4WTIMBHIDLOBTU3IG7MTXKZ5
X-Message-ID-Hash: BPFFL3SC4WTIMBHIDLOBTU3IG7MTXKZ5
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Conor Dooley <conor@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>, asahi@lists.linux.dev,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BPFFL3SC4WTIMBHIDLOBTU3IG7MTXKZ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--x8yWm22KI+W3sa7J
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 09, 2023 at 09:38:46PM +0200, Martin Povi=C5=A1er wrote:
> > On 9. 5. 2023, at 20:25, Conor Dooley <conor@kernel.org> wrote:

> >> +        00: 8.4 V Full-Scale Gain Mapping
> >> +        01: 12.6 V Full-Scale Gain Mapping
> >> +        10: 14 V Full-Scale Gain Mapping
> >> +        11: 15 V Full-Scale Gain Mapping

> > Putting register values into the DT does not seem correct, although
> > I know nothing about sound and will have to defer to Krzysztof & Co. on
> > that front.

> I thought this should be here, and not with the other gain controls to be
> exported to userspace, since it relates to the supply voltage. You probab=
ly
> can=E2=80=99t select a gain value close or over the amp=E2=80=99s supply =
and expect proper
> functioning, so the value here should be the system=E2=80=99s integrator =
choice.

> On second thought there doesn=E2=80=99t seem to be any risk of damage to =
the amp
> itself, so the knowledge of what=E2=80=99s the optimal value could be lef=
t up to
> ALSA use-case configuration, and there=E2=80=99s no real downside in trea=
ting it
> like other gain controls.

Alternatively why not just query the supply voltage via the regulator
API?  Those are kind of weird numbers (eg, 12.6V rather than 12V)
though, it looks like they're not expected to be the actual maximum
supply values but rather something slightly less.

--x8yWm22KI+W3sa7J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRa/QcACgkQJNaLcl1U
h9BY4QgAhWukkwf/Q+KJ/O1mA+WDot7Z/4HgoZ6HQ1Ah1oeMY2KKVMctkt+Fjjsu
71JOb30GLBJNLiU71/915kUVu6da4KdpfvWJAPT94yfishybk+Kvre0c4YsSuPnR
oToqrQLzMr14EHPYMgCB6xEOGyUgpQHJ+FXhhvlTaYme5wEwpUYrx7lNLCZCN5Xh
pBUJEWWAlImA/FqNICvl9pHooolRe/nkvvPb0m0RgWnQ90cxJXtfRQ5Louixv7l5
jmOqaO2hSFCuoRED54pUqOVKq3qGj/rzEGONEwxdSlIKaKYQWmkCzdx+xt+pCW8i
KwhMWrajFDoxxoo+t43SuOqOZyLsDg==
=Vdq1
-----END PGP SIGNATURE-----

--x8yWm22KI+W3sa7J--
