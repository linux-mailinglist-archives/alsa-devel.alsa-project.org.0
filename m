Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A830742B6D
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 19:44:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A49367F4;
	Thu, 29 Jun 2023 19:43:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A49367F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688060642;
	bh=V0qOlSWOHFdUJBrnvcm/PQeKhRzaF57NyRNow0c11k8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YsmSgnvVdZXPL/fZhWRHokE8wdziEyG5ST6f6l26si8pr05LAtVmHCzF+a36lHQub
	 ZuUb4STs0dDoCYP5o0dKyu/t9qdZBT2UkO1sBRpSnlnTqHEBSu8CPxyGdMPdA7vHLk
	 j1ElaYT/V9U1T8qQTj1q7E+IQwFa8KF5oRjC+MMI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF462F80212; Thu, 29 Jun 2023 19:43:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F483F80212;
	Thu, 29 Jun 2023 19:43:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8280CF80246; Thu, 29 Jun 2023 19:43:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6939DF800E3
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 19:43:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6939DF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YuNoCsqM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1B6F6615C1;
	Thu, 29 Jun 2023 17:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260B1C433C8;
	Thu, 29 Jun 2023 17:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688060583;
	bh=V0qOlSWOHFdUJBrnvcm/PQeKhRzaF57NyRNow0c11k8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YuNoCsqM9ReRiaGyA5ytN3QwAUueul5O8O1wCoDJaNq7G9gSCsPX0mznPtslOkyp+
	 n8mGu0EjvWTL/7nRV3lFwez4OukXd3QdNLSUJYc30EiwhKa7qg8326oIKkztYra7EZ
	 kHtKbLvJS4UVKlrnqovbCdSmX8HtWEzrha3UWjIQraS94YBEguubq1dM0AJFnzB8Vg
	 5gxMgMJ8qC/sVjVMeixuAuDjbVpojZXdQuJS/Yqeu2T1u8Kc2woeZhRQRH9PqkscRd
	 Bn6XO+DQ4feXXo+Kx1TvvipEafsdo1b1R+6R7H02PRhXX8Gpuakhys3DADnXLDfR7x
	 sGs91kfTKENxg==
Date: Thu, 29 Jun 2023 18:42:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: johan+linaro@kernel.org, perex@perex.cz, tiwai@suse.com,
	lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	Stable@vger.kernel.org
Subject: Re: [PATCH] ASoC: qdsp6: q6apm: use dai link pcm id as pcm device
 number
Message-ID: <8c3be94e-56c0-4820-853d-669e90969c24@sirena.org.uk>
References: <20230628092404.13927-1-srinivas.kandagatla@linaro.org>
 <c22fcc94-aa41-4ffd-bfe8-f0b9f15a76c0@sirena.org.uk>
 <77b348f7-0475-5e16-95e1-0e5831408d2b@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bypcLNqvoaiunsId"
Content-Disposition: inline
In-Reply-To: <77b348f7-0475-5e16-95e1-0e5831408d2b@linaro.org>
X-Cookie: Surprise due today.  Also the rent.
Message-ID-Hash: L73PKGX4CKPYIDYOIFUECXGDXLNEBKFU
X-Message-ID-Hash: L73PKGX4CKPYIDYOIFUECXGDXLNEBKFU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L73PKGX4CKPYIDYOIFUECXGDXLNEBKFU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--bypcLNqvoaiunsId
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 29, 2023 at 06:33:09PM +0100, Srinivas Kandagatla wrote:
> On 29/06/2023 16:43, Mark Brown wrote:
> > On Wed, Jun 28, 2023 at 10:24:04AM +0100, Srinivas Kandagatla wrote:

> > > For some reason we ended up with a setup without this flag.
> > > This resulted in inconsistent sound card devices numbers which
> > >   are also not starting as expected at dai_link->id.
> > >   (Ex: MultiMedia1 pcm ended up with device number 4 instead of 0)

> > Why is this a problem?

> In existing Qualcomm setup the backend pcm are added first, which results=
 in
> frontend pcms getting pcm numbers after this.

> For example: with 3 backend dailinks in DT we have frontend pcm start at =
3.
> Now if we add new backend dai-link in DT we now have frontend pcm start at
> 4.

> This is a bug in qualcomm driver.

Why is this an actual problem rather than just being a bit ugly?  What
is the negative consequence of having a PCM with this number?

> > > With this patch patch now the MultiMedia1 PCM ends up with device num=
ber 0
> > > as expected.
> > >=20
> > > Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
> > > Cc: <Stable@vger.kernel.org>
> >=20
> > Won't this be an ABI change?  That seems like it'd disrupt things in
> > stable.

> Yes, but this is a real bug. without fixing this also results in abi(pcm
> number) change when we add new backend dai-link. I have also sent fix for
> UCM to handle this.

I'm still not clear why you believe this to be a bug.

--bypcLNqvoaiunsId
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSdwqAACgkQJNaLcl1U
h9BKfQf+JaDl48bnioUDhQMuI6KqIfybuy9qh+7M+gWOmuwGSdFJwByoifsnUGPL
9KOh0gRw6dNjOwFtQ2CKSdedM+9+gUDhm3dLe9JNt7SC3x2Cf9e6RVPZVZdwVKLi
N9bG7Ci9yGDg1OlNpE0tdu5ocoui2v3HAQyaKlTCBUskQPP1urHgNgz73L5pfXsp
+mJR5GtZMwxnYejkE/IKc0gJP/IgPwqcxwb929ppfxx2mH4wFS2lMx0YwtrG1i1N
LEg/sMGXl0mnileFhSpDedb5hViiGOckQr+Gs7IPSiMVjwAKsp/NluD4p9uSTTsl
CdSgGlutumZ4wOhHt21s5hq4iqrrqw==
=Ygv3
-----END PGP SIGNATURE-----

--bypcLNqvoaiunsId--
