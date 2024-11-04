Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1219BBA78
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2024 17:42:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E39E686E;
	Mon,  4 Nov 2024 17:41:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E39E686E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730738520;
	bh=+B9xFugGobw2ZRWDNdrYNv/jQoedsgnzX20cqqtb3i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PCKfQqh+iKPaoG7P8cJFDQpHIbUOUGqRknrl86aX6W3/c64pOxnOaeAlGpGFV+nJc
	 TSs0o+eOmE+8l3xNeXXIf6b8fG1w8I84QURDdceMz8HACtdzuPr5m27q7KYiMjfiFm
	 7wkZ7OEKJIf/zNTFxgxLjhDTL2tPoJKxnaZ9YTJI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 761E0F805AC; Mon,  4 Nov 2024 17:41:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6CA5F805A8;
	Mon,  4 Nov 2024 17:41:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E26FF8026A; Mon,  4 Nov 2024 17:41:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DFA52F8014C
	for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2024 17:41:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFA52F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OWjugrvu
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D3D435C3ECC;
	Mon,  4 Nov 2024 16:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04D29C4CECE;
	Mon,  4 Nov 2024 16:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730738479;
	bh=+B9xFugGobw2ZRWDNdrYNv/jQoedsgnzX20cqqtb3i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OWjugrvuDz6ff1jX/EzVG4/5uQaUmp1rB0aAZ84F+JUT2zEz56uX+cXmYmmDbldk2
	 UbhbOGj3IXz8OKNgB2+5YfAEdCUCMImjpwSQ7RqsxtwYDe5v1KA9Bjf8gJOBqPCswA
	 6EnDbu8MrjWQszhTFJwgJK3Qi7rRh4x6YoFVpDBHZnXBPv321bpIic0X87FGSnk09b
	 x4epqNCrtv9imO8+7YX4eRYgmRYegPpjGWCDyfGOsckK+wtSzunlOLmlD7WKqRyEct
	 41BYaHLIba6sMWBmPxbjI3w6OvSq6rSnjk3alY9Iw9RuS+d+pW45muP1DwnAzha6X7
	 eySOu/81VHVkw==
Date: Mon, 4 Nov 2024 16:41:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Ki-Seok Jo <kiseok.jo@irondevice.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: irondevice,sma1307: Add
 initial DT binding
Message-ID: <ac5ad26e-ef76-4ad9-9396-2b175276a5c8@sirena.org.uk>
References: <20241104-irondevice-sma1307-v3-0-4bbe79895f54@irondevice.com>
 <20241104-irondevice-sma1307-v3-1-4bbe79895f54@irondevice.com>
 <SL2P216MB23377A60BEC4396ADFA78A6A8C512@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
 <20241104161751.GA320514-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oagKkKyvt1o8YX1v"
Content-Disposition: inline
In-Reply-To: <20241104161751.GA320514-robh@kernel.org>
X-Cookie: The meek are contesting the will.
Message-ID-Hash: SAWJH2IKELZYQAZZYEWOPLCTFGLD2U3A
X-Message-ID-Hash: SAWJH2IKELZYQAZZYEWOPLCTFGLD2U3A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SAWJH2IKELZYQAZZYEWOPLCTFGLD2U3A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--oagKkKyvt1o8YX1v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2024 at 10:17:51AM -0600, Rob Herring wrote:
> On Mon, Nov 04, 2024 at 07:33:47AM +0000, Ki-Seok Jo wrote:

> > +    enum:
> > +      - irondevice,sma1307a
> > +      - irondevice,sma1307aq
> > +    description:
> > +      If a 'q' is added, it indicated the product is AEC-Q100
> > +      qualified for automotive applications. SMA1307A supports
> > +      both WLCSP and QFN packages. However, SMA1307AQ only
> > +      supports the QFN package.

> Is this difference visible to software? The package is not, so that part=
=20
> is irrelevant.

It seems reasonable to allow it as a compatible if it's sold as a
separate part, even if we don't need to care.

--oagKkKyvt1o8YX1v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmco+SkACgkQJNaLcl1U
h9C3WQf/cvCLIIc9BSmHgNbLWWFbm12PJ+ga/IEM7Ud6luckZzqyjyZRvFV/uy0E
JabJmdMpallRe/VTN0/0aXbMFY66Jw+3QVCyLprfuYr6GtItgkLxE7SdO32bmp6N
1Qj5qXJETVb2PWiVsvmVjRitxuKTfLJms0HGgaK5VMwdkV6nTjujPDhKLfIzbgOl
kDEI+s+aZXcOSbqk69XjFrRtXMiiGZKqbFbdfOncUdt6i1UeiM7AuIvJzjLh18gp
o2v7CQ5BI+/WXKEk3Mqz8c16WBBiJYmihPraozovwIlDRp7BH7o3qBqX/SxR5TLz
OkBQzrEMqk42cfC+HVpeWVHb6ML8TA==
=ZsMY
-----END PGP SIGNATURE-----

--oagKkKyvt1o8YX1v--
