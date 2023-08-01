Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DEE76B839
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 17:07:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 038397F4;
	Tue,  1 Aug 2023 17:07:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 038397F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690902478;
	bh=3DMu2SfyBRfJ5mXUV3Knb5Dg+unc/Zx+XTPu2LfsSIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YTfXAY1rorIm9os2hPGGxpeUuKLwr4XPoYzVUrvpd46hBARGwO6PJIaoWFcZqsqK9
	 OOSPP3AnNfmCPHYH5NUeAg/jzoDA5z2Nmi+IsrWJb2Fxpay4Zfy6VF55+4JvBI7pBP
	 R489j0JYOFRbbwGvdNtyFS57Ht2uJQQQXU26wMzs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9EDAF802BE; Tue,  1 Aug 2023 17:07:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AB63F801D5;
	Tue,  1 Aug 2023 17:07:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F853F8025A; Tue,  1 Aug 2023 17:05:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F7B6F8015B
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 17:04:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F7B6F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rCO3rcEk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0DE8B615DE;
	Tue,  1 Aug 2023 15:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA3FC433C8;
	Tue,  1 Aug 2023 15:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690902279;
	bh=3DMu2SfyBRfJ5mXUV3Knb5Dg+unc/Zx+XTPu2LfsSIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rCO3rcEkZUNVCiVItbuD5CjArPPHajEhBNs/gS7wHtgPl/hHXbnUzdS/U/HcpESVq
	 yvKxi6OUGhmM7JKSwJRcduhs+3PAdaF1eNDN/CwRTQtv2H0GT1BSygUpFbkNJjHWD9
	 v7iMoRYGV1Sabzn0Hh24+voR1IzE52H3oHjwdKeS1JETlpGtiZT3lUoBObUbXu9x4B
	 ummUN15dI1JULmGf2pYW91A+Xjnp4BtAKAdWaBMzpK2kD5pM9gBYWAZ4PtbDSZLxzU
	 VZ1it/yML9qadcAcL5J9+UjFBVtNFAF67XU8X0IHRi2aRyXN/HNOxqMtyoPbqbO5/O
	 CsbnYpAmqd/uw==
Date: Tue, 1 Aug 2023 16:04:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: intel: use devm_snd_soc_register_dai()
Message-ID: <d48ab7f9-970e-4c21-af5e-640d0dea7b7b@sirena.org.uk>
References: <87v8dzpsvm.wl-kuninori.morimoto.gx@renesas.com>
 <5d8f3ae1-7f9f-8076-f5ff-36f9fe666ceb@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x8IW8CUY8mOrQGDe"
Content-Disposition: inline
In-Reply-To: <5d8f3ae1-7f9f-8076-f5ff-36f9fe666ceb@linux.intel.com>
X-Cookie: I thought YOU silenced the guard!
Message-ID-Hash: SXVTNF2L3Y6CY37FMEESLMAV6XZ3IFOG
X-Message-ID-Hash: SXVTNF2L3Y6CY37FMEESLMAV6XZ3IFOG
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SXVTNF2L3Y6CY37FMEESLMAV6XZ3IFOG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--x8IW8CUY8mOrQGDe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 01, 2023 at 04:14:37PM +0200, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
> On 8/1/2023 1:23 AM, Kuninori Morimoto wrote:
> > It is still using snd_soc_{un}register_dai() manually.
> > Let's use devm_snd_soc_register_dai().

> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

> There are two other related patches..., should this have been a patch
> series?

Given that there's no interrelationship between the patches other than
them doing roughly the same thing there's no need, pulling things into a
series is only needed if the patches depend on each other.  Keeping
things together can make repetitive things clearer, but splitting avoids
anything getting stuck if one driver has an issue for some reason.

--x8IW8CUY8mOrQGDe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTJHwAACgkQJNaLcl1U
h9C7pwf9FtN3/XrpTimLAja6m0lbwf+Pd+eZrmN6y3yBMjAzDMT9sHDpEvsaW2R/
RzzKBafuV+YeCLg2gs9vjJqwWmXB2kR4BrJWtVoY5ZlSh3hnk2EuNk99xeX6EhNV
Je06XVN6MltILa2CCt/i/EvhyK4pTTpU9m8+wSwBizfiOW+T21Zlhb4jzrC9QXWc
bsgl4q36i6PQpY96EcLTdEAKoPpUTvddz+E+Nc+Umf6LrzIlaxvI/Efs7lFj0Dxn
0WdFRsXSK3VzCQ2eGRiOvfbdCkmC3mRCJvTeQkyyfbpW/IOEIr63bVBr0y3yZjrj
8R5V2GCAatZpaj/kPfDkWi2s6vvneA==
=HvhB
-----END PGP SIGNATURE-----

--x8IW8CUY8mOrQGDe--
