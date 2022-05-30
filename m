Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A9B537EC3
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 16:14:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30A401F11;
	Mon, 30 May 2022 16:13:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30A401F11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653920076;
	bh=M+00GOuXuD3qATD1qzKNz1hVq15YrxTq0pMnKrwvVeY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U+P/aCdvJZ2E9YEtPvc+nLl03QjuCNLWGeue5lqh4Ipa529qJ4ZhUbJ2P2TLOXjZn
	 adsP5guM5zF077uPKTQfNo+vqA2Y4iGTs+F90cfcYsr4w1zljNz++GY9+xCdcmZvUR
	 LET5LDjUhi6ilcsE8wKaOlyRXm+5xUg5YLrqLKi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AF37F8019D;
	Mon, 30 May 2022 16:13:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 123F5F8012F; Mon, 30 May 2022 16:13:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB3FCF800E5
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 16:13:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB3FCF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jox3gxFn"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 60D8861180;
 Mon, 30 May 2022 14:13:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC87C385B8;
 Mon, 30 May 2022 14:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653920011;
 bh=M+00GOuXuD3qATD1qzKNz1hVq15YrxTq0pMnKrwvVeY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jox3gxFnMJU1mWKLehrO+A1MOhqnkIk7Oipg39sFbcHHnmKaAZRVYrdTuaBEpmjv4
 lcL8dWWain6ty0I9wQNm9Vw7QzIFXnBizSCFStfVcFmRDZkwgun69wdrtci3b7hUPW
 +zReSXJAeShCyXWK42qBF4IHy/m4cBrc2bl9vAPQyk225seicmLauLtIWEHCVJcp44
 sXOJm2iEuiqEDWBEEInwuh95ouU0kF/xff/7NA8jlRTspt7AYYXFhOb4nhtxFesJu/
 7dBN1CAf7eaBv5oigmIAH4rgI79QGcl5OF+ZlwAmbY7P9RpDu2UPPFB5vrvNt+6eb9
 pOyi3WIrvBhDA==
Date: Mon, 30 May 2022 16:13:27 +0200
From: Mark Brown <broonie@kernel.org>
To: Raghu Bankapur <quic_rbankapu@quicinc.com>
Subject: Re: [PATCH V0 1/1] asoc: msm: use hashtable to check kcontrol
Message-ID: <YpTRB6rwGGUnUmvK@sirena.org.uk>
References: <cover.1653813866.git.quic_rbankapu@quicinc.com>
 <ad55bbd41cc253acb9af6ac068c15dd1545ecd81.1653813866.git.quic_rbankapu@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="w30vGsfjdTtApDVJ"
Content-Disposition: inline
In-Reply-To: <ad55bbd41cc253acb9af6ac068c15dd1545ecd81.1653813866.git.quic_rbankapu@quicinc.com>
X-Cookie: May your camel be as swift as the wind.
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Krishna Jha <quic_kkishorj@quicinc.com>
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


--w30vGsfjdTtApDVJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 29, 2022 at 02:20:09PM +0530, Raghu Bankapur wrote:

> index 5dcf77af07af..0eb18f8ee6fd 100644
> --- a/sound/soc/Kconfig
> +++ b/sound/soc/Kconfig
> @@ -58,6 +58,15 @@ config SND_SOC_TOPOLOGY_KUNIT_TEST
>  config SND_SOC_ACPI
>  	tristate
> =20
> +config SND_CTL_HASHTABLE
> +	bool "Add SND CTL hashtable"
> +	help
> +	  This enables hash table in sound card for kcontrols. The traditional =
way is

Since the rest of the change is to the ALSA core this should be
in the core ALSA Kconfig, though I'm also wondering if there's
any reason to make it configurable at all - is there any big
downside to just using the hastable all the time?  This sort of
tuning control tends to be a bit unclear for users.

--w30vGsfjdTtApDVJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKU0QcACgkQJNaLcl1U
h9CgDgf8CA1ZjPNPDW9eTebFImHbdjUFqR86l8zehQwy0N0Cwxx9Sfpe7WQPbR9a
ZeJ9L4cgNQ0e7l4+txIc+i+G/BzIOc5ojK3/OiUqTlCaiie5bP9aNVVd1SaHVCRW
2buYD+83wCTYdpjRDHd6stmHc2XDZCkRRmeYeaKFNINNNe2ovg8W+LteV7dZdX9S
/K8cHu+bIJzdUetALHkKS/jyHyD1xX0QVb7b6vQOfKmlelGVyVq7i5VVOso/tvqV
A/Rmy8HUwbCbQieD2zGxsvRK4k50/tQH/1GmHp5O8vVzPfuqZRbHNR7dodJnz9gA
fM18/fn88qbrP4HiYNiVKDnJ2heShA==
=98Bq
-----END PGP SIGNATURE-----

--w30vGsfjdTtApDVJ--
