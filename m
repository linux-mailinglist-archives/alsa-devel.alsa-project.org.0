Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F6B4D0417
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 17:27:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBA751729;
	Mon,  7 Mar 2022 17:26:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBA751729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646670428;
	bh=KpKI6qgGwDUwwLWxU1qaL2a44GAcKr4iZtGWpWGYJMs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UN5m9P3Vvb7r/DEVIy+HY8p2JK9Q3VN0IbTwLc9eI6j2qr5KJsWsvfTKvuyDrFn/x
	 2LvblUTgu2Ju+c8hp1uL7E7AH7lRUCZhkBNFSMGYYnpRYRuZRF3QG7oAZawyjC3h3S
	 kjw3YNKLB5+V+uuzCJQmDb9xibjmiPbC092omln4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A242F80159;
	Mon,  7 Mar 2022 17:26:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D78EF8013F; Mon,  7 Mar 2022 17:25:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF87BF800E9
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 17:25:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF87BF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CpH6ITx2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 495F5B81630;
 Mon,  7 Mar 2022 16:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3A6C340E9;
 Mon,  7 Mar 2022 16:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646670354;
 bh=KpKI6qgGwDUwwLWxU1qaL2a44GAcKr4iZtGWpWGYJMs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CpH6ITx2pU0aJmp+sjZpLmce+nHz3VuHJ4vSd0yJFz7JN+yIbVvVTI7mMZvpazB5y
 2DOmmBplhkuHluzAoQQVGK80dcizAl8vdKoeCwXw0WWpv1gcLOMcmUPPbJ5d9wqrIW
 ChgohkIkSD0DTszRgc6XGXAml/QmqQzK1OyvxxWp4cp0uh/i1+gA4wCMKF1P1NuPzQ
 2PhwsFeOPqcimMgw4z2RtTFONcCdp/oTfAp/Ep9u7MuwyOY23p1Zl8V6kk6eXp9lTE
 eyLob+D7IiUflZ4KBqoYAcDIERFu5MljuYGci1vczIr08puMtYjO/OfhtvU1iJl7K9
 fVshh7WBcCxvA==
Date: Mon, 7 Mar 2022 16:25:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Alifer Moraes <alifer.m@variscite.com>
Subject: Re: [PATCH 4/4] ASoC: wm8904: add DMIC support
Message-ID: <YiYyC1MVd+oCMU4x@sirena.org.uk>
References: <20220307141041.27538-1-alifer.m@variscite.com>
 <20220307141041.27538-4-alifer.m@variscite.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1iwP804p5/iDUb1W"
Content-Disposition: inline
In-Reply-To: <20220307141041.27538-4-alifer.m@variscite.com>
X-Cookie: Whatever became of eternal truth?
Cc: pierluigi.p@variscite.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@gmail.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, eran.m@variscite.com,
 robh+dt@kernel.org, patches@opensource.cirrus.com, festevam@gmail.com
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


--1iwP804p5/iDUb1W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 07, 2022 at 11:10:41AM -0300, Alifer Moraes wrote:

> +static const char *cin_text[] = {
> +	"ADC", "DMIC"
> +};
> +
> +static SOC_ENUM_SINGLE_DECL(cin_enum,
> +			    WM8904_DIGITAL_MICROPHONE_0, 12, cin_text);

Why would this be runtime selectable?  I'd expect the decision to use
an analogue or digital microphone to be made in the hardware design.

--1iwP804p5/iDUb1W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmImMgoACgkQJNaLcl1U
h9CVtwf+Nl6A9aOjLebqzdwWyr4hAKLag1cq9s4w8/dqa2QzayNcPU+m11c7Pc+v
LCTqp1AlwYRMPznHYVXQbIP6Vy3rK6XHJpfU5vlib/7VUfOCE3Od3rmsD+1OtvDX
QYgjz3RZz1TgeQaKHk5O77GUIhmw1xRSQI+kxuUu2I6JKmETEkOkcvgbF6NyR1oN
NBtwQe7cJhJ1QHhB0PoNrB5cK6LIPlNgrxB6rqFsXyz1tOYN+/ObjvgJHsC9kCUc
vr3cIPI1Hy5lw3vEyFJuqnP0FKcO/CZjb4Wbk0ZFqTBDkBiqFLJTaFWLsRzngEk+
Nnu6Iq3gFIdDvBfmoAUHTBmB7dsKhw==
=Rd11
-----END PGP SIGNATURE-----

--1iwP804p5/iDUb1W--
