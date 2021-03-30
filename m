Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1DB34EB87
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 17:07:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C2E81686;
	Tue, 30 Mar 2021 17:06:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C2E81686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617116833;
	bh=Ad141g+06Mj6kxA0pZroy2+ah/G8as714CayImOKtTk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nZrjWrQUftfLCocWdZ0lBvQQSXzUlx0dCBA9S9s+MuSqkpF2tXC5RssBy8O/ZkJJx
	 RNMLua09GFC4XRXs1pJ5x3a46L+/aQEWNrk5EiwA4z4HWlwg0fQ6rypu9hrvpcdLjJ
	 CqpSpQojeq2+h3buWdJMbLh7vKQi+CeYKDlnI3nY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FE94F800B9;
	Tue, 30 Mar 2021 17:05:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7834AF80240; Tue, 30 Mar 2021 17:05:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23D3BF80141
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 17:05:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23D3BF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cs7vS3PK"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9076E619C8;
 Tue, 30 Mar 2021 15:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617116733;
 bh=Ad141g+06Mj6kxA0pZroy2+ah/G8as714CayImOKtTk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cs7vS3PK1/F3nSAzLn1MyTZrf6CiZ/ol6wLci6u05BjhP5fULglV2DEHFr5mtcQ7N
 9p5JpNmRdK+RmeQhdee4oa6MZW42laUwlviiywVlzvqIxYtXl5+NkS/0ddMLSwsvHu
 09Km333AQDu8pdrNl0ozwcW0YI5yBvblkC3MlJlt+3zDGRBm0aZFu1kvCOx6Q7xu6T
 bLqyVbsXupxbZW7K9flIi7SlcPPJX6pr5dMhQ7+oB1c7SaFsMsMpVI9acjeCbfRZAW
 3/ST9M76hf37Gp4luwzFb+pOppgbtC5bsHGoP2btgl1UOTlxjokRDE841IN6/MNev6
 rOnsRo00jf+iQ==
Date: Tue, 30 Mar 2021 16:05:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: ak5558: Add support for ak5552
Message-ID: <20210330150521.GD4976@sirena.org.uk>
References: <1617085972-6094-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="a2FkP9tdjPU2nyhF"
Content-Disposition: inline
In-Reply-To: <1617085972-6094-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Memory fault - where am I?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 robh+dt@kernel.org
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


--a2FkP9tdjPU2nyhF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 30, 2021 at 02:32:51PM +0800, Shengjiu Wang wrote:

> +static const struct snd_kcontrol_new ak5552_snd_controls[] = {
> +	SOC_ENUM("AK5552 Monaural Mode", ak5552_mono_enum[0]),
> +	SOC_ENUM("AK5552 Digital Filter", ak5558_adcset_enum[0]),
> +};

It's a bit weird to have AK5552 in the control name - any reason for
that?

--a2FkP9tdjPU2nyhF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBjPjAACgkQJNaLcl1U
h9DkEQf+Ol3YVjyLArT+FOt6sN18M3scwhn2xFn1/JazXAfsJTtIAzGG1YTItNdZ
bivEU66vjQ90ao+FNXapny//1uwlfOPFYVieXVmOlx05Vgl8TsApelVN8lOopNH7
48vLv4gGmIQILT3vTVbBbSetXJU8zIAQuSVCuZqt53I3KSaDd8KQyCuJmLKSfVfn
3dNIQoJBHGioNlPqaUgm8f73NC/LRJJ7AtCGD7ylRQ86RYmEwIaTKOCkBRKbns+r
UoYJ/GJ6vjLcFdjrvuHfc8Him6JpZlr5R6mHNanljL2+0moqW7b9NBeYPGGEK0FR
VrtzZNwhGtfXJPCazDJOKUIVD8qYpQ==
=VImg
-----END PGP SIGNATURE-----

--a2FkP9tdjPU2nyhF--
