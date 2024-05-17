Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4CA8C9E52
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 15:46:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF15D83E;
	Mon, 20 May 2024 15:46:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF15D83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716212792;
	bh=NGy4y9LkeLC6kMLGudcaqdBbS5CppWV4B0ewLsdwhpk=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KUsRYCy/+JJz8TbZjoZCT9YjRyYZ41Svdep1W0C7TpOdtPPptP/5ua7zhDovrz17M
	 xAf7ng9uYoIeqHZIlLwtzEmSq4tRVVQRHifFBCrIupjRGr9LfUxj4iaW452TxxxVrj
	 Ata3ISM5VgFyuSangaAT7rHCidIAUhIhihM1oZPs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50A4BF805F5; Mon, 20 May 2024 15:45:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6721F805F8;
	Mon, 20 May 2024 15:45:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 361E5F805AD; Mon, 20 May 2024 14:51:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23E79F8028B
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 14:51:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23E79F8028B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HrkcH1zG
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C6786198D;
	Fri, 17 May 2024 11:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C68C2BD11;
	Fri, 17 May 2024 11:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715944310;
	bh=NGy4y9LkeLC6kMLGudcaqdBbS5CppWV4B0ewLsdwhpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HrkcH1zGc5nsdF095rPasSd0smJVrBFPzVO1GfGnDndEAQRzzcEtOccP0Lq+THwc4
	 pAwXQ3f+M6XWsJrDZNt1FvPIfrTYhdCz2SnBp87g4iKe0IaqCqMHvc/yhtKzdgGaJv
	 dLAUdfS/gP7P/6XMwMIK5GZ43Hj833J7d0dOXLHcvLJKhNfKwWtUm/RnK70V89+VUu
	 AKcflMk2YxuK7b1Ya1coPH208ZfKUOWyTC39jgyRK1kZ/ASRPGRlTuL0lnElYvRFcD
	 VX4z/sJPHRJZ4c5hebs5Lf/i0NjNi4TSVrQuPXXHKTI5HQ+wADouLeFLthJoRCZaFs
	 N+LYX3g6JdEBg==
Date: Fri, 17 May 2024 12:11:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: Re: [PATCHv4 9/9] ASoC: dt-bindings: fsl-asoc-card: add compatible
 for generic codec
Message-ID: <500db9de-6113-4e73-ba92-6e52ea292b32@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-10-elinor.montmasson@savoirfairelinux.com>
 <ce9a87c6-4a5c-4f0a-a8df-1fdce8c1f5df@sirena.org.uk>
 <599489232.349333.1715936741672.JavaMail.zimbra@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u3ZQHG5Itc4786pl"
Content-Disposition: inline
In-Reply-To: 
 <599489232.349333.1715936741672.JavaMail.zimbra@savoirfairelinux.com>
X-Cookie: Function reject.
Message-ID-Hash: 37LB74VK2K3SNUMMTYXQYPOXCMECQALR
X-Message-ID-Hash: 37LB74VK2K3SNUMMTYXQYPOXCMECQALR
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, shengjiu wang <shengjiu.wang@gmail.com>,
 Xiubo Lee <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-sound <linux-sound@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 alsa-devel <alsa-devel@alsa-project.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--u3ZQHG5Itc4786pl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 17, 2024 at 05:05:41AM -0400, Elinor Montmasson wrote:
> From: "Mark Brown" <broonie@kernel.org>

> > This description (and the code) don't feel like they're actually generic
> > - they're clearly specific to the bidrectional S/PDIF case.  I'd expect
> > something called -generic to cope with single CODECs as well as double,
> > and not to have any constraints on what those are.

> I proposed, in an reply of the v3 patch series to Krzysztof Kozlowski,
> the compatible "fsl,imx-audio-no-codec" instead of "generic".
> Krzysztof thought it was too generic, but it would convey more clearly
> that it is for cases without codec driver.
> Would this other compatible string be more appropriate ?

No.  There is very clearly a CODEC here, it physically exists, we can
point at it on the board and it has a software representation.  Your
code is also very specific to the two CODEC case.

--u3ZQHG5Itc4786pl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZHO24ACgkQJNaLcl1U
h9AA9Af/dEW1/sXD0drucKnj3m5nf/uGf/YhJyyfJ/1JSqxnRA/VSoHYc1D6ZDLc
CYKJEQc19aWqb2hDm2/NebWPZ2nAgbG64R6Mn+Ue1pJ025SpxFd+SD2G9nzkzh2r
rhP5qrycZhKjkaMvsYxOQCgUZMDup6yEwckX93anIVYxBuz6o1Vx2H4tJkbXIU74
Q7wz5GIp6xMQNpX7RoCw/wE7IEe2TOmjGl5bPg9kM+V8uqYq/cZIZOnHMXicXoTa
jRDfO6DaG6nJ/23U8LJW9Ja6BJ+rHeeBtCDVZvcQUff+s/p7D+LzYeghTFOO1xQW
kN7EAVsua19NtkhnbL1ZsBqhr6EznA==
=AwEF
-----END PGP SIGNATURE-----

--u3ZQHG5Itc4786pl--
