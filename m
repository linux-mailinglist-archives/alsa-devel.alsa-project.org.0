Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A53D817200
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 15:05:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB01BE72;
	Mon, 18 Dec 2023 15:05:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB01BE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702908330;
	bh=k0DsLMv1mYh5Ev1M+XlYsASwzVoRwAGWCEUYM7QIuj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tgxI5PKXfCghCDumgY0mdK0BeWqV5ypiPEZeKqZHN1JhDCrztxR7uIeXlac7INWP2
	 54Hanz7AgfDbkKN0CjPDtFF55SaHcYnWu6lWAV30KwgHLULlOTI2Hg6pctb3zCYVK+
	 vZqiXrNA9giCPQXOue2jcxgV6KuSm5e/SK7pmHLg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B998F8057D; Mon, 18 Dec 2023 15:04:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25249F80557;
	Mon, 18 Dec 2023 15:04:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 950F9F80425; Mon, 18 Dec 2023 15:04:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F07CEF800BD
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 15:04:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F07CEF800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=s+Q42Mrf
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8E6D360FF8;
	Mon, 18 Dec 2023 14:04:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE989C433C9;
	Mon, 18 Dec 2023 14:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702908287;
	bh=k0DsLMv1mYh5Ev1M+XlYsASwzVoRwAGWCEUYM7QIuj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s+Q42Mrf303qA6N5Ka8JkGzWO3W6sxr8bZuA2VpMj0mJY+b3Pw67ElV8RcnErwEFj
	 mmm/nYYkRZL2/HGzFMZ/V191Z07Al1D30zgcRpqHEecvtpFI+6Uze/N7gI6Bp6mWRO
	 4F5NOsf72biKrLip3DcSMdd5bPDz1uhrdoFrgAZPe8um5/0QZBHy189huIjuxgryyT
	 lpTNaM5+GWdGJ6t91naqdjgtG/s/VwyfqFMt4ghnhTO+6FOekzGA8aF4eu1vnXDVUK
	 DoIaTe8X0rVbXryb4e6lTjx4jYSUHE0Dv2JU09C8SJ/IBYxm+MadlQdZJC8XfugEpv
	 7PPLfO5luHAAA==
Date: Mon, 18 Dec 2023 14:04:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	shengjiu wang <shengjiu.wang@gmail.com>,
	Xiubo Lee <Xiubo.Lee@gmail.com>, alsa-devel@alsa-project.org,
	Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinux.com>
Subject: Re: [PATCHv3 10/10] ASoC: bindings: fsl-asoc-card: add compatible
 for generic codec
Message-ID: <c8e151f8-1fda-41af-b591-d76a60487371@sirena.org.uk>
References: <20231215144005.934728-1-elinor.montmasson@savoirfairelinux.com>
 <20231215144005.934728-11-elinor.montmasson@savoirfairelinux.com>
 <d095614a-071c-4ee8-8e47-5bf073aaabea@kernel.org>
 <299362992.190017.1702892951148.JavaMail.zimbra@savoirfairelinux.com>
 <66caf181-dc54-4161-81db-e77932c33327@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eiRFjsflfaTrtW9N"
Content-Disposition: inline
In-Reply-To: <66caf181-dc54-4161-81db-e77932c33327@kernel.org>
X-Cookie: I'm proud of my humility.
Message-ID-Hash: ZNTNZ7TVD6JLKAA6Z2MEUSTVHKBX6H72
X-Message-ID-Hash: ZNTNZ7TVD6JLKAA6Z2MEUSTVHKBX6H72
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZNTNZ7TVD6JLKAA6Z2MEUSTVHKBX6H72/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--eiRFjsflfaTrtW9N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 18, 2023 at 10:51:44AM +0100, Krzysztof Kozlowski wrote:
> On 18/12/2023 10:49, Elinor Montmasson wrote:

> > Is this compatible string not suitable ?
> > Should we rename it to something else, like "fsl,imx-audio-no-codec" ?

> Maybe Mark or Rob will help here, but for me "imx-audio" is just way too
> generic.

I think it's fine.

> Also, you add several new properties, so I really expect either
> converting old binding to DT schema first or adding new device in DT
> schema format.

So long as the binding conversion can go through quickly...

--eiRFjsflfaTrtW9N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWAUXoACgkQJNaLcl1U
h9BS9Qf/WPVjFYHFsabKFmOWsnA/UyOA2Yh9LNOOrslVz9zRH5oAUFmf04QYNQc6
PGAn3Di60uyuQjKoKaoZVp4Rj2SBsgtXv9Oc1uW5Dw+xYtgJcVRJjEMjwmDHvBOp
13nfEILmBnw5RjaQOJh6nDAjyqGuRNsRTGnHUATQINHpWYCqVpYKsYFekv/DmEjT
B/qRvjy3sU96eRxBv2+bT+F3cgpEfOsjv+/mW1d0gMHmOE8vVzPxWuhQzHxZ6FAf
ZlN99qPR9R5cU+wy6stlZNodFkwvUCqXVLpKqn5L6o/j//nrOjVE5Po7AHjT4CF1
GviprxqZJhWYRwOjFRBKiRxUxHYJAw==
=QBLD
-----END PGP SIGNATURE-----

--eiRFjsflfaTrtW9N--
