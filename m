Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B374971DA4
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2024 17:11:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1ADA844;
	Mon,  9 Sep 2024 17:11:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1ADA844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725894677;
	bh=+iq8ZuR0xNfhMb6f8AZQy5xUVme4rLtghqLGlbhb6LE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FQx1QbiIq3Dio1+ZXHbNCTSkkr25lBkZ6hNMbKI08xlpPqOTdV9I7eOHS6L+HpqOy
	 3df0t9V147NoC1d56/weVYwFvqfe6OWTynxdl/pCmxr4Qo3vuUzVfdp/WOxiKC0qal
	 w9xde/+1sRWylrGdGGl6Apevr+L18ILQgMsFsQUU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54315F805B2; Mon,  9 Sep 2024 17:10:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 640EEF805B2;
	Mon,  9 Sep 2024 17:10:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13BF4F8026D; Mon,  9 Sep 2024 17:10:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40243F8019B
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 17:10:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40243F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pi0osoIL
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B127DA43D35;
	Mon,  9 Sep 2024 15:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0608C4CEC7;
	Mon,  9 Sep 2024 15:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725894635;
	bh=+iq8ZuR0xNfhMb6f8AZQy5xUVme4rLtghqLGlbhb6LE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pi0osoILqDfQAZmIUTrsSAIV/aKtDdNvbWcXzcx7nl3NC0WX+PYB075uPOwwRS1hR
	 VYWy/gqeeF3XYKLdYaHZTCVuwJSWVsxbLidm8thp+q6OqltvvYt0NjsjIjrN52IlKO
	 GJtcyIQiWegtjExazp3FS3oP6u8QKDJ+S9nTOPw1e61kj1tKEodXVHnPfvk5bOJjXV
	 DDGTSGQPCbGn620sFJGLJPQeQ790MpHBwE1vgiyuLGlYzZBjamAlG4hdJrOz5oSr1Z
	 82TaHkrqlFCeajdf94jPTmc9rNbsh6TF7wZDcZSG/wYwH1J1/okQlijxvMl3ou0llk
	 G9qKJtWhURwYg==
Date: Mon, 9 Sep 2024 16:10:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
	kernel@quicinc.com, quic_pkumpatl@quicinc.com
Subject: Re: [PATCH v1 0/4] Add static channel mapping between soundwire
 master and slave
Message-ID: <fb137d59-c8ef-4e02-89f6-9abf8a3f12e5@sirena.org.uk>
References: <20240909105547.2691015-1-quic_mohs@quicinc.com>
 <Zt8LC4IY7DGq8Qom@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0VQUlaAE/r6Fm+ww"
Content-Disposition: inline
In-Reply-To: <Zt8LC4IY7DGq8Qom@opensource.cirrus.com>
X-Cookie: Anything is possible, unless it's not.
Message-ID-Hash: P7RLHRJ5LDAEKCPI4NYFJKDI36F65TOZ
X-Message-ID-Hash: P7RLHRJ5LDAEKCPI4NYFJKDI36F65TOZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P7RLHRJ5LDAEKCPI4NYFJKDI36F65TOZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--0VQUlaAE/r6Fm+ww
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 09, 2024 at 03:49:47PM +0100, Charles Keepax wrote:
> On Mon, Sep 09, 2024 at 04:25:43PM +0530, Mohammad Rafi Shaik wrote:

> > Add static channel map support between soundwire master and slave.
> > This patch series will resolve channel mask mismatch between master and=
 slave.

=2E..

> > For AMIC2 usecase, The Slave need to configure TX2 Port with channel ma=
sk 1 and
> > for Master required PORT1 with channel mask 2,
> >=20
> > In existing design master and slave configured with same channel mask, =
it will fail
> > AMIC2 usecase.

> Apologies but I am not really following what exactly the issue is
> here? How do these ports map to DAI links? It looks like you are
> attempting to have AMIC2 produced by one DAI link, but consumed
> by another?

Yes, and it's also not clear to me why this is device specific.

--0VQUlaAE/r6Fm+ww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbfD+AACgkQJNaLcl1U
h9Au7wf/U9b5eAsInNOjUnuTMx81qHdkNyxcwOyRGo9BnLIEeY6WEzH5BIgSkVVj
kHf250hHlRGglWrR8zCVesc1yH0X66KZ9+rTH+7cW4SH/V9CiWHy1Z69VZie2N3Z
wi8TPB6W+Zq9m2BrIu+8BUs+UBuwMuVfAkZnrkZhclRJceOkm/wL2dHXSJ+xfFdJ
cFFYNNsri7IJ4M/+DtefOnrEcvvYEy9mWAO2tEvIYEYT+6pk1wy5Hbeqv9s9BF62
Mj1DoIUb3iRlKGk/717jqIEXSHoR7Hx9UDphrXZAumPxb0uw5rWYI2l8dmqwKpxL
wc9eUX2wlWjnRnKGP+2G8j/lMSa/4g==
=eard
-----END PGP SIGNATURE-----

--0VQUlaAE/r6Fm+ww--
