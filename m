Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 019DE8474F7
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Feb 2024 17:36:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74CE583E;
	Fri,  2 Feb 2024 17:36:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74CE583E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706891814;
	bh=arzyIYOYtqrlqTyYOOX+PFd1VhqAUTVPhh5mK5F2ZKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JUPxLnrYsj4hK5ZRDpM9kY61x7Nn/f743fVkJzhyq3hbusqXIj1pYC9k5Schx7dKW
	 nQPdGaim/NFJ0yp4vfaHgTub7sW5SmQjCnz2RYIYyDuUvq/W/a9Vr67CmlAZfG9kEv
	 RWZFKEptCOSPSxtE5K+nwyxhvTuwO/bF0LMOYxZU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFA1AF8058C; Fri,  2 Feb 2024 17:36:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B244F8055C;
	Fri,  2 Feb 2024 17:36:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11BC7F8055C; Fri,  2 Feb 2024 17:36:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D522F80548
	for <alsa-devel@alsa-project.org>; Fri,  2 Feb 2024 17:36:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D522F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ol+CT98m
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E58D624DD;
	Fri,  2 Feb 2024 16:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F64C433F1;
	Fri,  2 Feb 2024 16:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706891771;
	bh=arzyIYOYtqrlqTyYOOX+PFd1VhqAUTVPhh5mK5F2ZKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ol+CT98mOTuP5PPkbccLG/tvqVpithWKV27/5J9Y55e2H6sHCslKuRpO+0Sa/qJvM
	 QdzrP7lBLTpNYd6T/l2ml9Xlh1PXmpB7JrQyFyL5DjKxjJHG/1RNhfnzSc0RoUSxGH
	 fG6rr01SfEdgMvS+smS2CUBtNVlP4G+zfz1tIB+bImLLsf05pCsTFBxbpmL9TfK7cC
	 45ttsKyyRTHPRTUzinXPRUsk+FPhp5iYTQAJwb157plRz87BH622TDkIB4fN5cBMI+
	 8jjdgGKkKherSrF7nzszQ16IQQX9H78Z1DWTCHgw6XzT3cpvFRl2YWN1MhTI/Xg/mq
	 aLbOxVkhlZjXw==
Date: Fri, 2 Feb 2024 16:36:05 +0000
From: Conor Dooley <conor@kernel.org>
To: AS50 WTLi <WTLI@nuvoton.com>
Cc: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh+dt@kernel.org,
	conor+dt@kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
	CTLIN0@nuvoton.com, SJLIN0@nuvoton.com, scott6986@gmail.com,
	supercraig0719@gmail.com, dardar923@gmail.com
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Added schema for "nuvoton,nau8325"
Message-ID: <20240202-tripod-clumsily-ff7c19515acf@spud>
References: <20240122095650.60523-1-wtli@nuvoton.com>
 <20240122-daunting-woof-19fac5689bb2@spud>
 <04945799-eded-42f9-b8fa-8907be44c400@sirena.org.uk>
 <20240123-bottle-elevating-9fbba5424014@spud>
 <185f3912-5a92-4ef2-aac4-0df8363d8727@sirena.org.uk>
 <20240123-brewery-roving-b9ebc70468f4@spud>
 <591e12e6-117d-28b5-986c-83414ebc6b4e@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CMNQgfuuSMLBnyM2"
Content-Disposition: inline
In-Reply-To: <591e12e6-117d-28b5-986c-83414ebc6b4e@nuvoton.com>
Message-ID-Hash: JJUDTS7R3TIBSJHESMNGQSTRBR4YJAWZ
X-Message-ID-Hash: JJUDTS7R3TIBSJHESMNGQSTRBR4YJAWZ
X-MailFrom: conor@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JJUDTS7R3TIBSJHESMNGQSTRBR4YJAWZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--CMNQgfuuSMLBnyM2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > At the end of the day, if it is too painful on the driver, then I'll
> > live with another enum. This is one of the worse cases of this sort of
> > enum that is clearly a bunch of register values, given there's not a
> > "nice" explanation for them.
>=20
>=20
>=20
>=20
> I will modify as follows,
>=20
> +    enum:
> +      - VDDA
> +      - VDDA*1.5
> +      - VDDA*1.6
> +      - VDDA*1.7


To be clear, since I was not in my earlier mail, you can leave this as it
was, given Mark's complaints about what the handling for it in the driver
would look like with the special characters.

Thanks,
Conor.

--CMNQgfuuSMLBnyM2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZb0Z9QAKCRB4tDGHoIJi
0k4vAQDWeO2U42KxwOZd1oONkkxLORevf0jKg9VDOGSICLk3FQEA8ZAeCgaITd8x
PBDJw8quHX0cC54LzWTFtTppI7fDOAg=
=MoNi
-----END PGP SIGNATURE-----

--CMNQgfuuSMLBnyM2--
